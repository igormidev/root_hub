import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';
import 'package:root_hub_client/root_hub_client.dart';

part 'match_create_table_state.freezed.dart';

@freezed
abstract class MatchCreateTableState with _$MatchCreateTableState {
  const factory MatchCreateTableState({
    @Default('') String title,
    @Default('') String description,
    @Default(3) int minPlayers,
    @Default(4) int maxPlayers,
    required DateTime scheduledDate,
    required TimeOfDay scheduledTime,
    @Default(true) bool hostWillPlay,
    @Default(false) bool hasLoadedRecentLocations,
    @Default(<Location>[]) List<Location> recentLocations,
    @Default('') String locationQuery,
    @Default(false) bool isSearchingLocations,
    @Default(false) bool hasPerformedLocationSearch,
    @Default(<Location>[]) List<Location> searchResults,
    RootHubException? locationSearchError,
    Location? selectedLocation,
    @Default(false) bool isCreatingTable,
    RootHubException? createTableError,
  }) = _MatchCreateTableState;
}
