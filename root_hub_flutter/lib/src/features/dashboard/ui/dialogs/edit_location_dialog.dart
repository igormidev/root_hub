import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/design_system/location_picker/location_selection_panel_widget.dart';
import 'package:root_hub_flutter/src/design_system/location_picker/location_selection_search_sheet.dart';
import 'package:root_hub_flutter/src/design_system/default_error_snackbar.dart';
import 'package:root_hub_flutter/src/states/dashboard/dashboard_profile_provider.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';

class EditLocationDialog extends ConsumerStatefulWidget {
  const EditLocationDialog({
    required this.initialLocation,
    super.key,
  });

  final GeoLocation? initialLocation;

  @override
  ConsumerState<EditLocationDialog> createState() => _EditLocationDialogState();
}

class _EditLocationDialogState extends ConsumerState<EditLocationDialog> {
  static const _ratioStepKm = 5.0;

  GeoLocation? _draftLocation;
  bool _isResolvingLocation = false;
  String? _locationStatusMessage;
  bool _locationStatusError = false;

  @override
  void initState() {
    super.initState();
    _draftLocation = widget.initialLocation;
  }

  Future<void> _openLocationSearchSheet() async {
    final currentRatio =
        _draftLocation?.ratio ?? widget.initialLocation?.ratio ?? 25;

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return LocationSelectionSearchSheet(
          initialRatioKm: currentRatio,
          onLocationPicked: (selectedLocation) {
            setState(() {
              _draftLocation = selectedLocation;
            });
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
        locationSettings: LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );

      if (!mounted) {
        return;
      }

      setState(() {
        _draftLocation = GeoLocation(
          x: position.latitude,
          y: position.longitude,
          ratio: _draftLocation?.ratio ?? widget.initialLocation?.ratio ?? 25,
        );
      });

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

  void _changeRatio(double delta) {
    final location = _draftLocation;
    if (location == null) {
      return;
    }

    final nextRatio = (location.ratio + delta).clamp(1.0, 500.0).toDouble();
    setState(() {
      _draftLocation = location.copyWith(ratio: nextRatio);
    });
  }

  Future<void> _saveLocation() async {
    final location = _draftLocation;
    if (location == null) {
      _setLocationMessage(
        t
            .auth
            .auth_onboarding_profile_screen
            .selectALocationFromTheListBeforeContinuing,
        isError: true,
      );
      return;
    }

    final result = await ref
        .read(dashboardProfileProvider.notifier)
        .updateLocation(location);

    if (!mounted) {
      return;
    }

    if (result != null) {
      await showErrorDialog(
        context,
        title: result.title,
        description: result.description,
      );
      return;
    }

    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    final isSaving = ref.watch(
      dashboardProfileProvider.select((value) => value.isUpdatingLocation),
    );
    final maxDialogHeight = MediaQuery.sizeOf(context).height * 0.86;
    final colorScheme = Theme.of(context).colorScheme;

    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: maxDialogHeight),
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 14),
          child: Column(
            children: [
              Text(
                t.dashboard.ui_dialogs_edit_location_dialog.editLocation,
                style: GoogleFonts.cinzel(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 8),
              Text(
                t
                    .dashboard
                    .ui_dialogs_edit_location_dialog
                    .updateYourCoordinatesAndTargetSearchRatioForMatchDiscovery,
                textAlign: TextAlign.center,
                style: GoogleFonts.nunitoSans(
                  fontWeight: FontWeight.w700,
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              SizedBox(height: 14),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: LocationSelectionPanelWidget(
                    currentLocation: _draftLocation,
                    currentLocationCityName: null,
                    currentLocationShortAddress: null,
                    isResolvingLocation: _isResolvingLocation,
                    isResolvingLocationLabel: false,
                    onUseCurrentLocation: _resolveCurrentLocation,
                    onSearchLocation: _openLocationSearchSheet,
                    onUnselectLocation: () {
                      setState(() {
                        _draftLocation = null;
                      });
                    },
                    onDecreaseRatio: _draftLocation == null
                        ? null
                        : () => _changeRatio(-_ratioStepKm),
                    onIncreaseRatio: _draftLocation == null
                        ? null
                        : () => _changeRatio(_ratioStepKm),
                    statusMessage: _locationStatusMessage,
                    statusIsError: _locationStatusError,
                    enabled: !isSaving,
                  ),
                ),
              ),
              SizedBox(height: 14),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: isSaving
                          ? null
                          : () {
                              Navigator.of(context).pop(false);
                            },
                      child: Text(
                        t.dashboard.ui_dialogs_edit_location_dialog.cancel,
                        style: GoogleFonts.nunitoSans(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: FilledButton(
                      onPressed: isSaving ? null : _saveLocation,
                      child: isSaving
                          ? SizedBox(
                              width: 18,
                              height: 18,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                              ),
                            )
                          : Text(
                              t.dashboard.ui_dialogs_edit_location_dialog.save,
                              style: GoogleFonts.nunitoSans(
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
