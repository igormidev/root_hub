import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:root_hub_client/root_hub_client.dart';
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
    state = state.copyWith(currentLocation: location);
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
    state = state.copyWith(currentLocation: null);
  }

  void reset() {
    state = const OnboardingState();
  }
}

final onboardingProvider =
    NotifierProvider<OnboardingNotifier, OnboardingState>(
      OnboardingNotifier.new,
    );
