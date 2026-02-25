import 'dart:typed_data';

import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:root_hub_server/src/core/uploadthing_storage_client.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class RegisterMatchData extends Endpoint {
  static const _uploadThingStorageClient = UploadThingStorageClient();
  static const _registerBeforeScheduledStartAllowance = Duration(hours: 2);
  static const _maxProofImageBytes = 6 * 1024 * 1024;

  @override
  bool get requireLogin => true;

  Future<PlayedMatch> v1(
    Session session, {
    required DateTime matchStartedAt,
    required Duration matchEstimatedDuration,
    required int locationId,
    required int scheduledPairingAttemptId,
    required List<PlayerMatchResultInput> players,
    required ByteData groupPhotoBytes,
    String? groupPhotoFileName,
    String? groupPhotoContentType,
    required ByteData boardPhotoBytes,
    String? boardPhotoFileName,
    String? boardPhotoContentType,
  }) async {
    return guardRootHubEndpointErrors(
      () async {
        if (matchEstimatedDuration <= Duration.zero) {
          _throwInvalidRequest(
            'Match estimated duration must be greater than zero.',
          );
        }

        _validateProofImage(
          imageBytes: groupPhotoBytes,
          imageDescription: 'Group photo',
        );
        _validateProofImage(
          imageBytes: boardPhotoBytes,
          imageDescription: 'Board photo',
        );

        final authenticatedPlayerData = await _getAuthenticatedPlayerData(
          session,
        );

        final scheduledPairingAttempt = await MatchSchedulePairingAttempt.db
            .findById(
              session,
              scheduledPairingAttemptId,
              include: MatchSchedulePairingAttempt.include(
                playedMatch: PlayedMatch.include(),
              ),
            );
        if (scheduledPairingAttempt == null) {
          _throwNotFound(
            title: 'Scheduled match not found',
            description: 'Scheduled pairing attempt not found.',
          );
        }

        if (scheduledPairingAttempt.playedMatch != null) {
          _throwInvalidRequest(
            'This scheduled match already has a registered result.',
          );
        }

        _validateRegistrationWindow(
          scheduledPairingAttempt: scheduledPairingAttempt,
          matchStartedAt: matchStartedAt,
        );

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

        final playerDataById = await _loadPlayerDataById(
          session,
          players: players,
        );
        final anonymousPlayersById = await _loadAnonymousPlayersById(
          session,
          players: players,
        );

        _validateAnonymousPlayersOwnership(
          authenticatedPlayerData: authenticatedPlayerData,
          anonymousPlayersById: anonymousPlayersById,
        );

        await _validateAuthenticatedPlayerCanRegister(
          session,
          authenticatedPlayerData: authenticatedPlayerData,
          scheduledPairingAttempt: scheduledPairingAttempt,
        );

        final groupPhotoUrl = await _uploadProofImage(
          session,
          imageBytes: groupPhotoBytes,
          fileName: groupPhotoFileName ?? 'match-group-photo.jpg',
          contentType: groupPhotoContentType,
        );
        final boardPhotoUrl = await _uploadProofImage(
          session,
          imageBytes: boardPhotoBytes,
          fileName: boardPhotoFileName ?? 'match-board-photo.jpg',
          contentType: boardPhotoContentType,
        );

        return await session.db.transaction((transaction) async {
          final playedMatch = await PlayedMatch.db.insertRow(
            session,
            PlayedMatch(
              matchStartedAt: matchStartedAt,
              matchEstimatedDuration: matchEstimatedDuration,
              locationId: location.id!,
              scheduledPairingAttemptId: scheduledPairingAttempt.id!,
            ),
            transaction: transaction,
          );

          await PlayedMatch.db.attachRow.location(
            session,
            playedMatch,
            location,
            transaction: transaction,
          );
          await PlayedMatch.db.attachRow.scheduledPairingAttempt(
            session,
            playedMatch,
            scheduledPairingAttempt,
            transaction: transaction,
          );

          for (final player in players) {
            final performance = await PlayerPerfomanceInMatch.db.insertRow(
              session,
              PlayerPerfomanceInMatch(
                anonymousPlayerId: player.anonymousPlayerId,
                playerDataId: player.playerDataId,
                playedMatchId: playedMatch.id!,
                factionUsedInMatch: player.factionUsedInMatch,
                didWin: player.didWin,
                scoreInMatch: player.scoreInMatch,
              ),
              transaction: transaction,
            );

            await PlayerPerfomanceInMatch.db.attachRow.playedMatch(
              session,
              performance,
              playedMatch,
              transaction: transaction,
            );

            if (player.playerDataId case final playerDataId?) {
              final playerData = playerDataById[playerDataId];
              if (playerData == null) {
                _throwInvalidRequest(
                  'playerDataId not found for id: $playerDataId.',
                );
              }

              await PlayerPerfomanceInMatch.db.attachRow.playerData(
                session,
                performance,
                playerData,
                transaction: transaction,
              );
            }

            if (player.anonymousPlayerId case final anonymousPlayerId?) {
              final anonymousPlayer = anonymousPlayersById[anonymousPlayerId];
              if (anonymousPlayer == null) {
                _throwInvalidRequest(
                  'anonymousPlayerId not found for id: $anonymousPlayerId.',
                );
              }

              await PlayerPerfomanceInMatch.db.attachRow.anonymousPlayer(
                session,
                performance,
                anonymousPlayer,
                transaction: transaction,
              );
            }
          }

          final playerDataIds =
              players
                  .map((player) => player.playerDataId)
                  .whereType<int>()
                  .toSet()
                  .toList()
                ..sort();

          for (final playerDataId in playerDataIds) {
            final playerData = playerDataById[playerDataId];
            if (playerData == null) {
              _throwInvalidRequest(
                'playerDataId not found for id: $playerDataId.',
              );
            }

            final playerInMatch = await PlayerInMatch.db.insertRow(
              session,
              PlayerInMatch(
                playerId: playerDataId,
                matchId: playedMatch.id!,
              ),
              transaction: transaction,
            );

            await PlayerInMatch.db.attachRow.player(
              session,
              playerInMatch,
              playerData,
              transaction: transaction,
            );
            await PlayerInMatch.db.attachRow.match(
              session,
              playerInMatch,
              playedMatch,
              transaction: transaction,
            );
          }

          final inPersonProof = await MatchInPersonProof.db.insertRow(
            session,
            MatchInPersonProof(
              matchId: playedMatch.id!,
              groupPhotoUrl: groupPhotoUrl,
              boardPhotoUrl: boardPhotoUrl,
            ),
            transaction: transaction,
          );

          await MatchInPersonProof.db.attachRow.match(
            session,
            inPersonProof,
            playedMatch,
            transaction: transaction,
          );

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
    final winnerByDominance = winner.scoreInMatch == null;

    if (!winnerByPoints && !winnerByDominance) {
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

  Future<Map<int, PlayerData>> _loadPlayerDataById(
    Session session, {
    required List<PlayerMatchResultInput> players,
  }) async {
    final playerDataIds = players
        .map((player) => player.playerDataId)
        .whereType<int>()
        .toSet();
    if (playerDataIds.isEmpty) {
      return const <int, PlayerData>{};
    }

    final existingPlayerData = await PlayerData.db.find(
      session,
      where: (t) => t.id.inSet(playerDataIds),
    );

    final playerDataById = <int, PlayerData>{
      for (final playerData in existingPlayerData.where(
        (playerData) => playerData.id != null,
      ))
        playerData.id!: playerData,
    };

    final missingPlayerDataIds = playerDataIds.difference(
      playerDataById.keys.toSet(),
    );
    if (missingPlayerDataIds.isNotEmpty) {
      final missingIds = missingPlayerDataIds.toList()..sort();
      _throwInvalidRequest(
        'playerDataId not found for ids: ${missingIds.join(', ')}.',
      );
    }

    return playerDataById;
  }

  Future<Map<int, AnonymousPlayer>> _loadAnonymousPlayersById(
    Session session, {
    required List<PlayerMatchResultInput> players,
  }) async {
    final anonymousPlayerIds = players
        .map((player) => player.anonymousPlayerId)
        .whereType<int>()
        .toSet();
    if (anonymousPlayerIds.isEmpty) {
      return const <int, AnonymousPlayer>{};
    }

    final existingAnonymousPlayers = await AnonymousPlayer.db.find(
      session,
      where: (t) => t.id.inSet(anonymousPlayerIds),
    );

    final anonymousPlayersById = <int, AnonymousPlayer>{
      for (final anonymousPlayer in existingAnonymousPlayers.where(
        (anonymousPlayer) => anonymousPlayer.id != null,
      ))
        anonymousPlayer.id!: anonymousPlayer,
    };

    final missingAnonymousPlayerIds = anonymousPlayerIds.difference(
      anonymousPlayersById.keys.toSet(),
    );

    if (missingAnonymousPlayerIds.isNotEmpty) {
      final missingIds = missingAnonymousPlayerIds.toList()..sort();
      _throwInvalidRequest(
        'anonymousPlayerId not found for ids: ${missingIds.join(', ')}.',
      );
    }

    return anonymousPlayersById;
  }

  void _validateAnonymousPlayersOwnership({
    required PlayerData authenticatedPlayerData,
    required Map<int, AnonymousPlayer> anonymousPlayersById,
  }) {
    if (anonymousPlayersById.isEmpty) {
      return;
    }

    final invalidAnonymousPlayers =
        anonymousPlayersById.values
            .where(
              (anonymousPlayer) =>
                  anonymousPlayer.createdByPlayerId !=
                  authenticatedPlayerData.id,
            )
            .map((anonymousPlayer) => anonymousPlayer.id)
            .whereType<int>()
            .toList()
          ..sort();

    if (invalidAnonymousPlayers.isNotEmpty) {
      _throwAccessDenied(
        'Anonymous players can only be used by the player that created them. Invalid ids: ${invalidAnonymousPlayers.join(', ')}.',
      );
    }
  }

  void _validateRegistrationWindow({
    required MatchSchedulePairingAttempt scheduledPairingAttempt,
    required DateTime matchStartedAt,
  }) {
    final now = DateTime.now();
    final earliestAllowedRegistrationTime = scheduledPairingAttempt.attemptedAt
        .subtract(_registerBeforeScheduledStartAllowance);

    if (now.isBefore(earliestAllowedRegistrationTime)) {
      _throwInvalidRequest(
        'You can only register this result from 2 hours before the scheduled start time.',
      );
    }

    if (matchStartedAt.isBefore(earliestAllowedRegistrationTime)) {
      _throwInvalidRequest(
        'Match start time cannot be earlier than 2 hours before the scheduled start time.',
      );
    }

    if (matchStartedAt.isAfter(now.add(const Duration(minutes: 5)))) {
      _throwInvalidRequest(
        'Match start time cannot be in the future.',
      );
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

  void _validateProofImage({
    required ByteData imageBytes,
    required String imageDescription,
  }) {
    if (imageBytes.lengthInBytes <= 0) {
      _throwInvalidRequest('$imageDescription is required.');
    }

    if (imageBytes.lengthInBytes > _maxProofImageBytes) {
      _throwInvalidRequest(
        '$imageDescription is too large. Please upload an image smaller than 6 MB.',
      );
    }
  }

  Future<String> _uploadProofImage(
    Session session, {
    required ByteData imageBytes,
    required String fileName,
    required String? contentType,
  }) async {
    final imageBytesList = imageBytes.buffer.asUint8List(
      imageBytes.offsetInBytes,
      imageBytes.lengthInBytes,
    );

    return _uploadThingStorageClient.uploadPublicImage(
      session,
      imageBytes: imageBytesList,
      fileName: fileName,
      contentType: contentType,
    );
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
