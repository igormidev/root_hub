import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';
import 'package:root_hub_flutter/src/core/match_share/match_share_link_builder.dart';
import 'package:root_hub_flutter/src/core/navigation/app_routes.dart';
import 'package:root_hub_flutter/src/design_system/default_error_snackbar.dart';
import 'package:root_hub_flutter/src/features/match/ui/dialogs/match_location_info_dialog.dart';
import 'package:root_hub_flutter/src/features/match/ui/screens/match_initial_loading_state_widget.dart';
import 'package:root_hub_flutter/src/features/match/ui/screens/match_join_sheet_content_widget.dart';
import 'package:root_hub_flutter/src/features/match/ui/screens/match_join_sheet_error_widget.dart';
import 'package:root_hub_flutter/src/features/match/ui/screens/match_join_sheet_loading_widget.dart';
import 'package:root_hub_flutter/src/features/match/ui/screens/match_loading_error_state_widget.dart';
import 'package:root_hub_flutter/src/features/match/ui/screens/match_nearby_header_widget.dart';
import 'package:root_hub_flutter/src/features/match/ui/screens/match_no_matches_state_widget.dart';
import 'package:root_hub_flutter/src/features/match/ui/screens/match_table_card_widget.dart';
import 'package:root_hub_flutter/src/features/match/ui/sheets/match_share_sheet.dart';
import 'package:root_hub_flutter/src/features/register_match/ui/sheets/register_match_picker_sheet.dart';
import 'package:root_hub_flutter/src/global_providers/session_provider.dart';
import 'package:root_hub_flutter/src/states/auth_flow/auth_flow_provider.dart';
import 'package:root_hub_flutter/src/states/auth_flow/auth_flow_state.dart';
import 'package:root_hub_flutter/src/states/deep_link/deep_link_provider.dart';
import 'package:root_hub_flutter/src/states/match/match_create_table_provider.dart';
import 'package:root_hub_flutter/src/states/match/match_tables_provider.dart';
import 'package:root_hub_flutter/src/states/register_match/register_match_provider.dart';

class MatchScreen extends ConsumerStatefulWidget {
  const MatchScreen({
    super.key,
  });

  @override
  ConsumerState<MatchScreen> createState() => _MatchScreenState();
}

class _MatchScreenState extends ConsumerState<MatchScreen> {
  late DateTime _currentTime;
  Timer? _countdownTimer;
  int? _openingDeepLinkedMatchId;

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

