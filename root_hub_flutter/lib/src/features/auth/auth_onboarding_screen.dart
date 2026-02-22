import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/core/extension/faction_ui_extension.dart';
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
    final topPadding = MediaQuery.viewPaddingOf(context).top;

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
            const SizedBox(height: 10),
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
                  GridView.builder(
                    padding: EdgeInsets.only(
                      bottom: hasSelectedFaction ? 60 : 0,
                    ),
                    itemCount: Faction.values.length,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 0,
                          mainAxisSpacing: 0,
                          childAspectRatio: 0.75,
                        ),
                    itemBuilder: (context, index) {
                      final faction = Faction.values[index];
                      final isSelected = selectedFaction == faction;

                      return Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 8, 12),
                            child: GestureDetector(
                              onTap: () {
                                ref
                                    .read(onboardingProvider.notifier)
                                    .selectFaction(faction);
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 220),
                                curve: Curves.easeOutCubic,
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(22),
                                  border: Border.all(
                                    color: isSelected
                                        ? faction.factionColor
                                        : colorScheme.outlineVariant,
                                    width: isSelected ? 2.6 : 1.2,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: isSelected ? 24 : 12,
                                      spreadRadius: isSelected ? 1 : 0,
                                      offset: const Offset(0, 8),
                                      color: isSelected
                                          ? faction.factionColor.withValues(
                                              alpha: 0.28,
                                            )
                                          : colorScheme.shadow.withValues(
                                              alpha: 0.08,
                                            ),
                                    ),
                                  ],
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      colorScheme.surfaceContainerHighest
                                          .withValues(
                                            alpha: isSelected ? 0.9 : 0.6,
                                          ),
                                      colorScheme.surfaceContainer.withValues(
                                        alpha: isSelected ? 0.95 : 0.72,
                                      ),
                                    ],
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Hero(
                                        tag:
                                            'faction-image-${faction.toJson()}',
                                        child: Image.asset(
                                          faction.getFactionImage,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      _formatFactionName(faction),
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.nunitoSans(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 13,
                                        letterSpacing: 0.2,
                                        color: isSelected
                                            ? faction.factionColor
                                            : colorScheme.onSurface,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                          .animate(delay: (90 * index).ms)
                          .fadeIn(duration: 450.ms)
                          .slideY(begin: 0.18, end: 0, duration: 450.ms);
                    },
                  ),
                  Positioned(
                    left: 16,
                    right: 16,
                    bottom: 12,
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      switchInCurve: Curves.easeOutCubic,
                      switchOutCurve: Curves.easeInCubic,
                      child: hasSelectedFaction
                          ? Builder(
                              builder: (context) {
                                final faction = selectedFaction;
                                return SizedBox(
                                      key: ValueKey(faction.toJson()),
                                      height: 54,
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          await ref
                                              .read(
                                                onboardingProvider.notifier,
                                              )
                                              .selectFaction(faction);
                                          ref
                                              .read(
                                                authFlowProvider.notifier,
                                              )
                                              .moveToLoginAfterOnboarding();
                                        },
                                        style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          backgroundColor: faction.factionColor,
                                          foregroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              16,
                                            ),
                                          ),
                                        ),
                                        child: Text(
                                          'Continue',
                                          style: GoogleFonts.nunitoSans(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ),
                                    )
                                    .animate()
                                    .fadeIn(duration: 240.ms)
                                    .slideY(
                                      begin: 0.25,
                                      end: 0,
                                      duration: 240.ms,
                                    );
                              },
                            )
                          : const SizedBox.shrink(),
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

  String _formatFactionName(Faction faction) {
    final raw = faction.toJson();
    final withSpaces = raw.replaceAllMapped(
      RegExp(r'([a-z])([A-Z])'),
      (match) => '${match.group(1)} ${match.group(2)}',
    );
    return withSpaces
        .split(' ')
        .map((word) {
          if (word.isEmpty) {
            return word;
          }
          return '${word[0].toUpperCase()}${word.substring(1)}';
        })
        .join(' ');
  }
}
