import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:root_hub_client/root_hub_client.dart';

part 'schedules_state.freezed.dart';

@freezed
abstract class SchedulesState with _$SchedulesState {
  const factory SchedulesState({
    @Default(<MatchSchedulePairingAttempt>[])
    List<MatchSchedulePairingAttempt> activeSchedules,
    @Default(false) bool isLoadingActiveSchedules,
    @Default(false) bool hasLoadedActiveSchedules,
    @Default(false) bool isLoadingMoreActiveSchedules,
    @Default(false) bool hasNextActiveSchedulesPage,
    @Default(0) int activeSchedulesCurrentPage,
    RootHubException? activeSchedulesError,
    @Default(<MatchSchedulePairingAttempt>[])
    List<MatchSchedulePairingAttempt> pastSchedules,
    @Default(false) bool isLoadingPastSchedules,
    @Default(false) bool hasLoadedPastSchedules,
    @Default(false) bool isLoadingMorePastSchedules,
    @Default(false) bool hasNextPastSchedulesPage,
    @Default(0) int pastSchedulesCurrentPage,
    RootHubException? pastSchedulesError,
  }) = _SchedulesState;
}
