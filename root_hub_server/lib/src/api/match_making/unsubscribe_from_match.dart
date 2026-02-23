import 'package:root_hub_server/src/api/match_chat/send_system_chat_message.dart';
import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class UnsubscribeFromMatch extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<void> v1(
    Session session, {
    required int scheduledMatchId,
  }) async {
    return guardRootHubEndpointErrors(
      () async {
        if (scheduledMatchId <= 0) {
          throw RootHubEndpointError.invalidRequest(
            description: 'Scheduled match id must be greater than zero.',
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
            title: 'Player profile missing',
            description: 'Player profile not found for authenticated user.',
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
            title: 'Not subscribed',
            description: 'You are not subscribed to this match.',
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
          scheduledMatchId: scheduledMatchId,
          playerData: playerData,
          messageType: MatchChatMessageType.systemLeave,
          content: '${playerData.displayName} left the table',
        );
      },
      fallbackDescription:
          'Unable to unsubscribe from this match right now. Please try again.',
    );
  }
}
