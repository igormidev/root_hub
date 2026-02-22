import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:root_hub_client/root_hub_client.dart';

part 'match_tables_state.freezed.dart';

@freezed
abstract class MatchTablesState with _$MatchTablesState {
  const factory MatchTablesState({
    @Default(<MatchSchedulePairingAttempt>[])
    List<MatchSchedulePairingAttempt> tables,
    @Default(false) bool isLoading,
    @Default(false) bool hasLoadedOnce,
    RootHubException? loadError,
    @Default(<int>{}) Set<int> subscribingTableIds,
    RootHubException? actionError,
  }) = _MatchTablesState;
}
