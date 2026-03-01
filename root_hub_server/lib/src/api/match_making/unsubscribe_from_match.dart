import 'package:root_hub_server/src/api/match_chat/send_system_chat_message.dart';
import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:root_hub_server/src/core/server_translations.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class UnsubscribeFromMatch extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<void> v1(
    Session session, {
    required ServerSupportedTranslation language,
    required int scheduledMatchId,
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

        final userIdentifier = session.authenticated!.userIdentifier;
        final authUserId = UuidValue.fromString(userIdentifier);

        final playerData = await PlayerData.db.findFirstRow(
          session,
          where: (t) => t.authUserId.equals(authUserId),
        );

        if (playerData == null) {
          throw RootHubEndpointError.notFound(
            language: language,
            title: t.errors.playerProfileMissingTitle,
            description: t.errors.playerProfileNotFoundForAuthenticatedUser,
          );
        }

        final subscription = await MatchSubscription.db.findFirstRow(
          session,
          where: (t) =>
              t.matchSchedulePairingAttemptId.equals(scheduledMatchId) &
              t.playerDataId.equals(playerData.id!),
        );

        if (subscription == null) {
          throw RootHubEndpointError.invalidRequest(
            language: language,
            title: t.errors.notSubscribedTitle,
            description: t.errors.youAreNotSubscribedToThisMatch,
          );
        }

        await MatchSubscription.db.deleteRow(session, subscription);

        session.log(
          '[MatchMaking] Player unsubscribed. '
          'scheduledMatchId=$scheduledMatchId playerDataId=${playerData.id}',
          level: LogLevel.info,
        );

        await sendSystemChatMessage(
          session,
          language: language,
          scheduledMatchId: scheduledMatchId,
          playerData: playerData,
          messageType: MatchChatMessageType.systemLeave,
          content: t.systemMessages.leftTheTable(
            displayName: playerData.displayName,
          ),
        );
      },
      language: language,
      fallbackDescription: t.fallback.unableToUnsubscribeFromMatch,
    );
  }
}
