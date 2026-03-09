import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:blurhash_dart/blurhash_dart.dart';
import 'package:chatview/chatview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart'
    as cache_manager;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';
import 'package:root_hub_flutter/src/core/chat/match_chat_view_message_metadata.dart';
import 'package:root_hub_flutter/src/core/extension/serverpod_to_result.dart';
import 'package:root_hub_flutter/src/core/utils/talker.dart';
import 'package:root_hub_flutter/src/global_providers/server_supported_translation_provider.dart';
import 'package:root_hub_flutter/src/global_providers/session_provider.dart';
import 'package:root_hub_flutter/src/states/auth_flow/auth_flow_provider.dart';
import 'package:root_hub_flutter/src/states/auth_flow/auth_flow_state.dart';
import 'package:root_hub_flutter/src/states/match/match_chat_state.dart';
import 'package:root_hub_flutter/src/states/match/match_tables_provider.dart';
import 'package:synchronized/synchronized.dart';

typedef ConfirmImageCompressionCallback =
    Future<bool> Function({
      required int imageBytes,
      required int maxBytes,
    });

typedef ConfirmImageMessageCallback =
    Future<String?> Function({
      required Uint8List previewBytes,
    });

final _matchChatAudioCacheManager = cache_manager.CacheManager(
  cache_manager.Config(
    'matchChatAudioCache',
    stalePeriod: Duration(days: 7),
    maxNrOfCacheObjects: 120,
  ),
);

class MatchChatNotifier extends Notifier<MatchChatState> {
  static const int _maxImageBytes = 3 * 1024 * 1024;
  static const int _maxReadableImageBytes = 20 * 1024 * 1024;

  final ImagePicker _imagePicker = ImagePicker();
  final Lock _sendOperationLock = Lock();

  final List<Message> _chatMessages = <Message>[];
  final Map<String, PlayerData> _playersByAuthorId = <String, PlayerData>{};
  final Map<String, String> _profileImageUrlsByAuthorId = <String, String>{};
  final Map<String, String> _audioPlaybackPathByUrl = <String, String>{};

  late ChatController _chatController;
  bool _hasInitializedChatController = false;
  bool _isOpeningChat = false;
  int _optimisticMessageCounter = 0;

  @override
  MatchChatState build() {
    _resetChatController();
    ref.onDispose(() {
      if (_hasInitializedChatController) {
        _chatController.dispose();
      }
    });
    return const MatchChatState();
  }

  ChatController get chatController => _chatController;

  Future<void> openChat(
    int scheduledMatchId, {
    bool forceRefresh = false,
  }) async {
    if (scheduledMatchId <= 0) {
      state = state.copyWith(
        actionError: RootHubException(
          title: 'Invalid chat',
          description: 'The selected match chat is invalid.',
        ),
      );
      return;
    }

    if (_isOpeningChat) {
      return;
    }

    final isSameChat = state.scheduledMatchId == scheduledMatchId;
    if (!forceRefresh && isSameChat && state.hasLoadedOnce) {
      return;
    }

    _isOpeningChat = true;
    try {
      state = MatchChatState(
        scheduledMatchId: scheduledMatchId,
        isLoading: true,
        isLoadingPlayedMatchSummary: true,
      );

      _chatMessages.clear();
      _playersByAuthorId.clear();
      _profileImageUrlsByAuthorId.clear();
      _resetChatController();

      await Future.wait<dynamic>([
        _loadPage(
          page: 1,
          replaceMessages: true,
        ),
        _loadPlayedMatchSummary(scheduledMatchId),
      ]);
    } finally {
      _isOpeningChat = false;
    }
  }

  Future<void> refresh() async {
    final scheduledMatchId = state.scheduledMatchId;
    if (scheduledMatchId == null) {
      return;
    }

    await openChat(
      scheduledMatchId,
      forceRefresh: true,
    );
  }

  Future<void> loadOlderMessages() async {
    if (!state.hasNextPage || state.isLoadingMore || state.isLoading) {
      return;
    }

    state = state.copyWith(
      isLoadingMore: true,
      loadError: null,
    );

    await _loadPage(
      page: state.currentPage + 1,
      replaceMessages: false,
    );
  }

