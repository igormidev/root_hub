import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:root_hub_flutter/src/global_providers/shared_preferences_provider.dart';
import 'package:root_hub_flutter/src/states/theme_mode/theme_mode_state.dart';

class ThemeModeNotifier extends Notifier<ThemeModeState> {
  static const _darkModeEnabledKey = 'theme_mode_dark_enabled_v1';

  @override
  ThemeModeState build() {
    final sharedPreferences = ref.read(sharedPreferencesProvider);
    final isDarkModeEnabled =
        sharedPreferences.getBool(_darkModeEnabledKey) ?? false;
    return ThemeModeState(
      themeMode: isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light,
    );
  }

  void setDarkModeEnabled(bool isDarkModeEnabled) {
    final nextThemeMode = isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light;
    if (state.themeMode == nextThemeMode) {
      return;
    }

    state = state.copyWith(themeMode: nextThemeMode);
    unawaited(
      ref
          .read(sharedPreferencesProvider)
          .setBool(_darkModeEnabledKey, isDarkModeEnabled),
    );
  }
}

final themeModeProvider = NotifierProvider<ThemeModeNotifier, ThemeModeState>(
  ThemeModeNotifier.new,
);