      ref.read(matchTablesProvider.notifier).ensureLoaded();
      ref
          .read(registerMatchProvider.notifier)
          .ensurePendingMatchesCountLoaded();
      ref.read(registerMatchProvider.notifier).ensurePendingMatchesLoaded();
    });
  }

  @override
  void dispose() {
    _countdownTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final matchState = ref.watch(matchTablesProvider);
    final registerMatchState = ref.watch(registerMatchProvider);
    final authFlowState = ref.watch(authFlowProvider);
    final currentPlayer = authFlowState.maybeWhen(
      authenticated: (playerData) => playerData,
      orElse: () => null,
    );
    final pendingSubscribedMatchIds = _buildPendingSubscribedMatchIds(
      registerMatchState.pendingMatches,
      currentPlayerId: currentPlayer?.id,
    );
    final reportablePendingMatchIds = _buildReportablePendingMatchIds(
      registerMatchState.pendingMatches,
      currentPlayerId: currentPlayer?.id,
    );
    final pendingDeepLinkedMatchId = ref.watch(
      deepLinkProvider.select((value) => value.pendingMatchId),
    );
    final reportablePendingMatchesCount = reportablePendingMatchIds.length;
    final hasPendingMatches = pendingSubscribedMatchIds.isNotEmpty;

    if (pendingDeepLinkedMatchId != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) {
          return;
        }
        unawaited(
          _handlePendingDeepLinkedMatch(pendingDeepLinkedMatchId),
        );
      });
    }

    return Stack(
      children: [
        RefreshIndicator(
          onRefresh: _refreshMatchScreenData,
          child: ListView(
            physics: AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics(),
            ),
            padding: EdgeInsets.fromLTRB(16, 4, 16, 180),
            children: [
              MatchNearbyHeaderWidget(
                playerData: currentPlayer,
              ),
              SizedBox(height: 12),
              if (matchState.isLoading && !matchState.hasLoadedOnce)
                MatchInitialLoadingStateWidget()
              else if (matchState.loadError != null &&
                  matchState.tables.isEmpty)
                MatchLoadingErrorStateWidget(
                  error: matchState.loadError!,
                  onRetry: () {
                    ref.read(matchTablesProvider.notifier).refresh();
                  },
                )
              else if (matchState.tables.isEmpty)
                MatchNoMatchesStateWidget(
                  onHostFirstTable: () {
                    ref.read(matchCreateTableProvider.notifier).startNewFlow();
                    context.push(dashboardMatchCreatePath);
                  },
                )
              else ...[
                for (final table in matchState.tables)
                  Padding(
                    padding: EdgeInsets.only(bottom: 12),
                    child: MatchTableCardWidget(
                      table: table,
                      currentPlayer: currentPlayer,
                      isSubscribing: matchState.subscribingTableIds.contains(
                        table.id,
                      ),
                      canReportResultNow:
                          table.id != null &&
                          reportablePendingMatchIds.contains(table.id),
                      currentTime: _currentTime,
                      distanceLabel: _distanceLabel(
                        currentPlayer,
                        table.location?.googlePlaceLocation,
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
                          }) async {
                            await _openJoinTableBottomSheet(
                              context,
                              tableId: tableId,
                              fallbackTable: fallbackTable,
                              currentPlayer: currentPlayer,
                            );
                          },
                      onOpenSubscribedChat: (tableId, tableTitle) {
                        context.push(
                          dashboardMatchChatPathForMatch(tableId),
                          extra: tableTitle,
                        );
                      },
                      onShareTable: (tableToShare) async {
                        await _openShareSheet(tableToShare);
                      },
                    ),
                  ),
              ],
            ],
          ),
        ),
        if (hasPendingMatches)
          Positioned(
            left: 16,
            bottom: 124,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                FloatingActionButton.extended(
                  heroTag: 'register-match-fab',
                  onPressed: _openRegisterMatchFlow,
                  icon: Icon(Icons.emoji_events_rounded),
                  label: Text(
                    t.match.ui_screens_match_screen.reportResult,
                    style: GoogleFonts.nunitoSans(
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.2,
                    ),
                  ),
                  backgroundColor: colorScheme.primary,
                  foregroundColor: colorScheme.onPrimary,
                  elevation: 1,
                ),
                if (reportablePendingMatchesCount > 0)
                  Positioned(
                    right: -6,
                    top: -6,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: colorScheme.error,
                        borderRadius: BorderRadius.circular(999),
                      ),
                      constraints: BoxConstraints(minWidth: 22),
                      child: Text(
                        '$reportablePendingMatchesCount',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: colorScheme.onError,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        Positioned(
          right: 16,
          bottom: 124,
          child: FloatingActionButton.extended(
            heroTag: 'host-match-fab',
            onPressed: () {
              ref.read(matchCreateTableProvider.notifier).startNewFlow();
              context.push(dashboardMatchCreatePath);
            },
            icon: Icon(Icons.campaign_rounded),
            label: Text(
              t.match.ui_screens_match_screen.hostTable,
              style: GoogleFonts.nunitoSans(
                fontWeight: FontWeight.w800,
                letterSpacing: 0.2,
              ),
            ),
            backgroundColor: colorScheme.primary,
            foregroundColor: colorScheme.onPrimary,
            elevation: 1,
          ),
        ),
      ],
    );
  }

  Future<void> _openRegisterMatchFlow() async {
    final platform = Theme.of(context).platform;
    bool? submitted;

    if (platform == TargetPlatform.iOS) {
      submitted = await showCupertinoModalPopup<bool>(
        context: context,
        builder: (sheetContext) {
          return RegisterMatchPickerSheet();
        },
      );
    } else {
      submitted = await showModalBottomSheet<bool>(
        context: context,
        isScrollControlled: true,
        useSafeArea: true,
        backgroundColor: Colors.transparent,
        builder: (sheetContext) {
          return RegisterMatchPickerSheet();
        },
      );
    }

    if (!mounted) {
      return;
    }

    await ref
        .read(registerMatchProvider.notifier)
        .refreshPendingMatchesOverview();

    if (submitted == true) {
      await ref
          .read(matchTablesProvider.notifier)
          .loadTablesInArea(showLoadingIndicator: false);
    }
  }

  Future<void> _refreshMatchScreenData() async {
    await Future.wait<dynamic>([
      ref.read(matchTablesProvider.notifier).refresh(),
      ref.read(registerMatchProvider.notifier).refreshPendingMatchesOverview(),
    ]);
  }

  Future<void> _handlePendingDeepLinkedMatch(int matchId) async {
    if (_openingDeepLinkedMatchId == matchId) {
      return;
    }

    final currentPlayer = ref
        .read(authFlowProvider)
        .maybeWhen(
          authenticated: (playerData) => playerData,
          orElse: () => null,
        );
    if (currentPlayer == null || matchId <= 0) {
      return;
    }

    _openingDeepLinkedMatchId = matchId;

    try {
      final tableInfo = await ref
          .read(matchTablesProvider.notifier)
          .getTableDetails(matchId);
      if (!mounted) {
        return;
      }

      await _openJoinTableBottomSheet(
        context,
        tableId: matchId,
        fallbackTable: tableInfo.matchSchedule,
        currentPlayer: currentPlayer,
      );

      if (!mounted) {
        return;
      }
      ref.read(deepLinkProvider.notifier).consumePendingMatchId(matchId);
    } on RootHubException catch (error) {
      if (!mounted) {
        return;
      }
      await showErrorDialog(
        context,
        title: error.title,
        description: error.description,
      );
      if (!mounted) {
        return;
      }
      ref.read(deepLinkProvider.notifier).consumePendingMatchId(matchId);
    } catch (_) {
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            t.match.ui_screens_match_screen.unableToOpenSharedMatch,
          ),
        ),
      );
      ref.read(deepLinkProvider.notifier).consumePendingMatchId(matchId);
    } finally {
      _openingDeepLinkedMatchId = null;
    }
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

  Set<int> _buildReportablePendingMatchIds(
    List<MatchSchedulePairingAttempt> pendingMatches, {
    required int? currentPlayerId,
  }) {
    if (currentPlayerId == null) {
      return <int>{};
    }

    final now = DateTime.now();

    return pendingMatches
        .where(
          (match) =>
              _isCurrentPlayerSubscribed(
                match,
                currentPlayerId: currentPlayerId,
              ) &&
              _canReportMatchResultNow(match, now: now),
        )
        .map((match) => match.id)
        .whereType<int>()
        .toSet();
  }

  Set<int> _buildPendingSubscribedMatchIds(
    List<MatchSchedulePairingAttempt> pendingMatches, {
    required int? currentPlayerId,
  }) {
    if (currentPlayerId == null) {
      return <int>{};
    }

    return pendingMatches
        .where(
          (match) => _isCurrentPlayerSubscribed(
            match,
            currentPlayerId: currentPlayerId,
          ),
        )
        .map((match) => match.id)
        .whereType<int>()
        .toSet();
  }

  bool _canReportMatchResultNow(
    MatchSchedulePairingAttempt match, {
    required DateTime now,
  }) {
    final earliestAllowedRegistrationTime = match.attemptedAt.subtract(
      Duration(hours: 2),
    );

    return !now.isBefore(earliestAllowedRegistrationTime);
  }

  bool _isCurrentPlayerSubscribed(
    MatchSchedulePairingAttempt match, {
    required int currentPlayerId,
  }) {
    final subscriptions = match.subscriptions ?? <MatchSubscription>[];

    return subscriptions.any((entry) => entry.playerDataId == currentPlayerId);
  }

  Future<void> _openJoinTableBottomSheet(
    BuildContext context, {
    required int? tableId,
    required MatchSchedulePairingAttempt fallbackTable,
    required PlayerData? currentPlayer,
  }) async {
    if (tableId == null) {
      return;
    }

    Future<MatchScheduleInfo> detailsFuture = ref
        .read(matchTablesProvider.notifier)
        .getTableDetails(tableId);

    final shouldSubscribe = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) {
        return FractionallySizedBox(
          heightFactor: 0.8,
          child: StatefulBuilder(
            builder: (sheetContext, setModalState) {
              return Container(
                decoration: BoxDecoration(
                  color: Theme.of(sheetContext).colorScheme.surface,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(28),
                  ),
                ),
                clipBehavior: Clip.antiAlias,
                child: FutureBuilder<MatchScheduleInfo>(
                  future: detailsFuture,
                  builder: (sheetContext, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return MatchJoinSheetLoadingWidget(
                        fallbackTable: fallbackTable,
                      );
                    }

                    if (snapshot.hasError) {
                      final error = snapshot.error is RootHubException
                          ? snapshot.error! as RootHubException
                          : defaultException;

                      return MatchJoinSheetErrorWidget(
                        error: error,
                        onRetry: () {
                          setModalState(() {
                            detailsFuture = ref
                                .read(matchTablesProvider.notifier)
                                .getTableDetails(
                                  tableId,
                                  forceRefresh: true,
                                );
                          });
                        },
                      );
                    }

                    final detailedTable = snapshot.data;
                    return MatchJoinSheetContentWidget(
                      tableId: tableId,
                      tableInfo: detailedTable,
                      currentPlayer: currentPlayer,
                      fallbackTable: fallbackTable,
                      onOpenChat: () {
                        if (!mounted) {
                          return;
                        }

                        final tableTitle =
                            (detailedTable?.matchSchedule ?? fallbackTable)
                                .title;
                        this.context.push(
                          dashboardMatchChatPathForMatch(tableId),
                          extra: tableTitle,
                        );
                      },
                      onOpenLocationInfo:
                          (
                            location,
                            locationAdditionalInfo,
                          ) {
                            _showLocationInfoDialog(
                              sheetContext,
                              location: location,
                              locationAdditionalInfo: locationAdditionalInfo,
                            );
                          },
                    );
                  },
                ),
              );
            },
          ),
        );
      },
    );

    if (shouldSubscribe != true || !mounted) {
      return;
    }

    final error = await ref
        .read(matchTablesProvider.notifier)
        .subscribeToTable(
          tableId,
        );
    if (!mounted || error == null) {
      return;
    }

    await showErrorDialog(
      this.context,
      title: error.title,
      description: error.description,
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
    final earthRadiusKm = 6371.0;

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
