import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/core/extension/match_podium_extension.dart';
import 'package:root_hub_flutter/src/core/extension/serverpod_to_result.dart';
import 'package:root_hub_flutter/src/global_providers/session_provider.dart';
import 'package:root_hub_flutter/src/global_providers/shared_preferences_provider.dart';
import 'package:root_hub_flutter/src/states/match/match_create_table_state.dart';
import 'package:root_hub_flutter/src/states/match/match_tables_provider.dart';

class MatchCreateTableNotifier extends Notifier<MatchCreateTableState> {
  static const _recentLocationsKey = 'match_create_table_recent_locations_v1';
  static const _maxRecentLocations = 8;

  Timer? _searchDebounce;
  int _activeSearchRunId = 0;

  @override
  MatchCreateTableState build() {
    ref.onDispose(() {
      _searchDebounce?.cancel();
      _activeSearchRunId += 1;
    });

    final initialState = _buildDefaultState();
    unawaited(_loadRecentLocations());
    return initialState;
  }

  void startNewFlow() {
    _searchDebounce?.cancel();
    _activeSearchRunId += 1;

    state = _buildDefaultState(
      recentLocations: state.recentLocations,
      hasLoadedRecentLocations: state.hasLoadedRecentLocations,
    );
  }

  void setTitle(String title) {
    state = state.copyWith(
      title: title,
      createTableError: null,
    );
  }

  void setDescription(String description) {
    state = state.copyWith(
      description: description,
      createTableError: null,
    );
  }

  void increaseMinPlayers() {
    if (state.minPlayers >= state.maxPlayers) {
      return;
    }

    state = state.copyWith(
      minPlayers: state.minPlayers + 1,
      createTableError: null,
    );
  }

  void decreaseMinPlayers() {
    if (state.minPlayers <= 2) {
      return;
    }

    state = state.copyWith(
      minPlayers: state.minPlayers - 1,
      createTableError: null,
    );
  }

  void increaseMaxPlayers() {
    if (state.maxPlayers >= 6) {
      return;
    }

    state = state.copyWith(
      maxPlayers: state.maxPlayers + 1,
      createTableError: null,
    );
  }

  void decreaseMaxPlayers() {
    if (state.maxPlayers <= state.minPlayers) {
      return;
    }

    state = state.copyWith(
      maxPlayers: state.maxPlayers - 1,
      createTableError: null,
    );
  }

  void setScheduledDate(DateTime date) {
    state = state.copyWith(
      scheduledDate: DateTime(date.year, date.month, date.day),
      createTableError: null,
    );
  }

  void setScheduledTime(TimeOfDay time) {
    state = state.copyWith(
      scheduledTime: TimeOfDay(hour: time.hour, minute: time.minute),
      createTableError: null,
    );
  }

  void setHostWillPlay(bool hostWillPlay) {
    state = state.copyWith(
      hostWillPlay: hostWillPlay,
      createTableError: null,
    );
  }

  void setLocationQuery(String query) {
    final normalizedQuery = query.trim();

    _searchDebounce?.cancel();
    _activeSearchRunId += 1;

    if (normalizedQuery.isEmpty) {
      state = state.copyWith(
        locationQuery: query,
        isSearchingLocations: false,
        hasPerformedLocationSearch: false,
        searchResults: const <Location>[],
        locationSearchError: null,
      );
      return;
    }

    final runId = _activeSearchRunId;
    state = state.copyWith(
      locationQuery: query,
      isSearchingLocations: true,
      hasPerformedLocationSearch: true,
      locationSearchError: null,
    );

    _searchDebounce = Timer(const Duration(milliseconds: 360), () {
      unawaited(
        _executeLocationSearch(
          runId: runId,
          normalizedQuery: normalizedQuery,
        ),
      );
    });
  }

  void selectLocation(Location location) {
    if (location.id == null) {
      return;
    }

    state = state.copyWith(
      selectedLocation: location,
      createTableError: null,
    );

    unawaited(_saveRecentLocation(location));
  }

