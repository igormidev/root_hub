import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/core/extension/serverpod_to_result.dart';
import 'package:root_hub_flutter/src/global_providers/session_provider.dart';
import 'package:root_hub_flutter/src/global_providers/shared_preferences_provider.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';

import 'location_search_picker_widget.dart';

class LocationSelectionSearchSheet extends ConsumerStatefulWidget {
  const LocationSelectionSearchSheet({
    required this.onLocationPicked,
    required this.initialRatioKm,
    super.key,
  });

  final ValueChanged<GeoLocation> onLocationPicked;
  final double initialRatioKm;

  @override
  ConsumerState<LocationSelectionSearchSheet> createState() =>
      _LocationSelectionSearchSheetState();
}

class _LocationSelectionSearchSheetState
    extends ConsumerState<LocationSelectionSearchSheet> {
  static const _recentLocationsKey = 'match_create_table_recent_locations_v1';
  static const _maxRecentLocations = 8;

  late final TextEditingController _searchController;

  Timer? _searchDebounce;
  int _activeSearchRunId = 0;

  bool _hasLoadedRecentLocations = false;
  List<Location> _recentLocations = const <Location>[];
  String _locationQuery = '';
  bool _isSearchingLocations = false;
  bool _hasPerformedLocationSearch = false;
  List<Location> _searchResults = const <Location>[];
  RootHubException? _locationSearchError;
  Location? _selectedLocation;
  String? _selectionErrorMessage;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _searchController.addListener(_onSearchChanged);
    unawaited(_loadRecentLocations());
  }

  @override
  void dispose() {
    _searchDebounce?.cancel();
    _activeSearchRunId += 1;
    _searchController
      ..removeListener(_onSearchChanged)
      ..dispose();
    super.dispose();
  }

  Future<void> _loadRecentLocations() async {
    final loadedLocations = _readRecentLocations();
    if (!mounted) {
      return;
    }

    setState(() {
      _recentLocations = loadedLocations;
      _hasLoadedRecentLocations = true;
    });
  }

  void _onSearchChanged() {
    final query = _searchController.text;
    final normalizedQuery = query.trim();

    _searchDebounce?.cancel();
    _activeSearchRunId += 1;
    _selectionErrorMessage = null;

    if (normalizedQuery.isEmpty) {
      setState(() {
        _locationQuery = query;
        _isSearchingLocations = false;
        _hasPerformedLocationSearch = false;
        _searchResults = const <Location>[];
        _locationSearchError = null;
      });
      return;
    }

    final runId = _activeSearchRunId;
    setState(() {
      _locationQuery = query;
      _isSearchingLocations = true;
      _hasPerformedLocationSearch = true;
      _locationSearchError = null;
    });

    _searchDebounce = Timer(const Duration(milliseconds: 360), () {
      unawaited(
        _executeLocationSearch(
          runId: runId,
          normalizedQuery: normalizedQuery,
        ),
      );
    });
  }

  Future<void> _executeLocationSearch({
    required int runId,
    required String normalizedQuery,
  }) async {
    final result = await ref
        .read(clientProvider)
        .getMatchLocation
        .v1(
          query: normalizedQuery,
          page: 1,
        )
        .toResult;

    if (runId != _activeSearchRunId || !mounted) {
      return;
    }

    result.fold(
      (locations) {
        setState(() {
          _isSearchingLocations = false;
          _searchResults = locations;
          _locationSearchError = null;
        });
      },
      (error) {
        setState(() {
          _isSearchingLocations = false;
          _searchResults = const <Location>[];
          _locationSearchError = error;
        });
      },
    );
  }

  void _selectLocation(Location location) {
    if (location.id == null) {
      return;
    }

    setState(() {
      _selectedLocation = location;
      _selectionErrorMessage = null;
    });

    unawaited(_saveRecentLocation(location));
  }

  Future<void> _confirmLocationSelection() async {
    final selectedLocation = _selectedLocation;
    if (selectedLocation == null) {
      setState(() {
        _selectionErrorMessage = t
            .auth
            .auth_onboarding_profile_screen
            .selectALocationFromTheListBeforeContinuing;
      });
      return;
    }

    final googlePlaceLocation = selectedLocation.googlePlaceLocation;
    final lat = googlePlaceLocation?.lat;
    final lng = googlePlaceLocation?.lng;
    if (lat == null || lng == null) {
      setState(() {
        _selectionErrorMessage = t
            .auth
            .auth_onboarding_profile_screen
            .unableToUseTheSelectedLocationCoordinatesRightNow;
      });
      return;
    }

    widget.onLocationPicked(
      GeoLocation(
        x: lat,
        y: lng,
        ratio: widget.initialRatioKm,
      ),
    );

    Navigator.of(context).pop();
  }

  List<Location> _readRecentLocations() {
    final prefs = ref.read(sharedPreferencesProvider);
    final storedLocations =
        prefs.getStringList(_recentLocationsKey) ?? const <String>[];

    final parsedLocations = <Location>[];
    for (final rawLocation in storedLocations) {
      final decodedLocation = _decodeLocation(rawLocation);
      if (decodedLocation != null) {
        parsedLocations.add(decodedLocation);
      }
    }

    return _dedupeAndLimit(parsedLocations);
  }

  Future<void> _saveRecentLocation(Location location) async {
    final updatedRecentLocations = _dedupeAndLimit([
      location,
      ..._recentLocations,
    ]);

    if (mounted) {
      setState(() {
        _recentLocations = updatedRecentLocations;
      });
    }

    final serializedLocations = updatedRecentLocations
        .map((item) => jsonEncode(item.toJson()))
        .toList();

    await ref
        .read(sharedPreferencesProvider)
        .setStringList(_recentLocationsKey, serializedLocations);
  }

  List<Location> _dedupeAndLimit(List<Location> locations) {
    final dedupedById = <int, Location>{};
    for (final location in locations) {
      final locationId = location.id;
      if (locationId == null) {
        continue;
      }
      dedupedById[locationId] = location;
    }

    return dedupedById.values.take(_maxRecentLocations).toList();
  }

  Location? _decodeLocation(String rawLocation) {
    try {
      final decoded = jsonDecode(rawLocation);
      if (decoded is! Map) {
        return null;
      }

      final location = Location.fromJson(decoded.cast<String, dynamic>());
      if (location.id == null) {
        return null;
      }

      return location;
    } catch (_) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final viewInsets = MediaQuery.viewInsetsOf(context);
    final viewPadding = MediaQuery.viewPaddingOf(context);

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.only(bottom: viewInsets.bottom),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Container(
                width: 44,
                height: 5,
                decoration: BoxDecoration(
                  color: colorScheme.outlineVariant,
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
                child: Text(
                  t.auth.auth_onboarding_profile_screen.searchForLocation,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.cinzel(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: colorScheme.onSurface,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
                child: Text(
                  t
                      .auth
                      .auth_onboarding_profile_screen
                      .searchAndPickOnePlaceWeWillUseItsCoordinatesForNearbyMatches,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w700,
                    height: 1.35,
                  ),
                ),
              ),
              Expanded(
                child: LocationSearchPickerWidget(
                  searchController: _searchController,
                  locationQuery: _locationQuery,
                  isSearchingLocations: _isSearchingLocations,
                  hasPerformedLocationSearch: _hasPerformedLocationSearch,
                  searchResults: _searchResults,
                  locationSearchError: _locationSearchError,
                  hasLoadedRecentLocations: _hasLoadedRecentLocations,
                  recentLocations: _recentLocations,
                  selectedLocation: _selectedLocation,
                  onLocationSelected: _selectLocation,
                  showInstructionText: false,
                  listPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                ),
              ),
              if (_selectionErrorMessage != null)
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 4, 16, 0),
                  child: Text(
                    _selectionErrorMessage!,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: colorScheme.error,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                  16,
                  10,
                  16,
                  viewPadding.bottom > 0 ? viewPadding.bottom : 14,
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton.icon(
                    onPressed: _confirmLocationSelection,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorScheme.primary,
                      foregroundColor: colorScheme.onPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    icon: const Icon(Icons.check_rounded),
                    label: Text(
                      t.auth.auth_onboarding_profile_screen.useSelectedLocation,
                      style: GoogleFonts.nunitoSans(
                        fontSize: 17,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
