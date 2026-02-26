import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:root_hub_flutter/src/design_system/faction_selector/faction_selection_grid_widget.dart';
import 'package:root_hub_flutter/src/features/auth/auth_onboarding_continue_button_widget.dart';
import 'package:root_hub_flutter/src/states/auth_flow/auth_flow_provider.dart';
import 'package:root_hub_flutter/src/states/onboarding/onboarding_provider.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';

class AuthOnboardingScreen extends ConsumerStatefulWidget {
  const AuthOnboardingScreen({
    super.key,
  });

  @override
  ConsumerState<AuthOnboardingScreen> createState() =>
      _AuthOnboardingScreenState();
}

class _AuthOnboardingScreenState extends ConsumerState<AuthOnboardingScreen> {
  static const _ctaHideScrollThreshold = 40.0;

  bool _showLoginShortcut = true;

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification.metrics.axis != Axis.vertical) {
      return false;
    }

    final shouldShow = notification.metrics.pixels <= _ctaHideScrollThreshold;
    if (shouldShow != _showLoginShortcut) {
      setState(() {
        _showLoginShortcut = shouldShow;
      });
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final selectedFaction = ref.watch(onboardingProvider).selectedFaction;
    final hasSelectedFaction = selectedFaction != null;
    final viewPadding = MediaQuery.viewPaddingOf(context);
    final topPadding = viewPadding.top;
    final shouldShowShortcut = !hasSelectedFaction && _showLoginShortcut;

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
                  NotificationListener<ScrollNotification>(
                    onNotification: _handleScrollNotification,
                    child: FactionSelectionGridWidget(
                      selectedFaction: selectedFaction,
                      bottomPadding: hasSelectedFaction ? 110 : 92,
                      onFactionPressed: (faction) {
                        final notifier = ref.read(onboardingProvider.notifier);
                        if (selectedFaction == faction) {
                          notifier.unselectFaction();
                          return;
                        }
                        notifier.selectFaction(faction);
                      },
                    ),
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
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: IgnorePointer(
                      ignoring: !shouldShowShortcut,
                      child: Animate(
                        target: shouldShowShortcut ? 1 : 0,
                        effects: [
                          FadeEffect(duration: 240.ms),
                          SlideEffect(
                            begin: const Offset(0, 0.22),
                            end: Offset.zero,
                            duration: 240.ms,
                            curve: Curves.easeOutCubic,
                          ),
                        ],
                        child: Container(
                          padding: EdgeInsets.fromLTRB(
                            16,
                            34,
                            16,
                            viewPadding.bottom + 8,
                          ),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                colorScheme.surface.withValues(alpha: 0),
                                colorScheme.surface.withValues(alpha: 0.72),
                                colorScheme.surface.withValues(alpha: 0.96),
                              ],
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: TextButton(
                              onPressed: () {
                                ref
                                    .read(authFlowProvider.notifier)
                                    .moveToLoginAfterOnboarding();
                              },
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                              ),
                              child: Text(
                                t
                                    .auth
                                    .auth_onboarding_screen
                                    .iAlreadyHaveAnAccount,
                                style: GoogleFonts.nunitoSans(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
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