  Future<void> sendTextMessage(String text) async {
    final scheduledMatchId = state.scheduledMatchId;
    final currentUserId = _resolveCurrentUserId();
    if (scheduledMatchId == null || currentUserId == null) {
      return;
    }

    final normalizedText = text.trim();
    if (normalizedText.isEmpty || _sendOperationLock.locked) {
      return;
    }

    await _sendOperationLock.synchronized(() async {
      if (state.scheduledMatchId != scheduledMatchId) {
        return;
      }

      final pendingMessage = _buildPendingTextMessage(
        authorId: currentUserId,
        text: normalizedText,
      );

      state = state.copyWith(
        isSendingMessage: true,
        actionError: null,
      );
      await _insertUiMessage(pendingMessage);

      talker.debug(
        '[MatchChat] Sending text message. '
        'scheduledMatchId=$scheduledMatchId chars=${normalizedText.length}',
      );

      try {
        final result = await ref
            .read(clientProvider)
            .sendMatchChatMessage
            .v1(
              language: ref.read(serverSupportedTranslationProvider),
              scheduledMatchId: scheduledMatchId,
              content: normalizedText,
            )
            .toResult;

        await result.fold(
          (serverMessage) async {
            await _replaceUiMessage(
              oldMessage: pendingMessage,
              newMessage: await _toUiMessage(serverMessage),
            );
            state = state.copyWith(
              isSendingMessage: false,
              actionError: null,
            );
          },
          (error) async {
            await _replaceUiMessage(
              oldMessage: pendingMessage,
              newMessage: pendingMessage.copyWith(
                status: MessageStatus.undelivered,
              ),
            );
            state = state.copyWith(
              isSendingMessage: false,
              actionError: error,
            );
          },
        );
      } catch (error, stackTrace) {
        talker.handle(
          error,
          stackTrace,
          '[MatchChat] Unexpected text message failure. '
          'scheduledMatchId=$scheduledMatchId',
        );
        await _replaceUiMessage(
          oldMessage: pendingMessage,
          newMessage: pendingMessage.copyWith(
            status: MessageStatus.undelivered,
          ),
        );
        state = state.copyWith(
          isSendingMessage: false,
          actionError: RootHubException(
            title: 'Unable to send message',
            description:
                'An unexpected error occurred while sending your message.',
          ),
        );
      }
    });
  }

  Future<void> sendVoiceMessage(String recordingPath) async {
    final scheduledMatchId = state.scheduledMatchId;
    final currentUserId = _resolveCurrentUserId();
    if (scheduledMatchId == null || currentUserId == null) {
      return;
    }

    final normalizedRecordingPath = recordingPath.trim();
    if (normalizedRecordingPath.isEmpty || _sendOperationLock.locked) {
      return;
    }

    await _sendOperationLock.synchronized(() async {
      if (state.scheduledMatchId != scheduledMatchId) {
        return;
      }

      final audioFile = File(normalizedRecordingPath);
      if (!await audioFile.exists()) {
        state = state.copyWith(
          actionError: RootHubException(
            title: 'Unable to send audio',
            description: 'The recorded audio file could not be found.',
          ),
        );
        return;
      }

      final audioBytes = await audioFile.readAsBytes();
      if (audioBytes.isEmpty) {
        state = state.copyWith(
          actionError: RootHubException(
            title: 'Unable to send audio',
            description: 'The recorded audio file is empty.',
          ),
        );
        return;
      }

      final duration = await _resolveAudioDuration(normalizedRecordingPath);
      final pendingMessage = _buildPendingVoiceMessage(
        authorId: currentUserId,
        recordingPath: normalizedRecordingPath,
        duration: duration,
      );

      state = state.copyWith(
        isSendingMessage: true,
        isUploadingAudio: true,
        actionError: null,
      );
      await _insertUiMessage(pendingMessage);

      try {
        final result = await ref
            .read(clientProvider)
            .sendMatchChatMessage
            .v1(
              language: ref.read(serverSupportedTranslationProvider),
              scheduledMatchId: scheduledMatchId,
              content: '',
              audioBytes: ByteData.sublistView(audioBytes),
              audioFileName: _resolveFileName(normalizedRecordingPath),
              audioContentType: _resolveAudioContentType(
                normalizedRecordingPath,
              ),
              audioDurationMilliseconds: duration?.inMilliseconds,
            )
            .toResult;

        await result.fold(
          (serverMessage) async {
            await _replaceUiMessage(
              oldMessage: pendingMessage,
              newMessage: await _toUiMessage(serverMessage),
            );
            state = state.copyWith(
              isSendingMessage: false,
              isUploadingAudio: false,
              actionError: null,
            );
          },
          (error) async {
            await _replaceUiMessage(
              oldMessage: pendingMessage,
              newMessage: pendingMessage.copyWith(
                status: MessageStatus.undelivered,
              ),
            );
            state = state.copyWith(
              isSendingMessage: false,
              isUploadingAudio: false,
              actionError: error,
            );
          },
        );
      } catch (error, stackTrace) {
        talker.handle(
          error,
          stackTrace,
          '[MatchChat] Unexpected voice message failure. '
          'scheduledMatchId=$scheduledMatchId',
        );
        await _replaceUiMessage(
          oldMessage: pendingMessage,
          newMessage: pendingMessage.copyWith(
            status: MessageStatus.undelivered,
          ),
        );
        state = state.copyWith(
          isSendingMessage: false,
          isUploadingAudio: false,
          actionError: RootHubException(
            title: 'Unable to send audio',
            description:
                'An unexpected error occurred while sending your audio.',
          ),
        );
      }
    });
  }

