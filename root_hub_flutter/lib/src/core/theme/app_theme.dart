import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Builds a [ThemeData] for the application based on the seed color and brightness.
///
/// This centralizes theme configuration to avoid repetition and ensure consistency.
ThemeData buildAppTheme({
  required Color seedColor,
  required Brightness brightness,
}) {
  final colorScheme = ColorScheme.fromSeed(
    seedColor: seedColor,
    brightness: brightness,
  );
  final baseTextTheme = GoogleFonts.nunitoSansTextTheme(
    ThemeData(
      brightness: brightness,
      useMaterial3: true,
    ).textTheme,
  );
  final headingTextTheme = GoogleFonts.cinzelTextTheme(baseTextTheme);
  final textTheme = baseTextTheme.copyWith(
    displayLarge: headingTextTheme.displayLarge,
    displayMedium: headingTextTheme.displayMedium,
    displaySmall: headingTextTheme.displaySmall,
    headlineLarge: headingTextTheme.headlineLarge,
    headlineMedium: headingTextTheme.headlineMedium,
    headlineSmall: headingTextTheme.headlineSmall,
    titleLarge: headingTextTheme.titleLarge,
  );

  return ThemeData(
    colorScheme: colorScheme,
    brightness: brightness,
    textTheme: textTheme,
    cupertinoOverrideTheme: CupertinoThemeData(
      textTheme: CupertinoTextThemeData(
        textStyle: GoogleFonts.nunitoSans(),
        navTitleTextStyle: GoogleFonts.cinzel(
          fontWeight: FontWeight.w600,
        ),
        navLargeTitleTextStyle: GoogleFonts.cinzel(
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    useMaterial3: true,
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        minimumSize: const Size(20, 50),
        maximumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}

/// Returns the [ThemeMode] based on the given [Brightness].
ThemeMode themeModeFromBrightness(Brightness brightness) {
  return brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
}
