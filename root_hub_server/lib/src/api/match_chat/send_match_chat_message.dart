import 'dart:typed_data';

import 'package:blurhash_dart/blurhash_dart.dart';
import 'package:image/image.dart' as img;
import 'package:root_hub_server/src/api/match_chat/match_chat_participant_state_service.dart';
import 'package:root_hub_server/src/core/uploadthing_storage_client.dart';
import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:root_hub_server/src/notifications/match_chat_push_notification_service.dart';
import 'package:serverpod/serverpod.dart';

class SendMatchChatMessage extends Endpoint {
  static const _uploadThingStorageClient = UploadThingStorageClient();
  static const _maxImageBytes = 6 * 1024 * 1024;

  @override
  bool get requireLogin => true;

  Future<MatchChatMessage> v1(
    Session session, {
    required int scheduledMatchId,
    required String content,
    ByteData? imageBytes,
    String? imageFileName,
    String? imageContentType,
  }) async {
    return guardRootHubEndpointErrors(
      () async {
        if (scheduledMatchId <= 0) {
          throw RootHubEndpointError.invalidRequest(
            description: 'Scheduled match id must be greater than zero.',
          );
        }

        final normalizedContent = content.trim();
        final hasImage = imageBytes != null && imageBytes.lengthInBytes > 0;

        if (normalizedContent.isEmpty && !hasImage) {
          throw RootHubEndpointError.invalidRequest(
            description: 'Message must include text content or an image.',
          );
        }

        if (imageBytes != null && imageBytes.lengthInBytes == 0) {
          throw RootHubEndpointError.invalidRequest(
            description: 'Image bytes cannot be empty.',
          );
        }

        if (imageBytes != null && imageBytes.lengthInBytes > _maxImageBytes) {
          throw RootHubEndpointError.invalidRequest(
            description:
                'Image is too large. Please send an image smaller than 6 MB.',
          );
        }

        final playerData =
            await MatchChatParticipantStateService.getAuthenticatedPlayerData(
              session,
            );
        session.log(
          '[MatchChat] Sending message. '
          'scheduledMatchId=$scheduledMatchId playerDataId=${playerData.id} '
          'hasText=${normalizedContent.isNotEmpty} hasImage=$hasImage',
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
            title: 'Scheduled match not found',
            description:
                'Scheduled match with id $scheduledMatchId was not found.',
          );
        }

        final chatHistory = matchSchedule.chatHistory;
        final chatHistoryId = chatHistory?.id;
        if (chatHistory == null || chatHistoryId == null) {
          throw RootHubEndpointError.notFound(
            title: 'Chat not found',
            description:
                'Chat history for scheduled match $scheduledMatchId was not found.',
          );
        }

        String? uploadedImageUrl;
        String? computedBlurhash;
        int? computedImageWidth;
        int? computedImageHeight;

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
              description:
                  'Unable to upload image right now. Please try again.',
            );
          }
        }

        final message = await MatchChatMessage.db.insertRow(
          session,
          MatchChatMessage(
            sentAt: DateTime.now(),
            content: normalizedContent,
            imageUrl: uploadedImageUrl,
            blurhash: computedBlurhash,
            imageWidth: computedImageWidth,
            imageHeight: computedImageHeight,
            messageType: MatchChatMessageType.userMessage,
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
          chatHistory: chatHistory,
          playerData: playerData,
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
          'messageId=${message.id} hasImage=${uploadedImageUrl != null}',
          level: LogLevel.info,
        );

        return message;
      },
      fallbackDescription:
          'Unable to send the message right now. Please try again.',
    );
  }
}
