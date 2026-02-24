import 'package:root_hub_server/src/api/match_chat/send_system_chat_message.dart';
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
          include: MatchSchedulePairingAttempt.include(
            subscriptions: MatchSubscription.includeList(),
          ),
        );

        if (match == null) {
          throw RootHubEndpointError.notFound(
            title: 'Scheduled match not found',
            description:
                'Scheduled match with id $scheduledMatchId was not found.',
          );
        }

        if (match.closedForSubscriptions == true) {
          throw RootHubEndpointError.invalidRequest(
            title: 'Subscriptions closed',
            description:
                'The host has closed subscriptions for this table. '
                'No new players can join at this time.',
          );
        }

        final currentSubscriptions =
            match.subscriptions ?? const <MatchSubscription>[];
        final maxPlayers = _podiumToPlayersCount(match.maxAmountOfPlayers);
        if (currentSubscriptions.length >= maxPlayers) {
          throw RootHubEndpointError.invalidRequest(
            title: 'Table is full',
            description:
                'This table has reached its maximum of $maxPlayers players.',
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

        await sendSystemChatMessage(
          session,
          scheduledMatchId: scheduledMatchId,
          playerData: playerData,
          messageType: MatchChatMessageType.systemJoin,
          content: '${playerData.displayName} joined the table',
        );

        return subscription;
      },
      fallbackDescription:
          'Unable to subscribe to this match right now. Please try again.',
    );
  }

  int _podiumToPlayersCount(MatchPodium podium) {
    switch (podium) {
      case MatchPodium.firstPlace:
        return 1;
      case MatchPodium.secondPlace:
        return 2;
      case MatchPodium.thirdPlace:
        return 3;
      case MatchPodium.fourthPlace:
        return 4;
      case MatchPodium.fifthPlace:
        return 5;
      case MatchPodium.sixthPlace:
        return 6;
    }
  }
}
