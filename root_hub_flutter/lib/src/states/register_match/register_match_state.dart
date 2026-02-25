import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:root_hub_client/root_hub_client.dart';

part 'register_match_state.freezed.dart';

@freezed
abstract class RegisterMatchState with _$RegisterMatchState {
  const factory RegisterMatchState({
    @Default(0) int pendingMatchesCount,
    @Default(false) bool isLoadingPendingMatchesCount,
    @Default(false) bool hasLoadedPendingMatchesCount,
    RootHubException? pendingMatchesCountError,
    @Default(<MatchSchedulePairingAttempt>[])
    List<MatchSchedulePairingAttempt> pendingMatches,
    @Default(false) bool isLoadingPendingMatches,
    @Default(false) bool hasLoadedPendingMatches,
    RootHubException? pendingMatchesError,
    @Default(<AnonymousPlayer>[]) List<AnonymousPlayer> anonymousPlayers,
    @Default(false) bool isLoadingAnonymousPlayers,
    @Default(false) bool hasLoadedAnonymousPlayers,
    RootHubException? anonymousPlayersError,
    @Default(<RegisteredPlayerSearchResult>[])
    List<RegisteredPlayerSearchResult> registeredPlayersSearchResults,
    @Default(false) bool isSearchingRegisteredPlayers,
    RootHubException? registeredPlayersSearchError,
    @Default(false) bool isSubmitting,
    RootHubException? submitError,
  }) = _RegisterMatchState;
}
