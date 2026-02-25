import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/states/home/home_stats_snapshot.dart';

part 'home_stats_state.freezed.dart';

@freezed
abstract class HomeStatsState with _$HomeStatsState {
  const factory HomeStatsState({
    @Default(false) bool isLoading,
    @Default(false) bool hasLoadedOnce,
    HomeStatsSnapshot? platformStats,
    HomeStatsSnapshot? playerStats,
    RootHubException? loadError,
  }) = _HomeStatsState;
}
