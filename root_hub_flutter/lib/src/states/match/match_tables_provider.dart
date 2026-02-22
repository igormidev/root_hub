import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/core/extension/serverpod_to_result.dart';
import 'package:root_hub_flutter/src/global_providers/session_provider.dart';
import 'package:root_hub_flutter/src/states/match/match_tables_state.dart';

class MatchTablesNotifier extends Notifier<MatchTablesState> {
  bool _hasRequestedInitialLoad = false;

  @override
  MatchTablesState build() {
    return const MatchTablesState();
  }

  void ensureLoaded() {
    if (_hasRequestedInitialLoad) {
      return;
    }

    _hasRequestedInitialLoad = true;
    unawaited(loadTablesInArea());
  }

  Future<void> refresh() {
    return loadTablesInArea();
  }

  Future<void> loadTablesInArea({
    bool showLoadingIndicator = true,
  }) async {
    if (state.isLoading && showLoadingIndicator) {
      return;
    }

    if (showLoadingIndicator) {
      state = state.copyWith(
        isLoading: true,
        loadError: null,
      );
    }

    final result = await ref.read(clientProvider).getTablesInArea.v1().toResult;

    result.fold(
      (tables) {
        final sortedTables = [...tables]
          ..sort((a, b) => a.attemptedAt.compareTo(b.attemptedAt));

        state = state.copyWith(
          tables: sortedTables,
          isLoading: false,
          hasLoadedOnce: true,
          loadError: null,
        );
      },
      (error) {
        state = state.copyWith(
          isLoading: false,
          hasLoadedOnce: true,
          loadError: error,
        );
      },
    );
  }

  Future<RootHubException?> subscribeToTable(int tableId) async {
    if (tableId <= 0) {
      return RootHubException(
        title: 'Invalid match',
        description: 'The selected table is invalid.',
      );
    }

    if (state.subscribingTableIds.contains(tableId)) {
      return null;
    }

    state = state.copyWith(
      subscribingTableIds: {
        ...state.subscribingTableIds,
        tableId,
      },
      actionError: null,
    );

    final result = await ref
        .read(clientProvider)
        .subscribeToMatch
        .v1(scheduledMatchId: tableId)
        .toResult;

    RootHubException? actionError;
    await result.fold(
      (_) async {
        await loadTablesInArea(showLoadingIndicator: false);
      },
      (error) async {
        actionError = error;
      },
    );

    final updatedSubscribingIds = {...state.subscribingTableIds}
      ..remove(tableId);

    state = state.copyWith(
      subscribingTableIds: updatedSubscribingIds,
      actionError: actionError,
    );

    return actionError;
  }

  void clearActionError() {
    state = state.copyWith(actionError: null);
  }
}

final matchTablesProvider =
    NotifierProvider<MatchTablesNotifier, MatchTablesState>(
      MatchTablesNotifier.new,
    );
