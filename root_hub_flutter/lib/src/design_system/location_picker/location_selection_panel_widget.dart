import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';

class LocationSelectionPanelWidget extends StatelessWidget {
  const LocationSelectionPanelWidget({
    required this.currentLocation,
    required this.isResolvingLocation,
    required this.onUseCurrentLocation,
    required this.onSearchLocation,
    required this.statusMessage,
    required this.statusIsError,
    this.onDecreaseRatio,
    this.onIncreaseRatio,
    this.enabled = true,
    this.showWarning = true,
    super.key,
  });

  final GeoLocation? currentLocation;
  final bool isResolvingLocation;
  final VoidCallback onUseCurrentLocation;
  final VoidCallback onSearchLocation;
  final String? statusMessage;
  final bool statusIsError;
  final VoidCallback? onDecreaseRatio;
  final VoidCallback? onIncreaseRatio;
  final bool enabled;
  final bool showWarning;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final location = currentLocation;

    return Column(
      children: [
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
        const SizedBox(height: 12),
        if (location != null)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: colorScheme.outlineVariant),
              color: colorScheme.surface.withValues(alpha: 0.93),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  t.auth.auth_onboarding_profile_screen.selectedCoordinates,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  '${t.dashboard.ui_widgets_dashboard_profile_drawer_widget.xLabel}: ${location.x.toStringAsFixed(6)}',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '${t.dashboard.ui_widgets_dashboard_profile_drawer_widget.yLabel}: ${location.y.toStringAsFixed(6)}',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        if (location != null) ...[
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
        if (showWarning) ...[
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: const Color(0xFFFFB300).withValues(alpha: 0.75),
              ),
              color: const Color(0xFFFFF5D9).withValues(alpha: 0.6),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.warning_amber_rounded,
                  color: Color(0xFFE07A00),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    t
                        .auth
                        .auth_onboarding_profile_screen
                        .disableVpnOrProxyBeforeCapturingLocationWrongCoordinatesMayHideNearby,
                    style: GoogleFonts.nunitoSans(
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF8A4E00),
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
