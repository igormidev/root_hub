import 'package:root_hub_server/src/api/match_chat/match_chat_participant_state_service.dart';
import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:root_hub_server/src/core/server_translations.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class SetMatchChatTyping extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<void> v1(
    Session session, {
    required ServerSupportedTranslation language,
    required int scheduledMatchId,
    required bool isTyping,
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
        if (matchSchedule == null || chatHistory?.id == null) {
          throw RootHubEndpointError.notFound(
            language: language,
            title: t.errors.chatNotFoundTitle,
            description: t.errors.chatHistoryForScheduledMatchNotFound(
              scheduledMatchId: scheduledMatchId,
            ),
          );
        }

        await MatchChatParticipantStateService.setTypingState(
          session,
          language: language,
          chatHistory: chatHistory!,
          playerData: playerData,
          isTyping: isTyping,
        );
      },
      language: language,
      fallbackDescription: t.fallback.unableToUpdateChatTypingStatus,
    );
  }
}
