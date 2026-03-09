import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/core/extension/serverpod_to_result.dart';
import 'package:root_hub_flutter/src/global_providers/server_supported_translation_provider.dart';
import 'package:root_hub_flutter/src/global_providers/session_provider.dart';
import 'package:root_hub_flutter/src/states/activity/activity_state.dart';

class ActivityNotifier extends Notifier<ActivityState> {
  static const _unreadCountRefreshInterval = Duration(seconds: 30);

  bool _hasRequestedInitialLoad = false;
  bool _hasRequestedUnreadCount = false;
  Timer? _unreadCountTimer;

  @override
  ActivityState build() {
    _unreadCountTimer ??= Timer.periodic(
      _unreadCountRefreshInterval,
      (_) {
        unawaited(refreshUnreadCount());
      },
    );
    ref.onDispose(() {
      _unreadCountTimer?.cancel();
      _unreadCountTimer = null;
    });

    return const ActivityState();
  }

  void ensureLoaded() {
    if (_hasRequestedInitialLoad) {
      return;
    }

    _hasRequestedInitialLoad = true;
    unawaited(loadOverview());
  }

  void ensureUnreadCountLoaded() {
    if (_hasRequestedUnreadCount) {
      return;
    }

    _hasRequestedUnreadCount = true;
    unawaited(refreshUnreadCount());
  }

  Future<void> refresh() async {
    await Future.wait<dynamic>([
      loadOverview(),
      refreshUnreadCount(),
    ]);
  }

  Future<void> loadOverview({
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
        .getMatchChatActivityOverview
        .v1(language: ref.read(serverSupportedTranslationProvider))
        .toResult;

    result.fold(
      (overview) {
        final now = DateTime.now();
        final sortedSchedules = [...overview.subscribedActiveSchedules]
          ..sort(
            (a, b) => _compareSchedulesByClosestAttempt(
              a,
              b,
              now: now,
            ),
          );
        final sortedChats = [...overview.activeChats, ...overview.endedChats]
          ..sort(_compareChatItemsByInboxPriority);
        state = state.copyWith(
          subscribedActiveSchedules: sortedSchedules,
          chatItems: sortedChats,
          unreadMessagesCount: overview.unreadMessagesCount,
          isLoading: false,
          hasLoadedOnce: true,
          loadError: null,
          unreadCountError: null,
          hasLoadedUnreadCount: true,
          isLoadingUnreadCount: false,
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

  int _compareSchedulesByClosestAttempt(
    MatchSchedulePairingAttempt a,
    MatchSchedulePairingAttempt b, {
    required DateTime now,
  }) {
    final aDistance = a.attemptedAt.difference(now).abs();
    final bDistance = b.attemptedAt.difference(now).abs();
    final distanceComparison = aDistance.compareTo(bDistance);
    if (distanceComparison != 0) {
      return distanceComparison;
    }

    return a.attemptedAt.compareTo(b.attemptedAt);
  }

  int _compareChatItemsByInboxPriority(
    MatchChatActivityChatItem a,
    MatchChatActivityChatItem b,
  ) {
    final aUnreadCount = a.unreadMessagesCount;
    final bUnreadCount = b.unreadMessagesCount;
    final unreadPriorityComparison = (bUnreadCount > 0 ? 1 : 0).compareTo(
      aUnreadCount > 0 ? 1 : 0,
    );
    if (unreadPriorityComparison != 0) {
      return unreadPriorityComparison;
    }

    final unreadCountComparison = bUnreadCount.compareTo(aUnreadCount);
    if (unreadCountComparison != 0) {
      return unreadCountComparison;
    }

    final aActivityAt = a.lastMessageAt ?? a.attemptedAt;
    final bActivityAt = b.lastMessageAt ?? b.attemptedAt;
    final activityComparison = bActivityAt.compareTo(aActivityAt);
    if (activityComparison != 0) {
      return activityComparison;
    }

    if (a.hasPlayedResult != b.hasPlayedResult) {
      return a.hasPlayedResult ? 1 : -1;
    }

    return b.attemptedAt.compareTo(a.attemptedAt);
  }

  Future<void> refreshUnreadCount() async {
    if (state.isLoadingUnreadCount) {
      return;
    }

    state = state.copyWith(
      isLoadingUnreadCount: true,
      unreadCountError: null,
    );

    final result = await ref
        .read(clientProvider)
        .getMatchChatUnreadCount
        .v1(language: ref.read(serverSupportedTranslationProvider))
        .toResult;

    result.fold(
      (count) {
        state = state.copyWith(
          unreadMessagesCount: count,
          isLoadingUnreadCount: false,
          hasLoadedUnreadCount: true,
          unreadCountError: null,
        );
      },
      (error) {
        state = state.copyWith(
          isLoadingUnreadCount: false,
          hasLoadedUnreadCount: true,
          unreadCountError: error,
        );
      },
    );
  }
}

final activityProvider = NotifierProvider<ActivityNotifier, ActivityState>(
  ActivityNotifier.new,
);
