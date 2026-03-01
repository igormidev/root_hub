import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
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
        state = state.copyWith(
          subscribedActiveSchedules: overview.subscribedActiveSchedules,
          activeChats: overview.activeChats,
          endedChats: overview.endedChats,
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
