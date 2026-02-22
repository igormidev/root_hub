import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/design_system/default_error_snackbar.dart';
import 'package:root_hub_flutter/src/design_system/profile_editor/profile_location_editor_card.dart';
import 'package:root_hub_flutter/src/states/dashboard/dashboard_profile_provider.dart';

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

      setState(() {
        _draftLocation = GeoLocation(
          x: position.latitude,
          y: position.longitude,
          ratio: _draftLocation?.ratio ?? widget.initialLocation?.ratio ?? 25,
        );
      });

      _setLocationMessage(
        'Location captured successfully.',
        isError: false,
      );
    } catch (_) {
      _setLocationMessage(
        'Unable to capture location right now. Try again in a moment.',
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
        'Capture a location before saving.',
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

    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 14),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Edit Location',
              style: GoogleFonts.cinzel(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Update your coordinates and target search ratio for match discovery.',
              textAlign: TextAlign.center,
              style: GoogleFonts.nunitoSans(
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 14),
            ProfileLocationEditorCard(
              currentLocation: _draftLocation,
              isResolvingLocation: _isResolvingLocation,
              onResolveLocation: _resolveCurrentLocation,
              onClearLocation: () {
                setState(() {
                  _draftLocation = null;
                });
              },
              onDecreaseRatio: () => _changeRatio(-_ratioStepKm),
              onIncreaseRatio: () => _changeRatio(_ratioStepKm),
              statusMessage: _locationStatusMessage,
              statusIsError: _locationStatusError,
              enabled: !isSaving,
              showOuterCard: false,
            ),
            const SizedBox(height: 14),
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
                      'Cancel',
                      style: GoogleFonts.nunitoSans(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: FilledButton(
                    onPressed: isSaving ? null : _saveLocation,
                    child: isSaving
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                          )
                        : Text(
                            'Save',
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
    );
  }
}
