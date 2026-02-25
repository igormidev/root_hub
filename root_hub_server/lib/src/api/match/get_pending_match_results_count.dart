import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class GetPendingMatchResultsCount extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<int> v1(Session session) async {
    return guardRootHubEndpointErrors(
      () async {
        final playerData = await _getAuthenticatedPlayerData(session);

        final hostedSchedules = await MatchSchedulePairingAttempt.db.find(
          session,
          where: (t) => t.playerDataId.equals(playerData.id!),
        );
        final hostedScheduleIds = hostedSchedules
            .map((schedule) => schedule.id)
            .whereType<int>();

        final subscriptions = await MatchSubscription.db.find(
          session,
          where: (t) => t.playerDataId.equals(playerData.id!),
        );
        final subscribedScheduleIds = subscriptions
            .map((subscription) => subscription.matchSchedulePairingAttemptId);

        final candidateScheduleIds = <int>{
          ...hostedScheduleIds,
          ...subscribedScheduleIds,
        };

        if (candidateScheduleIds.isEmpty) {
          return 0;
        }

        final playedMatches = await PlayedMatch.db.find(
          session,
          where: (t) => t.scheduledPairingAttemptId.inSet(candidateScheduleIds),
        );

        final promotedScheduleIds = playedMatches
            .map((playedMatch) => playedMatch.scheduledPairingAttemptId)
            .toSet();

        final pendingScheduleIds = candidateScheduleIds.difference(
          promotedScheduleIds,
        );

        return pendingScheduleIds.length;
      },
      fallbackDescription:
          'Unable to load pending match reports right now. Please try again.',
    );
  }

  Future<PlayerData> _getAuthenticatedPlayerData(Session session) async {
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
