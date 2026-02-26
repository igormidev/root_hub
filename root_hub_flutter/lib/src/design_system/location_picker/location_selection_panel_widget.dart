import 'package:flutter/material.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';

class LocationSelectionPanelWidget extends StatelessWidget {
  const LocationSelectionPanelWidget({
    required this.currentLocation,
    required this.currentLocationCityName,
    required this.currentLocationShortAddress,
    required this.isResolvingLocation,
    required this.isResolvingLocationLabel,
    required this.onUseCurrentLocation,
    required this.onSearchLocation,
    required this.onUnselectLocation,
    required this.statusMessage,
    required this.statusIsError,
    this.onDecreaseRatio,
    this.onIncreaseRatio,
    this.enabled = true,
    super.key,
  });

  final GeoLocation? currentLocation;
  final String? currentLocationCityName;
  final String? currentLocationShortAddress;
  final bool isResolvingLocation;
  final bool isResolvingLocationLabel;
  final VoidCallback onUseCurrentLocation;
  final VoidCallback onSearchLocation;
  final VoidCallback onUnselectLocation;
  final String? statusMessage;
  final bool statusIsError;
  final VoidCallback? onDecreaseRatio;
  final VoidCallback? onIncreaseRatio;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final location = currentLocation;
    final hasLocation = location != null;
    final normalizedCity = currentLocationCityName?.trim();
    final normalizedAddress = currentLocationShortAddress?.trim();
    final hasCity = normalizedCity != null && normalizedCity.isNotEmpty;
    final areaLine = hasCity
        ? normalizedCity
        : normalizedAddress != null && normalizedAddress.isNotEmpty
        ? normalizedAddress
        : null;

    return Column(
      children: [
        if (!hasLocation) ...[
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: !enabled || isResolvingLocation
                  ? null
                  : onUseCurrentLocation,
              child: Ink(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: colorScheme.outlineVariant),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      colorScheme.primaryContainer.withValues(alpha: 0.35),
                      colorScheme.surface.withValues(alpha: 0.93),
                    ],
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colorScheme.primary.withValues(alpha: 0.12),
                      ),
                      child: Center(
                        child: isResolvingLocation
                            ? SizedBox(
                                width: 22,
                                height: 22,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2.4,
                                  color: colorScheme.primary,
                                ),
                              )
                            : Icon(
                                Icons.my_location_rounded,
                                color: colorScheme.primary,
                                size: 26,
                              ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            t
                                .auth
                                .auth_onboarding_profile_screen
                                .useMyCurrentDeviceLocation,
                            style: Theme.of(context).textTheme.titleSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.w900,
                                ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            isResolvingLocation
                                ? t
                                      .auth
                                      .auth_onboarding_profile_screen
                                      .capturingCoordinates
                                : t
                                      .auth
                                      .auth_onboarding_profile_screen
                                      .instantlyUseYourPhonesGpsCoordinates,
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                  fontWeight: FontWeight.w700,
                                  height: 1.3,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: enabled ? onSearchLocation : null,
              child: Ink(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: colorScheme.outlineVariant),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      colorScheme.tertiaryContainer.withValues(alpha: 0.33),
                      colorScheme.surface.withValues(alpha: 0.93),
                    ],
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colorScheme.tertiary.withValues(alpha: 0.14),
                      ),
                      child: Icon(
                        Icons.travel_explore_rounded,
                        color: colorScheme.tertiary,
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            t
                                .auth
                                .auth_onboarding_profile_screen
                                .searchForATableLocation,
                            style: Theme.of(context).textTheme.titleSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.w900,
                                ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            t
                                .auth
                                .auth_onboarding_profile_screen
                                .openTheSearchAndSelectAnyPlaceYouPrefer,
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                  fontWeight: FontWeight.w700,
                                  height: 1.3,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
        if (hasLocation) ...[
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: colorScheme.outlineVariant),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  colorScheme.primaryContainer.withValues(alpha: 0.42),
                  colorScheme.surface.withValues(alpha: 0.96),
                ],
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: colorScheme.primary.withValues(alpha: 0.14),
                  ),
                  child: Icon(
                    Icons.location_city_rounded,
                    color: colorScheme.primary,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        t.auth.auth_onboarding_profile_screen.yourPlayArea,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        isResolvingLocationLabel
                            ? t
                                  .auth
                                  .auth_onboarding_profile_screen
                                  .findingCityName
                            : areaLine ??
                                  t
                                      .auth
                                      .auth_onboarding_profile_screen
                                      .selectedArea,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              fontWeight: FontWeight.w900,
                            ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        hasCity
                            ? t.auth.auth_onboarding_profile_screen
                                  .weWillShowMatchesNear(city: areaLine!)
                            : t
                                  .auth
                                  .auth_onboarding_profile_screen
                                  .weWillShowMatchesNearTheSelectedArea,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          fontWeight: FontWeight.w700,
                          height: 1.3,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: colorScheme.outlineVariant),
                    color: colorScheme.surface.withValues(alpha: 0.94),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        t
                            .dashboard
                            .ui_widgets_dashboard_profile_drawer_widget
                            .xLabel,
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontWeight: FontWeight.w900,
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        location.x.toStringAsFixed(6),
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              fontWeight: FontWeight.w900,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: colorScheme.outlineVariant),
                    color: colorScheme.surface.withValues(alpha: 0.94),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        t
                            .dashboard
                            .ui_widgets_dashboard_profile_drawer_widget
                            .yLabel,
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontWeight: FontWeight.w900,
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        location.y.toStringAsFixed(6),
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              fontWeight: FontWeight.w900,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton.icon(
              onPressed: enabled ? onUnselectLocation : null,
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
              icon: const Icon(
                Icons.edit_location_alt_rounded,
                size: 18,
              ),
              label: Text(
                t.auth.auth_onboarding_profile_screen.changeLocation,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ],
        if (statusMessage != null) ...[
          const SizedBox(height: 10),
          Text(
            statusMessage!,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: statusIsError ? colorScheme.error : colorScheme.primary,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
        if (hasLocation) ...[
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              t.auth.auth_onboarding_profile_screen.searchAreaRadius,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              t
                  .auth
                  .auth_onboarding_profile_screen
                  .howFarShouldWeSearchForNearbyPlayersAroundYou,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w700,
                height: 1.35,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: colorScheme.outlineVariant),
              color: colorScheme.surface.withValues(alpha: 0.92),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton.filledTonal(
                      onPressed: enabled ? onDecreaseRatio : null,
                      icon: const Icon(Icons.remove_rounded),
                    ),
                    Expanded(
                      child: Text(
                        '${location.ratio.toStringAsFixed(0)} ${t.auth.auth_onboarding_profile_screen.kilometersUnit}',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(fontWeight: FontWeight.w900),
                      ),
                    ),
                    IconButton.filledTonal(
                      onPressed: enabled ? onIncreaseRatio : null,
                      icon: const Icon(Icons.add_rounded),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    t
                        .auth
                        .auth_onboarding_profile_screen
                        .value25KmIsTheRecommendedStartingPoint,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}
