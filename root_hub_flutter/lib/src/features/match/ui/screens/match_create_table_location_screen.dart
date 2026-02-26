import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:root_hub_flutter/src/core/navigation/app_routes.dart';
import 'package:root_hub_flutter/src/design_system/location_picker/location_search_picker_widget.dart';
import 'package:root_hub_flutter/src/design_system/default_error_snackbar.dart';
import 'package:root_hub_flutter/src/states/match/match_create_table_provider.dart';

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
        title: t
            .match
            .ui_screens_match_create_table_location_screen
            .locationRequired,
        description: t
            .match
            .ui_screens_match_create_table_location_screen
            .chooseOneLocationFromTheListBeforeCreatingTheTable,
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
                            .chooseTableLocation,
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
              Expanded(
                child: LocationSearchPickerWidget(
                  searchController: _searchController,
                  locationQuery: state.locationQuery,
                  isSearchingLocations: state.isSearchingLocations,
                  hasPerformedLocationSearch: state.hasPerformedLocationSearch,
                  searchResults: state.searchResults,
                  locationSearchError: state.locationSearchError,
                  hasLoadedRecentLocations: state.hasLoadedRecentLocations,
                  recentLocations: state.recentLocations,
                  selectedLocation: state.selectedLocation,
                  onLocationSelected: (location) {
                    ref
                        .read(matchCreateTableProvider.notifier)
                        .selectLocation(location);
                  },
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
                                .continueButton,
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
}
