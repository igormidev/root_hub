import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';
import 'package:root_hub_flutter/src/core/extension/serverpod_to_result.dart';
import 'package:root_hub_flutter/src/global_providers/server_supported_translation_provider.dart';
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
        .v1(language: ref.read(serverSupportedTranslationProvider))
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
        .v1(language: ref.read(serverSupportedTranslationProvider))
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
        .v1(language: ref.read(serverSupportedTranslationProvider))
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

    final result = await ref
        .read(clientProvider)
        .createAnonymousPlayer
        .v1(
          language: ref.read(serverSupportedTranslationProvider),
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
        .v1(
          language: ref.read(serverSupportedTranslationProvider),
          query: query.trim(),
        )
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
    required String groupPhotoFilePath,
    required String groupPhotoFileName,
    String? groupPhotoContentType,
    required Uint8List boardPhotoBytes,
    required String boardPhotoFilePath,
    required String boardPhotoFileName,
    String? boardPhotoContentType,
  }) async {
    final scheduledMatchId = scheduledMatch.id;
    final locationId = scheduledMatch.locationId;
    if (scheduledMatchId == null || scheduledMatchId <= 0 || locationId <= 0) {
      return RootHubException(
        title: t
            .register_match
            .ui_states_register_match_provider
            .invalidMatchTitle,
        description: t
            .register_match
            .ui_states_register_match_provider
            .invalidMatchDescription,
      );
    }

    state = state.copyWith(
      isSubmitting: true,
      submitError: null,
    );

    final resolvedGroupPhotoFilePath = await _resolveUploadFilePath(
      preferredFilePath: groupPhotoFilePath,
      fallbackBytes: groupPhotoBytes,
      fallbackFileName: groupPhotoFileName,
    );
    if (resolvedGroupPhotoFilePath == null) {
      return _setSubmitErrorAndReturn(
        RootHubException(
          title: t
              .register_match
              .ui_states_register_match_provider
              .unableToPrepareGroupPhotoTitle,
          description: t
              .register_match
              .ui_states_register_match_provider
              .unableToPrepareGroupPhotoDescription,
        ),
      );
    }

    final resolvedBoardPhotoFilePath = await _resolveUploadFilePath(
      preferredFilePath: boardPhotoFilePath,
      fallbackBytes: boardPhotoBytes,
      fallbackFileName: boardPhotoFileName,
    );
    if (resolvedBoardPhotoFilePath == null) {
      return _setSubmitErrorAndReturn(
        RootHubException(
          title: t
              .register_match
              .ui_states_register_match_provider
              .unableToPrepareBoardPhotoTitle,
          description: t
              .register_match
              .ui_states_register_match_provider
              .unableToPrepareBoardPhotoDescription,
        ),
      );
    }

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

    final (
      groupPhotoPreparation,
      groupPhotoPrepareError,
    ) = await _prepareMatchProofUpload(
      fileName: groupPhotoFileName,
      contentType: groupPhotoContentType,
      fileSizeBytes: groupPhotoBytes.length,
    );
    if (groupPhotoPrepareError != null || groupPhotoPreparation == null) {
      return _setSubmitErrorAndReturn(
        groupPhotoPrepareError ??
            RootHubException(
              title: t
                  .register_match
                  .ui_states_register_match_provider
                  .unableToPrepareGroupPhotoTitle,
              description: t
                  .register_match
                  .ui_states_register_match_provider
                  .unableToPrepareGroupPhotoDescription,
            ),
      );
    }

    final (
      boardPhotoPreparation,
      boardPhotoPrepareError,
    ) = await _prepareMatchProofUpload(
      fileName: boardPhotoFileName,
      contentType: boardPhotoContentType,
      fileSizeBytes: boardPhotoBytes.length,
    );
    if (boardPhotoPrepareError != null || boardPhotoPreparation == null) {
      return _setSubmitErrorAndReturn(
        boardPhotoPrepareError ??
            RootHubException(
              title: t
                  .register_match
                  .ui_states_register_match_provider
                  .unableToPrepareBoardPhotoTitle,
              description: t
                  .register_match
                  .ui_states_register_match_provider
                  .unableToPrepareBoardPhotoDescription,
            ),
      );
    }

    final groupUploadError = await _uploadProofImageToSignedUrl(
      uploadUrl: groupPhotoPreparation.uploadUrl,
      uploadKey: groupPhotoPreparation.uploadKey,
      filePath: resolvedGroupPhotoFilePath,
    );
    if (groupUploadError != null) {
      return _setSubmitErrorAndReturn(groupUploadError);
    }

    final boardUploadError = await _uploadProofImageToSignedUrl(
      uploadUrl: boardPhotoPreparation.uploadUrl,
      uploadKey: boardPhotoPreparation.uploadKey,
      filePath: resolvedBoardPhotoFilePath,
    );
    if (boardUploadError != null) {
      return _setSubmitErrorAndReturn(boardUploadError);
    }

    final result = await ref
        .read(clientProvider)
        .registerMatchData
        .v1(
          language: ref.read(serverSupportedTranslationProvider),
          matchStartedAt: matchStartedAt,
          matchEstimatedDuration: matchEstimatedDuration,
          locationId: locationId,
          scheduledPairingAttemptId: scheduledMatchId,
          players: reportPlayers,
          groupPhotoUploadKey: groupPhotoPreparation.uploadKey,
          boardPhotoUploadKey: boardPhotoPreparation.uploadKey,
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

  RootHubException _setSubmitErrorAndReturn(RootHubException error) {
    state = state.copyWith(
      isSubmitting: false,
      submitError: error,
    );
    return error;
  }

  Future<String?> _resolveUploadFilePath({
    required String preferredFilePath,
    required Uint8List fallbackBytes,
    required String fallbackFileName,
  }) async {
    final normalizedPreferredPath = preferredFilePath.trim();
    if (normalizedPreferredPath.isNotEmpty) {
      final preferredFile = File(normalizedPreferredPath);
      if (await preferredFile.exists()) {
        return preferredFile.path;
      }
    }

    final safeFileName = _normalizeFileNameForTempPath(fallbackFileName);
    final tempFilePath =
        '${Directory.systemTemp.path}/${DateTime.now().microsecondsSinceEpoch}-$safeFileName';
    try {
      final tempFile = File(tempFilePath);
      await tempFile.writeAsBytes(fallbackBytes, flush: true);
      if (!await tempFile.exists()) {
        return null;
      }

      return tempFile.path;
    } catch (_) {
      return null;
    }
  }

  String _normalizeFileNameForTempPath(String fileName) {
    final normalizedFileName = fileName.trim();
    if (normalizedFileName.isEmpty) {
      return 'match-proof.jpg';
    }

    return normalizedFileName.replaceAll(RegExp(r'[^A-Za-z0-9._-]'), '_');
  }

  Future<(MatchProofUploadPreparation?, RootHubException?)>
  _prepareMatchProofUpload({
    required String fileName,
    required String? contentType,
    required int fileSizeBytes,
  }) async {
    final result = await ref
        .read(clientProvider)
        .prepareMatchProofUpload
        .v1(
          language: ref.read(serverSupportedTranslationProvider),
          fileName: fileName,
          contentType: _normalizeProofContentType(contentType),
          fileSizeBytes: fileSizeBytes,
        )
        .toResult;

    return result.fold(
      (preparation) => (preparation, null),
      (error) => (null, error),
    );
  }

  String _normalizeProofContentType(String? contentType) {
    final normalizedContentType = contentType?.trim();
    if (normalizedContentType != null && normalizedContentType.isNotEmpty) {
      return normalizedContentType;
    }

    return 'image/jpeg';
  }

  Future<RootHubException?> _uploadProofImageToSignedUrl({
    required String uploadUrl,
    required String uploadKey,
    required String filePath,
  }) async {
    final request = http.MultipartRequest(
      'PUT',
      Uri.parse(uploadUrl),
    );
    try {
      request.files.add(
        await http.MultipartFile.fromPath(
          'file',
          filePath,
          filename: uploadKey,
        ),
      );
    } catch (_) {
      return RootHubException(
        title: t
            .register_match
            .ui_states_register_match_provider
            .unableToUploadProofImageTitle,
        description: t
            .register_match
            .ui_states_register_match_provider
            .unableToUploadProofImageReadDescription,
      );
    }

    http.StreamedResponse streamedResponse;
    try {
      streamedResponse = await request.send();
    } catch (_) {
      return RootHubException(
        title: t
            .register_match
            .ui_states_register_match_provider
            .unableToUploadProofImageTitle,
        description: t
            .register_match
            .ui_states_register_match_provider
            .unableToUploadProofImageNetworkDescription,
      );
    }

    final response = await http.Response.fromStream(streamedResponse);
    if (response.statusCode < 200 || response.statusCode >= 300) {
      return RootHubException(
        title: t
            .register_match
            .ui_states_register_match_provider
            .unableToUploadProofImageTitle,
        description: t
            .register_match
            .ui_states_register_match_provider
            .unableToUploadProofImageStorageDescription,
      );
    }

    return null;
  }

  Future<RootHubException?> cancelScheduledMatch({
    required MatchSchedulePairingAttempt scheduledMatch,
    required MatchScheduleNotPlayedReason notPlayedReason,
    String? notPlayedReasonDetails,
  }) async {
    final scheduledMatchId = scheduledMatch.id;
    if (scheduledMatchId == null || scheduledMatchId <= 0) {
      return RootHubException(
        title: t
            .register_match
            .ui_states_register_match_provider
            .invalidMatchTitle,
        description: t
            .register_match
            .ui_states_register_match_provider
            .invalidMatchDescription,
      );
    }

    final result = await ref
        .read(clientProvider)
        .cancelMatchSchedule
        .v1(
          language: ref.read(serverSupportedTranslationProvider),
          scheduledMatchId: scheduledMatchId,
          notPlayedReason: notPlayedReason,
          notPlayedReasonDetails: notPlayedReasonDetails?.trim(),
        )
        .toResult;

    RootHubException? cancelError;
    await result.fold(
      (_) async {
        final remainingMatches = state.pendingMatches
            .where((match) => match.id != scheduledMatchId)
            .toList();

        state = state.copyWith(
          pendingMatches: remainingMatches,
          pendingMatchesCount: remainingMatches.length,
          hasLoadedPendingMatches: true,
          hasLoadedPendingMatchesCount: true,
          pendingMatchesError: null,
          pendingMatchesCountError: null,
        );

        await ref
            .read(matchTablesProvider.notifier)
            .loadTablesInArea(showLoadingIndicator: false);
      },
      (error) async {
        cancelError = error;
      },
    );

    return cancelError;
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