  Future<void> pickAndSendImage({
    required ImageSource source,
    required ConfirmImageCompressionCallback onConfirmImageCompression,
    required ConfirmImageMessageCallback onConfirmImageMessage,
  }) async {
    final scheduledMatchId = state.scheduledMatchId;
    final currentUserId = _resolveCurrentUserId();
    if (scheduledMatchId == null || currentUserId == null) {
      return;
    }
    if (_sendOperationLock.locked) {
      return;
    }

    await _sendOperationLock.synchronized(() async {
      if (state.scheduledMatchId != scheduledMatchId) {
        return;
      }

      XFile? pickedImage;
      try {
        pickedImage = await _imagePicker.pickImage(
          source: source,
          maxWidth: 1800,
          maxHeight: 1800,
          imageQuality: 88,
          requestFullMetadata: false,
        );
      } catch (error, stackTrace) {
        talker.handle(
          error,
          stackTrace,
          '[MatchChat] Failed to open image source. '
          'scheduledMatchId=$scheduledMatchId source=$source',
        );
        state = state.copyWith(
          actionError: RootHubException(
            title: 'Unable to access camera or gallery',
            description:
                'Allow camera and photo permissions in system settings and try again.',
          ),
        );
        return;
      }

      if (pickedImage == null) {
        return;
      }

      Uint8List imageBytes;
      try {
        final streamedImageBytes = await _readImageBytesByStreaming(
          pickedImage,
          maxReadableBytes: _maxReadableImageBytes,
        );
        if (streamedImageBytes == null) {
          final maxReadableMb = (_maxReadableImageBytes / (1024 * 1024))
              .toStringAsFixed(0);
          state = state.copyWith(
            actionError: RootHubException(
              title: 'Image is too large',
              description:
                  'The selected image exceeds the $maxReadableMb MB processing limit. '
                  'Choose a smaller image and try again.',
            ),
          );
          return;
        }
        imageBytes = streamedImageBytes;
      } catch (error, stackTrace) {
        talker.handle(
          error,
          stackTrace,
          '[MatchChat] Failed to stream selected image bytes. '
          'scheduledMatchId=$scheduledMatchId name=${pickedImage.name}',
        );
        state = state.copyWith(
          actionError: RootHubException(
            title: 'Unable to read image',
            description:
                'The selected image could not be read. Try another file.',
          ),
        );
        return;
      }

      if (imageBytes.isEmpty) {
        state = state.copyWith(
          actionError: RootHubException(
            title: 'Invalid image',
            description:
                'The selected image is empty. Please choose another one.',
          ),
        );
        return;
      }

      var imageBytesToUpload = imageBytes;
      var imageFileName = pickedImage.name;
      var imageContentType = pickedImage.mimeType;

      if (imageBytes.length > _maxImageBytes) {
        final shouldCompressImage = await onConfirmImageCompression(
          imageBytes: imageBytes.length,
          maxBytes: _maxImageBytes,
        );
        if (!shouldCompressImage) {
          return;
        }

        final compressedImageBytes = _compressImageToAllowedSize(
          imageBytes,
          maxBytes: _maxImageBytes,
        );

        if (compressedImageBytes == null) {
          state = state.copyWith(
            actionError: RootHubException(
              title: 'Unable to compress image',
              description:
                  'Try selecting a different image or crop it before sending.',
            ),
          );
          return;
        }

        imageBytesToUpload = compressedImageBytes;
        imageFileName = _resolveCompressedImageFileName(
          originalFileName: pickedImage.name,
        );
        imageContentType = 'image/jpeg';
      }

      final messageContent = await onConfirmImageMessage(
        previewBytes: imageBytesToUpload,
      );
      if (messageContent == null) {
        return;
      }
      final normalizedMessageContent = messageContent.trim();

      final previewDecodedImage = img.decodeImage(imageBytesToUpload);
      final pendingImageMessage = _buildPendingImageMessage(
        authorId: currentUserId,
        previewBytes: imageBytesToUpload,
        blurhash: _encodeBlurhash(previewDecodedImage),
        caption: normalizedMessageContent,
        width: previewDecodedImage?.width,
        height: previewDecodedImage?.height,
      );

      state = state.copyWith(
        isUploadingImage: true,
        actionError: null,
      );
      await _insertUiMessage(pendingImageMessage);

      try {
        final sendResult = await ref
            .read(clientProvider)
            .sendMatchChatMessage
            .v1(
              language: ref.read(serverSupportedTranslationProvider),
              scheduledMatchId: scheduledMatchId,
              content: normalizedMessageContent,
              imageBytes: ByteData.sublistView(imageBytesToUpload),
              imageFileName: imageFileName,
              imageContentType: imageContentType,
            )
            .toResult;

        await sendResult.fold(
          (serverMessage) async {
            await _replaceUiMessage(
              oldMessage: pendingImageMessage,
              newMessage: await _toUiMessage(serverMessage),
            );
            state = state.copyWith(
              isUploadingImage: false,
              actionError: null,
            );
          },
          (error) async {
            await _replaceUiMessage(
              oldMessage: pendingImageMessage,
              newMessage: pendingImageMessage.copyWith(
                status: MessageStatus.undelivered,
              ),
            );
            state = state.copyWith(
              isUploadingImage: false,
              actionError: error,
            );
          },
        );
      } catch (error, stackTrace) {
        talker.handle(
          error,
          stackTrace,
          '[MatchChat] Unexpected image message failure. '
          'scheduledMatchId=$scheduledMatchId name=${pickedImage.name}',
        );
        await _replaceUiMessage(
          oldMessage: pendingImageMessage,
          newMessage: pendingImageMessage.copyWith(
            status: MessageStatus.undelivered,
          ),
        );
        state = state.copyWith(
          isUploadingImage: false,
          actionError: RootHubException(
            title: 'Unable to send image',
            description:
                'An unexpected error occurred while sending your image.',
          ),
        );
      }
    });
  }

