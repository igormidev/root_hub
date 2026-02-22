import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/core/extension/faction_ui_extension.dart';
import 'package:root_hub_flutter/src/design_system/faction_selector/faction_selection_grid_widget.dart';
import 'package:root_hub_flutter/src/states/auth_flow/auth_flow_provider.dart';
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
                        'Choose Your Faction',
                        style: GoogleFonts.cinzel(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.1,
                          color: colorScheme.onSurface,
                        ),
                      )
                      .animate()
                      .fadeIn(duration: 400.ms)
                      .slideY(begin: -0.2, end: 0, duration: 400.ms),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Pick your favorite ROOT faction before entering the hub.',
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
                    bottomPadding: hasSelectedFaction ? 110 : 0,
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
                        final faction => _buildContinueButton(
                          context,
                          ref,
                          faction,
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

  Widget _buildContinueButton(
    BuildContext context,
    WidgetRef ref,
    Faction faction,
  ) {
    final useDarkForeground =
        faction == Faction.riverfolkCompany || faction == Faction.keepersInIron;
    final foregroundColor = useDarkForeground ? Colors.black : Colors.white;

    return SizedBox(
          key: ValueKey(faction.toJson()),
          height: 58,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () async {
              await ref
                  .read(onboardingProvider.notifier)
                  .persistSelectedFaction();
              ref.read(authFlowProvider.notifier).moveToOnboardingProfile();
            },
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: faction.factionColor,
              foregroundColor: foregroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Text(
              'Continue',
              style: GoogleFonts.getFont(
                'MedievalSharp',
                fontSize: 22,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.7,
                color: foregroundColor,
              ),
            ),
          ),
        )
        .animate()
        .fadeIn(duration: 240.ms)
        .slideY(begin: 0.25, end: 0, duration: 240.ms);
  }
}
