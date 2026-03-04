import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/core/extension/match_podium_extension.dart';
import 'package:root_hub_flutter/src/core/extension/serverpod_to_result.dart';
import 'package:root_hub_flutter/src/core/utils/talker.dart';
import 'package:root_hub_flutter/src/global_providers/server_supported_translation_provider.dart';
import 'package:root_hub_flutter/src/global_providers/session_provider.dart';
import 'package:root_hub_flutter/src/states/match/match_tables_state.dart';

class MatchTablesNotifier extends Notifier<MatchTablesState> {
  bool _hasRequestedInitialLoad = false;
  final _tableInfoCache = <int, MatchScheduleInfo>{};
  final _locationPhotoUrlCache = <String, String?>{};

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

    final result = await ref
        .read(clientProvider)
        .getTablesInArea
        .v1(language: ref.read(serverSupportedTranslationProvider))
        .toResult;

    result.fold(
      (tables) {
        final sortedTables = [...tables]
          ..sort((a, b) => a.attemptedAt.compareTo(b.attemptedAt));
        final visibleTableIds = sortedTables
            .map((entry) => entry.id)
            .whereType<int>()
            .toSet();
        _tableInfoCache.removeWhere(
          (tableId, _) => !visibleTableIds.contains(tableId),
        );

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
        .v1(
          language: ref.read(serverSupportedTranslationProvider),
          scheduledMatchId: tableId,
        )
        .toResult;

    RootHubException? actionError;
    await result.fold(
      (_) async {
        _tableInfoCache.remove(tableId);
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

  void invalidateTableInfoCache(int tableId) {
    if (tableId <= 0) {
      return;
    }
    _tableInfoCache.remove(tableId);
  }

  Future<RootHubException?> editMatchSchedule({
    required int scheduledMatchId,
    required String title,
    String? description,
    required int minPlayers,
    required int maxPlayers,
    required DateTime attemptedAt,
    bool? closedForSubscriptions,
  }) async {
    talker.debug(
      '[MatchTables] Editing match schedule. '
      'scheduledMatchId=$scheduledMatchId '
      'title=$title minPlayers=$minPlayers maxPlayers=$maxPlayers '
      'attemptedAt=$attemptedAt',
    );

    try {
      await ref
          .read(clientProvider)
          .editMatchSchedule
          .v1(
            language: ref.read(serverSupportedTranslationProvider),
            scheduledMatchId: scheduledMatchId,
            title: title,
            description: description,
            minAmountOfPlayers: matchPodiumFromPlayerCount(minPlayers),
            maxAmountOfPlayers: matchPodiumFromPlayerCount(maxPlayers),
            attemptedAt: attemptedAt,
            closedForSubscriptions: closedForSubscriptions,
          );
      talker.debug(
        '[MatchTables] Match schedule updated successfully. '
        'scheduledMatchId=$scheduledMatchId',
      );
      _tableInfoCache.remove(scheduledMatchId);
      return null;
    } on RootHubException catch (error) {
      talker.debug(
        '[MatchTables] Edit match schedule failed. '
        'scheduledMatchId=$scheduledMatchId '
        'title=${error.title} description=${error.description}',
      );
      return error;
    } catch (error, stackTrace) {
      talker.handle(
        error,
        stackTrace,
        '[MatchTables] Unexpected edit match schedule failure. '
        'scheduledMatchId=$scheduledMatchId',
      );
      return RootHubException(
        title: 'Unable to update table',
        description: error.toString(),
      );
    }
  }

  Future<MatchScheduleInfo> getTableDetails(
    int tableId, {
    bool forceRefresh = false,
  }) async {
    if (tableId <= 0) {
      throw RootHubException(
        title: 'Invalid match',
        description: 'The selected table is invalid.',
      );
    }

    if (!forceRefresh) {
      final cachedValue = _tableInfoCache[tableId];
      if (cachedValue != null) {
        return cachedValue;
      }
    }

    final result = await ref
        .read(clientProvider)
        .getMatchScheduleInfo
        .v1(
          language: ref.read(serverSupportedTranslationProvider),
          scheduledMatchId: tableId,
        )
        .toResult;

    return result.fold(
      (matchScheduleInfo) {
        _tableInfoCache[tableId] = matchScheduleInfo;
        return matchScheduleInfo;
      },
      (error) {
        throw error;
      },
    );
  }

  Future<String?> resolveLocationHeaderPhotoUrl({
    required String providerPlaceId,
  }) async {
    final normalizedPlaceId = providerPlaceId.trim();
    if (normalizedPlaceId.isEmpty) {
      return null;
    }

    if (_locationPhotoUrlCache.containsKey(normalizedPlaceId)) {
      return _locationPhotoUrlCache[normalizedPlaceId];
    }

    final result = await ref
        .read(clientProvider)
        .getMatchLocationPhoto
        .v1(
          language: ref.read(serverSupportedTranslationProvider),
          providerPlaceId: normalizedPlaceId,
          maxWidthPx: 1200,
          maxHeightPx: 420,
        )
        .toResult;

    final resolvedPhotoUrl = result.fold(
      (photoUrl) {
        final normalizedUrl = photoUrl.value?.trim();
        if (normalizedUrl == null || normalizedUrl.isEmpty) {
          return null;
        }
        return normalizedUrl;
      },
      (_) => null,
    );

    _locationPhotoUrlCache[normalizedPlaceId] = resolvedPhotoUrl;
    return resolvedPhotoUrl;
  }
}

final matchTablesProvider =
    NotifierProvider<MatchTablesNotifier, MatchTablesState>(
      MatchTablesNotifier.new,
    );