  void clearActionError() {
    state = state.copyWith(actionError: null);
  }

  Future<RootHubException?> removePlayerFromTable({
    required int playerDataId,
  }) async {
    final scheduledMatchId = state.scheduledMatchId;
    if (scheduledMatchId == null) {
      return RootHubException(
        title: 'Invalid chat',
        description: 'No active match chat to remove a player from.',
      );
    }

    state = state.copyWith(actionError: null);

    try {
      await ref
          .read(clientProvider)
          .removePlayerFromMatch
          .v1(
            language: ref.read(serverSupportedTranslationProvider),
            scheduledMatchId: scheduledMatchId,
            playerDataId: playerDataId,
          );
      return null;
    } on RootHubException catch (error) {
      state = state.copyWith(actionError: error);
      return error;
    } catch (error, stackTrace) {
      talker.handle(
        error,
        stackTrace,
        '[MatchChat] Unexpected remove player failure. '
        'scheduledMatchId=$scheduledMatchId playerDataId=$playerDataId',
      );
      final exception = RootHubException(
        title: 'Unable to remove player',
        description: 'An unexpected error occurred while removing this player.',
      );
      state = state.copyWith(actionError: exception);
      return exception;
    }
  }

  Future<RootHubException?> unsubscribeFromTable() async {
    final scheduledMatchId = state.scheduledMatchId;
    if (scheduledMatchId == null) {
      return RootHubException(
        title: 'Invalid chat',
        description: 'No active match chat to unsubscribe from.',
      );
    }

    state = state.copyWith(actionError: null);

    try {
      await ref
          .read(clientProvider)
          .unsubscribeFromMatch
          .v1(
            language: ref.read(serverSupportedTranslationProvider),
            scheduledMatchId: scheduledMatchId,
          );
      ref
          .read(matchTablesProvider.notifier)
          .invalidateTableInfoCache(scheduledMatchId);
      return null;
    } on RootHubException catch (error) {
      state = state.copyWith(actionError: error);
      return error;
    } catch (error, stackTrace) {
      talker.handle(
        error,
        stackTrace,
        '[MatchChat] Unexpected unsubscribe failure. '
        'scheduledMatchId=$scheduledMatchId',
      );
      final exception = RootHubException(
        title: 'Unable to unsubscribe',
        description:
            'An unexpected error occurred while unsubscribing from this table.',
      );
      state = state.copyWith(actionError: exception);
      return exception;
    }
  }

