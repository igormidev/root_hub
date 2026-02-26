import 'dart:async';
import 'dart:typed_data';

import 'package:flutter_chat_core/flutter_chat_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/core/extension/faction_ui_extension.dart';
import 'package:root_hub_flutter/src/core/extension/serverpod_to_result.dart';
import 'package:root_hub_flutter/src/core/utils/talker.dart';
import 'package:root_hub_flutter/src/global_providers/session_provider.dart';
import 'package:root_hub_flutter/src/states/match/match_chat_state.dart';

typedef ConfirmImageCompressionCallback =
    Future<bool> Function({
      required int imageBytes,
      required int maxBytes,
    });

class MatchChatNotifier extends Notifier<MatchChatState> {
  static const int _maxImageBytes = 6 * 1024 * 1024;

  final InMemoryChatController _chatController = InMemoryChatController();
  final ImagePicker _imagePicker = ImagePicker();

  final List<Message> _chatMessages = <Message>[];
  final Map<String, PlayerData> _playersByAuthorId = <String, PlayerData>{};
  final Map<String, String> _profileImageUrlsByAuthorId = <String, String>{};

  bool _isOpeningChat = false;

  @override
  MatchChatState build() {
    ref.onDispose(_chatController.dispose);
    return const MatchChatState();
  }

  InMemoryChatController get chatController => _chatController;

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
      await _chatController.setMessages(const <Message>[], animated: false);

