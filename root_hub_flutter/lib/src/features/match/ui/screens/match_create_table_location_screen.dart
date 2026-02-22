import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/core/navigation/app_routes.dart';
import 'package:root_hub_flutter/src/design_system/default_error_snackbar.dart';
import 'package:root_hub_flutter/src/states/match/match_create_table_provider.dart';

class MatchCreateTableLocationScreen extends ConsumerStatefulWidget {
  const MatchCreateTableLocationScreen({
    super.key,
  });

  @override
  ConsumerState<MatchCreateTableLocationScreen> createState() =>
      _MatchCreateTableLocationScreenState();
}

class _MatchCreateTableLocationScreenState
    extends ConsumerState<MatchCreateTableLocationScreen> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();

    final state = ref.read(matchCreateTableProvider);
    _searchController = TextEditingController(text: state.locationQuery);
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController
      ..removeListener(_onSearchChanged)
      ..dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    ref
        .read(matchCreateTableProvider.notifier)
        .setLocationQuery(_searchController.text);
  }

  Future<void> _createTable() async {
    final state = ref.read(matchCreateTableProvider);
    if (state.selectedLocation == null) {
      await showErrorDialog(
        context,
        title: 'Location required',
        description:
            'Choose one location from the list before creating the table.',
      );
      return;
    }

    final error = await ref
        .read(matchCreateTableProvider.notifier)
        .createTable();
    if (!mounted) {
      return;
    }

    if (error != null) {
      await showErrorDialog(
        context,
        title: error.title,
        description: error.description,
      );
      return;
    }

    context.go(dashboardPath);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(matchCreateTableProvider);

    final selectedLocation = state.selectedLocation;
    final queryIsEmpty = state.locationQuery.trim().isEmpty;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: const Alignment(0, -1.1),
            radius: 1.45,
            colors: [
              colorScheme.primaryContainer.withValues(alpha: 0.62),
              colorScheme.surface,
              colorScheme.secondaryContainer.withValues(alpha: 0.42),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 10),
                child: Row(
                  children: [
                    IconButton.filledTonal(
                      onPressed: () {
                        context.pop();
                      },
                      icon: const Icon(Icons.arrow_back_rounded),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Choose Table Location',
                        style: GoogleFonts.cinzel(
                          fontSize: 23,
                          fontWeight: FontWeight.w800,
                          color: colorScheme.onSurface,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                child: TextField(
                  controller: _searchController,
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search_rounded),
                    suffixIcon: _searchController.text.trim().isEmpty
                        ? null
                        : IconButton(
                            onPressed: () {
                              _searchController.clear();
                            },
                            icon: const Icon(Icons.clear_rounded),
                          ),
                    hintText: 'Search location (Google Places)',
                    filled: true,
                    fillColor: colorScheme.surface.withValues(alpha: 0.94),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
                child: Text(
                  'Tap a location to select it. Previously selected locations are saved here for faster hosting.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w700,
                    height: 1.3,
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 18),
                  children: [
                    if (selectedLocation != null)
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: colorScheme.primary),
                          color: colorScheme.primaryContainer.withValues(
                            alpha: 0.45,
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.check_circle_rounded,
                              color: colorScheme.primary,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                _locationTitle(selectedLocation),
                                style: Theme.of(context).textTheme.bodyLarge
                                    ?.copyWith(fontWeight: FontWeight.w900),
                              ),
                            ),
                          ],
                        ),
                      ),
                    if (!queryIsEmpty) ...[
                      Text(
                        'Search results',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              fontWeight: FontWeight.w900,
                            ),
                      ),
                      const SizedBox(height: 8),
                      if (state.isSearchingLocations)
                        _buildLoadingSearchState(context)
                      else if (state.locationSearchError != null)
                        _buildLocationSearchErrorState(
                          context,
                          state.locationSearchError!,
                        )
                      else if (state.hasPerformedLocationSearch &&
                          state.searchResults.isEmpty)
                        _buildNoSearchResultsState(context)
                      else
                        for (final location in state.searchResults)
                          _buildLocationTile(
                            context,
                            location,
                            isSelected:
                                location.id != null &&
                                location.id == selectedLocation?.id,
                            onTap: () {
                              ref
                                  .read(matchCreateTableProvider.notifier)
                                  .selectLocation(location);
                            },
                          ),
                      const SizedBox(height: 14),
                    ],
                    Text(
                      'Previously selected locations',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 8),
                    if (!state.hasLoadedRecentLocations)
                      _buildLoadingRecentState(context)
                    else if (state.recentLocations.isEmpty)
                      _buildNoRecentLocationsState(context)
                    else
                      for (final location in state.recentLocations)
                        _buildLocationTile(
                          context,
                          location,
                          isSelected:
                              location.id != null &&
                              location.id == selectedLocation?.id,
                          onTap: () {
                            ref
                                .read(matchCreateTableProvider.notifier)
                                .selectLocation(location);
                          },
                        ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 14),
                child: SizedBox(
                  width: double.infinity,
                  height: 58,
                  child: ElevatedButton(
                    onPressed: state.isCreatingTable ? null : _createTable,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorScheme.primary,
                      foregroundColor: colorScheme.onPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: state.isCreatingTable
                        ? SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.5,
                              color: colorScheme.onPrimary,
                            ),
                          )
                        : Text(
                            'Continue',
                            style: GoogleFonts.getFont(
                              'MedievalSharp',
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.7,
                              color: colorScheme.onPrimary,
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

  Widget _buildLocationTile(
    BuildContext context,
    Location location, {
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: isSelected
                    ? colorScheme.primary
                    : colorScheme.outlineVariant,
              ),
              color: isSelected
                  ? colorScheme.primaryContainer.withValues(alpha: 0.45)
                  : colorScheme.surface.withValues(alpha: 0.9),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.location_on_rounded,
                  color: isSelected
                      ? colorScheme.primary
                      : colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _locationTitle(location),
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        _locationSubtitle(location),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                if (isSelected)
                  Icon(
                    Icons.check_circle_rounded,
                    color: colorScheme.primary,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingSearchState(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        children: [
          const SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(strokeWidth: 2.5),
          ),
          const SizedBox(width: 10),
          Text(
            'Searching locations...',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLocationSearchErrorState(
    BuildContext context,
    RootHubException error,
  ) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: colorScheme.error.withValues(alpha: 0.5)),
        color: colorScheme.errorContainer.withValues(alpha: 0.42),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            error.title,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w900,
              color: colorScheme.onErrorContainer,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            error.description,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: colorScheme.onErrorContainer,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNoSearchResultsState(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: colorScheme.outlineVariant),
        color: colorScheme.surface.withValues(alpha: 0.9),
      ),
      child: Text(
        'No locations found for this query. Try another place name or area.',
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: colorScheme.onSurfaceVariant,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _buildLoadingRecentState(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        children: [
          const SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(strokeWidth: 2.5),
          ),
          const SizedBox(width: 10),
          Text(
            'Loading previous locations...',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNoRecentLocationsState(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: colorScheme.outlineVariant),
        color: colorScheme.surface.withValues(alpha: 0.9),
      ),
      child: Text(
        'No previous locations yet. Search and select one above.',
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: colorScheme.onSurfaceVariant,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  String _locationTitle(Location location) {
    final googlePlace = location.googlePlaceLocation;
    final manualLocation = location.manualInputLocation;

    return googlePlace?.name ?? manualLocation?.title ?? 'Unknown location';
  }

  String _locationSubtitle(Location location) {
    final googlePlace = location.googlePlaceLocation;
    final manualLocation = location.manualInputLocation;

    return googlePlace?.shortFormattedAddress ??
        googlePlace?.formattedAddress ??
        manualLocation?.cityName ??
        'Address unavailable';
  }
}