  String? _resolveCurrentUserId() {
    return ref
        .read(authFlowProvider)
        .maybeWhen(
          authenticated: (playerData) => playerData.id?.toString(),
          orElse: () => null,
        );
  }

  PlayerData? _resolveAuthenticatedPlayerData() {
    return ref
        .read(authFlowProvider)
        .maybeWhen(
          authenticated: (playerData) => playerData,
          orElse: () => null,
        );
  }

  void _resetChatController() {
    if (_hasInitializedChatController) {
      _chatController.dispose();
    }

    final playerData = _resolveAuthenticatedPlayerData();
    final currentUserId = playerData?.id?.toString() ?? '__current_user__';
    final currentUserName = playerData?.displayName.trim();

    _chatController = ChatController(
      initialMessageList: <Message>[],
      scrollController: ScrollController(),
      otherUsers: const <ChatUser>[],
      currentUser: ChatUser(
        id: currentUserId,
        name: currentUserName == null || currentUserName.isEmpty
            ? 'You'
            : currentUserName,
      ),
    );
    _hasInitializedChatController = true;
  }

  Future<void> _loadPage({
    required int page,
    required bool replaceMessages,
  }) async {
    final scheduledMatchId = state.scheduledMatchId;
    if (scheduledMatchId == null) {
      return;
    }

    final result = await ref
        .read(clientProvider)
        .getMatchChatMessage
        .v1(
          language: ref.read(serverSupportedTranslationProvider),
          scheduledMatchId: scheduledMatchId,
          page: page,
        )
        .toResult;

    await result.fold(
      (chatPage) async {
        final orderedMessages = [...chatPage.messages]
          ..sort((a, b) => a.sentAt.compareTo(b.sentAt));

        for (final senderProfile in chatPage.senderProfiles) {
          final authorId = senderProfile.playerDataId.toString();
          final normalizedProfileImageUrl = senderProfile.profileImageUrl
              ?.trim();
          if (normalizedProfileImageUrl == null ||
              normalizedProfileImageUrl.isEmpty) {
            continue;
          }

          _profileImageUrlsByAuthorId[authorId] = normalizedProfileImageUrl;
        }

        final mappedMessages = await Future.wait(
          orderedMessages.map(_toUiMessage),
        );

        if (replaceMessages) {
          _chatMessages
            ..clear()
            ..addAll(mappedMessages);
          _chatController.replaceMessageList(List<Message>.from(_chatMessages));
          _chatController.scrollToLastMessage(
            waitFor: Duration(milliseconds: 60),
          );
        } else {
          final existingIds = _chatMessages
              .map((message) => message.id)
              .toSet();
          final uniqueMessages = mappedMessages
              .where((message) => !existingIds.contains(message.id))
              .toList();
          _chatMessages.insertAll(0, uniqueMessages);
          if (uniqueMessages.isNotEmpty) {
            _chatController.loadMoreData(uniqueMessages);
          }
        }

        state = state.copyWith(
          isLoading: false,
          hasLoadedOnce: true,
          isLoadingMore: false,
          hasNextPage: chatPage.paginationMetadata.hasNextPage,
          currentPage: chatPage.paginationMetadata.currentPage,
          loadError: null,
          subscribedPlayerIds: chatPage.subscribedPlayerIds.toSet(),
        );
      },
      (error) async {
        final hasExistingMessages = _chatMessages.isNotEmpty;
        state = state.copyWith(
          isLoading: false,
          hasLoadedOnce: true,
          isLoadingMore: false,
          loadError: hasExistingMessages ? null : error,
          actionError: hasExistingMessages ? error : state.actionError,
        );
      },
    );
  }