      await Future.wait([
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
    if (scheduledMatchId == null) {
      return;
    }

    final normalizedText = text.trim();
    if (normalizedText.isEmpty) {
      return;
    }

    state = state.copyWith(
      isSendingMessage: true,
      actionError: null,
    );

    talker.debug(
      '[MatchChat] Sending text message. '
      'scheduledMatchId=$scheduledMatchId chars=${normalizedText.length}',
    );

    try {
      final result = await ref
          .read(clientProvider)
          .sendMatchChatMessage
          .v1(
            scheduledMatchId: scheduledMatchId,
            content: normalizedText,
          )
          .toResult;

      await result.fold(
        (serverMessage) async {
          talker.debug(
            '[MatchChat] Text message sent. '
            'scheduledMatchId=$scheduledMatchId messageId=${serverMessage.id}',
          );
          await _insertMessage(serverMessage);
          state = state.copyWith(
            isSendingMessage: false,
            actionError: null,
          );
        },
        (error) async {
          talker.debug(
            '[MatchChat] Failed to send text message. '
            'scheduledMatchId=$scheduledMatchId title=${error.title} '
            'description=${error.description}',
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

  Future<void> pickAndSendImage({
    required ImageSource source,
    required ConfirmImageCompressionCallback onConfirmImageCompression,
  }) async {
    final scheduledMatchId = state.scheduledMatchId;
    if (scheduledMatchId == null || state.isUploadingImage) {
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
      talker.debug(
        '[MatchChat] Image pick canceled by user. '
        'scheduledMatchId=$scheduledMatchId',
      );
      return;
    }

    talker.debug(
      '[MatchChat] Image picked. scheduledMatchId=$scheduledMatchId '
      'name=${pickedImage.name} mimeType=${pickedImage.mimeType ?? 'unknown'}',
    );

    state = state.copyWith(
      isUploadingImage: true,
      actionError: null,
    );

    Uint8List imageBytes;
    try {
      imageBytes = await pickedImage.readAsBytes();
    } catch (error, stackTrace) {
      talker.handle(
        error,
        stackTrace,
        '[MatchChat] Failed to read selected image bytes. '
        'scheduledMatchId=$scheduledMatchId name=${pickedImage.name}',
      );
      state = state.copyWith(
        isUploadingImage: false,
        actionError: RootHubException(
          title: 'Unable to read image',
          description:
              'The selected image could not be read. Try another file.',
        ),
      );
      return;
    }

    if (imageBytes.isEmpty) {
      talker.debug(
        '[MatchChat] Picked image has no bytes. '
        'scheduledMatchId=$scheduledMatchId name=${pickedImage.name}',
      );
      state = state.copyWith(
        isUploadingImage: false,
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
      talker.debug(
        '[MatchChat] Picked image exceeds allowed size. '
        'scheduledMatchId=$scheduledMatchId name=${pickedImage.name} '
        'bytes=${imageBytes.length} maxBytes=$_maxImageBytes',
      );

      bool shouldCompressImage;
      try {
        shouldCompressImage = await onConfirmImageCompression(
          imageBytes: imageBytes.length,
          maxBytes: _maxImageBytes,
        );
      } catch (error, stackTrace) {
        talker.handle(
          error,
          stackTrace,
          '[MatchChat] Failed to confirm image compression with user. '
          'scheduledMatchId=$scheduledMatchId name=${pickedImage.name}',
        );
        state = state.copyWith(
          isUploadingImage: false,
          actionError: RootHubException(
            title: 'Unable to send image',
            description:
                'An unexpected error occurred while confirming image compression.',
          ),
        );
        return;
      }

      if (!shouldCompressImage) {
        talker.debug(
          '[MatchChat] User canceled image compression. '
          'scheduledMatchId=$scheduledMatchId name=${pickedImage.name}',
        );
        state = state.copyWith(
          isUploadingImage: false,
          actionError: null,
        );
        return;
      }

      final compressedImageBytes = _compressImageToAllowedSize(
        imageBytes,
        maxBytes: _maxImageBytes,
      );

      if (compressedImageBytes == null) {
        state = state.copyWith(
          isUploadingImage: false,
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
      talker.debug(
        '[MatchChat] Image compressed before upload. '
        'scheduledMatchId=$scheduledMatchId name=${pickedImage.name} '
        'sourceBytes=${imageBytes.length} compressedBytes=${compressedImageBytes.length}',
      );
    }

    talker.debug(
      '[MatchChat] Uploading image message. scheduledMatchId=$scheduledMatchId '
      'name=$imageFileName bytes=${imageBytesToUpload.length}',
    );

    final imageByteData = ByteData.sublistView(imageBytesToUpload);
    try {
      final sendResult = await ref
          .read(clientProvider)
          .sendMatchChatMessage
          .v1(
            scheduledMatchId: scheduledMatchId,
            content: '',
            imageBytes: imageByteData,
            imageFileName: imageFileName,
            imageContentType: imageContentType,
          )
          .toResult;

      await sendResult.fold(
        (serverMessage) async {
          talker.debug(
            '[MatchChat] Image message sent. '
            'scheduledMatchId=$scheduledMatchId messageId=${serverMessage.id} '
            'imageUrl=${serverMessage.imageUrl}',
          );
          await _insertMessage(serverMessage);
          state = state.copyWith(
            isUploadingImage: false,
            actionError: null,
          );
        },
        (error) async {
          talker.debug(
            '[MatchChat] Failed to send image message. '
            'scheduledMatchId=$scheduledMatchId title=${error.title} '
            'description=${error.description}',
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
      state = state.copyWith(
        isUploadingImage: false,
        actionError: RootHubException(
          title: 'Unable to send image',
          description: 'An unexpected error occurred while sending your image.',
        ),
      );
    }
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

  Future<User?> resolveUser(String authorId) async {
    final displayName = displayNameForAuthorId(authorId);
    final isSubscribed = isAuthorSubscribed(authorId);
    final name = isSubscribed ? '$displayName • Subscribed' : displayName;

    return User(
      id: authorId,
      name: name,
      metadata: <String, dynamic>{
        'isSubscribed': isSubscribed,
      },
    );
  }

  String displayNameForAuthorId(String authorId) {
    final sender = _playersByAuthorId[authorId];
    if (sender == null) {
      return 'Player #$authorId';
    }
    return sender.displayName;
  }

  String? profileImageUrlForAuthorId(String authorId) {
    return _profileImageUrlsByAuthorId[authorId];
  }

  String? factionIconPathForAuthorId(String authorId) {
    final sender = _playersByAuthorId[authorId];
    if (sender == null) {
      return null;
    }

    return sender.favoriteFaction.getFactionIconPath(
      size: FactionIconSize.size80,
    );
  }

  bool isAuthorSubscribed(String authorId) {
    final playerId = int.tryParse(authorId);
    if (playerId == null) {
      return false;
    }
    return state.subscribedPlayerIds.contains(playerId);
  }

  void clearActionError() {
    state = state.copyWith(actionError: null);
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
          scheduledMatchId: scheduledMatchId,
          page: page,
        )
        .toResult;

    await result.fold(
      (chatPage) async {
        final orderedMessages = [...chatPage.messages]
          ..sort((a, b) => a.sentAt.compareTo(b.sentAt));
        final mappedMessages = orderedMessages.map(_toUiMessage).toList();

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

        if (replaceMessages) {
          _chatMessages
            ..clear()
            ..addAll(mappedMessages);
        } else {
          final existingIds = _chatMessages
              .map((message) => message.id)
              .toSet();
          final uniqueMessages = mappedMessages
              .where((message) => !existingIds.contains(message.id))
              .toList();
          _chatMessages.insertAll(0, uniqueMessages);
        }

        await _chatController.setMessages(
          List<Message>.from(_chatMessages),
          animated: !replaceMessages,
        );

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
        talker.debug(
          '[MatchChat] Failed to load chat page. '
          'scheduledMatchId=$scheduledMatchId page=$page '
          'title=${error.title} description=${error.description}',
        );
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
        .v1(scheduledMatchId: scheduledMatchId)
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

  Future<void> _insertMessage(MatchChatMessage serverMessage) async {
    final message = _toUiMessage(serverMessage);
    final alreadyExists = _chatMessages.any(
      (existingMessage) => existingMessage.id == message.id,
    );
    if (alreadyExists) {
      return;
    }

    _chatMessages.add(message);
    await _chatController.insertMessage(message);
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
            scheduledMatchId: scheduledMatchId,
            playerDataId: playerDataId,
          );
      return null;
    } on RootHubException catch (error) {
      talker.debug(
        '[MatchChat] Remove player failed. '
        'scheduledMatchId=$scheduledMatchId '
        'playerDataId=$playerDataId '
        'title=${error.title} description=${error.description}',
      );
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
          .v1(scheduledMatchId: scheduledMatchId);
      return null;
    } on RootHubException catch (error) {
      talker.debug(
        '[MatchChat] Unsubscribe failed. '
        'scheduledMatchId=$scheduledMatchId '
        'title=${error.title} description=${error.description}',
      );
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

  Message _toUiMessage(MatchChatMessage serverMessage) {
    final messageId =
        serverMessage.id?.toString() ??
        '${serverMessage.playerDataId}_${serverMessage.sentAt.millisecondsSinceEpoch}';
    final authorId = serverMessage.playerDataId.toString();

    final sender = serverMessage.sender;
    if (sender != null) {
      _playersByAuthorId[authorId] = sender;
    }

    final isSystemMessage =
        serverMessage.messageType == MatchChatMessageType.systemJoin ||
        serverMessage.messageType == MatchChatMessageType.systemLeave;

    if (isSystemMessage) {
      return Message.custom(
        id: messageId,
        authorId: authorId,
        createdAt: serverMessage.sentAt,
        sentAt: serverMessage.sentAt,
        status: MessageStatus.sent,
        metadata: <String, dynamic>{
          'type': serverMessage.messageType == MatchChatMessageType.systemJoin
              ? 'systemJoin'
              : 'systemLeave',
          'content': serverMessage.content.trim(),
        },
      );
    }

    final normalizedText = serverMessage.content.trim();
    final normalizedImageUrl = serverMessage.imageUrl?.trim();
    final hasImage =
        normalizedImageUrl != null && normalizedImageUrl.isNotEmpty;

    if (hasImage) {
      return Message.image(
        id: messageId,
        authorId: authorId,
        createdAt: serverMessage.sentAt,
        sentAt: serverMessage.sentAt,
        status: MessageStatus.sent,
        source: normalizedImageUrl,
        text: normalizedText.isEmpty ? null : normalizedText,
        blurhash: serverMessage.blurhash,
        width: serverMessage.imageWidth?.toDouble(),
        height: serverMessage.imageHeight?.toDouble(),
      );
    }

    return Message.text(
      id: messageId,
      authorId: authorId,
      createdAt: serverMessage.sentAt,
      sentAt: serverMessage.sentAt,
      status: MessageStatus.sent,
      text: normalizedText,
    );
  }
}

final matchChatProvider = NotifierProvider<MatchChatNotifier, MatchChatState>(
  MatchChatNotifier.new,
);
