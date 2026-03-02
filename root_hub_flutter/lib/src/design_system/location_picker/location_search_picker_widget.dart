import 'package:flutter/material.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';

class LocationSearchPickerWidget extends StatelessWidget {
  const LocationSearchPickerWidget({
    required this.searchController,
    required this.locationQuery,
    required this.isSearchingLocations,
    required this.hasPerformedLocationSearch,
    required this.searchResults,
    required this.locationSearchError,
    required this.hasLoadedRecentLocations,
    required this.recentLocations,
    required this.selectedLocation,
    required this.onLocationSelected,
    this.listPadding = const EdgeInsets.fromLTRB(16, 0, 16, 18),
    this.showInstructionText = true,
    this.listPhysics = const BouncingScrollPhysics(),
    super.key,
  });

  final TextEditingController searchController;
  final String locationQuery;
  final bool isSearchingLocations;
  final bool hasPerformedLocationSearch;
  final List<Location> searchResults;
  final RootHubException? locationSearchError;
  final bool hasLoadedRecentLocations;
  final List<Location> recentLocations;
  final Location? selectedLocation;
  final ValueChanged<Location> onLocationSelected;
  final EdgeInsetsGeometry listPadding;
  final bool showInstructionText;
  final ScrollPhysics listPhysics;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final queryIsEmpty = locationQuery.trim().isEmpty;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: TextField(
            controller: searchController,
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search_rounded),
              suffixIcon: searchController.text.trim().isEmpty
                  ? null
                  : IconButton(
                      onPressed: searchController.clear,
                      icon: const Icon(Icons.clear_rounded),
                    ),
              hintText: t
                  .match
                  .ui_screens_match_create_table_location_screen
                  .searchLocationGooglePlaces,
              filled: true,
              fillColor: colorScheme.surface.withValues(alpha: 0.94),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ),
        if (showInstructionText)
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
            child: Text(
              t
                  .match
                  .ui_screens_match_create_table_location_screen
                  .tapALocationToSelectItPreviouslySelectedLocationsAreSavedHereForFasterHo,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w700,
                height: 1.3,
              ),
            ),
          ),
        Expanded(
          child: ListView(
            physics: listPhysics,
            padding: listPadding,
            children: [
              if (selectedLocation != null)
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: colorScheme.primary),
                    color: colorScheme.primaryContainer.withValues(alpha: 0.45),
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
                          _locationTitle(selectedLocation!),
                          style:
                              Theme.of(
                                context,
                              ).textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w900,
                              ),
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
                      .searchResults,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 8),
                if (isSearchingLocations)
                  Padding(
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
                          t
                              .match
                              .ui_screens_match_create_table_location_loading_search_widget
                              .searchingLocations,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                fontWeight: FontWeight.w800,
                              ),
                        ),
                      ],
                    ),
                  )
                else if (locationSearchError != null)
                  Container(
                    padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: colorScheme.error.withValues(alpha: 0.5),
                      ),
                      color: colorScheme.errorContainer.withValues(alpha: 0.42),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          locationSearchError!.title,
                          style: Theme.of(context).textTheme.titleSmall
                              ?.copyWith(
                                fontWeight: FontWeight.w900,
                                color: colorScheme.onErrorContainer,
                              ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          locationSearchError!.description,
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                color: colorScheme.onErrorContainer,
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                      ],
                    ),
                  )
                else if (hasPerformedLocationSearch && searchResults.isEmpty)
                  Container(
                    padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: colorScheme.outlineVariant),
                      color: colorScheme.surface.withValues(alpha: 0.9),
                    ),
                    child: Text(
                      t
                          .match
                          .ui_screens_match_create_table_location_no_search_results_widget
                          .noLocationsFoundForThisQueryTryAnotherPlaceNameOrArea,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
                else
                  for (final location in searchResults)
                    _LocationSearchResultTileWidget(
                      title: _locationTitle(location),
                      subtitle: _locationSubtitle(location),
                      isSelected:
                          location.id != null &&
                          location.id == selectedLocation?.id,
                      onTap: () => onLocationSelected(location),
                    ),
                const SizedBox(height: 14),
              ],
              Text(
                t
                    .match
                    .ui_screens_match_create_table_location_screen
                    .previouslySelectedLocations,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 8),
              if (!hasLoadedRecentLocations)
                Padding(
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
                        t
                            .match
                            .ui_screens_match_create_table_location_loading_recent_widget
                            .loadingPreviousLocations,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                )
              else if (recentLocations.isEmpty)
                Container(
                  padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: colorScheme.outlineVariant),
                    color: colorScheme.surface.withValues(alpha: 0.9),
                  ),
                  child: Text(
                    t
                        .match
                        .ui_screens_match_create_table_location_no_recent_locations_widget
                        .noPreviousLocationsYetSearchAndSelectOneAbove,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )
              else
                for (final location in recentLocations)
                  _LocationSearchResultTileWidget(
                    title: _locationTitle(location),
                    subtitle: _locationSubtitle(location),
                    isSelected:
                        location.id != null &&
                        location.id == selectedLocation?.id,
                    onTap: () => onLocationSelected(location),
                  ),
            ],
          ),
        ),
      ],
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

class _LocationSearchResultTileWidget extends StatelessWidget {
  const _LocationSearchResultTileWidget({
    required this.title,
    required this.subtitle,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
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
                        title,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        subtitle,
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
}
