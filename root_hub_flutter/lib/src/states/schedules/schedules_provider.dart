import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/core/extension/serverpod_to_result.dart';
import 'package:root_hub_flutter/src/global_providers/server_supported_translation_provider.dart';
import 'package:root_hub_flutter/src/global_providers/session_provider.dart';
import 'package:root_hub_flutter/src/states/schedules/schedules_state.dart';

class SchedulesNotifier extends Notifier<SchedulesState> {
  bool _hasRequestedInitialActiveSchedules = false;
  bool _hasRequestedInitialPastSchedules = false;

  @override
  SchedulesState build() {
    return const SchedulesState();
  }

  void ensureActiveSchedulesLoaded() {
    if (_hasRequestedInitialActiveSchedules) {
      return;
    }

    _hasRequestedInitialActiveSchedules = true;
    unawaited(loadActiveSchedules());
  }

  void ensurePastSchedulesLoaded() {
    if (_hasRequestedInitialPastSchedules) {
      return;
    }

    _hasRequestedInitialPastSchedules = true;
    unawaited(loadPastSchedules());
  }

  Future<RootHubException?> refreshActiveSchedules() {
    return loadActiveSchedules(forceRefresh: true);
  }

  Future<RootHubException?> refreshPastSchedules() {
    return loadPastSchedules(forceRefresh: true);
  }

  Future<RootHubException?> loadActiveSchedules({
    bool forceRefresh = false,
  }) async {
    if (state.isLoadingActiveSchedules) {
      return null;
    }

    state = state.copyWith(
      isLoadingActiveSchedules: true,
      isLoadingMoreActiveSchedules: false,
      activeSchedulesError: null,
      activeSchedulesCurrentPage: forceRefresh
          ? 0
          : state.activeSchedulesCurrentPage,
    );

    return _loadActiveSchedulesPage(
      page: 1,
      append: false,
    );
  }

  Future<RootHubException?> loadPastSchedules({
    bool forceRefresh = false,
  }) async {
    if (state.isLoadingPastSchedules) {
      return null;
    }

    state = state.copyWith(
      isLoadingPastSchedules: true,
      isLoadingMorePastSchedules: false,
      pastSchedulesError: null,
      pastSchedulesCurrentPage: forceRefresh
          ? 0
          : state.pastSchedulesCurrentPage,
    );

    return _loadPastSchedulesPage(
      page: 1,
      append: false,
    );
  }

  Future<void> loadMoreActiveSchedules() async {
    if (!state.hasNextActiveSchedulesPage ||
        state.isLoadingActiveSchedules ||
        state.isLoadingMoreActiveSchedules) {
      return;
    }

    state = state.copyWith(
      isLoadingMoreActiveSchedules: true,
      activeSchedulesError: null,
    );

    await _loadActiveSchedulesPage(
      page: state.activeSchedulesCurrentPage + 1,
      append: true,
    );
  }

  Future<void> loadMorePastSchedules() async {
    if (!state.hasNextPastSchedulesPage ||
        state.isLoadingPastSchedules ||
        state.isLoadingMorePastSchedules) {
      return;
    }

    state = state.copyWith(
      isLoadingMorePastSchedules: true,
      pastSchedulesError: null,
    );

    await _loadPastSchedulesPage(
      page: state.pastSchedulesCurrentPage + 1,
      append: true,
    );
  }

  Future<RootHubException?> _loadActiveSchedulesPage({
    required int page,
    required bool append,
  }) async {
    final result = await ref
        .read(clientProvider)
        .getPlayerActiveSchedules
        .v1(
          language: ref.read(serverSupportedTranslationProvider),
          page: page,
        )
        .toResult;

    RootHubException? loadError;
    result.fold(
      (pagination) {
        final nextSchedules = append
            ? _mergeSchedules(state.activeSchedules, pagination.schedules)
            : pagination.schedules;

        state = state.copyWith(
          activeSchedules: nextSchedules,
          isLoadingActiveSchedules: false,
          hasLoadedActiveSchedules: true,
          isLoadingMoreActiveSchedules: false,
          hasNextActiveSchedulesPage: pagination.paginationMetadata.hasNextPage,
          activeSchedulesCurrentPage: pagination.paginationMetadata.currentPage,
          activeSchedulesError: null,
        );
      },
      (error) {
        loadError = error;
        state = state.copyWith(
          isLoadingActiveSchedules: false,
          hasLoadedActiveSchedules: true,
          isLoadingMoreActiveSchedules: false,
          activeSchedulesError: error,
        );
      },
    );

    return loadError;
  }

  Future<RootHubException?> _loadPastSchedulesPage({
    required int page,
    required bool append,
  }) async {
    final result = await ref
        .read(clientProvider)
        .getPlayerPastSchedules
        .v1(
          language: ref.read(serverSupportedTranslationProvider),
          page: page,
        )
        .toResult;

    RootHubException? loadError;
    result.fold(
      (pagination) {
        final nextSchedules = append
            ? _mergeSchedules(state.pastSchedules, pagination.schedules)
            : pagination.schedules;

        state = state.copyWith(
          pastSchedules: nextSchedules,
          isLoadingPastSchedules: false,
          hasLoadedPastSchedules: true,
          isLoadingMorePastSchedules: false,
          hasNextPastSchedulesPage: pagination.paginationMetadata.hasNextPage,
          pastSchedulesCurrentPage: pagination.paginationMetadata.currentPage,
          pastSchedulesError: null,
        );
      },
      (error) {
        loadError = error;
        state = state.copyWith(
          isLoadingPastSchedules: false,
          hasLoadedPastSchedules: true,
          isLoadingMorePastSchedules: false,
          pastSchedulesError: error,
        );
      },
    );

    return loadError;
  }

  List<MatchSchedulePairingAttempt> _mergeSchedules(
    List<MatchSchedulePairingAttempt> existingSchedules,
    List<MatchSchedulePairingAttempt> incomingSchedules,
  ) {
    final schedulesById = <int?, MatchSchedulePairingAttempt>{
      for (final schedule in existingSchedules) schedule.id: schedule,
    };

    for (final schedule in incomingSchedules) {
      schedulesById[schedule.id] = schedule;
    }

    return schedulesById.values.toList();
  }
}

final schedulesProvider = NotifierProvider<SchedulesNotifier, SchedulesState>(
  SchedulesNotifier.new,
);