  Future<void> _loadPlayedMatchSummary(int scheduledMatchId) async {
    final result = await ref
        .read(clientProvider)
        .getMatchChatPlayedMatchSummary
        .v1(
          language: ref.read(serverSupportedTranslationProvider),
          scheduledMatchId: scheduledMatchId,
        )
        .toResult;

    if (state.scheduledMatchId != scheduledMatchId) {
      return;
    }

    result.fold(
      (summaryValue) {
        state = state.copyWith(
          isLoadingPlayedMatchSummary: false,
          playedMatchSummaryError: null,
          playedMatchSummary: summaryValue.value,
        );
      },
      (error) {
        state = state.copyWith(
          isLoadingPlayedMatchSummary: false,
          playedMatchSummaryError: error,
          playedMatchSummary: null,
        );
      },
    );
  }

  Future<void> _insertUiMessage(Message message) async {
    final alreadyExists = _chatMessages.any(
      (existingMessage) => existingMessage.id == message.id,
    );
    if (alreadyExists) {
      return;
    }

    _chatMessages.add(message);
    _chatController.addMessage(message);
  }

  Future<void> _replaceUiMessage({
    required Message oldMessage,
    required Message newMessage,
  }) async {
    final existingMessageIndex = _chatMessages.indexWhere(
      (message) => message.id == oldMessage.id,
    );
    if (existingMessageIndex < 0) {
      await _insertUiMessage(newMessage);
      return;
    }

    _chatMessages[existingMessageIndex] = newMessage;
    _chatController.updateMessage(
      messageId: oldMessage.id,
      newMessage: newMessage,
    );
  }

  Future<Message> _toUiMessage(MatchChatMessage serverMessage) async {
    final messageId =
        serverMessage.id?.toString() ??
        '${serverMessage.playerDataId}_${serverMessage.sentAt.millisecondsSinceEpoch}';
    final authorId = serverMessage.playerDataId.toString();

    final sender = serverMessage.sender;
    if (sender != null) {
      _playersByAuthorId[authorId] = sender;
    }
    _upsertChatUser(authorId);

    final normalizedText = serverMessage.content.trim();
    final isSystemMessage =
        serverMessage.messageType == MatchChatMessageType.systemJoin ||
        serverMessage.messageType == MatchChatMessageType.systemLeave;

    if (isSystemMessage) {
      return Message(
        id: messageId,
        message: normalizedText,
        createdAt: serverMessage.sentAt,
        sentBy: _chatController.currentUser.id,
        messageType: MessageType.custom,
        status: MessageStatus.delivered,
        update: <String, dynamic>{
          MatchChatViewMessageMetadata.kindKey:
              MatchChatViewMessageMetadata.encodeKind(
                MatchChatViewCustomMessageKind.system,
              ),
          MatchChatViewMessageMetadata.systemTypeKey:
              serverMessage.messageType == MatchChatMessageType.systemJoin
              ? 'systemJoin'
              : 'systemLeave',
        },
      );
    }

    final normalizedAudioUrl = serverMessage.audioUrl?.trim();
    if (normalizedAudioUrl != null && normalizedAudioUrl.isNotEmpty) {
      final audioPlaybackPath = await _resolveAudioPlaybackPath(
        normalizedAudioUrl,
      );
      if (audioPlaybackPath != null) {
        return Message(
          id: messageId,
          message: audioPlaybackPath,
          createdAt: serverMessage.sentAt,
          sentBy: authorId,
          messageType: MessageType.voice,
          voiceMessageDuration: serverMessage.audioDurationMilliseconds == null
              ? await _resolveAudioDuration(audioPlaybackPath)
              : Duration(
                  milliseconds: serverMessage.audioDurationMilliseconds!,
                ),
          status: MessageStatus.delivered,
        );
      }

      return Message(
        id: messageId,
        message: t.match.ui_screens_match_chat_screen.voiceMessage,
        createdAt: serverMessage.sentAt,
        sentBy: authorId,
        messageType: MessageType.text,
        status: MessageStatus.delivered,
      );
    }

    final normalizedImageUrl = serverMessage.imageUrl?.trim();
    final hasImage =
        normalizedImageUrl != null && normalizedImageUrl.isNotEmpty;

    if (hasImage) {
      return Message(
        id: messageId,
        message: normalizedText,
        createdAt: serverMessage.sentAt,
        sentBy: authorId,
        messageType: MessageType.custom,
        status: MessageStatus.delivered,
        update: <String, dynamic>{
          MatchChatViewMessageMetadata.kindKey:
              MatchChatViewMessageMetadata.encodeKind(
                MatchChatViewCustomMessageKind.image,
              ),
          MatchChatViewMessageMetadata.imageUrlKey: normalizedImageUrl,
          MatchChatViewMessageMetadata.blurhashKey: serverMessage.blurhash,
          MatchChatViewMessageMetadata.widthKey: serverMessage.imageWidth
              ?.toDouble(),
          MatchChatViewMessageMetadata.heightKey: serverMessage.imageHeight
              ?.toDouble(),
        },
      );
    }

    return Message(
      id: messageId,
      message: normalizedText,
      createdAt: serverMessage.sentAt,
      sentBy: authorId,
      messageType: MessageType.text,
      status: MessageStatus.delivered,
    );
  }

