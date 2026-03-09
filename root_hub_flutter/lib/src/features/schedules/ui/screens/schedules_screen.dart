import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';
import 'package:root_hub_flutter/src/core/match_share/match_share_link_builder.dart';
import 'package:root_hub_flutter/src/core/navigation/app_routes.dart';
import 'package:root_hub_flutter/src/features/match/ui/dialogs/match_location_info_dialog.dart';
import 'package:root_hub_flutter/src/features/match/ui/screens/match_table_card_widget.dart';
import 'package:root_hub_flutter/src/features/match/ui/sheets/match_share_sheet.dart';
import 'package:root_hub_flutter/src/global_providers/session_provider.dart';
import 'package:root_hub_flutter/src/states/activity/activity_provider.dart';
import 'package:root_hub_flutter/src/states/auth_flow/auth_flow_provider.dart';
import 'package:root_hub_flutter/src/states/auth_flow/auth_flow_state.dart';

class SchedulesScreen extends ConsumerStatefulWidget {
  const SchedulesScreen({
    super.key,
  });

  @override
  ConsumerState<SchedulesScreen> createState() => _SchedulesScreenState();
}

class _SchedulesScreenState extends ConsumerState<SchedulesScreen> {
  late DateTime _currentTime;
  Timer? _countdownTimer;

