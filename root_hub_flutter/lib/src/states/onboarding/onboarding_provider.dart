import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/global_providers/shared_preferences_provider.dart';
import 'package:root_hub_flutter/src/states/onboarding/onboarding_state.dart';

class OnboardingNotifier extends Notifier<OnboardingState> {
  static const _selectedFactionKey = 'auth_onboarding_selected_faction';

  @override
  OnboardingState build() {
    final savedFactionRaw = ref
        .read(sharedPreferencesProvider)
        .getString(_selectedFactionKey);
    return OnboardingState(
      selectedFaction: _parseFaction(savedFactionRaw),
    );
  }

  Future<void> selectFaction(Faction faction) async {
    state = state.copyWith(selectedFaction: faction);
    await ref
        .read(sharedPreferencesProvider)
        .setString(_selectedFactionKey, faction.toJson());
  }

  Future<void> clearSelection() async {
    state = const OnboardingState();
    await ref.read(sharedPreferencesProvider).remove(_selectedFactionKey);
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
}

final onboardingProvider =
    NotifierProvider<OnboardingNotifier, OnboardingState>(
      OnboardingNotifier.new,
    );
