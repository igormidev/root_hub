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
  static const _hostWillPlayKey = 'match_create_table_host_will_play_v1';
  static const _scheduledHourKey = 'match_create_table_hour_v1';
  static const _scheduledMinuteKey = 'match_create_table_minute_v1';
  static const _maxRecentLocations = 8;

  Timer? _searchDebounce;
  int _activeSearchRunId = 0;

  @override
  MatchCreateTableState build() {
    ref.onDispose(() {
      _searchDebounce?.cancel();
      _activeSearchRunId += 1;
    });

    final prefs = ref.read(sharedPreferencesProvider);
    final persistedHostWillPlay = prefs.getBool(_hostWillPlayKey);
    final persistedScheduledHour = prefs.getInt(_scheduledHourKey);
    final persistedScheduledMinute = prefs.getInt(_scheduledMinuteKey);
    final recentLocations = _readRecentLocations();

    final initialState = _buildDefaultState(
      recentLocations: recentLocations,
      hasLoadedRecentLocations: true,
      persistedHostWillPlay: persistedHostWillPlay,
      persistedScheduledHour: persistedScheduledHour,
      persistedScheduledMinute: persistedScheduledMinute,
    );
    return initialState;
  }

  void startNewFlow() {
    _searchDebounce?.cancel();
    _activeSearchRunId += 1;

    state = _buildDefaultState(
      recentLocations: state.recentLocations,
      hasLoadedRecentLocations: state.hasLoadedRecentLocations,
      persistedHostWillPlay: state.hostWillPlay,
      persistedScheduledHour: state.scheduledTime.hour,
      persistedScheduledMinute: state.scheduledTime.minute,
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
    final normalizedTime = TimeOfDay(hour: time.hour, minute: time.minute);
    state = state.copyWith(
      scheduledTime: normalizedTime,
      createTableError: null,
    );
    unawaited(_persistScheduledTime(normalizedTime));
  }

  void setHostWillPlay(bool hostWillPlay) {
    state = state.copyWith(
      hostWillPlay: hostWillPlay,
      createTableError: null,
    );
    unawaited(_persistHostWillPlay(hostWillPlay));
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

    if (state.minPlayers < 2 || state.maxPlayers > 6) {
      return RootHubException(
        title: 'Invalid players range',
        description: 'Players range must stay between 2 and 6.',
      );
    }
    if (state.minPlayers > state.maxPlayers) {
      return RootHubException(
        title: 'Invalid players range',
        description: 'Minimum players cannot be greater than maximum players.',
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

    final now = DateTime.now();
    final minAllowedTime = now.add(const Duration(minutes: 10));
    if (attemptedAt.isBefore(minAllowedTime)) {
      return RootHubException(
        title: 'Time is too soon',
        description:
            'The scheduled time must be at least 10 minutes in the future.',
      );
    }

    final maxAllowedTime = now.add(const Duration(days: 50));
    if (attemptedAt.isAfter(maxAllowedTime)) {
      return RootHubException(
        title: 'Date is too far',
        description:
            'The scheduled time cannot be more than 50 days in the future.',
      );
    }

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
          persistedHostWillPlay: state.hostWillPlay,
          persistedScheduledHour: state.scheduledTime.hour,
          persistedScheduledMinute: state.scheduledTime.minute,
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

  List<Location> _readRecentLocations() {
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

    return _dedupeAndLimit(parsedLocations);
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

  Future<void> _persistHostWillPlay(bool hostWillPlay) async {
    await ref
        .read(sharedPreferencesProvider)
        .setBool(
          _hostWillPlayKey,
          hostWillPlay,
        );
  }

  Future<void> _persistScheduledTime(TimeOfDay scheduledTime) async {
    final prefs = ref.read(sharedPreferencesProvider);
    await prefs.setInt(_scheduledHourKey, scheduledTime.hour);
    await prefs.setInt(_scheduledMinuteKey, scheduledTime.minute);
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
    bool? persistedHostWillPlay,
    int? persistedScheduledHour,
    int? persistedScheduledMinute,
  }) {
    final now = DateTime.now();
    final roundedToNextHour = DateTime(
      now.year,
      now.month,
      now.day,
      now.hour,
    ).add(const Duration(hours: 1));

    final hasValidPersistedTime =
        persistedScheduledHour != null &&
        persistedScheduledMinute != null &&
        persistedScheduledHour >= 0 &&
        persistedScheduledHour <= 23 &&
        persistedScheduledMinute >= 0 &&
        persistedScheduledMinute <= 59;

    final scheduledTime = hasValidPersistedTime
        ? TimeOfDay(
            hour: persistedScheduledHour,
            minute: persistedScheduledMinute,
          )
        : TimeOfDay(
            hour: roundedToNextHour.hour,
            minute: roundedToNextHour.minute,
          );

    return MatchCreateTableState(
      scheduledDate: DateTime(
        roundedToNextHour.year,
        roundedToNextHour.month,
        roundedToNextHour.day,
      ),
      scheduledTime: scheduledTime,
      hostWillPlay: persistedHostWillPlay ?? true,
      recentLocations: recentLocations,
      hasLoadedRecentLocations: hasLoadedRecentLocations,
    );
  }
}

final matchCreateTableProvider =
    NotifierProvider<MatchCreateTableNotifier, MatchCreateTableState>(
      MatchCreateTableNotifier.new,
    );
