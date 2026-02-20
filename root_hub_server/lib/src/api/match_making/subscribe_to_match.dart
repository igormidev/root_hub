import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class SubscribeToMatch extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<MatchSubscription> v1(
    Session session, {
    required int scheduledMatchId,
  }) async {
    return guardRootHubEndpointErrors(
      () async {
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

        final match = await MatchSchedulePairingAttempt.db.findById(
          session,
          scheduledMatchId,
        );

        if (match == null) {
          throw RootHubEndpointError.notFound(
            title: 'Scheduled match not found',
            description:
                'Scheduled match with id $scheduledMatchId was not found.',
          );
        }

        final existing = await MatchSubscription.db.findFirstRow(
          session,
          where: (t) =>
              t.matchSchedulePairingAttemptId.equals(scheduledMatchId) &
              t.playerDataId.equals(playerData.id!),
        );

        if (existing != null) {
          throw RootHubEndpointError.invalidRequest(
            title: 'Subscription already exists',
            description: 'Already subscribed to this match.',
          );
        }

        final subscription = await MatchSubscription.db.insertRow(
          session,
          MatchSubscription(
            subscribedAt: DateTime.now(),
            matchSchedulePairingAttemptId: scheduledMatchId,
            playerDataId: playerData.id!,
          ),
        );

        await MatchSubscription.db.attachRow.matchSchedulePairingAttempt(
          session,
          subscription,
          match,
        );
        await MatchSubscription.db.attachRow.playerData(
          session,
          subscription,
          playerData,
        );

        return subscription;
      },
      fallbackDescription:
          'Unable to subscribe to this match right now. Please try again.',
    );
  }
}
