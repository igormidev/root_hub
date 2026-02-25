import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/core/navigation/app_routes.dart';
import 'package:root_hub_flutter/src/design_system/default_error_snackbar.dart';
import 'package:root_hub_flutter/src/states/match/match_create_table_provider.dart';

import 'match_create_table_location_list_tile_widget.dart';
import 'match_create_table_location_loading_recent_widget.dart';
import 'match_create_table_location_loading_search_widget.dart';
import 'match_create_table_location_no_recent_locations_widget.dart';
import 'match_create_table_location_no_search_results_widget.dart';
import 'match_create_table_location_search_error_widget.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';

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
        title: t.match.ui_screens_match_create_table_location_screen.l59c16,
        description:
            t.match.ui_screens_match_create_table_location_screen.l61c13,
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
            center: Alignment(0, -1.1),
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
                padding: EdgeInsets.fromLTRB(16, 8, 16, 10),
                child: Row(
                  children: [
                    IconButton.filledTonal(
                      onPressed: () {
                        context.pop();
                      },
                      icon: Icon(Icons.arrow_back_rounded),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        t
                            .match
                            .ui_screens_match_create_table_location_screen
                            .l122c25,
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
                padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
                child: TextField(
                  controller: _searchController,
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search_rounded),
                    suffixIcon: _searchController.text.trim().isEmpty
                        ? null
                        : IconButton(
                            onPressed: () {
                              _searchController.clear();
                            },
                            icon: Icon(Icons.clear_rounded),
                          ),
                    hintText: t
                        .match
                        .ui_screens_match_create_table_location_screen
                        .l148c31,
                    filled: true,
                    fillColor: colorScheme.surface.withValues(alpha: 0.94),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 10),
                child: Text(
                  t.match.ui_screens_match_create_table_location_screen.l160c19,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w700,
                    height: 1.3,
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 18),
                  children: [
                    if (selectedLocation != null)
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        padding: EdgeInsets.fromLTRB(12, 10, 12, 10),
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
                            SizedBox(width: 8),
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
                        t
                            .match
                            .ui_screens_match_create_table_location_screen
                            .l203c25,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              fontWeight: FontWeight.w900,
                            ),
                      ),
                      SizedBox(height: 8),
                      if (state.isSearchingLocations)
                        MatchCreateTableLocationLoadingSearchWidget()
                      else if (state.locationSearchError != null)
                        MatchCreateTableLocationSearchErrorWidget(
                          error: state.locationSearchError!,
                        )
                      else if (state.hasPerformedLocationSearch &&
                          state.searchResults.isEmpty)
                        MatchCreateTableLocationNoSearchResultsWidget()
                      else
                        for (final location in state.searchResults)
                          MatchCreateTableLocationListTileWidget(
                            title: _locationTitle(location),
                            subtitle: _locationSubtitle(location),
                            isSelected:
                                location.id != null &&
                                location.id == selectedLocation?.id,
                            onTap: () {
                              ref
                                  .read(matchCreateTableProvider.notifier)
                                  .selectLocation(location);
                            },
                          ),
                      SizedBox(height: 14),
                    ],
                    Text(
                      t
                          .match
                          .ui_screens_match_create_table_location_screen
                          .l236c23,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: 8),
                    if (!state.hasLoadedRecentLocations)
                      MatchCreateTableLocationLoadingRecentWidget()
                    else if (state.recentLocations.isEmpty)
                      MatchCreateTableLocationNoRecentLocationsWidget()
                    else
                      for (final location in state.recentLocations)
                        MatchCreateTableLocationListTileWidget(
                          title: _locationTitle(location),
                          subtitle: _locationSubtitle(location),
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
                padding: EdgeInsets.fromLTRB(16, 8, 16, 14),
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
                            t
                                .match
                                .ui_screens_match_create_table_location_screen
                                .l287c29,
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
