import 'package:root_hub_server/src/api/match_chat/match_chat_participant_state_service.dart';
import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:root_hub_server/src/core/server_translations.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class DeleteMatchChatMessage extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<void> v1(
    Session session, {
    required ServerSupportedTranslation language,
    required int scheduledMatchId,
    required int messageId,
  }) async {
    final t = ServerTranslations.of(language);

    await guardRootHubEndpointErrors(
      () async {
        if (scheduledMatchId <= 0) {
          throw RootHubEndpointError.invalidRequest(
            language: language,
            description: t.errors.scheduledMatchIdMustBeGreaterThanZero,
          );
        }

        if (messageId <= 0) {
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

        final matchSchedule = await MatchSchedulePairingAttempt.db.findById(
          session,
          scheduledMatchId,
          include: MatchSchedulePairingAttempt.include(
            chatHistory: MatchChatHistory.include(),
          ),
        );

        final chatHistory = matchSchedule?.chatHistory;
        final chatHistoryId = chatHistory?.id;
        if (matchSchedule == null || chatHistory == null || chatHistoryId == null) {
          throw RootHubEndpointError.notFound(
            language: language,
            title: t.errors.chatNotFoundTitle,
            description: t.errors.chatHistoryForScheduledMatchNotFound(
              scheduledMatchId: scheduledMatchId,
            ),
          );
        }

        final message = await MatchChatMessage.db.findFirstRow(
          session,
          where: (t) =>
              t.id.equals(messageId) & t.matchChatHistoryId.equals(chatHistoryId),
        );

        if (message == null) {
          throw RootHubEndpointError.notFound(
            language: language,
            description: t.errors.messageWithIdNotFound(messageId: messageId),
          );
        }

        if (message.playerDataId != playerData.id) {
          throw RootHubEndpointError.accessDenied(
            language: language,
            description: t.errors.onlyOwnMessagesCanBeDeleted,
          );
        }

        if (message.messageType == MatchChatMessageType.systemJoin ||
            message.messageType == MatchChatMessageType.systemLeave) {
          throw RootHubEndpointError.invalidRequest(
            language: language,
            description: t.errors.systemMessagesCannotBeDeleted,
          );
        }

        await session.db.transaction((transaction) async {
          await MatchChatParticipantStateService
              .decrementUnreadForRecipientsOnDeletedMessage(
                session,
                chatHistoryId: chatHistoryId,
                senderPlayerDataId: playerData.id!,
                sentAt: message.sentAt,
                transaction: transaction,
              );

          await MatchChatMessage.db.deleteRow(
            session,
            message,
            transaction: transaction,
          );
        });
      },
      language: language,
      fallbackDescription: t.fallback.unableToDeleteChatMessage,
    );
  }
}
