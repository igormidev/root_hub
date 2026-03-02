import 'package:root_hub_server/src/api/match_chat/send_system_chat_message.dart';
import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:root_hub_server/src/core/server_translations.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class RemovePlayerFromMatch extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<void> v1(
    Session session, {
    required ServerSupportedTranslation language,
    required int scheduledMatchId,
    required int playerDataId,
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

        if (playerDataId <= 0) {
          throw RootHubEndpointError.invalidRequest(
            language: language,
            description: t.errors.playerDataIdMustBeGreaterThanZero,
          );
        }

        final userIdentifier = session.authenticated!.userIdentifier;
        final authUserId = UuidValue.fromString(userIdentifier);

        final hostPlayerData = await PlayerData.db.findFirstRow(
          session,
          where: (t) => t.authUserId.equals(authUserId),
        );

        if (hostPlayerData == null) {
          throw RootHubEndpointError.notFound(
            language: language,
            title: t.errors.playerProfileMissingTitle,
            description: t.errors.playerProfileNotFoundForAuthenticatedUser,
          );
        }

        final matchSchedule = await MatchSchedulePairingAttempt.db.findById(
          session,
          scheduledMatchId,
        );

        if (matchSchedule == null) {
          throw RootHubEndpointError.notFound(
            language: language,
            title: t.errors.tableNotFoundTitle,
            description: t.errors.selectedTableWasNotFound,
          );
        }

        if (matchSchedule.playerDataId != hostPlayerData.id) {
          throw RootHubEndpointError.accessDenied(
            language: language,
            description: t.errors.onlyHostCanRemovePlayers,
          );
        }

        if (matchSchedule.status != MatchScheduleStatus.scheduled) {
          throw RootHubEndpointError.invalidRequest(
            language: language,
            description: t.errors.onlyScheduledMatchesCanManagePlayers,
          );
        }

        if (playerDataId == hostPlayerData.id) {
          throw RootHubEndpointError.invalidRequest(
            language: language,
            description: t.errors.youCannotRemoveYourself,
          );
        }

        final targetPlayerData = await PlayerData.db.findById(
          session,
          playerDataId,
        );

        if (targetPlayerData == null) {
          throw RootHubEndpointError.notFound(
            language: language,
            title: t.errors.playerNotFoundTitle,
            description: t.errors.playerToRemoveWasNotFound,
          );
        }

        final subscription = await MatchSubscription.db.findFirstRow(
          session,
          where: (t) =>
              t.matchSchedulePairingAttemptId.equals(scheduledMatchId) &
              t.playerDataId.equals(playerDataId),
        );

        if (subscription == null) {
          throw RootHubEndpointError.invalidRequest(
            language: language,
            title: t.errors.playerNotSubscribedTitle,
            description: t.errors.playerIsNotSubscribedToTable,
          );
        }

        await MatchSubscription.db.deleteRow(session, subscription);

        session.log(
          '[MatchMaking] Host removed player from table. '
          'scheduledMatchId=$scheduledMatchId '
          'hostId=${hostPlayerData.id} '
          'removedPlayerId=$playerDataId',
          level: LogLevel.info,
        );

        await sendSystemChatMessage(
          session,
          language: language,
          scheduledMatchId: scheduledMatchId,
          playerData: hostPlayerData,
          messageType: MatchChatMessageType.systemLeave,
          content: t.systemMessages.removedPlayerFromTable(
            hostDisplayName: hostPlayerData.displayName,
            targetDisplayName: targetPlayerData.displayName,
          ),
        );
      },
      language: language,
      fallbackDescription: t.fallback.unableToRemovePlayer,
    );
  }
}
