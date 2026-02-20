import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:serverpod/serverpod.dart';
import 'package:root_hub_server/src/generated/protocol.dart';

class RegisterMatchData extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<PlayedMatch> v1(
    Session session, {
    required DateTime matchStartedAt,
    required Duration matchEstimatedDuration,
    required int locationId,
    required int scheduledPairingAttemptId,
    required List<PlayerMatchResultInput> players,
  }) async {
    return guardRootHubEndpointErrors(
      () async {
        if (matchEstimatedDuration <= Duration.zero) {
          _throwInvalidRequest(
            'Match estimated duration must be greater than zero.',
          );
        }

        final authenticatedPlayerData = await _getAuthenticatedPlayerData(
          session,
        );

        final scheduledPairingAttempt = await MatchSchedulePairingAttempt.db
            .findById(session, scheduledPairingAttemptId);
        if (scheduledPairingAttempt == null) {
          _throwNotFound(
            title: 'Scheduled match not found',
            description: 'Scheduled pairing attempt not found.',
          );
        }

        final location = await Location.db.findById(session, locationId);
        if (location == null) {
          _throwNotFound(
            title: 'Location not found',
            description: 'Location not found.',
          );
        }

        if (scheduledPairingAttempt.locationId != locationId) {
          _throwInvalidRequest(
            'Provided location does not match the scheduled pairing attempt location.',
          );
        }

        _validatePlayersCount(
          playersCount: players.length,
          minAmountOfPlayers: scheduledPairingAttempt.minAmountOfPlayers,
          maxAmountOfPlayers: scheduledPairingAttempt.maxAmountOfPlayers,
        );
        _validatePlayerResults(players);
        await _validatePlayerReferencesExist(session, players);
        await _validateAuthenticatedPlayerCanRegister(
          session,
          authenticatedPlayerData: authenticatedPlayerData,
          scheduledPairingAttempt: scheduledPairingAttempt,
        );
        await _validateRegisteredPlayerDataAreParticipants(
          session,
          scheduledPairingAttempt: scheduledPairingAttempt,
          players: players,
        );

        return await session.db.transaction((transaction) async {
          final playedMatch = await PlayedMatch.db.insertRow(
            session,
            PlayedMatch(
              matchStartedAt: matchStartedAt,
              matchEstimatedDuration: matchEstimatedDuration,
              locationId: location.id!,
            ),
            transaction: transaction,
          );

          final playerPerformances = players
              .map(
                (player) => PlayerPerfomanceInMatch(
                  anonymousPlayerId: player.anonymousPlayerId,
                  playerDataId: player.playerDataId,
                  playedMatchId: playedMatch.id!,
                  factionUsedInMatch: player.factionUsedInMatch,
                  didWin: player.didWin,
                  scoreInMatch: player.scoreInMatch,
                ),
              )
              .toList();

          if (playerPerformances.isNotEmpty) {
            await PlayerPerfomanceInMatch.db.insert(
              session,
              playerPerformances,
              transaction: transaction,
            );
          }

          final playerDataIds = players
              .map((player) => player.playerDataId)
              .whereType<int>()
              .toSet();
          final playerInMatchRows = playerDataIds
              .map(
                (playerDataId) => PlayerInMatch(
                  playerId: playerDataId,
                  matchId: playedMatch.id!,
                ),
              )
              .toList();

          if (playerInMatchRows.isNotEmpty) {
            await PlayerInMatch.db.insert(
              session,
              playerInMatchRows,
              transaction: transaction,
            );
          }

          return playedMatch;
        });
      },
      fallbackDescription:
          'Unable to register this match result right now. Please try again.',
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
      _throwNotFound(
        title: 'Player profile missing',
        description: 'Player profile not found for authenticated user.',
      );
    }

    return playerData;
  }

  void _validatePlayersCount({
    required int playersCount,
    required MatchPodium minAmountOfPlayers,
    required MatchPodium maxAmountOfPlayers,
  }) {
    final minPlayers = _podiumToPlayersCount(minAmountOfPlayers);
    final maxPlayers = _podiumToPlayersCount(maxAmountOfPlayers);

    if (playersCount < minPlayers || playersCount > maxPlayers) {
      _throwInvalidRequest(
        'Players count must be between $minPlayers and $maxPlayers for this scheduled pairing attempt.',
      );
    }
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

  void _validatePlayerResults(List<PlayerMatchResultInput> players) {
    if (players.length < 2 || players.length > 6) {
      _throwInvalidRequest('Root matches must have between 2 and 6 players.');
    }

    final winnerCount = players.where((player) => player.didWin).length;
    if (winnerCount == 0) {
      _throwInvalidRequest(
        'A match must have exactly one winner, but none was provided.',
      );
    }
    if (winnerCount > 1) {
      _throwInvalidRequest(
        'A match must have exactly one winner, but $winnerCount winners were provided.',
      );
    }

    final seenPlayerDataIds = <int>{};
    final seenAnonymousPlayerIds = <int>{};
    final nonVagabondFactions = <Faction>{};
    var vagabondCount = 0;

    for (final player in players) {
      final hasAnonymousPlayer = player.anonymousPlayerId != null;
      final hasPlayerData = player.playerDataId != null;
      if (hasAnonymousPlayer == hasPlayerData) {
        _throwInvalidRequest(
          'Each player must provide exactly one identifier: anonymousPlayerId or playerDataId.',
        );
      }

      if (player.playerDataId case final playerDataId?) {
        if (!seenPlayerDataIds.add(playerDataId)) {
          _throwInvalidRequest(
            'Duplicate playerDataId found in players list: $playerDataId.',
          );
        }
      }

      if (player.anonymousPlayerId case final anonymousPlayerId?) {
        if (!seenAnonymousPlayerIds.add(anonymousPlayerId)) {
          _throwInvalidRequest(
            'Duplicate anonymousPlayerId found in players list: $anonymousPlayerId.',
          );
        }
      }

      if (player.scoreInMatch case final score?) {
        if (score < 0 || score > 30) {
          _throwInvalidRequest(
            'scoreInMatch must be between 0 and 30 when provided.',
          );
        }
      }

      if (player.factionUsedInMatch == Faction.vagabond) {
        vagabondCount++;
        if (vagabondCount > 2) {
          _throwInvalidRequest('At most 2 players can use Vagabond.');
        }
      } else if (!nonVagabondFactions.add(player.factionUsedInMatch)) {
        _throwInvalidRequest(
          'Faction ${player.factionUsedInMatch.name} is duplicated. Only Vagabond can repeat.',
        );
      }
    }

    final winner = players.firstWhere((player) => player.didWin);
    final winnerByPoints = winner.scoreInMatch == 30;
    final winnerByDomination = winner.scoreInMatch == null;

    if (!winnerByPoints && !winnerByDomination) {
      _throwInvalidRequest(
        'Winner must have (didWin=true and scoreInMatch=30) or (didWin=true and scoreInMatch=null).',
      );
    }

    final invalidNonWinners = players.where(
      (player) => !player.didWin && player.scoreInMatch == 30,
    );
    if (invalidNonWinners.isNotEmpty) {
      _throwInvalidRequest(
        'Only the winner can have scoreInMatch equal to 30.',
      );
    }
  }

  Future<void> _validatePlayerReferencesExist(
    Session session,
    List<PlayerMatchResultInput> players,
  ) async {
    final playerDataIds = players
        .map((player) => player.playerDataId)
        .whereType<int>()
        .toSet();
    final anonymousPlayerIds = players
        .map((player) => player.anonymousPlayerId)
        .whereType<int>()
        .toSet();

    if (playerDataIds.isNotEmpty) {
      final existingPlayerData = await PlayerData.db.find(
        session,
        where: (t) => t.id.inSet(playerDataIds),
      );
      final existingPlayerDataIds = existingPlayerData
          .map((playerData) => playerData.id)
          .whereType<int>()
          .toSet();
      final missingPlayerDataIds = playerDataIds.difference(
        existingPlayerDataIds,
      );

      if (missingPlayerDataIds.isNotEmpty) {
        final missingIds = missingPlayerDataIds.toList()..sort();
        _throwInvalidRequest(
          'playerDataId not found for ids: ${missingIds.join(', ')}.',
        );
      }
    }

    if (anonymousPlayerIds.isNotEmpty) {
      final existingAnonymousPlayers = await AnonymousPlayer.db.find(
        session,
        where: (t) => t.id.inSet(anonymousPlayerIds),
      );
      final existingAnonymousPlayerIds = existingAnonymousPlayers
          .map((anonymousPlayer) => anonymousPlayer.id)
          .whereType<int>()
          .toSet();
      final missingAnonymousPlayerIds = anonymousPlayerIds.difference(
        existingAnonymousPlayerIds,
      );

      if (missingAnonymousPlayerIds.isNotEmpty) {
        final missingIds = missingAnonymousPlayerIds.toList()..sort();
        _throwInvalidRequest(
          'anonymousPlayerId not found for ids: ${missingIds.join(', ')}.',
        );
      }
    }
  }

  Future<void> _validateAuthenticatedPlayerCanRegister(
    Session session, {
    required PlayerData authenticatedPlayerData,
    required MatchSchedulePairingAttempt scheduledPairingAttempt,
  }) async {
    if (scheduledPairingAttempt.playerDataId == authenticatedPlayerData.id) {
      return;
    }

    final isSubscribed = await MatchSubscription.db.findFirstRow(
      session,
      where: (t) =>
          t.matchSchedulePairingAttemptId.equals(scheduledPairingAttempt.id!) &
          t.playerDataId.equals(authenticatedPlayerData.id!),
    );

    if (isSubscribed == null) {
      _throwAccessDenied(
        'Only host or subscribed players can register this match result.',
      );
    }
  }

  Future<void> _validateRegisteredPlayerDataAreParticipants(
    Session session, {
    required MatchSchedulePairingAttempt scheduledPairingAttempt,
    required List<PlayerMatchResultInput> players,
  }) async {
    final registeredPlayerDataIds = players
        .map((player) => player.playerDataId)
        .whereType<int>()
        .toSet();
    if (registeredPlayerDataIds.isEmpty) {
      return;
    }

    final subscriptions = await MatchSubscription.db.find(
      session,
      where: (t) =>
          t.matchSchedulePairingAttemptId.equals(scheduledPairingAttempt.id!),
    );

    final participantPlayerDataIds = <int>{
      scheduledPairingAttempt.playerDataId,
      ...subscriptions.map((subscription) => subscription.playerDataId),
    };

    final nonParticipants =
        registeredPlayerDataIds
            .where(
              (playerDataId) =>
                  !participantPlayerDataIds.contains(playerDataId),
            )
            .toList()
          ..sort();
    if (nonParticipants.isNotEmpty) {
      _throwInvalidRequest(
        'These playerDataIds are not participants of the scheduled pairing attempt: ${nonParticipants.join(', ')}.',
      );
    }
  }

  Never _throwInvalidRequest(String description) {
    throw RootHubEndpointError.invalidRequest(
      title: 'Invalid match registration',
      description: description,
    );
  }

  Never _throwNotFound({
    required String title,
    required String description,
  }) {
    throw RootHubEndpointError.notFound(
      title: title,
      description: description,
    );
  }

  Never _throwAccessDenied(String description) {
    throw RootHubEndpointError.accessDenied(
      title: 'Registration not allowed',
      description: description,
    );
  }
}
