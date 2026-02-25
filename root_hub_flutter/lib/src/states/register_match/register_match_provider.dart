import 'dart:async';
import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/core/extension/serverpod_to_result.dart';
import 'package:root_hub_flutter/src/global_providers/session_provider.dart';
import 'package:root_hub_flutter/src/states/match/match_tables_provider.dart';
import 'package:root_hub_flutter/src/states/register_match/register_match_state.dart';

class RegisterMatchPlayerReportInput {
  const RegisterMatchPlayerReportInput({
    required this.playerDataId,
    required this.anonymousPlayerId,
    required this.factionUsedInMatch,
    required this.didWin,
    required this.scoreInMatch,
  });

  final int? playerDataId;
  final int? anonymousPlayerId;
  final Faction factionUsedInMatch;
  final bool didWin;
  final int? scoreInMatch;
}

class RegisterMatchNotifier extends Notifier<RegisterMatchState> {
  static const _minAnonymousNameLength = 3;

  bool _hasRequestedInitialCount = false;
  bool _hasRequestedInitialPendingMatches = false;
  int _registeredPlayerSearchRunId = 0;

  @override
  RegisterMatchState build() {
    return const RegisterMatchState();
  }

  void ensurePendingMatchesCountLoaded() {
    if (_hasRequestedInitialCount) {
      return;
    }

    _hasRequestedInitialCount = true;
    unawaited(refreshPendingMatchesCount());
  }

  void ensurePendingMatchesLoaded() {
    if (_hasRequestedInitialPendingMatches) {
      return;
    }

    _hasRequestedInitialPendingMatches = true;
    unawaited(loadPendingMatches());
  }

  Future<void> refreshPendingMatchesOverview() async {
    await Future.wait<dynamic>([
      loadPendingMatches(),
      refreshPendingMatchesCount(),
    ]);
  }

  Future<void> refreshPendingMatchesCount() async {
    if (state.isLoadingPendingMatchesCount) {
      return;
    }

    state = state.copyWith(
      isLoadingPendingMatchesCount: true,
      pendingMatchesCountError: null,
    );

    final result = await ref
        .read(clientProvider)
        .getPendingMatchResultsCount
        .v1()
        .toResult;

    result.fold(
      (count) {
        state = state.copyWith(
          pendingMatchesCount: count,
          isLoadingPendingMatchesCount: false,
          hasLoadedPendingMatchesCount: true,
          pendingMatchesCountError: null,
        );
      },
      (error) {
        state = state.copyWith(
          isLoadingPendingMatchesCount: false,
          hasLoadedPendingMatchesCount: true,
          pendingMatchesCountError: error,
        );
      },
    );
  }

  Future<RootHubException?> loadPendingMatches() async {
    if (state.isLoadingPendingMatches) {
      return null;
    }

    state = state.copyWith(
      isLoadingPendingMatches: true,
      pendingMatchesError: null,
    );

    final result = await ref
        .read(clientProvider)
        .getPendingMatchResults
        .v1()
        .toResult;

    RootHubException? loadError;
    result.fold(
      (matches) {
        final sortedMatches = [...matches]
          ..sort((a, b) => b.attemptedAt.compareTo(a.attemptedAt));

        state = state.copyWith(
          pendingMatches: sortedMatches,
          pendingMatchesCount: sortedMatches.length,
          isLoadingPendingMatches: false,
          hasLoadedPendingMatches: true,
          pendingMatchesError: null,
          pendingMatchesCountError: null,
          hasLoadedPendingMatchesCount: true,
        );
      },
      (error) {
        loadError = error;
        state = state.copyWith(
          isLoadingPendingMatches: false,
          hasLoadedPendingMatches: true,
          pendingMatchesError: error,
        );
      },
    );

    return loadError;
  }

  Future<void> ensureAnonymousPlayersLoaded() async {
    if (state.hasLoadedAnonymousPlayers || state.isLoadingAnonymousPlayers) {
      return;
    }

    await loadAnonymousPlayers();
  }

