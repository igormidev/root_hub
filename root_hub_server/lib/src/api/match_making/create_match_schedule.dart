import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class CreateMatchSchedule extends Endpoint {
  @override
  bool get requireLogin => true;

  static const _maxScheduleDays = 50;
  static const _minScheduleMinutes = 10;

  Future<MatchSchedulePairingAttempt> v1(
    Session session, {
    required String title,
    String? description,
    required MatchPodium minAmountOfPlayers,
    required MatchPodium maxAmountOfPlayers,
    required DateTime attemptedAt,
    required int locationId,
    required bool hostWillPlay,
  }) async {
    return guardRootHubEndpointErrors(
      () async {
        final normalizedTitle = title.trim();
        final normalizedDescription = description?.trim();
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
                'Players range must stay between 2 and 6, with min not greater than max.',
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

        final location = await Location.db.findById(session, locationId);
        if (location == null) {
          throw RootHubEndpointError.notFound(
            title: 'Location not found',
            description: 'Location with id $locationId was not found.',
          );
        }

        return await session.db.transaction((transaction) async {
          final match = await MatchSchedulePairingAttempt.db.insertRow(
            session,
            MatchSchedulePairingAttempt(
              createdAt: DateTime.now(),
              title: normalizedTitle,
              description: normalizedDescription?.isEmpty == true
                  ? null
                  : normalizedDescription,
              minAmountOfPlayers: minAmountOfPlayers,
              maxAmountOfPlayers: maxAmountOfPlayers,
              attemptedAt: attemptedAt,
              locationId: location.id!,
              playerDataId: playerData.id!,
            ),
            transaction: transaction,
          );

          await MatchSchedulePairingAttempt.db.attachRow.location(
            session,
            match,
            location,
            transaction: transaction,
          );
          await MatchSchedulePairingAttempt.db.attachRow.host(
            session,
            match,
            playerData,
            transaction: transaction,
          );

          final chatHistory = await MatchChatHistory.db.insertRow(
            session,
            MatchChatHistory(
              content: '',
              matchSchedulePairingAttemptId: match.id!,
            ),
            transaction: transaction,
          );

          await MatchChatHistory.db.attachRow.matchSchedulePairingAttempt(
            session,
            chatHistory,
            match,
            transaction: transaction,
          );

          if (hostWillPlay) {
            final hostSubscription = await MatchSubscription.db.insertRow(
              session,
              MatchSubscription(
                subscribedAt: DateTime.now(),
                matchSchedulePairingAttemptId: match.id!,
                playerDataId: playerData.id!,
              ),
              transaction: transaction,
            );

            await MatchSubscription.db.attachRow.matchSchedulePairingAttempt(
              session,
              hostSubscription,
              match,
              transaction: transaction,
            );
            await MatchSubscription.db.attachRow.playerData(
              session,
              hostSubscription,
              playerData,
              transaction: transaction,
            );
          }

          return match;
        });
      },
      fallbackDescription:
          'Unable to create a match schedule right now. Please try again.',
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
