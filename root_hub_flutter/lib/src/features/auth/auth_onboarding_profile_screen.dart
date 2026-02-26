import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';
import 'package:root_hub_flutter/src/core/extension/faction_ui_extension.dart';
import 'package:root_hub_flutter/src/design_system/location_picker/location_selection_panel_widget.dart';
import 'package:root_hub_flutter/src/design_system/location_picker/location_selection_search_sheet.dart';
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

  Future<void> _openLocationSearchSheet() async {
    final currentRatio =
        ref.read(onboardingProvider).currentLocation?.ratio ??
        OnboardingNotifier.defaultLocationRatioKm;

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return LocationSelectionSearchSheet(
          initialRatioKm: currentRatio,
          onLocationPicked: (selectedLocation) {
            ref
                .read(onboardingProvider.notifier)
                .setCurrentLocation(selectedLocation);
            _setLocationMessage(
              t.auth.auth_onboarding_profile_screen.locationSelectedFromSearch,
              isError: false,
            );
          },
        );
      },
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
          t
              .auth
              .auth_onboarding_profile_screen
              .enableLocationServicesOnYourPhoneAndTryAgain,
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
          t
              .auth
              .auth_onboarding_profile_screen
              .locationPermissionDeniedLocationIsRequiredToContinue,
          isError: true,
        );
        return;
      }

      if (permission == LocationPermission.deniedForever) {
        _setLocationMessage(
          t
              .auth
              .auth_onboarding_profile_screen
              .locationPermissionIsDeniedForeverEnableItInSystemSettingsToContinue,
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
        t.auth.auth_onboarding_profile_screen.locationCapturedSuccessfully,
        isError: false,
      );
    } catch (_) {
      _setLocationMessage(
        t
            .auth
            .auth_onboarding_profile_screen
            .unableToCaptureLocationRightNowLocationIsRequiredToContinue,
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
                        t
                            .auth
                            .auth_onboarding_profile_screen
                            .setYourHubIdentity,
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
                      .slideY(
                        begin: -0.2,
                        end: 0,
                        duration: 400.ms,
                      ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                t
                    .auth
                    .auth_onboarding_profile_screen
                    .chooseHowYouAppearAndSetYourLocationToFindNearbyMatches,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      t.auth.auth_onboarding_profile_screen.howYouWillBeCalled,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      t
                          .auth
                          .auth_onboarding_profile_screen
                          .thisIsHowOtherPlayersWillSeeYourProfileInRootHub,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w700,
                        height: 1.35,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _displayNameController,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        hintText: t
                            .auth
                            .auth_onboarding_profile_screen
                            .enterYourDisplayName,
                        filled: true,
                        fillColor: colorScheme.surface.withValues(
                          alpha: 0.95,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide(
                            color: colorScheme.outlineVariant,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide(
                            color: colorScheme.outlineVariant,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide(
                            color: colorScheme.primary,
                            width: 1.4,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 14,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      t.auth.auth_onboarding_profile_screen.currentLocation,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      t
                          .auth
                          .auth_onboarding_profile_screen
                          .locationIsRequiredToShowNearbyTablesChooseDeviceOrSearch,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w700,
                        height: 1.35,
                      ),
                    ),
                    const SizedBox(height: 12),
                    LocationSelectionPanelWidget(
                      currentLocation: currentLocation,
                      isResolvingLocation: _isResolvingLocation,
                      onUseCurrentLocation: _resolveCurrentLocation,
                      onSearchLocation: _openLocationSearchSheet,
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
                            t
                                .auth
                                .auth_onboarding_profile_screen
                                .continueButton,
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
