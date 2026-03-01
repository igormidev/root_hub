import 'dart:typed_data';

import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:root_hub_server/src/core/server_translations.dart';
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
    required ServerSupportedTranslation language,
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
    final t = ServerTranslations.of(language);

    return guardRootHubEndpointErrors(
      () async {
        if (matchEstimatedDuration <= Duration.zero) {
          _throwInvalidRequest(
            language: language,
            description: t.errors.matchEstimatedDurationMustBeGreaterThanZero,
          );
        }

        _validateProofImage(
          language: language,
          imageBytes: groupPhotoBytes,
          imageDescription: t.labels.groupPhoto,
        );
        _validateProofImage(
          language: language,
          imageBytes: boardPhotoBytes,
          imageDescription: t.labels.boardPhoto,
        );

        final authenticatedPlayerData = await _getAuthenticatedPlayerData(
          session,
          language: language,
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
            language: language,
            title: t.errors.scheduledMatchNotFoundTitle,
            description: t.errors.scheduledPairingAttemptNotFound,
          );
        }

        if (scheduledPairingAttempt.playedMatch != null) {
          _throwInvalidRequest(
            language: language,
            description: t.errors.scheduledMatchAlreadyHasResult,
          );
        }

        _validateRegistrationWindow(
          language: language,
          scheduledPairingAttempt: scheduledPairingAttempt,
          matchStartedAt: matchStartedAt,
        );

        final location = await Location.db.findById(session, locationId);
        if (location == null) {
          _throwNotFound(
            language: language,
            title: t.errors.locationNotFoundTitle,
            description: t.errors.locationNotFound,
          );
        }

        if (scheduledPairingAttempt.locationId != locationId) {
          _throwInvalidRequest(
            language: language,
            description: t.errors.providedLocationDoesNotMatchScheduledPairing,
          );
        }

        if (players.length < 2) {
          _throwInvalidRequest(
            language: language,
            description: t.errors.atLeastTwoPlayersRequiredToRegister,
          );
        }

        _validatePlayerResults(
          language: language,
          players: players,
        );

        final playerDataById = await _loadPlayerDataById(
          session,
          language: language,
          players: players,
        );
        final anonymousPlayersById = await _loadAnonymousPlayersById(
          session,
          language: language,
          players: players,
        );

        _validateAnonymousPlayersOwnership(
          language: language,
          authenticatedPlayerData: authenticatedPlayerData,
          anonymousPlayersById: anonymousPlayersById,
        );

        await _validateAuthenticatedPlayerCanRegister(
          session,
          language: language,
          authenticatedPlayerData: authenticatedPlayerData,
          scheduledPairingAttempt: scheduledPairingAttempt,
        );

        final groupPhotoUrl = await _uploadProofImage(
          session,
          language: language,
          imageBytes: groupPhotoBytes,
          fileName: groupPhotoFileName ?? 'match-group-photo.jpg',
          contentType: groupPhotoContentType,
        );
        final boardPhotoUrl = await _uploadProofImage(
          session,
          language: language,
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
                  language: language,
                  description: t.errors.playerDataIdNotFoundForId(
                    playerDataId: playerDataId,
                  ),
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
                  language: language,
                  description: t.errors.anonymousPlayerIdNotFoundForId(
                    anonymousPlayerId: anonymousPlayerId,
                  ),
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
                language: language,
                description: t.errors.playerDataIdNotFoundForId(
                  playerDataId: playerDataId,
                ),
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
      language: language,
      fallbackDescription: t.fallback.unableToRegisterMatchResult,
    );
  }

  Future<PlayerData> _getAuthenticatedPlayerData(
    Session session, {
    required ServerSupportedTranslation language,
  }) async {
    final t = ServerTranslations.of(language);

    final userIdentifier = session.authenticated!.userIdentifier;
    final authUserId = UuidValue.fromString(userIdentifier);

    final playerData = await PlayerData.db.findFirstRow(
      session,
      where: (t) => t.authUserId.equals(authUserId),
    );

    if (playerData == null) {
      _throwNotFound(
        language: language,
        title: t.errors.playerProfileMissingTitle,
        description: t.errors.playerProfileNotFoundForAuthenticatedUser,
      );
    }

    return playerData;
  }

  void _validatePlayerResults({
    required ServerSupportedTranslation language,
    required List<PlayerMatchResultInput> players,
  }) {
    final t = ServerTranslations.of(language);

    if (players.length < 2 || players.length > 6) {
      _throwInvalidRequest(
        language: language,
        description: t.errors.rootMatchesMustHaveBetweenTwoAndSixPlayers,
      );
    }

    final winnerCount = players.where((player) => player.didWin).length;
    if (winnerCount == 0) {
      _throwInvalidRequest(
        language: language,
        description: t.errors.exactlyOneWinnerRequiredNoneProvided,
      );
    }
    if (winnerCount > 1) {
      _throwInvalidRequest(
        language: language,
        description: t.errors.exactlyOneWinnerRequiredCountProvided(
          winnerCount: winnerCount,
        ),
      );
    }

    final seenPlayerDataIds = <int>{};
    final seenAnonymousPlayerIds = <int>{};
    final uniqueFactions = <Faction>{};

    for (final player in players) {
      final hasAnonymousPlayer = player.anonymousPlayerId != null;
      final hasPlayerData = player.playerDataId != null;
      if (hasAnonymousPlayer == hasPlayerData) {
        _throwInvalidRequest(
          language: language,
          description: t.errors.eachPlayerMustProvideExactlyOneIdentifier,
        );
      }

      if (player.playerDataId case final playerDataId?) {
        if (!seenPlayerDataIds.add(playerDataId)) {
          _throwInvalidRequest(
            language: language,
            description: t.errors.duplicatePlayerDataId(
              playerDataId: playerDataId,
            ),
          );
        }
      }

      if (player.anonymousPlayerId case final anonymousPlayerId?) {
        if (!seenAnonymousPlayerIds.add(anonymousPlayerId)) {
          _throwInvalidRequest(
            language: language,
            description: t.errors.duplicateAnonymousPlayerId(
              anonymousPlayerId: anonymousPlayerId,
            ),
          );
        }
      }

      if (player.scoreInMatch case final score?) {
        if (score < 0 || score > 30) {
          _throwInvalidRequest(
            language: language,
            description: t.errors.scoreMustBeBetweenZeroAndThirty,
          );
        }
      }

      if (!uniqueFactions.add(player.factionUsedInMatch)) {
        _throwInvalidRequest(
          language: language,
          description: t.errors.factionDuplicated(
            factionName: player.factionUsedInMatch.name,
          ),
        );
      }
    }

    final winner = players.firstWhere((player) => player.didWin);
    final winnerByPoints = winner.scoreInMatch == 30;
    final winnerByDominance = winner.scoreInMatch == null;

    if (!winnerByPoints && !winnerByDominance) {
      _throwInvalidRequest(
        language: language,
        description: t.errors.winnerScoreValidation,
      );
    }

    final invalidNonWinners = players.where(
      (player) => !player.didWin && player.scoreInMatch == 30,
    );
    if (invalidNonWinners.isNotEmpty) {
      _throwInvalidRequest(
        language: language,
        description: t.errors.onlyWinnerCanHaveThirtyPoints,
      );
    }
  }

  Future<Map<int, PlayerData>> _loadPlayerDataById(
    Session session, {
    required ServerSupportedTranslation language,
    required List<PlayerMatchResultInput> players,
  }) async {
    final t = ServerTranslations.of(language);

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
        language: language,
        description: t.errors.playerDataIdNotFoundForIds(
          missingIds: missingIds.join(', '),
        ),
      );
    }

    return playerDataById;
  }

  Future<Map<int, AnonymousPlayer>> _loadAnonymousPlayersById(
    Session session, {
    required ServerSupportedTranslation language,
    required List<PlayerMatchResultInput> players,
  }) async {
    final t = ServerTranslations.of(language);

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
        language: language,
        description: t.errors.anonymousPlayerIdNotFoundForIds(
          missingIds: missingIds.join(', '),
        ),
      );
    }

    return anonymousPlayersById;
  }

  void _validateAnonymousPlayersOwnership({
    required ServerSupportedTranslation language,
    required PlayerData authenticatedPlayerData,
    required Map<int, AnonymousPlayer> anonymousPlayersById,
  }) {
    final t = ServerTranslations.of(language);

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
        language: language,
        description: t.errors.anonymousPlayersOwnershipInvalid(
          invalidIds: invalidAnonymousPlayers.join(', '),
        ),
      );
    }
  }

  void _validateRegistrationWindow({
    required ServerSupportedTranslation language,
    required MatchSchedulePairingAttempt scheduledPairingAttempt,
    required DateTime matchStartedAt,
  }) {
    final t = ServerTranslations.of(language);

    final now = DateTime.now();
    final earliestAllowedRegistrationTime = scheduledPairingAttempt.attemptedAt
        .subtract(_registerBeforeScheduledStartAllowance);

    if (now.isBefore(earliestAllowedRegistrationTime)) {
      _throwInvalidRequest(
        language: language,
        description: t.errors.registerResultOnlyTwoHoursBefore,
      );
    }

    if (matchStartedAt.isBefore(earliestAllowedRegistrationTime)) {
      _throwInvalidRequest(
        language: language,
        description: t.errors.matchStartCannotBeEarlierThanTwoHoursBefore,
      );
    }

    if (matchStartedAt.isAfter(now.add(const Duration(minutes: 5)))) {
      _throwInvalidRequest(
        language: language,
        description: t.errors.matchStartCannotBeInFuture,
      );
    }
  }

  Future<void> _validateAuthenticatedPlayerCanRegister(
    Session session, {
    required ServerSupportedTranslation language,
    required PlayerData authenticatedPlayerData,
    required MatchSchedulePairingAttempt scheduledPairingAttempt,
  }) async {
    final t = ServerTranslations.of(language);

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
        language: language,
        description: t.errors.onlyHostOrSubscribedCanRegister,
      );
    }
  }

  void _validateProofImage({
    required ServerSupportedTranslation language,
    required ByteData imageBytes,
    required String imageDescription,
  }) {
    final t = ServerTranslations.of(language);

    if (imageBytes.lengthInBytes <= 0) {
      _throwInvalidRequest(
        language: language,
        description: t.errors.imageRequired(imageDescription: imageDescription),
      );
    }

    if (imageBytes.lengthInBytes > _maxProofImageBytes) {
      _throwInvalidRequest(
        language: language,
        description: t.errors.imageTooLargeWithDescription(
          imageDescription: imageDescription,
        ),
      );
    }
  }

  Future<String> _uploadProofImage(
    Session session, {
    required ServerSupportedTranslation language,
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
      language: language,
      imageBytes: imageBytesList,
      fileName: fileName,
      contentType: contentType,
    );
  }

  Never _throwInvalidRequest({
    required ServerSupportedTranslation language,
    required String description,
  }) {
    final t = ServerTranslations.of(language);

    throw RootHubEndpointError.invalidRequest(
      language: language,
      title: t.errors.invalidMatchRegistrationTitle,
      description: description,
    );
  }

  Never _throwNotFound({
    required ServerSupportedTranslation language,
    required String title,
    required String description,
  }) {
    throw RootHubEndpointError.notFound(
      language: language,
      title: title,
      description: description,
    );
  }

  Never _throwAccessDenied({
    required ServerSupportedTranslation language,
    required String description,
  }) {
    final t = ServerTranslations.of(language);

    throw RootHubEndpointError.accessDenied(
      language: language,
      title: t.errors.registrationNotAllowedTitle,
      description: description,
    );
  }
}
