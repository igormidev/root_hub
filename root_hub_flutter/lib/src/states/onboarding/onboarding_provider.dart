import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/core/extension/serverpod_to_result.dart';
import 'package:root_hub_flutter/src/global_providers/session_provider.dart';
import 'package:root_hub_flutter/src/states/onboarding/onboarding_state.dart';

class OnboardingNotifier extends Notifier<OnboardingState> {
  static const defaultLocationRatioKm = 25.0;

  @override
  OnboardingState build() {
    return const OnboardingState();
  }

  void selectFaction(Faction faction) {
    state = state.copyWith(selectedFaction: faction);
  }

  void unselectFaction() {
    state = state.copyWith(selectedFaction: null);
  }

  void setDisplayName(String displayName) {
    state = state.copyWith(displayName: displayName);
  }

  void setCurrentLocation(GeoLocation location) {
    state = state.copyWith(
      currentLocation: location,
      currentLocationCityName: null,
      currentLocationShortAddress: null,
      currentLocationFormattedAddress: null,
    );
  }

  void setCurrentLocationRatio(double ratioKm) {
    final location = state.currentLocation;
    if (location == null) {
      return;
    }

    final normalizedRatio = ratioKm.clamp(1.0, 500.0).toDouble();
    state = state.copyWith(
      currentLocation: location.copyWith(ratio: normalizedRatio),
    );
  }

  void clearCurrentLocation() {
    state = state.copyWith(
      currentLocation: null,
      currentLocationCityName: null,
      currentLocationShortAddress: null,
      currentLocationFormattedAddress: null,
    );
  }

  void clearCurrentLocationLabel() {
    state = state.copyWith(
      currentLocationCityName: null,
      currentLocationShortAddress: null,
      currentLocationFormattedAddress: null,
    );
  }

  void setCurrentLocationLabel(ReverseGeocodeCityResult? label) {
    state = state.copyWith(
      currentLocationCityName: label?.cityName,
      currentLocationShortAddress: label?.shortAddress,
      currentLocationFormattedAddress: label?.formattedAddress,
    );
  }

  Future<RootHubException?> resolveCurrentLocationLabel(
    GeoLocation location,
  ) async {
    final result = await ref
        .read(clientProvider)
        .reverseGeocodeCity
        .v1(x: location.x, y: location.y)
        .toResult;

    return result.fold(
      (label) {
        final activeLocation = state.currentLocation;
        if (activeLocation == null) {
          return null;
        }
        if (activeLocation.x != location.x || activeLocation.y != location.y) {
          return null;
        }

        setCurrentLocationLabel(label.value);
        return null;
      },
      (error) => error,
    );
  }

  void reset() {
    state = const OnboardingState();
  }
}

final onboardingProvider =
    NotifierProvider<OnboardingNotifier, OnboardingState>(
      OnboardingNotifier.new,
    );
