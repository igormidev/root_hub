import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/core/extension/serverpod_to_result.dart';
import 'package:root_hub_flutter/src/global_providers/session_provider.dart';
import 'package:root_hub_flutter/src/states/account/account_provider.dart';
import 'package:root_hub_flutter/src/states/auth_flow/auth_flow_provider.dart';
import 'package:root_hub_flutter/src/states/dashboard/dashboard_profile_state.dart';

class DashboardProfileNotifier extends Notifier<DashboardProfileState> {
  @override
  DashboardProfileState build() {
    return const DashboardProfileState();
  }

  Future<RootHubException?> updateDisplayName(String displayName) async {
    final normalizedDisplayName = displayName.trim();
    if (normalizedDisplayName.isEmpty) {
      return RootHubException(
        title: 'Invalid request',
        description: 'Display name cannot be empty.',
      );
    }

    state = state.copyWith(
      isUpdatingDisplayName: true,
      lastError: null,
    );

    final result = await ref
        .read(clientProvider)
        .updatePlayerData
        .v1(displayName: normalizedDisplayName)
        .toResult;

    return result.fold(
      (updatedPlayerData) {
        _setPlayerData(updatedPlayerData);
        state = state.copyWith(
          isUpdatingDisplayName: false,
        );
        return null;
      },
      (error) {
        state = state.copyWith(
          isUpdatingDisplayName: false,
          lastError: error,
        );
        return error;
      },
    );
  }

  Future<RootHubException?> updateLocation(GeoLocation location) async {
    if (location.ratio <= 0) {
      return RootHubException(
        title: 'Invalid request',
        description: 'Location ratio must be greater than zero.',
      );
    }

    state = state.copyWith(
      isUpdatingLocation: true,
      lastError: null,
    );

    final result = await ref
        .read(clientProvider)
        .updatePlayerData
        .v1(currentLocation: location)
        .toResult;

    return result.fold(
      (updatedPlayerData) {
        _setPlayerData(updatedPlayerData);
        state = state.copyWith(
          isUpdatingLocation: false,
        );
        return null;
      },
      (error) {
        state = state.copyWith(
          isUpdatingLocation: false,
          lastError: error,
        );
        return error;
      },
    );
  }

  Future<RootHubException?> updateFavoriteFaction(Faction faction) async {
    state = state.copyWith(
      isUpdatingFaction: true,
      lastError: null,
    );

    final result = await ref
        .read(clientProvider)
        .updatePlayerData
        .v1(favoriteFaction: faction)
        .toResult;

    return result.fold(
      (updatedPlayerData) {
        _setPlayerData(updatedPlayerData);
        state = state.copyWith(
          isUpdatingFaction: false,
        );
        return null;
      },
      (error) {
        state = state.copyWith(
          isUpdatingFaction: false,
          lastError: error,
        );
        return error;
      },
    );
  }

  void clearError() {
    state = state.copyWith(lastError: null);
  }

  void _setPlayerData(PlayerData updatedPlayerData) {
    ref.read(accountProvider.notifier).setUser(updatedPlayerData);
    ref
        .read(authFlowProvider.notifier)
        .replaceAuthenticatedPlayerData(updatedPlayerData);
  }
}

final dashboardProfileProvider =
    NotifierProvider<DashboardProfileNotifier, DashboardProfileState>(
      DashboardProfileNotifier.new,
    );
