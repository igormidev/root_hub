import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:root_hub_client/root_hub_client.dart';

part 'match_chat_state.freezed.dart';

@freezed
abstract class MatchChatState with _$MatchChatState {
  const factory MatchChatState({
    int? scheduledMatchId,
    @Default(false) bool isLoading,
    @Default(false) bool hasLoadedOnce,
    @Default(false) bool isLoadingMore,
    @Default(false) bool hasNextPage,
    @Default(0) int currentPage,
    @Default(false) bool isSendingMessage,
    @Default(false) bool isUploadingImage,
    @Default(false) bool isUploadingAudio,
    @Default(false) bool isDeletingMessage,
    @Default(false) bool isLoadingPlayedMatchSummary,
    RootHubException? loadError,
    RootHubException? actionError,
    RootHubException? playedMatchSummaryError,
    MatchChatPlayedMatchSummary? playedMatchSummary,
    @Default(<int>{}) Set<int> subscribedPlayerIds,
  }) = _MatchChatState;
}
