import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/global_providers/shared_preferences_provider.dart';
import 'package:root_hub_flutter/src/states/onboarding/onboarding_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingNotifier extends Notifier<OnboardingState> {
  static const defaultLocationRatioKm = 25.0;
  static const _selectedFactionKey = 'auth_onboarding_selected_faction_new';
  static const _displayNameKey = 'auth_onboarding_display_name';
  static const _locationXKey = 'auth_onboarding_location_x';
  static const _locationYKey = 'auth_onboarding_location_y';
  static const _locationRatioKey = 'auth_onboarding_location_ratio';

  @override
  OnboardingState build() {
    final prefs = ref.read(sharedPreferencesProvider);
    final savedFactionRaw = prefs.getString(_selectedFactionKey);

    return OnboardingState(
      selectedFaction: _parseFaction(savedFactionRaw),
      displayName: (prefs.getString(_displayNameKey) ?? '').trim(),
      currentLocation: _parseLocation(prefs),
    );
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

  Future<void> persistSelectedFaction() async {
    final faction = state.selectedFaction;
    if (faction == null) {
      return;
    }

    await ref
        .read(sharedPreferencesProvider)
        .setString(_selectedFactionKey, faction.toJson());
  }

  Future<void> persistProfileData() async {
    final prefs = ref.read(sharedPreferencesProvider);
    final normalizedDisplayName = state.displayName.trim();
    if (normalizedDisplayName.isEmpty) {
      await prefs.remove(_displayNameKey);
    } else {
      await prefs.setString(_displayNameKey, normalizedDisplayName);
    }

    final location = state.currentLocation;
    if (location == null) {
      await _removeLocationData(prefs);
      return;
    }

    await prefs.setDouble(_locationXKey, location.x);
    await prefs.setDouble(_locationYKey, location.y);
    await prefs.setDouble(_locationRatioKey, location.ratio);
  }

  Future<void> clearSelection() async {
    state = const OnboardingState();
    final prefs = ref.read(sharedPreferencesProvider);
    await prefs.remove(_selectedFactionKey);
    await prefs.remove(_displayNameKey);
    await _removeLocationData(prefs);
  }

  Future<void> _removeLocationData(SharedPreferences prefs) async {
    await prefs.remove(_locationXKey);
    await prefs.remove(_locationYKey);
    await prefs.remove(_locationRatioKey);
  }

  Faction? _parseFaction(String? raw) {
    if (raw == null || raw.isEmpty) {
      return null;
    }

    try {
      return Faction.fromJson(raw);
    } catch (_) {
      return null;
    }
  }

  GeoLocation? _parseLocation(SharedPreferences prefs) {
    final x = prefs.getDouble(_locationXKey);
    final y = prefs.getDouble(_locationYKey);
    if (x == null || y == null) {
      return null;
    }

    final ratio = prefs.getDouble(_locationRatioKey) ?? 0;
    return GeoLocation(
      x: x,
      y: y,
      ratio: ratio <= 0 ? defaultLocationRatioKm : ratio,
    );
  }
}

final onboardingProvider =
    NotifierProvider<OnboardingNotifier, OnboardingState>(
      OnboardingNotifier.new,
    );
