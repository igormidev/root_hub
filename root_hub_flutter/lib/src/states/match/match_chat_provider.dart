import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:chatview/chatview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart'
    as cache_manager;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image/image.dart' as img;
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
  static const Duration _chatSyncInterval = Duration(seconds: 4);
  static const Duration _typingSignalThrottle = Duration(seconds: 2);
  static const Duration _typingPresenceWindow = Duration(seconds: 6);

  final Lock _sendOperationLock = Lock();

  final List<Message> _chatMessages = <Message>[];
  final Map<String, PlayerData> _playersByAuthorId = <String, PlayerData>{};
  final Map<String, String> _profileImageUrlsByAuthorId = <String, String>{};
  final Map<String, String> _audioPlaybackPathByUrl = <String, String>{};
  final Map<String, MatchChatParticipantPresence>
  _participantPresenceByPlayerId = <String, MatchChatParticipantPresence>{};

  late ChatController _chatController;
  bool _hasInitializedChatController = false;
  bool _isOpeningChat = false;
  bool _isSyncingLatest = false;
  bool _lastTypingStateSent = false;
  int _optimisticMessageCounter = 0;
  Timer? _chatSyncTimer;
  DateTime? _lastTypingSignalSentAt;

  @override
  MatchChatState build() {
    _resetChatController();
    ref.onDispose(() {
      _chatSyncTimer?.cancel();
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
    _stopLiveSync();
    try {
      state = MatchChatState(
        scheduledMatchId: scheduledMatchId,
        isLoading: true,
        isLoadingPlayedMatchSummary: true,
      );

      _chatMessages.clear();
      _playersByAuthorId.clear();
      _profileImageUrlsByAuthorId.clear();
      _audioPlaybackPathByUrl.clear();
      _participantPresenceByPlayerId.clear();
      _lastTypingStateSent = false;
      _lastTypingSignalSentAt = null;
      _chatController.setTypingIndicator = false;
      _resetChatController();

      await Future.wait<dynamic>([
        _loadPage(
          page: 1,
          replaceMessages: true,
        ),
        _loadPlayedMatchSummary(scheduledMatchId),
      ]);

      if (state.scheduledMatchId == scheduledMatchId && state.hasLoadedOnce) {
        _startLiveSync();
      }
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

  Future<void> loadOlderMessagesUntilFound(String messageId) async {
    if (messageId.trim().isEmpty) {
      return;
    }

    while (_chatMessages.every((message) => message.id != messageId) &&
        state.hasNextPage) {
      await loadOlderMessages();
    }
  }

  Future<void> sendTextMessage(
    String text, {
    ReplyMessage replyMessage = const ReplyMessage(),
  }) async {
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

      await _sendTextMessageLocked(
        scheduledMatchId: scheduledMatchId,
        authorId: currentUserId,
        text: normalizedText,
        replyMessage: replyMessage,
      );
    });
  }

  Future<void> sendVoiceMessage(
    String recordingPath, {
    ReplyMessage replyMessage = const ReplyMessage(),
  }) async {
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
        replyMessage: replyMessage,
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
              replyToMessageId: _resolveReplyToMessageId(replyMessage),
            )
            .toResult;

        await result.fold(
          (serverMessage) async {
            final newMessage = await _toUiMessages(serverMessage);
            await _replaceUiMessage(
              oldMessage: pendingMessage,
              newMessage: newMessage.first,
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

  Future<void> sendImagePathMessage({
    required String imagePath,
    ReplyMessage replyMessage = const ReplyMessage(),
    required ConfirmImageCompressionCallback onConfirmImageCompression,
    required ConfirmImageMessageCallback onConfirmImageMessage,
  }) async {
    final scheduledMatchId = state.scheduledMatchId;
    final currentUserId = _resolveCurrentUserId();
    if (scheduledMatchId == null || currentUserId == null) {
      return;
    }

    final normalizedImagePath = imagePath.trim();
    if (normalizedImagePath.isEmpty || _sendOperationLock.locked) {
      return;
    }

    String? captionToSend;

    await _sendOperationLock.synchronized(() async {
      if (state.scheduledMatchId != scheduledMatchId) {
        return;
      }

      final selectedImage = File(normalizedImagePath);
      if (!await selectedImage.exists()) {
        state = state.copyWith(
          actionError: RootHubException(
            title: 'Unable to read image',
            description: 'The selected image could not be found.',
          ),
        );
        return;
      }

      Uint8List imageBytes;
      try {
        final streamedImageBytes = await _readImageBytesByStreaming(
          normalizedImagePath,
          maxReadableBytes: _maxReadableImageBytes,
        );
        if (streamedImageBytes == null) {
          final maxReadableMb = (_maxReadableImageBytes / (1024 * 1024))
              .toStringAsFixed(0);
          state = state.copyWith(
            actionError: RootHubException(
              title: 'Image is too large',
              description:
                  'The selected image exceeds the $maxReadableMb MB processing '
                  'limit. Choose a smaller image and try again.',
            ),
          );
          return;
        }
        imageBytes = streamedImageBytes;
      } catch (error, stackTrace) {
        talker.handle(
          error,
          stackTrace,
          '[MatchChat] Failed to read selected image bytes. '
          'scheduledMatchId=$scheduledMatchId path=$normalizedImagePath',
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
      var imageFileName = _resolveFileName(normalizedImagePath);
      var imageContentType = _resolveImageContentType(normalizedImagePath);

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
          originalFileName: imageFileName,
        );
        imageContentType = 'image/jpeg';
      }

      final messageContent = await onConfirmImageMessage(
        previewBytes: imageBytesToUpload,
      );
      if (messageContent == null) {
        return;
      }
      final normalizedCaption = messageContent.trim();

      final pendingImageMessage = _buildPendingImageMessage(
        authorId: currentUserId,
        imagePath: normalizedImagePath,
        replyMessage: replyMessage,
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
              content: '',
              imageBytes: ByteData.sublistView(imageBytesToUpload),
              imageFileName: imageFileName,
              imageContentType: imageContentType,
              replyToMessageId: _resolveReplyToMessageId(replyMessage),
            )
            .toResult;

        await sendResult.fold(
          (serverMessage) async {
            final newMessage = await _toUiMessages(serverMessage);
            await _replaceUiMessage(
              oldMessage: pendingImageMessage,
              newMessage: newMessage.first,
            );
            state = state.copyWith(
              isUploadingImage: false,
              actionError: null,
            );
            if (normalizedCaption.isNotEmpty) {
              captionToSend = normalizedCaption;
            }
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
          'scheduledMatchId=$scheduledMatchId path=$normalizedImagePath',
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

    if (captionToSend != null && captionToSend!.isNotEmpty) {
      await sendTextMessage(
        captionToSend!,
        replyMessage: replyMessage,
      );
    }
  }

  void sendReaction(Message message, String emoji) {
    unawaited(_persistReaction(message, emoji));
  }

  void updateTypingStatus(TypeWriterStatus status) {
    final scheduledMatchId = state.scheduledMatchId;
    if (scheduledMatchId == null) {
      return;
    }

    final shouldSendTyping = status.isTyping;
    final now = DateTime.now();
    final throttleWindowReached =
        _lastTypingSignalSentAt == null ||
        now.difference(_lastTypingSignalSentAt!) >= _typingSignalThrottle;

    if (!shouldSendTyping && !_lastTypingStateSent) {
      return;
    }

    if (shouldSendTyping && _lastTypingStateSent && !throttleWindowReached) {
      return;
    }

    _lastTypingStateSent = shouldSendTyping;
    _lastTypingSignalSentAt = now;
    unawaited(_pushTypingState(isTyping: shouldSendTyping));
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

  void _startLiveSync() {
    _chatSyncTimer?.cancel();
    _chatSyncTimer = Timer.periodic(_chatSyncInterval, (_) {
      unawaited(_syncLatestMessages());
    });
  }

  void _stopLiveSync() {
    _chatSyncTimer?.cancel();
    _chatSyncTimer = null;
  }

  Future<void> _sendTextMessageLocked({
    required int scheduledMatchId,
    required String authorId,
    required String text,
    required ReplyMessage replyMessage,
  }) async {
    final pendingMessage = _buildPendingTextMessage(
      authorId: authorId,
      text: text,
      replyMessage: replyMessage,
    );

    state = state.copyWith(
      isSendingMessage: true,
      actionError: null,
    );
    await _insertUiMessage(pendingMessage);

    talker.debug(
      '[MatchChat] Sending text message. '
      'scheduledMatchId=$scheduledMatchId chars=${text.length}',
    );

    try {
      final result = await ref
          .read(clientProvider)
          .sendMatchChatMessage
          .v1(
            language: ref.read(serverSupportedTranslationProvider),
            scheduledMatchId: scheduledMatchId,
            content: text,
            replyToMessageId: _resolveReplyToMessageId(replyMessage),
          )
          .toResult;

      await result.fold(
        (serverMessage) async {
          final newMessage = await _toUiMessages(serverMessage);
          await _replaceUiMessage(
            oldMessage: pendingMessage,
            newMessage: newMessage.first,
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
        await _applyRemotePage(
          chatPage,
          replaceMessages: replaceMessages,
          mergeLatestOnly: false,
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

  Future<void> _syncLatestMessages() async {
    final scheduledMatchId = state.scheduledMatchId;
    if (scheduledMatchId == null || _isSyncingLatest || state.isLoading) {
      return;
    }

    _isSyncingLatest = true;
    try {
      final result = await ref
          .read(clientProvider)
          .getMatchChatMessage
          .v1(
            language: ref.read(serverSupportedTranslationProvider),
            scheduledMatchId: scheduledMatchId,
            page: 1,
          )
          .toResult;

      await result.fold(
        (chatPage) async {
          await _applyRemotePage(
            chatPage,
            replaceMessages: false,
            mergeLatestOnly: true,
          );
        },
        (error) async {
          talker.debug(
            '[MatchChat] Live sync failed. '
            'scheduledMatchId=$scheduledMatchId error=${error.description}',
          );
        },
      );
    } finally {
      _isSyncingLatest = false;
    }
  }

  Future<void> _applyRemotePage(
    MatchChatMessagesPagination chatPage, {
    required bool replaceMessages,
    required bool mergeLatestOnly,
  }) async {
    _ingestSenderProfiles(chatPage.senderProfiles);
    _ingestParticipantPresence(chatPage.participantPresence);

    final orderedMessages = [...chatPage.messages]
      ..sort((a, b) => a.sentAt.compareTo(b.sentAt));

    final mappedMessageBatches = await Future.wait(
      orderedMessages.map(_toUiMessages),
    );
    final mappedMessages =
        mappedMessageBatches.expand((messages) => messages).toList()
          ..sort((a, b) => a.createdAt.compareTo(b.createdAt));

    if (replaceMessages) {
      _chatMessages
        ..clear()
        ..addAll(mappedMessages);
      _chatController.replaceMessageList(List<Message>.from(_chatMessages));
      _chatController.scrollToLastMessage(
        waitFor: Duration(milliseconds: 60),
      );
    } else if (mergeLatestOnly) {
      _mergeLatestMessages(mappedMessages);
    } else {
      final existingIds = _chatMessages.map((message) => message.id).toSet();
      final uniqueMessages = mappedMessages
          .where((message) => !existingIds.contains(message.id))
          .toList();
      _chatMessages.insertAll(0, uniqueMessages);
      if (uniqueMessages.isNotEmpty) {
        _chatController.loadMoreData(uniqueMessages);
      }
    }

    _refreshExistingMessageStatuses();
    _applyTypingPresence();

    state = state.copyWith(
      isLoading: false,
      hasLoadedOnce: true,
      isLoadingMore: false,
      hasNextPage: chatPage.paginationMetadata.hasNextPage,
      currentPage: chatPage.paginationMetadata.currentPage,
      loadError: null,
      subscribedPlayerIds: chatPage.subscribedPlayerIds.toSet(),
    );
  }

  void _ingestSenderProfiles(List<MatchChatSenderProfile> senderProfiles) {
    for (final senderProfile in senderProfiles) {
      final authorId = senderProfile.playerDataId.toString();
      final normalizedProfileImageUrl = senderProfile.profileImageUrl?.trim();
      if (normalizedProfileImageUrl == null ||
          normalizedProfileImageUrl.isEmpty) {
        continue;
      }

      _profileImageUrlsByAuthorId[authorId] = normalizedProfileImageUrl;
      _upsertChatUser(authorId);
    }
  }

  void _ingestParticipantPresence(
    List<MatchChatParticipantPresence> participantPresence,
  ) {
    _participantPresenceByPlayerId
      ..clear()
      ..addEntries(
        participantPresence.map(
          (entry) => MapEntry(entry.playerDataId.toString(), entry),
        ),
      );
  }

  void _mergeLatestMessages(List<Message> remoteMessages) {
    final existingIndexById = <String, int>{
      for (final entry in _chatMessages.indexed) entry.$2.id: entry.$1,
    };

    for (final remoteMessage in remoteMessages) {
      final existingIndex = existingIndexById[remoteMessage.id];
      if (existingIndex == null) {
        _chatMessages.add(remoteMessage);
        _chatController.addMessage(remoteMessage);
        existingIndexById[remoteMessage.id] = _chatMessages.length - 1;
        continue;
      }

      final currentMessage = _chatMessages[existingIndex];
      if (currentMessage == remoteMessage) {
        continue;
      }

      _chatMessages[existingIndex] = remoteMessage;
      _chatController.updateMessage(
        messageId: currentMessage.id,
        newMessage: remoteMessage,
      );
    }
  }

  void _refreshExistingMessageStatuses() {
    for (final entry in _chatMessages.indexed) {
      final currentMessage = entry.$2;
      if (currentMessage.status == MessageStatus.pending ||
          currentMessage.status == MessageStatus.undelivered) {
        continue;
      }

      final nextStatus = _resolveUiMessageStatus(currentMessage);
      if (nextStatus == currentMessage.status) {
        continue;
      }

      final updatedMessage = currentMessage.copyWith(status: nextStatus);
      _chatMessages[entry.$1] = updatedMessage;
      _chatController.updateMessage(
        messageId: currentMessage.id,
        newMessage: updatedMessage,
      );
    }
  }

  void _applyTypingPresence() {
    final currentUserId = _chatController.currentUser.id;
    final now = DateTime.now();

    final typingPlayerIds = _participantPresenceByPlayerId.values
        .where((entry) => entry.playerDataId.toString() != currentUserId)
        .where((entry) {
          final typingAt = entry.lastTypingAt;
          if (typingAt == null) {
            return false;
          }

          return now.difference(typingAt.toLocal()) <= _typingPresenceWindow;
        })
        .map((entry) => entry.playerDataId.toString())
        .toSet();

    _chatController.setTypingIndicator = typingPlayerIds.isNotEmpty;
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

  Future<List<Message>> _toUiMessages(MatchChatMessage serverMessage) async {
    final messageId =
        serverMessage.id?.toString() ??
        '${serverMessage.playerDataId}_${serverMessage.sentAt.millisecondsSinceEpoch}';
    final authorId = serverMessage.playerDataId.toString();

    final sender = serverMessage.sender;
    if (sender != null) {
      _playersByAuthorId[authorId] = sender;
    }
    _upsertChatUser(authorId);

    final replyMessage = _buildReplyMessage(serverMessage, authorId);
    final reaction = _buildReaction(serverMessage.reactionsJson);
    final status = _resolveServerMessageStatus(serverMessage);
    final normalizedText = serverMessage.content.trim();

    final isSystemMessage =
        serverMessage.messageType == MatchChatMessageType.systemJoin ||
        serverMessage.messageType == MatchChatMessageType.systemLeave;

    if (isSystemMessage) {
      return <Message>[
        Message(
          id: messageId,
          message: normalizedText,
          createdAt: serverMessage.sentAt,
          sentBy: _chatController.currentUser.id,
          messageType: MessageType.custom,
          replyMessage: replyMessage,
          reaction: reaction,
          status: status,
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
        ),
      ];
    }

    final normalizedAudioUrl = serverMessage.audioUrl?.trim();
    if (normalizedAudioUrl != null && normalizedAudioUrl.isNotEmpty) {
      final audioPlaybackPath = await _resolveAudioPlaybackPath(
        normalizedAudioUrl,
      );
      if (audioPlaybackPath != null) {
        return <Message>[
          Message(
            id: messageId,
            message: audioPlaybackPath,
            createdAt: serverMessage.sentAt,
            sentBy: authorId,
            messageType: MessageType.voice,
            replyMessage: replyMessage,
            reaction: reaction,
            voiceMessageDuration:
                serverMessage.audioDurationMilliseconds == null
                ? await _resolveAudioDuration(audioPlaybackPath)
                : Duration(
                    milliseconds: serverMessage.audioDurationMilliseconds!,
                  ),
            status: status,
          ),
        ];
      }

      return <Message>[
        Message(
          id: messageId,
          message: t.match.ui_screens_match_chat_screen.voiceMessage,
          createdAt: serverMessage.sentAt,
          sentBy: authorId,
          messageType: MessageType.text,
          replyMessage: replyMessage,
          reaction: reaction,
          status: status,
        ),
      ];
    }

    final normalizedImageUrl = serverMessage.imageUrl?.trim();
    if (normalizedImageUrl != null && normalizedImageUrl.isNotEmpty) {
      if (normalizedText.isNotEmpty) {
        return <Message>[
          Message(
            id: messageId,
            message: normalizedText,
            createdAt: serverMessage.sentAt,
            sentBy: authorId,
            messageType: MessageType.custom,
            replyMessage: replyMessage,
            reaction: reaction,
            status: status,
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
          ),
        ];
      }

      return <Message>[
        Message(
          id: messageId,
          message: normalizedImageUrl,
          createdAt: serverMessage.sentAt,
          sentBy: authorId,
          messageType: MessageType.image,
          replyMessage: replyMessage,
          reaction: reaction,
          status: status,
        ),
      ];
    }

    return <Message>[
      Message(
        id: messageId,
        message: normalizedText,
        createdAt: serverMessage.sentAt,
        sentBy: authorId,
        messageType: MessageType.text,
        replyMessage: replyMessage,
        reaction: reaction,
        status: status,
      ),
    ];
  }

  ReplyMessage _buildReplyMessage(
    MatchChatMessage serverMessage,
    String authorId,
  ) {
    final replyToMessageId = serverMessage.replyToMessageId;
    if (replyToMessageId == null) {
      return const ReplyMessage();
    }

    return ReplyMessage(
      messageId: replyToMessageId.toString(),
      message: serverMessage.replyToMessagePreview ?? '',
      replyBy: authorId,
      replyTo: serverMessage.replyToMessageSenderPlayerDataId?.toString() ?? '',
      messageType: _resolveReplyMessageType(serverMessage.replyToMessageUiType),
      voiceMessageDuration:
          serverMessage.replyToAudioDurationMilliseconds == null
          ? null
          : Duration(
              milliseconds: serverMessage.replyToAudioDurationMilliseconds!,
            ),
    );
  }

  MessageType _resolveReplyMessageType(MatchChatMessageUiType? uiType) {
    return switch (uiType) {
      MatchChatMessageUiType.image => MessageType.image,
      MatchChatMessageUiType.voice => MessageType.voice,
      MatchChatMessageUiType.system => MessageType.custom,
      MatchChatMessageUiType.text || null => MessageType.text,
    };
  }

  Reaction _buildReaction(String? reactionsJson) {
    final normalizedJson = reactionsJson?.trim();
    if (normalizedJson == null || normalizedJson.isEmpty) {
      return Reaction(
        reactions: <String>[],
        reactedUserIds: <String>[],
      );
    }

    try {
      final decoded = jsonDecode(normalizedJson);
      if (decoded is! Map<String, dynamic>) {
        return Reaction(
          reactions: <String>[],
          reactedUserIds: <String>[],
        );
      }

      final reactionEntries = decoded.entries
          .map(
            (entry) => (
              playerId: entry.key.trim(),
              emoji: entry.value.toString().trim(),
            ),
          )
          .where(
            (entry) => entry.playerId.isNotEmpty && entry.emoji.isNotEmpty,
          )
          .toList();

      return Reaction(
        reactions: reactionEntries.map((entry) => entry.emoji).toList(),
        reactedUserIds: reactionEntries.map((entry) => entry.playerId).toList(),
      );
    } catch (_) {
      return Reaction(
        reactions: <String>[],
        reactedUserIds: <String>[],
      );
    }
  }

  MessageStatus _resolveServerMessageStatus(MatchChatMessage serverMessage) {
    final currentUserId = _chatController.currentUser.id;
    if (serverMessage.playerDataId.toString() != currentUserId) {
      return MessageStatus.delivered;
    }

    final hasAnyOtherRead = _participantPresenceByPlayerId.values.any((entry) {
      if (entry.playerDataId.toString() == currentUserId) {
        return false;
      }

      final lastRead = entry.lastReadMessageAt;
      if (lastRead == null) {
        return false;
      }

      return !lastRead.toLocal().isBefore(serverMessage.sentAt);
    });

    return hasAnyOtherRead ? MessageStatus.read : MessageStatus.delivered;
  }

  MessageStatus _resolveUiMessageStatus(Message message) {
    if (message.sentBy != _chatController.currentUser.id) {
      return MessageStatus.delivered;
    }

    final hasAnyOtherRead = _participantPresenceByPlayerId.values.any((entry) {
      if (entry.playerDataId.toString() == _chatController.currentUser.id) {
        return false;
      }

      final lastRead = entry.lastReadMessageAt;
      if (lastRead == null) {
        return false;
      }

      return !lastRead.toLocal().isBefore(message.createdAt);
    });

    return hasAnyOtherRead ? MessageStatus.read : MessageStatus.delivered;
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
    required ReplyMessage replyMessage,
  }) {
    final now = DateTime.now();
    return Message(
      id: _buildOptimisticMessageId(prefix: 'local-text'),
      message: text,
      createdAt: now,
      sentBy: authorId,
      messageType: MessageType.text,
      replyMessage: replyMessage,
      status: MessageStatus.pending,
    );
  }

  Message _buildPendingVoiceMessage({
    required String authorId,
    required String recordingPath,
    required Duration? duration,
    required ReplyMessage replyMessage,
  }) {
    final now = DateTime.now();
    return Message(
      id: _buildOptimisticMessageId(prefix: 'local-voice'),
      message: recordingPath,
      createdAt: now,
      sentBy: authorId,
      messageType: MessageType.voice,
      replyMessage: replyMessage,
      voiceMessageDuration: duration,
      status: MessageStatus.pending,
    );
  }

  Message _buildPendingImageMessage({
    required String authorId,
    required String imagePath,
    required ReplyMessage replyMessage,
  }) {
    final now = DateTime.now();
    return Message(
      id: _buildOptimisticMessageId(prefix: 'local-image'),
      message: imagePath,
      createdAt: now,
      sentBy: authorId,
      messageType: MessageType.image,
      replyMessage: replyMessage,
      status: MessageStatus.pending,
    );
  }

  String _buildOptimisticMessageId({
    required String prefix,
  }) {
    _optimisticMessageCounter += 1;
    return '$prefix-${DateTime.now().microsecondsSinceEpoch}-$_optimisticMessageCounter';
  }

  int? _resolveReplyToMessageId(ReplyMessage replyMessage) {
    final rawMessageId = replyMessage.messageId.trim();
    if (rawMessageId.isEmpty) {
      return null;
    }

    return int.tryParse(rawMessageId);
  }

  Future<void> _persistReaction(
    Message message,
    String emoji,
  ) async {
    final scheduledMatchId = state.scheduledMatchId;
    final serverMessageId = int.tryParse(message.id);
    if (scheduledMatchId == null || serverMessageId == null) {
      return;
    }

    try {
      final updatedServerMessage = await ref
          .read(clientProvider)
          .setMatchChatMessageReaction
          .v1(
            language: ref.read(serverSupportedTranslationProvider),
            scheduledMatchId: scheduledMatchId,
            messageId: serverMessageId,
            emoji: emoji,
          );

      final existingMessage = _chatMessages
          .where((entry) => entry.id == message.id)
          .firstOrNull;
      if (existingMessage == null) {
        return;
      }

      final reaction = _buildReaction(updatedServerMessage.reactionsJson);
      final updatedMessage = existingMessage.copyWith(reaction: reaction);

      await _replaceUiMessage(
        oldMessage: existingMessage,
        newMessage: updatedMessage,
      );
    } catch (error, stackTrace) {
      talker.handle(
        error,
        stackTrace,
        '[MatchChat] Failed to persist reaction. '
        'scheduledMatchId=$scheduledMatchId messageId=$serverMessageId',
      );
      await _syncLatestMessages();
    }
  }

  Future<void> _pushTypingState({
    required bool isTyping,
  }) async {
    final scheduledMatchId = state.scheduledMatchId;
    if (scheduledMatchId == null) {
      return;
    }

    try {
      await ref
          .read(clientProvider)
          .setMatchChatTyping
          .v1(
            language: ref.read(serverSupportedTranslationProvider),
            scheduledMatchId: scheduledMatchId,
            isTyping: isTyping,
          );
    } catch (error, stackTrace) {
      talker.handle(
        error,
        stackTrace,
        '[MatchChat] Failed to push typing state. '
        'scheduledMatchId=$scheduledMatchId isTyping=$isTyping',
      );
    }
  }

  Future<Uint8List?> _readImageBytesByStreaming(
    String imagePath, {
    required int maxReadableBytes,
  }) async {
    final bytesBuilder = BytesBuilder(copy: false);
    var totalBytes = 0;

    await for (final chunk in File(imagePath).openRead()) {
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

  String? _resolveImageContentType(String path) {
    final extension = path.trim().split('.').last.toLowerCase();
    return switch (extension) {
      'heic' || 'heif' => 'image/heic',
      'jpeg' || 'jpg' => 'image/jpeg',
      'png' => 'image/png',
      'webp' => 'image/webp',
      _ => null,
    };
  }
}

final matchChatProvider = NotifierProvider<MatchChatNotifier, MatchChatState>(
  MatchChatNotifier.new,
);
