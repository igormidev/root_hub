import 'dart:typed_data';

import 'package:root_hub_server/src/core/uploadthing_storage_client.dart';
import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
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

        final playerData = await _getPlayerData(session);
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

  Future<PlayerData> _getPlayerData(Session session) async {
    final userIdentifier = session.authenticated!.userIdentifier;
    final authUserId = UuidValue.fromString(userIdentifier);

    final playerData = await PlayerData.db.findFirstRow(
      session,
      where: (t) => t.authUserId.equals(authUserId),
    );

    if (playerData == null) {
      throw RootHubEndpointError.notFound(
        title: 'Player profile missing',
        description: 'Player profile not found for authenticated user.',
      );
    }

    return playerData;
  }
}