  void _upsertChatUser(String authorId) {
    if (authorId == _chatController.currentUser.id) {
      return;
    }

    final sender = _playersByAuthorId[authorId];
    final normalizedProfileImageUrl = _profileImageUrlsByAuthorId[authorId];
    _chatController.updateOtherUser(
      ChatUser(
        id: authorId,
        name: sender?.displayName ?? 'Player #$authorId',
        profilePhoto: normalizedProfileImageUrl,
      ),
    );
  }

  Message _buildPendingTextMessage({
    required String authorId,
    required String text,
  }) {
    final now = DateTime.now();
    return Message(
      id: _buildOptimisticMessageId(prefix: 'local-text'),
      message: text,
      createdAt: now,
      sentBy: authorId,
      messageType: MessageType.text,
      status: MessageStatus.pending,
    );
  }

  Message _buildPendingVoiceMessage({
    required String authorId,
    required String recordingPath,
    required Duration? duration,
  }) {
    final now = DateTime.now();
    return Message(
      id: _buildOptimisticMessageId(prefix: 'local-voice'),
      message: recordingPath,
      createdAt: now,
      sentBy: authorId,
      messageType: MessageType.voice,
      voiceMessageDuration: duration,
      status: MessageStatus.pending,
    );
  }

  Message _buildPendingImageMessage({
    required String authorId,
    required Uint8List previewBytes,
    required String? blurhash,
    required String caption,
    required int? width,
    required int? height,
  }) {
    final now = DateTime.now();
    return Message(
      id: _buildOptimisticMessageId(prefix: 'local-image'),
      message: caption,
      createdAt: now,
      sentBy: authorId,
      messageType: MessageType.custom,
      status: MessageStatus.pending,
      update: <String, dynamic>{
        MatchChatViewMessageMetadata.kindKey:
            MatchChatViewMessageMetadata.encodeKind(
              MatchChatViewCustomMessageKind.image,
            ),
        MatchChatViewMessageMetadata.localPreviewBytesKey: previewBytes,
        MatchChatViewMessageMetadata.blurhashKey: blurhash,
        MatchChatViewMessageMetadata.widthKey: width?.toDouble(),
        MatchChatViewMessageMetadata.heightKey: height?.toDouble(),
      },
    );
  }

  String _buildOptimisticMessageId({
    required String prefix,
  }) {
    _optimisticMessageCounter += 1;
    return '$prefix-${DateTime.now().microsecondsSinceEpoch}-$_optimisticMessageCounter';
  }