  Future<RootHubException?> loadAnonymousPlayers() async {
    if (state.isLoadingAnonymousPlayers) {
      return null;
    }

    state = state.copyWith(
      isLoadingAnonymousPlayers: true,
      anonymousPlayersError: null,
    );

    final result = await ref
        .read(clientProvider)
        .getMyAnonymousPlayers
        .v1()
        .toResult;

    RootHubException? loadError;
    result.fold(
      (anonymousPlayers) {
        state = state.copyWith(
          anonymousPlayers: anonymousPlayers,
          isLoadingAnonymousPlayers: false,
          hasLoadedAnonymousPlayers: true,
          anonymousPlayersError: null,
        );
      },
      (error) {
        loadError = error;
        state = state.copyWith(
          isLoadingAnonymousPlayers: false,
          hasLoadedAnonymousPlayers: true,
          anonymousPlayersError: error,
        );
      },
    );

    return loadError;
  }

  Future<AnonymousPlayer?> createAnonymousPlayer({
    required String firstName,
    required String lastName,
  }) async {
    final normalizedFirstName = firstName.trim();
    final normalizedLastName = lastName.trim();
    if (normalizedFirstName.length < _minAnonymousNameLength ||
        normalizedLastName.length < _minAnonymousNameLength) {
      state = state.copyWith(
        anonymousPlayersError: RootHubException(
          title: 'Invalid player',
          description:
              'First name and last name must have at least $_minAnonymousNameLength characters.',
        ),
      );
      return null;
    }

    final result = await ref
        .read(clientProvider)
        .createAnonymousPlayer
        .v1(
          firstName: normalizedFirstName,
          lastName: normalizedLastName,
        )
        .toResult;

    AnonymousPlayer? createdAnonymousPlayer;
    result.fold(
      (anonymousPlayer) {
        createdAnonymousPlayer = anonymousPlayer;
        final updatedPlayers = [
          anonymousPlayer,
          ...state.anonymousPlayers.where(
            (entry) => entry.id != anonymousPlayer.id,
          ),
        ];
        state = state.copyWith(
          anonymousPlayers: updatedPlayers,
          hasLoadedAnonymousPlayers: true,
          anonymousPlayersError: null,
        );
      },
      (error) {
        state = state.copyWith(
          anonymousPlayersError: error,
        );
      },
    );

    return createdAnonymousPlayer;
  }

  Future<RootHubException?> searchRegisteredPlayers(String query) async {
    _registeredPlayerSearchRunId += 1;
    final runId = _registeredPlayerSearchRunId;

    state = state.copyWith(
      isSearchingRegisteredPlayers: true,
      registeredPlayersSearchError: null,
    );

    final result = await ref
        .read(clientProvider)
        .searchRegisteredPlayers
        .v1(query: query.trim())
        .toResult;

    RootHubException? searchError;
    result.fold(
      (players) {
        if (runId != _registeredPlayerSearchRunId) {
          return;
        }
        state = state.copyWith(
          registeredPlayersSearchResults: players,
          isSearchingRegisteredPlayers: false,
          registeredPlayersSearchError: null,
        );
      },
      (error) {
        if (runId != _registeredPlayerSearchRunId) {
          return;
        }
        searchError = error;
        state = state.copyWith(
          registeredPlayersSearchResults:
              const <RegisteredPlayerSearchResult>[],
          isSearchingRegisteredPlayers: false,
          registeredPlayersSearchError: error,
        );
      },
    );

    return searchError;
  }

  void clearRegisteredPlayersSearch() {
    _registeredPlayerSearchRunId += 1;
    state = state.copyWith(
      registeredPlayersSearchResults: const <RegisteredPlayerSearchResult>[],
      isSearchingRegisteredPlayers: false,
      registeredPlayersSearchError: null,
    );
  }

