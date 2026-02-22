import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/core/extension/faction_ui_extension.dart';
import 'package:root_hub_flutter/src/design_system/profile_editor/profile_display_name_editor_card.dart';
import 'package:root_hub_flutter/src/design_system/profile_editor/profile_location_editor_card.dart';
import 'package:root_hub_flutter/src/states/auth_flow/auth_flow_provider.dart';
import 'package:root_hub_flutter/src/states/onboarding/onboarding_provider.dart';

class AuthOnboardingProfileScreen extends ConsumerStatefulWidget {
  const AuthOnboardingProfileScreen({
    super.key,
  });

  @override
  ConsumerState<AuthOnboardingProfileScreen> createState() =>
      _AuthOnboardingProfileScreenState();
}

class _AuthOnboardingProfileScreenState
    extends ConsumerState<AuthOnboardingProfileScreen> {
  static const _ratioStepKm = 5.0;

  late final TextEditingController _displayNameController;

  bool _isResolvingLocation = false;
  String? _locationStatusMessage;
  bool _locationStatusError = false;

  @override
  void initState() {
    super.initState();
    _displayNameController = TextEditingController(
      text: ref.read(onboardingProvider).displayName,
    );
    _displayNameController.addListener(_onDisplayNameChanged);
  }

  @override
  void dispose() {
    _displayNameController
      ..removeListener(_onDisplayNameChanged)
      ..dispose();
    super.dispose();
  }

  void _onDisplayNameChanged() {
    ref
        .read(onboardingProvider.notifier)
        .setDisplayName(
          _displayNameController.text,
        );
  }

  Future<void> _resolveCurrentLocation() async {
    if (_isResolvingLocation) {
      return;
    }

    setState(() {
      _isResolvingLocation = true;
      _locationStatusMessage = null;
      _locationStatusError = false;
    });

    try {
      final isServiceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!isServiceEnabled) {
        _setLocationMessage(
          'Enable location services on your phone and try again.',
          isError: true,
        );
        return;
      }

      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.denied) {
        _setLocationMessage(
          'Location permission denied. Location is required to continue.',
          isError: true,
        );
        return;
      }

      if (permission == LocationPermission.deniedForever) {
        _setLocationMessage(
          'Location permission is denied forever. Enable it in system settings to continue.',
          isError: true,
        );
        return;
      }

      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );

      if (!mounted) {
        return;
      }

      ref
          .read(onboardingProvider.notifier)
          .setCurrentLocation(
            GeoLocation(
              x: position.latitude,
              y: position.longitude,
              ratio: OnboardingNotifier.defaultLocationRatioKm,
            ),
          );

      _setLocationMessage(
        'Location captured successfully.',
        isError: false,
      );
    } catch (_) {
      _setLocationMessage(
        'Unable to capture location right now. Location is required to continue.',
        isError: true,
      );
    } finally {
      if (mounted) {
        setState(() {
          _isResolvingLocation = false;
        });
      }
    }
  }

  void _setLocationMessage(
    String message, {
    required bool isError,
  }) {
    if (!mounted) {
      return;
    }

    setState(() {
      _locationStatusMessage = message;
      _locationStatusError = isError;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final onboardingState = ref.watch(onboardingProvider);
    final selectedFaction = onboardingState.selectedFaction;
    final currentLocation = onboardingState.currentLocation;
    final hasDisplayName = onboardingState.displayName.trim().isNotEmpty;
    final hasCurrentLocation = currentLocation != null;
    final viewPadding = MediaQuery.viewPaddingOf(context);
    final continueColor = selectedFaction?.factionColor ?? colorScheme.primary;
    final continueTextColor =
        selectedFaction == Faction.riverfolkCompany ||
            selectedFaction == Faction.keepersInIron
        ? Colors.black
        : Colors.white;

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
            SizedBox(height: viewPadding.top + 22),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child:
                  Text(
                        'Set Your Hub Identity',
                        style: GoogleFonts.cinzel(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.1,
                          color: colorScheme.onSurface,
                        ),
                        textAlign: TextAlign.center,
                      )
                      .animate()
                      .fadeIn(duration: 400.ms)
                      .slideY(begin: -0.2, end: 0, duration: 400.ms),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Your display name is how other players will see you in Root Hub. '
                'Current location uses your phone coordinates (x and y) and is required to show nearby matches.',
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
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Column(
                  children: [
                    ProfileDisplayNameEditorCard(
                      controller: _displayNameController,
                    ),
                    const SizedBox(height: 12),
                    ProfileLocationEditorCard(
                      currentLocation: currentLocation,
                      isResolvingLocation: _isResolvingLocation,
                      onResolveLocation: _resolveCurrentLocation,
                      onClearLocation: currentLocation == null
                          ? null
                          : () {
                              ref
                                  .read(onboardingProvider.notifier)
                                  .clearCurrentLocation();
                            },
                      onDecreaseRatio: currentLocation == null
                          ? null
                          : () {
                              final nextRatio =
                                  currentLocation.ratio - _ratioStepKm;
                              ref
                                  .read(onboardingProvider.notifier)
                                  .setCurrentLocationRatio(nextRatio);
                            },
                      onIncreaseRatio: currentLocation == null
                          ? null
                          : () {
                              final nextRatio =
                                  currentLocation.ratio + _ratioStepKm;
                              ref
                                  .read(onboardingProvider.notifier)
                                  .setCurrentLocationRatio(nextRatio);
                            },
                      statusMessage: _locationStatusMessage,
                      statusIsError: _locationStatusError,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 8, 16, viewPadding.bottom + 16),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 280),
                child: hasDisplayName && hasCurrentLocation
                    ? SizedBox(
                            key: const ValueKey('profile-continue'),
                            height: 58,
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () async {
                                await ref
                                    .read(onboardingProvider.notifier)
                                    .persistProfileData();
                                ref
                                    .read(authFlowProvider.notifier)
                                    .moveToLoginAfterOnboarding();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: continueColor,
                                foregroundColor: continueTextColor,
                                elevation: 0,
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
                                  color: continueTextColor,
                                ),
                              ),
                            ),
                          )
                          .animate()
                          .fadeIn(duration: 240.ms)
                          .slideY(begin: 0.25, end: 0, duration: 240.ms)
                    : const SizedBox(
                        key: ValueKey('profile-continue-placeholder'),
                        height: 58,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
