import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';
import 'package:root_hub_flutter/src/design_system/faction_selector/faction_selection_grid_widget.dart';
import 'package:root_hub_flutter/src/features/auth/auth_onboarding_continue_button_widget.dart';
import 'package:root_hub_flutter/src/states/onboarding/onboarding_provider.dart';

class AuthOnboardingScreen extends ConsumerWidget {
  const AuthOnboardingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final selectedFaction = ref.watch(onboardingProvider).selectedFaction;
    final hasSelectedFaction = selectedFaction != null;
    final viewPadding = MediaQuery.viewPaddingOf(context);
    final topPadding = viewPadding.top;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: const Alignment(0, -0.8),
            radius: 1.25,
            colors: [
              colorScheme.primaryContainer.withValues(alpha: 0.55),
              colorScheme.surface,
              colorScheme.secondaryContainer.withValues(alpha: 0.35),
            ],
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: topPadding + 22),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child:
                  Text(
                        t.auth.auth_onboarding_screen.chooseYourFaction,
                        style: GoogleFonts.cinzel(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.1,
                          color: colorScheme.onSurface,
                        ),
                      )
                      .animate()
                      .fadeIn(duration: 400.ms)
                      .slideY(
                        begin: -0.2,
                        end: 0,
                        duration: 400.ms,
                      ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                t
                    .auth
                    .auth_onboarding_screen
                    .pickYourFavoriteRootFactionBeforeEnteringTheHub,
                textAlign: TextAlign.center,
                style: GoogleFonts.nunitoSans(
                  fontSize: 15,
                  color: colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w600,
                ),
              ).animate().fadeIn(delay: 120.ms, duration: 420.ms),
            ),
            const SizedBox(height: 18),
            Expanded(
              child: Stack(
                children: [
                  FactionSelectionGridWidget(
                    selectedFaction: selectedFaction,
                    bottomPadding: hasSelectedFaction ? 110 : 20,
                    onFactionPressed: (faction) {
                      final notifier = ref.read(onboardingProvider.notifier);
                      if (selectedFaction == faction) {
                        notifier.unselectFaction();
                        return;
                      }
                      notifier.selectFaction(faction);
                    },
                  ),
                  Positioned(
                    left: 16,
                    right: 16,
                    bottom: viewPadding.bottom,
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      switchInCurve: Curves.easeOutCubic,
                      switchOutCurve: Curves.easeInCubic,
                      child: switch (selectedFaction) {
                        null => const SizedBox.shrink(),
                        final faction => AuthOnboardingContinueButtonWidget(
                          faction: faction,
                        ),
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
