import 'dart:typed_data';

import 'package:blurhash_dart/blurhash_dart.dart';
import 'package:image/image.dart' as img;
import 'package:root_hub_server/src/api/match_chat/match_chat_message_presentation.dart';
import 'package:root_hub_server/src/api/match_chat/match_chat_participant_state_service.dart';
import 'package:root_hub_server/src/core/uploadthing_storage_client.dart';
import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:root_hub_server/src/core/server_translations.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:root_hub_server/src/notifications/match_chat_push_notification_service.dart';
import 'package:serverpod/serverpod.dart';

class SendMatchChatMessage extends Endpoint {
  static const _uploadThingStorageClient = UploadThingStorageClient();
  static const _maxImageBytes = 3 * 1024 * 1024;
  static const _maxAudioBytes = 12 * 1024 * 1024;

  @override
  bool get requireLogin => true;

  Future<MatchChatMessage> v1(
    Session session, {
    required ServerSupportedTranslation language,
    required int scheduledMatchId,
    required String content,
    ByteData? imageBytes,
    String? imageFileName,
    String? imageContentType,
    ByteData? audioBytes,
    String? audioFileName,
    String? audioContentType,
    int? audioDurationMilliseconds,
    int? replyToMessageId,
  }) async {
    final t = ServerTranslations.of(language);

    return guardRootHubEndpointErrors(
      () async {
        if (scheduledMatchId <= 0) {
          throw RootHubEndpointError.invalidRequest(
            language: language,
            description: t.errors.scheduledMatchIdMustBeGreaterThanZero,
          );
        }

        final normalizedContent = content.trim();
        final hasImage = imageBytes != null && imageBytes.lengthInBytes > 0;
        final hasAudio = audioBytes != null && audioBytes.lengthInBytes > 0;

        if (normalizedContent.isEmpty && !hasImage && !hasAudio) {
          throw RootHubEndpointError.invalidRequest(
            language: language,
            description: t.errors.messageMustIncludeTextOrImage,
          );
        }

        if (imageBytes != null && imageBytes.lengthInBytes == 0) {
          throw RootHubEndpointError.invalidRequest(
            language: language,
            description: t.errors.imageBytesCannotBeEmpty,
          );
        }

        if (audioBytes != null && audioBytes.lengthInBytes == 0) {
          throw RootHubEndpointError.invalidRequest(
            language: language,
            description: t.errors.audioBytesCannotBeEmpty,
          );
        }

        if (hasImage && hasAudio) {
          throw RootHubEndpointError.invalidRequest(
            language: language,
            description: t.errors.messageCannotIncludeImageAndAudio,
          );
        }

        if (imageBytes != null && imageBytes.lengthInBytes > _maxImageBytes) {
          throw RootHubEndpointError.invalidRequest(
            language: language,
            description: t.errors.imageTooLargeSixMb,
          );
        }

        if (audioBytes != null && audioBytes.lengthInBytes > _maxAudioBytes) {
          throw RootHubEndpointError.invalidRequest(
            language: language,
            description: t.errors.audioTooLarge,
          );
        }

        if (replyToMessageId != null && replyToMessageId <= 0) {
          throw RootHubEndpointError.invalidRequest(
            language: language,
            description: t.errors.messageIdMustBeGreaterThanZero,
          );
        }

        final playerData =
            await MatchChatParticipantStateService.getAuthenticatedPlayerData(
              session,
              language: language,
            );
        session.log(
          '[MatchChat] Sending message. '
          'scheduledMatchId=$scheduledMatchId playerDataId=${playerData.id} '
          'hasText=${normalizedContent.isNotEmpty} hasImage=$hasImage '
          'hasAudio=$hasAudio',
          level: LogLevel.info,
        );

        final matchSchedule = await MatchSchedulePairingAttempt.db.findById(
          session,
          scheduledMatchId,
          include: MatchSchedulePairingAttempt.include(
            chatHistory: MatchChatHistory.include(),
          ),
        );

        if (matchSchedule == null) {
          throw RootHubEndpointError.notFound(
            language: language,
            title: t.errors.scheduledMatchNotFoundTitle,
            description: t.errors.scheduledMatchWithIdNotFound(
              scheduledMatchId: scheduledMatchId,
            ),
          );
        }

        final chatHistory = matchSchedule.chatHistory;
        final chatHistoryId = chatHistory?.id;
        if (chatHistory == null || chatHistoryId == null) {
          throw RootHubEndpointError.notFound(
            language: language,
            title: t.errors.chatNotFoundTitle,
            description: t.errors.chatHistoryForScheduledMatchNotFound(
              scheduledMatchId: scheduledMatchId,
            ),
          );
        }

        String? uploadedImageUrl;
        String? uploadedAudioUrl;
        String? computedBlurhash;
        int? computedImageWidth;
        int? computedImageHeight;
        MatchChatMessage? repliedMessage;

        if (hasImage) {
          final imageBytesList = imageBytes.buffer.asUint8List(
            imageBytes.offsetInBytes,
            imageBytes.lengthInBytes,
          );
          session.log(
            '[MatchChat] Image message detected. '
            'scheduledMatchId=$scheduledMatchId playerDataId=${playerData.id} '
            'name=${imageFileName ?? '<empty>'} contentType=${imageContentType ?? '<null>'} '
            'bytes=${imageBytesList.length}',
            level: LogLevel.info,
          );

          try {
            final decodedImage = img.decodeImage(imageBytesList);
            if (decodedImage != null) {
              computedImageWidth = decodedImage.width;
              computedImageHeight = decodedImage.height;

              final thumbnailWidth = decodedImage.width > 100
                  ? 100
                  : decodedImage.width;
              final thumbnail = img.copyResize(
                decodedImage,
                width: thumbnailWidth,
                interpolation: img.Interpolation.average,
              );
              computedBlurhash = BlurHash.encode(
                thumbnail,
                numCompX: 4,
                numCompY: 3,
              ).hash;

              session.log(
                '[MatchChat] Blurhash computed. '
                'scheduledMatchId=$scheduledMatchId playerDataId=${playerData.id} '
                'imageSize=${computedImageWidth}x$computedImageHeight '
                'blurhash=$computedBlurhash',
                level: LogLevel.info,
              );
            }
          } catch (error, stackTrace) {
            session.log(
              '[MatchChat] Blurhash computation failed (non-blocking). '
              'scheduledMatchId=$scheduledMatchId playerDataId=${playerData.id}: $error',
              level: LogLevel.warning,
              exception: error,
              stackTrace: stackTrace,
            );
          }

          try {
            uploadedImageUrl = await _uploadThingStorageClient
                .uploadPublicImage(
                  session,
                  language: language,
                  imageBytes: imageBytesList,
                  fileName: imageFileName ?? '',
                  contentType: imageContentType,
                );
          } on RootHubException catch (error) {
            session.log(
              '[MatchChat] Image upload failed with RootHubException. '
              'scheduledMatchId=$scheduledMatchId playerDataId=${playerData.id} '
              'title=${error.title} description=${error.description}',
              level: LogLevel.warning,
            );
            rethrow;
          } catch (error, stackTrace) {
            session.log(
              '[MatchChat] Image upload failed with unexpected error. '
              'scheduledMatchId=$scheduledMatchId playerDataId=${playerData.id}: $error',
              level: LogLevel.error,
              exception: error,
              stackTrace: stackTrace,
            );
            throw RootHubEndpointError.endpointUnavailable(
              language: language,
              description: t.fallback.unableToUploadImage,
            );
          }
        }

        if (hasAudio) {
          final audioBytesList = audioBytes.buffer.asUint8List(
            audioBytes.offsetInBytes,
            audioBytes.lengthInBytes,
          );
          session.log(
            '[MatchChat] Voice message detected. '
            'scheduledMatchId=$scheduledMatchId playerDataId=${playerData.id} '
            'name=${audioFileName ?? '<empty>'} contentType=${audioContentType ?? '<null>'} '
            'bytes=${audioBytesList.length} durationMs=$audioDurationMilliseconds',
            level: LogLevel.info,
          );

          try {
            uploadedAudioUrl = await _uploadThingStorageClient.uploadPublicFile(
              session,
              language: language,
              fileBytes: audioBytesList,
              fileName: audioFileName ?? '',
              contentType: audioContentType,
            );
          } on RootHubException catch (error) {
            session.log(
              '[MatchChat] Voice upload failed with RootHubException. '
              'scheduledMatchId=$scheduledMatchId playerDataId=${playerData.id} '
              'title=${error.title} description=${error.description}',
              level: LogLevel.warning,
            );
            rethrow;
          } catch (error, stackTrace) {
            session.log(
              '[MatchChat] Voice upload failed with unexpected error. '
              'scheduledMatchId=$scheduledMatchId playerDataId=${playerData.id}: $error',
              level: LogLevel.error,
              exception: error,
              stackTrace: stackTrace,
            );
            throw RootHubEndpointError.endpointUnavailable(
              language: language,
              description: t.fallback.unableToUploadImage,
            );
          }
        }

        if (replyToMessageId != null) {
          repliedMessage = await MatchChatMessage.db.findFirstRow(
            session,
            where: (t) =>
                t.id.equals(replyToMessageId) &
                t.matchChatHistoryId.equals(chatHistoryId),
          );

          if (repliedMessage == null) {
            throw RootHubEndpointError.notFound(
              language: language,
              description: t.errors.messageWithIdNotFound(
                messageId: replyToMessageId,
              ),
            );
          }
        }

        final repliedMessageUiType = repliedMessage == null
            ? null
            : MatchChatMessagePresentation.resolveUiType(repliedMessage);
        final repliedMessagePreview = repliedMessage == null
            ? null
            : MatchChatMessagePresentation.resolveReplyPreview(repliedMessage);

        final message = await MatchChatMessage.db.insertRow(
          session,
          MatchChatMessage(
            sentAt: DateTime.now(),
            content: normalizedContent,
            imageUrl: uploadedImageUrl,
            audioUrl: uploadedAudioUrl,
            audioDurationMilliseconds: hasAudio
                ? audioDurationMilliseconds
                : null,
            replyToMessageId: repliedMessage?.id,
            replyToMessagePreview: repliedMessagePreview,
            replyToMessageUiType: repliedMessageUiType,
            replyToMessageSenderPlayerDataId: repliedMessage?.playerDataId,
            replyToAudioDurationMilliseconds:
                repliedMessage?.audioDurationMilliseconds,
            reactionsJson: null,
            blurhash: computedBlurhash,
            imageWidth: computedImageWidth,
            imageHeight: computedImageHeight,
            messageType: hasAudio
                ? MatchChatMessageType.userVoiceMessage
                : MatchChatMessageType.userMessage,
            matchChatHistoryId: chatHistoryId,
            playerDataId: playerData.id!,
          ),
        );

        await MatchChatMessage.db.attachRow.matchChatHistory(
          session,
          message,
          chatHistory,
        );
        await MatchChatMessage.db.attachRow.sender(
          session,
          message,
          playerData,
        );

        await MatchChatParticipantStateService.ensureParticipantStateExists(
          session,
          language: language,
          chatHistory: chatHistory,
          playerData: playerData,
        );
        await MatchChatParticipantStateService.setTypingState(
          session,
          language: language,
          chatHistory: chatHistory,
          playerData: playerData,
          isTyping: false,
        );
        await MatchChatParticipantStateService.incrementUnreadForRecipients(
          session,
          chatHistoryId: chatHistoryId,
          senderPlayerDataId: playerData.id!,
          sentAt: message.sentAt,
          markSenderAsRead: true,
        );

        try {
          await MatchChatPushNotificationService.notifySubscribedPlayersForNewMessage(
            session,
            scheduledMatchId: scheduledMatchId,
            chatHistoryId: chatHistoryId,
            message: message,
            senderPlayerData: playerData,
            matchTitle: matchSchedule.title,
          );
        } catch (error, stackTrace) {
          session.log(
            '[PushNotifications] Failed to dispatch match chat push '
            'notifications. scheduledMatchId=$scheduledMatchId '
            'playerDataId=${playerData.id} messageId=${message.id}',
            level: LogLevel.error,
            exception: error,
            stackTrace: stackTrace,
          );
        }

        message.sender = playerData;
        session.log(
          '[MatchChat] Message sent. '
          'scheduledMatchId=$scheduledMatchId playerDataId=${playerData.id} '
          'messageId=${message.id} hasImage=${uploadedImageUrl != null} '
          'hasAudio=${uploadedAudioUrl != null}',
          level: LogLevel.info,
        );

        return message;
      },
      language: language,
      fallbackDescription: t.fallback.unableToSendMessage,
    );
  }
}