  Future<RootHubException?> createTable() async {
    final normalizedTitle = state.title.trim();
    if (normalizedTitle.isEmpty) {
      return RootHubException(
        title: 'Title required',
        description: 'Please add a title for your table before continuing.',
      );
    }

    final selectedLocation = state.selectedLocation;
    final locationId = selectedLocation?.id;
    if (selectedLocation == null || locationId == null) {
      return RootHubException(
        title: 'Location required',
        description: 'Select a location for this table before creating it.',
      );
    }

    final normalizedDescription = state.description.trim();
    final attemptedAt = DateTime(
      state.scheduledDate.year,
      state.scheduledDate.month,
      state.scheduledDate.day,
      state.scheduledTime.hour,
      state.scheduledTime.minute,
    );

    state = state.copyWith(
      isCreatingTable: true,
      createTableError: null,
    );

    final result = await ref
        .read(clientProvider)
        .createMatchSchedule
        .v1(
          title: normalizedTitle,
          description: normalizedDescription.isEmpty
              ? null
              : normalizedDescription,
          minAmountOfPlayers: matchPodiumFromPlayerCount(state.minPlayers),
          maxAmountOfPlayers: matchPodiumFromPlayerCount(state.maxPlayers),
          attemptedAt: attemptedAt,
          locationId: locationId,
          hostWillPlay: state.hostWillPlay,
        )
        .toResult;

    RootHubException? createError;
    await result.fold(
      (_) async {
        await ref
            .read(matchTablesProvider.notifier)
            .loadTablesInArea(showLoadingIndicator: false);

        state = _buildDefaultState(
          recentLocations: state.recentLocations,
          hasLoadedRecentLocations: state.hasLoadedRecentLocations,
        );
      },
      (error) async {
        createError = error;
        state = state.copyWith(
          isCreatingTable: false,
          createTableError: error,
        );
      },
    );

    return createError;
  }

  void clearCreateTableError() {
    state = state.copyWith(createTableError: null);
  }

  Future<void> _executeLocationSearch({
    required int runId,
    required String normalizedQuery,
  }) async {
    final result = await ref
        .read(clientProvider)
        .getMatchLocation
        .v1(
          query: normalizedQuery,
          page: 1,
        )
        .toResult;

    if (runId != _activeSearchRunId) {
      return;
    }

    result.fold(
      (locations) {
        state = state.copyWith(
          isSearchingLocations: false,
          searchResults: locations,
          locationSearchError: null,
        );
      },
      (error) {
        state = state.copyWith(
          isSearchingLocations: false,
          searchResults: const <Location>[],
          locationSearchError: error,
        );
      },
    );
  }

  Future<void> _loadRecentLocations() async {
    final prefs = ref.read(sharedPreferencesProvider);
    final storedLocations =
        prefs.getStringList(_recentLocationsKey) ?? const <String>[];

    final parsedLocations = <Location>[];
    for (final rawLocation in storedLocations) {
      final decodedLocation = _decodeLocation(rawLocation);
      if (decodedLocation != null) {
        parsedLocations.add(decodedLocation);
      }
    }

    state = state.copyWith(
      hasLoadedRecentLocations: true,
      recentLocations: _dedupeAndLimit(parsedLocations),
    );
  }

  Future<void> _saveRecentLocation(Location location) async {
    final updatedRecentLocations = _dedupeAndLimit([
      location,
      ...state.recentLocations,
    ]);

    state = state.copyWith(recentLocations: updatedRecentLocations);

    final serializedLocations = updatedRecentLocations
        .map((item) => jsonEncode(item.toJson()))
        .toList();

    await ref
        .read(sharedPreferencesProvider)
        .setStringList(_recentLocationsKey, serializedLocations);
  }

  List<Location> _dedupeAndLimit(List<Location> locations) {
    final dedupedById = <int, Location>{};
    for (final location in locations) {
      final locationId = location.id;
      if (locationId == null) {
        continue;
      }
      dedupedById[locationId] = location;
    }

    return dedupedById.values.take(_maxRecentLocations).toList();
  }

  Location? _decodeLocation(String rawLocation) {
    try {
      final decoded = jsonDecode(rawLocation);
      if (decoded is! Map) {
        return null;
      }

      final location = Location.fromJson(decoded.cast<String, dynamic>());
      if (location.id == null) {
        return null;
      }

      return location;
    } catch (_) {
      return null;
    }
  }

  MatchCreateTableState _buildDefaultState({
    List<Location> recentLocations = const <Location>[],
    bool hasLoadedRecentLocations = false,
  }) {
    final now = DateTime.now();
    final roundedToNextHour = DateTime(
      now.year,
      now.month,
      now.day,
      now.hour,
    ).add(const Duration(hours: 1));

    return MatchCreateTableState(
      scheduledDate: DateTime(
        roundedToNextHour.year,
        roundedToNextHour.month,
        roundedToNextHour.day,
      ),
      scheduledTime: TimeOfDay(
        hour: roundedToNextHour.hour,
        minute: roundedToNextHour.minute,
      ),
      recentLocations: recentLocations,
      hasLoadedRecentLocations: hasLoadedRecentLocations,
    );
  }
}

final matchCreateTableProvider =
    NotifierProvider<MatchCreateTableNotifier, MatchCreateTableState>(
      MatchCreateTableNotifier.new,
    );