  String? _encodeBlurhash(img.Image? sourceImage) {
    if (sourceImage == null) {
      return null;
    }

    try {
      const maxDimension = 180;
      final shouldDownsample =
          sourceImage.width > maxDimension || sourceImage.height > maxDimension;
      final imageForHash = shouldDownsample
          ? img.copyResize(
              sourceImage,
              width: sourceImage.width >= sourceImage.height
                  ? maxDimension
                  : (sourceImage.width * maxDimension / sourceImage.height)
                        .round()
                        .clamp(1, maxDimension),
              height: sourceImage.height > sourceImage.width
                  ? maxDimension
                  : (sourceImage.height * maxDimension / sourceImage.width)
                        .round()
                        .clamp(1, maxDimension),
              interpolation: img.Interpolation.average,
            )
          : sourceImage;

      return BlurHash.encode(
        imageForHash,
        numCompX: 4,
        numCompY: 3,
      ).hash;
    } catch (error, stackTrace) {
      talker.handle(
        error,
        stackTrace,
        '[MatchChat] Failed to generate blurhash for pending image preview.',
      );
      return null;
    }
  }

  Future<Uint8List?> _readImageBytesByStreaming(
    XFile pickedImage, {
    required int maxReadableBytes,
  }) async {
    final bytesBuilder = BytesBuilder(copy: false);
    var totalBytes = 0;

    await for (final chunk in pickedImage.openRead()) {
      totalBytes += chunk.length;
      if (totalBytes > maxReadableBytes) {
        return null;
      }

      bytesBuilder.add(chunk);
    }

    return bytesBuilder.takeBytes();
  }

  Uint8List? _compressImageToAllowedSize(
    Uint8List sourceBytes, {
    required int maxBytes,
  }) {
    final decodedImage = img.decodeImage(sourceBytes);
    if (decodedImage == null) {
      return null;
    }

    var workingImage = decodedImage;
    const qualityCandidates = <int>[82, 74, 66, 58, 50, 42, 34, 26, 18];

    for (var resizeIteration = 0; resizeIteration < 7; resizeIteration++) {
      for (final quality in qualityCandidates) {
        final compressed = Uint8List.fromList(
          img.encodeJpg(workingImage, quality: quality),
        );
        if (compressed.length <= maxBytes) {
          return compressed;
        }
      }

      final nextWidth = (workingImage.width * 0.85).round();
      final nextHeight = (workingImage.height * 0.85).round();
      if (nextWidth < 320 || nextHeight < 320) {
        break;
      }

      workingImage = img.copyResize(
        workingImage,
        width: nextWidth,
        height: nextHeight,
        interpolation: img.Interpolation.average,
      );
    }

    return null;
  }

  String _resolveCompressedImageFileName({
    required String originalFileName,
  }) {
    final normalizedOriginalFileName = originalFileName.trim();
    if (normalizedOriginalFileName.isEmpty) {
      return 'match-chat-image.jpg';
    }

    final fileNameWithoutExtension = normalizedOriginalFileName.replaceFirst(
      RegExp(r'\.[^./\\]+$'),
      '',
    );
    return '$fileNameWithoutExtension.jpg';
  }

  Future<String?> _resolveAudioPlaybackPath(String audioUrl) async {
    if (_audioPlaybackPathByUrl.containsKey(audioUrl)) {
      return _audioPlaybackPathByUrl[audioUrl];
    }

    try {
      final file = await _matchChatAudioCacheManager.getSingleFile(audioUrl);
      final resolvedPath = file.path;
      _audioPlaybackPathByUrl[audioUrl] = resolvedPath;
      return resolvedPath;
    } catch (error, stackTrace) {
      talker.handle(
        error,
        stackTrace,
        '[MatchChat] Failed to cache audio message. url=$audioUrl',
      );
      return null;
    }
  }

  Future<Duration?> _resolveAudioDuration(String audioPath) async {
    if (audioPath.isEmpty) {
      return null;
    }
    return null;
  }

  String _resolveFileName(String path) {
    final normalizedPath = path.trim();
    if (normalizedPath.isEmpty) {
      return 'match-chat-audio.m4a';
    }

    final fileName = normalizedPath.split(RegExp(r'[\\/]')).last.trim();
    if (fileName.isEmpty) {
      return 'match-chat-audio.m4a';
    }

    return fileName;
  }

  String? _resolveAudioContentType(String path) {
    final extension = path.trim().split('.').last.toLowerCase();
    return switch (extension) {
      'aac' => 'audio/aac',
      'caf' => 'audio/x-caf',
      'm4a' => 'audio/mp4',
      'mp3' => 'audio/mpeg',
      'wav' => 'audio/wav',
      _ => null,
    };
  }
}

final matchChatProvider = NotifierProvider<MatchChatNotifier, MatchChatState>(
  MatchChatNotifier.new,
);
