import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/core/extension/serverpod_to_result.dart';
import 'package:root_hub_flutter/src/global_providers/server_supported_translation_provider.dart';
import 'package:root_hub_flutter/src/global_providers/session_provider.dart';
import 'package:root_hub_flutter/src/states/home/home_stats_snapshot.dart';
import 'package:root_hub_flutter/src/states/home/home_stats_state.dart';

class HomeStatsNotifier extends Notifier<HomeStatsState> {
  bool _hasRequestedInitialLoad = false;

  @override
  HomeStatsState build() {
    return const HomeStatsState();
  }

  void ensureLoaded() {
    if (_hasRequestedInitialLoad) {
      return;
    }

    _hasRequestedInitialLoad = true;
    unawaited(loadStats());
  }

  Future<void> refresh() {
    return loadStats(showLoadingIndicator: false);
  }

  Future<void> loadStats({
    bool showLoadingIndicator = true,
  }) async {
    if (state.isLoading) {
      return;
    }

    if (showLoadingIndicator) {
      state = state.copyWith(
        isLoading: true,
        loadError: null,
      );
    }

    final platformStatsRequest = ref
        .read(clientProvider)
        .getPlatformStats
        .v1(language: ref.read(serverSupportedTranslationProvider))
        .toResult;
    final playerStatsRequest = ref
        .read(clientProvider)
        .getPlayerStats
        .v1(language: ref.read(serverSupportedTranslationProvider))
        .toResult;

    final platformResult = await platformStatsRequest;
    final playerResult = await playerStatsRequest;

    var nextPlatformStats = state.platformStats;
    var nextPlayerStats = state.playerStats;
    RootHubException? nextError;

    platformResult.fold(
      (platformStatsValue) {
        final platformStats = platformStatsValue.value;
        nextPlatformStats = platformStats == null
            ? null
            : HomeStatsSnapshot.fromPlatformStats(platformStats);
      },
      (error) {
        nextError ??= error;
      },
    );

    playerResult.fold(
      (playerStatsValue) {
        final playerStats = playerStatsValue.value;
        nextPlayerStats = playerStats == null
            ? null
            : HomeStatsSnapshot.fromPlayerStats(playerStats);
      },
      (error) {
        nextError ??= error;
      },
    );

    state = state.copyWith(
      isLoading: false,
      hasLoadedOnce: true,
      platformStats: nextPlatformStats,
      playerStats: nextPlayerStats,
      loadError: nextError,
    );
  }

  void clearLoadError() {
    state = state.copyWith(loadError: null);
  }
}

final homeStatsProvider = NotifierProvider<HomeStatsNotifier, HomeStatsState>(
  HomeStatsNotifier.new,
);
