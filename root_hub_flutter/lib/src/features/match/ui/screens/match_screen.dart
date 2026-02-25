import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/core/navigation/app_routes.dart';
import 'package:root_hub_flutter/src/design_system/default_error_snackbar.dart';
import 'package:root_hub_flutter/src/features/match/ui/screens/match_actionable_info_row_widget.dart';
import 'package:root_hub_flutter/src/features/match/ui/screens/match_initial_loading_state_widget.dart';
import 'package:root_hub_flutter/src/features/match/ui/screens/match_join_sheet_content_widget.dart';
import 'package:root_hub_flutter/src/features/match/ui/screens/match_join_sheet_error_widget.dart';
import 'package:root_hub_flutter/src/features/match/ui/screens/match_join_sheet_loading_widget.dart';
import 'package:root_hub_flutter/src/features/match/ui/screens/match_loading_error_state_widget.dart';
import 'package:root_hub_flutter/src/features/match/ui/screens/match_location_header_image_widget.dart';
import 'package:root_hub_flutter/src/features/match/ui/screens/match_location_meta_chip_widget.dart';
import 'package:root_hub_flutter/src/features/match/ui/screens/match_nearby_header_widget.dart';
import 'package:root_hub_flutter/src/features/match/ui/screens/match_no_matches_state_widget.dart';
import 'package:root_hub_flutter/src/features/match/ui/screens/match_table_card_widget.dart';
import 'package:root_hub_flutter/src/features/register_match/ui/sheets/register_match_picker_sheet.dart';
import 'package:root_hub_flutter/src/states/auth_flow/auth_flow_provider.dart';
import 'package:root_hub_flutter/src/states/auth_flow/auth_flow_state.dart';
import 'package:root_hub_flutter/src/states/match/match_create_table_provider.dart';
import 'package:root_hub_flutter/src/states/match/match_tables_provider.dart';
import 'package:root_hub_flutter/src/states/register_match/register_match_provider.dart';
import 'package:url_launcher/url_launcher.dart';

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

  @override
  void initState() {
    super.initState();
    _currentTime = DateTime.now();
    _countdownTimer = Timer.periodic(
      const Duration(seconds: 1),
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
    final reportablePendingMatchesCount = reportablePendingMatchIds.length;
    final hasPendingMatches = pendingSubscribedMatchIds.isNotEmpty;

    return Stack(
      children: [
        RefreshIndicator(
          onRefresh: _refreshMatchScreenData,
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics(),
            ),
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 130),
            children: [
              MatchNearbyHeaderWidget(
                playerData: currentPlayer,
              ),
              const SizedBox(height: 12),
              if (matchState.isLoading && !matchState.hasLoadedOnce)
                const MatchInitialLoadingStateWidget()
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
                    padding: const EdgeInsets.only(bottom: 12),
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
                      onOpenLocationInfo: (location) {
                        _showLocationInfoDialog(context, location);
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
                    ),
                  ),
              ],
            ],
          ),
        ),
        if (hasPendingMatches)
          Positioned(
            left: 16,
            bottom: 18,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                FloatingActionButton.extended(
                  heroTag: 'register-match-fab',
                  onPressed: _openRegisterMatchFlow,
                  icon: const Icon(Icons.emoji_events_rounded),
                  label: Text(
                    'Report Result',
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
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: colorScheme.error,
                        borderRadius: BorderRadius.circular(999),
                      ),
                      constraints: const BoxConstraints(minWidth: 22),
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
          bottom: 18,
          child: FloatingActionButton.extended(
            heroTag: 'host-match-fab',
            onPressed: () {
              ref.read(matchCreateTableProvider.notifier).startNewFlow();
              context.push(dashboardMatchCreatePath);
            },
            icon: const Icon(Icons.campaign_rounded),
            label: Text(
              'Host Table',
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
          return const RegisterMatchPickerSheet();
        },
      );
    } else {
      submitted = await showModalBottomSheet<bool>(
        context: context,
        isScrollControlled: true,
        useSafeArea: true,
        backgroundColor: Colors.transparent,
        builder: (sheetContext) {
          return const RegisterMatchPickerSheet();
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

  Set<int> _buildReportablePendingMatchIds(
    List<MatchSchedulePairingAttempt> pendingMatches, {
    required int? currentPlayerId,
  }) {
    if (currentPlayerId == null) {
      return const <int>{};
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
      return const <int>{};
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
      const Duration(hours: 2),
    );

    return !now.isBefore(earliestAllowedRegistrationTime);
  }

  bool _isCurrentPlayerSubscribed(
    MatchSchedulePairingAttempt match, {
    required int currentPlayerId,
  }) {
    final subscriptions = match.subscriptions ?? const <MatchSubscription>[];

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
                  borderRadius: const BorderRadius.vertical(
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
                      onOpenLocationInfo: (location) {
                        _showLocationInfoDialog(sheetContext, location);
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
    BuildContext context,
    Location? location,
  ) async {
    final google = location?.googlePlaceLocation;
    final manual = location?.manualInputLocation;
    final locationTitle = google?.name ?? manual?.title ?? 'Unknown location';
    final locationSubtitle =
        google?.shortFormattedAddress ??
        google?.formattedAddress ??
        manual?.cityName ??
        'Address unavailable';
    final playedMatchesCount = location?.playedMatches?.length ?? 0;
    final types = google?.types ?? const <String>[];

    await showDialog<void>(
      context: context,
      builder: (dialogContext) {
        final colorScheme = Theme.of(dialogContext).colorScheme;
        final maxDialogHeight = MediaQuery.of(dialogContext).size.height * 0.86;

        return Dialog(
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 16,
          ),
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: maxDialogHeight,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MatchLocationHeaderImageWidget(
                  locationTitle: locationTitle,
                  locationSubtitle: locationSubtitle,
                  google: google,
                ),
                Flexible(
                  fit: FlexFit.loose,
                  child: ListView(
                    shrinkWrap: true,
                    padding: const EdgeInsets.fromLTRB(14, 14, 14, 10),
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(
                                12,
                                10,
                                12,
                                10,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: colorScheme.primaryContainer.withValues(
                                  alpha: 0.62,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.sports_esports_rounded,
                                    color: colorScheme.primary,
                                  ),
                                  const SizedBox(width: 8),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '$playedMatchesCount',
                                        style: Theme.of(dialogContext)
                                            .textTheme
                                            .titleLarge
                                            ?.copyWith(
                                              fontWeight: FontWeight.w900,
                                            ),
                                      ),
                                      Text(
                                        playedMatchesCount == 1
                                            ? 'match played here'
                                            : 'matches played here',
                                        style: Theme.of(dialogContext)
                                            .textTheme
                                            .labelLarge
                                            ?.copyWith(
                                              fontWeight: FontWeight.w700,
                                              color:
                                                  colorScheme.onSurfaceVariant,
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: google?.isPublicPlace == false
                                  ? colorScheme.tertiaryContainer
                                  : colorScheme.secondaryContainer,
                            ),
                            child: Column(
                              children: [
                                Icon(
                                  google?.isPublicPlace == false
                                      ? Icons.lock_rounded
                                      : Icons.public_rounded,
                                  size: 18,
                                  color: google?.isPublicPlace == false
                                      ? colorScheme.onTertiaryContainer
                                      : colorScheme.onSecondaryContainer,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  google?.isPublicPlace == false
                                      ? 'Private'
                                      : 'Public',
                                  style: Theme.of(dialogContext)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.w900,
                                        color: google?.isPublicPlace == false
                                            ? colorScheme.onTertiaryContainer
                                            : colorScheme.onSecondaryContainer,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: [
                          if (google?.rating != null)
                            MatchLocationMetaChipWidget(
                              icon: Icons.star_rounded,
                              label:
                                  'Rating ${google!.rating!.toStringAsFixed(1)}',
                            ),
                          if (google?.userRatingCount != null)
                            MatchLocationMetaChipWidget(
                              icon: Icons.groups_2_rounded,
                              label: '${google!.userRatingCount} ratings',
                            ),
                          if (google?.timezone != null &&
                              google!.timezone!.trim().isNotEmpty)
                            MatchLocationMetaChipWidget(
                              icon: Icons.schedule_rounded,
                              label: google.timezone!,
                            ),
                          for (final type in types)
                            MatchLocationMetaChipWidget(
                              icon: Icons.sell_rounded,
                              label: type,
                            ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      if (google?.url != null && google!.url!.trim().isNotEmpty)
                        MatchActionableInfoRowWidget(
                          icon: Icons.map_rounded,
                          label: 'Map link',
                          value: google.url!.trim(),
                          onCopyTap: () {
                            _copyValue(
                              value: google.url!.trim(),
                              label: 'Map link',
                            );
                          },
                          onActionTap: () {
                            _launchExternalUrl(google.url!.trim());
                          },
                        ),
                      if (google?.websiteUri != null &&
                          google!.websiteUri!.trim().isNotEmpty)
                        MatchActionableInfoRowWidget(
                          icon: Icons.language_rounded,
                          label: 'Website',
                          value: google.websiteUri!.trim(),
                          onCopyTap: () {
                            _copyValue(
                              value: google.websiteUri!.trim(),
                              label: 'Website',
                            );
                          },
                          onActionTap: () {
                            _launchExternalUrl(google.websiteUri!.trim());
                          },
                        ),
                      if (google?.phoneNumber != null &&
                          google!.phoneNumber!.trim().isNotEmpty)
                        MatchActionableInfoRowWidget(
                          icon: Icons.phone_rounded,
                          label: 'Phone',
                          value: google.phoneNumber!.trim(),
                          onCopyTap: () {
                            _copyValue(
                              value: google.phoneNumber!.trim(),
                              label: 'Phone',
                            );
                          },
                          onActionTap: () {
                            _launchPhone(google.phoneNumber!.trim());
                          },
                        ),
                      if (manual != null) ...[
                        const SizedBox(height: 8),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: colorScheme.surfaceContainerHighest
                                .withValues(
                                  alpha: 0.55,
                                ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Manual location notes',
                                style: Theme.of(dialogContext)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                      fontWeight: FontWeight.w900,
                                    ),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                '${manual.title} • ${manual.cityName}, ${manual.country.toJson()}',
                                style: Theme.of(dialogContext)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: colorScheme.onSurfaceVariant,
                                    ),
                              ),
                              if (manual.description?.trim().isNotEmpty == true)
                                Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Text(
                                    manual.description!.trim(),
                                    style: Theme.of(dialogContext)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.w700,
                                        ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                SafeArea(
                  top: false,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                    child: SizedBox(
                      width: double.infinity,
                      child: FilledButton.tonal(
                        onPressed: () => Navigator.of(dialogContext).pop(),
                        child: const Text('Close'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _copyValue({
    required String value,
    required String label,
  }) async {
    await Clipboard.setData(ClipboardData(text: value));
    if (!mounted) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$label copied'),
      ),
    );
  }

  Future<void> _launchExternalUrl(String rawUrl) async {
    final parsedUri = Uri.tryParse(rawUrl);
    if (parsedUri == null) {
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid URL format.'),
        ),
      );
      return;
    }

    final launched = await launchUrl(
      parsedUri,
      mode: LaunchMode.externalApplication,
    );
    if (launched || !mounted) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Unable to open the link right now.'),
      ),
    );
  }

  Future<void> _launchPhone(String rawPhone) async {
    final normalizedPhone = _normalizePhoneNumber(rawPhone);
    if (normalizedPhone.isEmpty) {
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid phone number format.'),
        ),
      );
      return;
    }

    final telUri = Uri(
      scheme: 'tel',
      path: normalizedPhone,
    );
    final launched = await launchUrl(
      telUri,
      mode: LaunchMode.externalApplication,
    );
    if (launched || !mounted) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Unable to open the dialer right now.'),
      ),
    );
  }

  String _normalizePhoneNumber(String rawPhone) {
    final trimmed = rawPhone.trim();
    if (trimmed.isEmpty) {
      return '';
    }

    final hasLeadingPlus = trimmed.startsWith('+');
    final digitsOnly = trimmed.replaceAll(RegExp(r'[^0-9]'), '');
    if (digitsOnly.isEmpty) {
      return '';
    }

    return hasLeadingPlus ? '+$digitsOnly' : digitsOnly;
  }

  String _formatDurationToClock(Duration duration) {
    final clampedDuration = duration.inSeconds <= 0 ? Duration.zero : duration;
    final totalSeconds = clampedDuration.inSeconds;
    final hours = totalSeconds ~/ 3600;
    final minutes = (totalSeconds % 3600) ~/ 60;
    final seconds = totalSeconds % 60;

    return '$hours:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
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