  @override
  void initState() {
    super.initState();
    _currentTime = DateTime.now();
    _countdownTimer = Timer.periodic(
      Duration(seconds: 1),
      (_) {
        if (!mounted) {
          return;
        }

        setState(() {
          _currentTime = DateTime.now();
        });
      },
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }

      ref.read(activityProvider.notifier).ensureLoaded();
      ref.read(activityProvider.notifier).ensureUnreadCountLoaded();
    });
  }

  @override
  void dispose() {
    _countdownTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final activityState = ref.watch(activityProvider);
    final authFlowState = ref.watch(authFlowProvider);
    final currentPlayer = authFlowState.maybeWhen(
      authenticated: (playerData) => playerData,
      orElse: () => null,
    );
    final schedules = activityState.subscribedActiveSchedules;
    final loadError = activityState.loadError;

    if (activityState.isLoading &&
        !activityState.hasLoadedOnce &&
        schedules.isEmpty) {
      return Center(
        child: SizedBox(
          width: 32,
          height: 32,
          child: CircularProgressIndicator(strokeWidth: 3),
        ),
      );
    }

    if (loadError != null && schedules.isEmpty) {
      return Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                loadError.title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: 8),
              Text(
                loadError.description,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 18),
              FilledButton(
                onPressed: () {
                  ref.read(activityProvider.notifier).refresh();
                },
                child: Text(
                  t.match.ui_sheets_match_table_info_error_widget.retry,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () => ref.read(activityProvider.notifier).refresh(),
      child: ListView(
        physics: AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        padding: EdgeInsets.fromLTRB(16, 12, 16, 130),
        children: [
          Text(
            t.activity.ui_screens_activity_screen.myScheduledTablesTitle,
            style: GoogleFonts.cinzel(
              fontSize: 34,
              fontWeight: FontWeight.w700,
              height: 1.02,
            ),
          ),
          SizedBox(height: 8),
          Text(
            t
                .activity
                .ui_screens_activity_screen
                .tablesYouSubscribedToThatAreStillWithinTheActiveWindow,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w700,
              height: 1.35,
            ),
          ),
          SizedBox(height: 18),
          if (schedules.isEmpty)
            Container(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Theme.of(context).colorScheme.outlineVariant,
                ),
                color: Theme.of(context).colorScheme.surface.withValues(
                  alpha: 0.88,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    t.activity.ui_screens_activity_screen.noActiveSchedules,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    t
                        .activity
                        .ui_screens_activity_screen
                        .whenYouJoinATableItWillAppearHereAsASwipeableCard,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            )
          else
            for (final schedule in schedules)
              if (schedule.id != null)
                Padding(
                  padding: EdgeInsets.only(bottom: 12),
                  child: MatchTableCardWidget(
                    table: schedule,
                    currentPlayer: currentPlayer,
                    isSubscribing: false,
                    canReportResultNow: false,
                    currentTime: _currentTime,
                    distanceLabel: _distanceLabel(
                      currentPlayer,
                      schedule.location?.googlePlaceLocation,
                    ),
                    formatDurationToClock: _formatDurationToClock,
                    onOpenLocationInfo:
                        (
                          location,
                          locationAdditionalInfo,
                        ) {
                          _showLocationInfoDialog(
                            context,
                            location: location,
                            locationAdditionalInfo: locationAdditionalInfo,
                          );
                        },
                    onOpenJoinTable:
                        ({
                          required tableId,
                          required fallbackTable,
                          required currentPlayer,
                        }) async {},
                    onOpenSubscribedChat: (tableId, tableTitle) {
                      _openChat(tableId, tableTitle);
                    },
                    onShareTable: _openShareSheet,
                  ),
                ),
          if (loadError != null) ...[
            SizedBox(height: 8),
            Text(
              '${loadError.title}: ${loadError.description}',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.error,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Future<void> _openChat(int scheduledMatchId, String matchTitle) async {
    await context.push(
      dashboardMatchChatPathForMatch(scheduledMatchId),
      extra: matchTitle,
    );

    if (!mounted) {
      return;
    }

    await ref.read(activityProvider.notifier).refresh();
  }

  Future<void> _openShareSheet(MatchSchedulePairingAttempt table) async {
    final tableId = table.id;
    if (tableId == null || tableId <= 0) {
      if (!mounted) {
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            t.match.ui_screens_match_screen.unableToShareThisMatch,
          ),
        ),
      );
      return;
    }

    final localizations = MaterialLocalizations.of(context);
    final attemptedAtLocal = table.attemptedAt.toLocal();
    final dayLabel = localizations.formatMediumDate(attemptedAtLocal);
    final hourLabel = localizations.formatTimeOfDay(
      TimeOfDay.fromDateTime(attemptedAtLocal),
    );

    final location = table.location;
    final locationName =
        location?.googlePlaceLocation?.name ??
        location?.manualInputLocation?.title ??
        t.match.ui_screens_match_table_card_widget.unknownLocation;

    final shareLink = MatchShareLinkBuilder.buildLandingUri(
      serverHost: ref.read(clientProvider).host,
      matchId: tableId,
      location: locationName,
      day: dayLabel,
      hour: hourLabel,
    );

    final shareMessage = t.match.ui_screens_match_screen.shareMessage(
      location: locationName,
      hour: hourLabel,
      day: dayLabel,
      link: shareLink.toString(),
    );

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: false,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return MatchShareSheet(
          rawLink: shareLink,
          shareMessage: shareMessage,
        );
      },
    );
  }

  Future<void> _showLocationInfoDialog(
    BuildContext context, {
    required Location? location,
    String? locationAdditionalInfo,
  }) async {
    await MatchLocationInfoDialog.show(
      context,
      location: location,
      locationAdditionalInfo: locationAdditionalInfo,
    );
  }

  String _formatDurationToClock(Duration duration) {
    final clampedDuration = duration.inSeconds <= 0 ? Duration.zero : duration;
    final totalSeconds = clampedDuration.inSeconds;
    final days = totalSeconds ~/ Duration.secondsPerDay;
    final hours = (totalSeconds % Duration.secondsPerDay) ~/ 3600;
    final minutes = (totalSeconds % 3600) ~/ 60;
    final seconds = totalSeconds % 60;

    final timeLabel =
        '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';

    if (days > 0) {
      return '${days}d, $timeLabel';
    }

    return timeLabel;
  }

  String? _distanceLabel(
    PlayerData? playerData,
    GooglePlaceLocation? place,
  ) {
    final playerLocation = playerData?.currentLocation;
    final playerLat = playerLocation?.x;
    final playerLng = playerLocation?.y;
    if (playerLat == null || playerLng == null || place == null) {
      return null;
    }

    final distance = _haversineDistanceKm(
      latitudeA: playerLat,
      longitudeA: playerLng,
      latitudeB: place.lat,
      longitudeB: place.lng,
    );

    if (distance.isNaN || distance.isInfinite) {
      return null;
    }

    if (distance < 1) {
      return '<1 km away';
    }

    return '${distance.toStringAsFixed(1)} km away';
  }

  double _haversineDistanceKm({
    required double latitudeA,
    required double longitudeA,
    required double latitudeB,
    required double longitudeB,
  }) {
    const earthRadiusKm = 6371.0;

    final latitudeDelta = _degreesToRadians(latitudeB - latitudeA);
    final longitudeDelta = _degreesToRadians(longitudeB - longitudeA);
    final latitudeARadians = _degreesToRadians(latitudeA);
    final latitudeBRadians = _degreesToRadians(latitudeB);

    final haversineValue =
        math.pow(math.sin(latitudeDelta / 2), 2) +
        math.cos(latitudeARadians) *
            math.cos(latitudeBRadians) *
            math.pow(math.sin(longitudeDelta / 2), 2);

    final angularDistance =
        2 *
        math.atan2(
          math.sqrt(haversineValue),
          math.sqrt(1 - haversineValue),
        );

    return earthRadiusKm * angularDistance;
  }

  double _degreesToRadians(double degrees) {
    return degrees * (math.pi / 180.0);
  }
}
