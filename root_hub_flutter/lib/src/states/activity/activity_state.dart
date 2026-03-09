import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:root_hub_client/root_hub_client.dart';

part 'activity_state.freezed.dart';

@freezed
abstract class ActivityState with _$ActivityState {
  const factory ActivityState({
    @Default(<MatchSchedulePairingAttempt>[])
    List<MatchSchedulePairingAttempt> subscribedActiveSchedules,
    @Default(<MatchChatActivityChatItem>[])
    List<MatchChatActivityChatItem> chatItems,
    @Default(0) int unreadMessagesCount,
    @Default(false) bool isLoading,
    @Default(false) bool hasLoadedOnce,
    RootHubException? loadError,
    @Default(false) bool isLoadingUnreadCount,
    @Default(false) bool hasLoadedUnreadCount,
    RootHubException? unreadCountError,
  }) = _ActivityState;
}
