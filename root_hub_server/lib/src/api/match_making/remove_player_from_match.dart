import 'package:root_hub_server/src/api/match_chat/send_system_chat_message.dart';
import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class RemovePlayerFromMatch extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<void> v1(
    Session session, {
    required int scheduledMatchId,
    required int playerDataId,
  }) async {
    return guardRootHubEndpointErrors(
      () async {
        if (scheduledMatchId <= 0) {
          throw RootHubEndpointError.invalidRequest(
            description: 'Scheduled match id must be greater than zero.',
          );
        }

        if (playerDataId <= 0) {
          throw RootHubEndpointError.invalidRequest(
            description: 'Player data id must be greater than zero.',
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
            title: 'Player profile missing',
            description: 'Player profile not found for authenticated user.',
          );
        }

        final matchSchedule = await MatchSchedulePairingAttempt.db.findById(
          session,
          scheduledMatchId,
        );

        if (matchSchedule == null) {
          throw RootHubEndpointError.notFound(
            title: 'Table not found',
            description: 'The selected table was not found.',
          );
        }

        if (matchSchedule.playerDataId != hostPlayerData.id) {
          throw RootHubEndpointError.accessDenied(
            description: 'Only the host of the table can remove players.',
          );
        }

        if (playerDataId == hostPlayerData.id) {
          throw RootHubEndpointError.invalidRequest(
            description: 'You cannot remove yourself. Use leave table instead.',
          );
        }

        final targetPlayerData = await PlayerData.db.findById(
          session,
          playerDataId,
        );

        if (targetPlayerData == null) {
          throw RootHubEndpointError.notFound(
            title: 'Player not found',
            description: 'The player to remove was not found.',
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
            title: 'Player not subscribed',
            description: 'This player is not subscribed to the table.',
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
          scheduledMatchId: scheduledMatchId,
          playerData: hostPlayerData,
          messageType: MatchChatMessageType.systemLeave,
          content:
              '${hostPlayerData.displayName} removed '
              '${targetPlayerData.displayName} from the table',
        );
      },
      fallbackDescription:
          'Unable to remove this player right now. Please try again.',
    );
  }
}