  Future<RootHubException?> submitMatchReport({
    required MatchSchedulePairingAttempt scheduledMatch,
    required List<RegisterMatchPlayerReportInput> players,
    required DateTime matchStartedAt,
    required Duration matchEstimatedDuration,
    required Uint8List groupPhotoBytes,
    required String groupPhotoFileName,
    String? groupPhotoContentType,
    required Uint8List boardPhotoBytes,
    required String boardPhotoFileName,
    String? boardPhotoContentType,
  }) async {
    final scheduledMatchId = scheduledMatch.id;
    final locationId = scheduledMatch.locationId;
    if (scheduledMatchId == null || scheduledMatchId <= 0 || locationId <= 0) {
      return RootHubException(
        title: 'Invalid match',
        description: 'The selected match schedule is invalid.',
      );
    }

    if (players.length < 2) {
      return RootHubException(
        title: 'Not enough players',
        description:
            'Select at least two participants before submitting the report.',
      );
    }

    if (groupPhotoBytes.isEmpty || boardPhotoBytes.isEmpty) {
      return RootHubException(
        title: 'Missing proof photos',
        description:
            'Both group and board photos are required to register this match.',
      );
    }

    if (matchEstimatedDuration <= Duration.zero) {
      return RootHubException(
        title: 'Invalid duration',
        description: 'Match estimated duration must be greater than zero.',
      );
    }
    if (matchEstimatedDuration > const Duration(hours: 8)) {
      return RootHubException(
        title: 'Invalid duration',
        description: 'Match estimated duration must be at most 8 hours.',
      );
    }

    if (matchStartedAt.isAfter(DateTime.now())) {
      return RootHubException(
        title: 'Invalid match registration',
        description: 'Match start time cannot be in the future.',
      );
    }

    state = state.copyWith(
      isSubmitting: true,
      submitError: null,
    );

    final reportPlayers = players
        .map(
          (player) => PlayerMatchResultInput(
            anonymousPlayerId: player.anonymousPlayerId,
            playerDataId: player.playerDataId,
            didWin: player.didWin,
            scoreInMatch: player.scoreInMatch,
            factionUsedInMatch: player.factionUsedInMatch,
          ),
        )
        .toList();

    final result = await ref
        .read(clientProvider)
        .registerMatchData
        .v1(
          matchStartedAt: matchStartedAt,
          matchEstimatedDuration: matchEstimatedDuration,
          locationId: locationId,
          scheduledPairingAttemptId: scheduledMatchId,
          players: reportPlayers,
          groupPhotoBytes: ByteData.sublistView(groupPhotoBytes),
          groupPhotoFileName: groupPhotoFileName,
          groupPhotoContentType: groupPhotoContentType,
          boardPhotoBytes: ByteData.sublistView(boardPhotoBytes),
          boardPhotoFileName: boardPhotoFileName,
          boardPhotoContentType: boardPhotoContentType,
        )
        .toResult;

    RootHubException? submitError;
    await result.fold(
      (_) async {
        final remainingMatches = state.pendingMatches
            .where((match) => match.id != scheduledMatchId)
            .toList();

        state = state.copyWith(
          isSubmitting: false,
          submitError: null,
          pendingMatches: remainingMatches,
          pendingMatchesCount: remainingMatches.length,
          hasLoadedPendingMatches: true,
          hasLoadedPendingMatchesCount: true,
        );

        await ref
            .read(matchTablesProvider.notifier)
            .loadTablesInArea(showLoadingIndicator: false);
      },
      (error) async {
        submitError = error;
        state = state.copyWith(
          isSubmitting: false,
          submitError: error,
        );
      },
    );

    return submitError;
  }

  void clearErrors() {
    state = state.copyWith(
      pendingMatchesError: null,
      pendingMatchesCountError: null,
      anonymousPlayersError: null,
      registeredPlayersSearchError: null,
      submitError: null,
    );
  }
}

final registerMatchProvider =
    NotifierProvider<RegisterMatchNotifier, RegisterMatchState>(
      RegisterMatchNotifier.new,
    );
