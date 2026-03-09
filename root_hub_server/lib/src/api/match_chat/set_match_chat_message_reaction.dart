import 'package:root_hub_server/src/api/match_chat/match_chat_message_presentation.dart';
import 'package:root_hub_server/src/api/match_chat/match_chat_participant_state_service.dart';
import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:root_hub_server/src/core/server_translations.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class SetMatchChatMessageReaction extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<MatchChatMessage> v1(
    Session session, {
    required ServerSupportedTranslation language,
    required int scheduledMatchId,
    required int messageId,
    required String emoji,
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

        if (messageId <= 0) {
          throw RootHubEndpointError.invalidRequest(
            language: language,
            description: t.errors.messageIdMustBeGreaterThanZero,
          );
        }

        final normalizedEmoji = emoji.trim();
        if (normalizedEmoji.isEmpty) {
          throw RootHubEndpointError.invalidRequest(
            language: language,
            description: t.errors.reactionEmojiCannotBeEmpty,
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

        final chatHistoryId = matchSchedule?.chatHistory?.id;
        if (matchSchedule == null || chatHistoryId == null) {
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
          include: MatchChatMessage.include(
            sender: PlayerData.include(),
          ),
        );

        if (message == null) {
          throw RootHubEndpointError.notFound(
            language: language,
            description: t.errors.messageWithIdNotFound(messageId: messageId),
          );
        }

        final playerKey = playerData.id!.toString();
        final reactionsByPlayerId =
            MatchChatMessagePresentation.decodeReactionsJson(
              message.reactionsJson,
            );

        if (reactionsByPlayerId[playerKey] == normalizedEmoji) {
          reactionsByPlayerId.remove(playerKey);
        } else {
          reactionsByPlayerId[playerKey] = normalizedEmoji;
        }

        message.reactionsJson = MatchChatMessagePresentation.encodeReactionsJson(
          reactionsByPlayerId,
        );

        await MatchChatMessage.db.updateRow(session, message);
        return message;
      },
      language: language,
      fallbackDescription: t.fallback.unableToUpdateChatReaction,
    );
  }
}
