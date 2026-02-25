import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class EditMatchSchedule extends Endpoint {
  @override
  bool get requireLogin => true;

  static const _maxScheduleDays = 15;
  static const _minScheduleMinutes = 10;

  Future<void> v1(
    Session session, {
    required int scheduledMatchId,
    required String title,
    String? description,
    required MatchPodium minAmountOfPlayers,
    required MatchPodium maxAmountOfPlayers,
    required DateTime attemptedAt,
    bool? closedForSubscriptions,
  }) async {
    return guardRootHubEndpointErrors(
      () async {
        if (scheduledMatchId <= 0) {
          throw RootHubEndpointError.invalidRequest(
            description: 'Scheduled match id must be greater than zero.',
          );
        }

        final normalizedTitle = title.trim();
        if (normalizedTitle.isEmpty) {
          throw RootHubEndpointError.invalidRequest(
            description: 'Title cannot be empty.',
          );
        }

        final minPlayers = _podiumToPlayersCount(minAmountOfPlayers);
        final maxPlayers = _podiumToPlayersCount(maxAmountOfPlayers);
        if (minPlayers < 2 || maxPlayers > 6 || minPlayers > maxPlayers) {
          throw RootHubEndpointError.invalidRequest(
            description:
                'Players range must stay between 2 and 6, '
                'with min not greater than max.',
          );
        }

        final now = DateTime.now();
        final minAllowedTime = now.add(
          const Duration(minutes: _minScheduleMinutes),
        );
        if (attemptedAt.isBefore(minAllowedTime)) {
          throw RootHubEndpointError.invalidRequest(
            description:
                'The scheduled time must be at least '
                '$_minScheduleMinutes minutes in the future.',
          );
        }

        final maxAllowedTime = now.add(
          const Duration(days: _maxScheduleDays),
        );
        if (attemptedAt.isAfter(maxAllowedTime)) {
          throw RootHubEndpointError.invalidRequest(
            description:
                'The scheduled time cannot be more than '
                '$_maxScheduleDays days in the future.',
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
          include: MatchSchedulePairingAttempt.include(
            subscriptions: MatchSubscription.includeList(),
          ),
        );

        if (matchSchedule == null) {
          throw RootHubEndpointError.notFound(
            title: 'Table not found',
            description: 'The selected table was not found.',
          );
        }

        if (matchSchedule.playerDataId != hostPlayerData.id) {
          throw RootHubEndpointError.accessDenied(
            description: 'Only the host of the table can edit its details.',
          );
        }

        final currentSubscriberCount = matchSchedule.subscriptions?.length ?? 0;
        if (maxPlayers < currentSubscriberCount) {
          throw RootHubEndpointError.invalidRequest(
            title: 'Too many players',
            description:
                'There are already $currentSubscriberCount players subscribed. '
                'You cannot set the maximum below that number.',
          );
        }

        final normalizedDescription = description?.trim();
        matchSchedule
          ..title = normalizedTitle
          ..description = normalizedDescription?.isEmpty == true
              ? null
              : normalizedDescription
          ..minAmountOfPlayers = minAmountOfPlayers
          ..maxAmountOfPlayers = maxAmountOfPlayers
          ..attemptedAt = attemptedAt
          ..closedForSubscriptions = closedForSubscriptions;

        await MatchSchedulePairingAttempt.db.updateRow(
          session,
          matchSchedule,
        );

        session.log(
          '[MatchMaking] Match schedule updated. '
          'scheduledMatchId=$scheduledMatchId '
          'hostId=${hostPlayerData.id}',
          level: LogLevel.info,
        );
      },
      fallbackDescription:
          'Unable to update this table right now. Please try again.',
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
