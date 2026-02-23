import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/core/extension/faction_ui_extension.dart';
import 'package:root_hub_flutter/src/core/extension/match_podium_extension.dart';
import 'package:root_hub_flutter/src/core/navigation/app_routes.dart';
import 'package:root_hub_flutter/src/design_system/default_error_snackbar.dart';
import 'package:root_hub_flutter/src/states/auth_flow/auth_flow_provider.dart';
import 'package:root_hub_flutter/src/states/auth_flow/auth_flow_state.dart';
import 'package:root_hub_flutter/src/states/match/match_create_table_provider.dart';
import 'package:root_hub_flutter/src/states/match/match_tables_provider.dart';

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
    final authFlowState = ref.watch(authFlowProvider);
    final currentPlayer = authFlowState.maybeWhen(
      authenticated: (playerData) => playerData,
      orElse: () => null,
    );

    return Stack(
      children: [
        RefreshIndicator(
          onRefresh: () => ref.read(matchTablesProvider.notifier).refresh(),
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics(),
            ),
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 130),
            children: [
              _buildNearbyHeader(
                context,
                currentPlayer,
              ),
              const SizedBox(height: 12),
              if (matchState.isLoading && !matchState.hasLoadedOnce)
                _buildInitialLoadingState(context)
              else if (matchState.loadError != null &&
                  matchState.tables.isEmpty)
                _buildLoadingErrorState(
                  context,
                  matchState.loadError!,
                )
              else if (matchState.tables.isEmpty)
                _buildNoMatchesState(context)
              else ...[
                for (final table in matchState.tables)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: _buildTableCard(
                      context,
                      table,
                      currentPlayer,
                      matchState.subscribingTableIds.contains(table.id),
                    ),
                  ),
              ],
            ],
          ),
        ),
        Positioned(
          right: 16,
          bottom: 18,
          child: FloatingActionButton.extended(
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

  Widget _buildNearbyHeader(
    BuildContext context,
    PlayerData? playerData,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    final ratioKm = playerData?.currentLocation?.ratio;

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 15, 16, 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: colorScheme.outlineVariant),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colorScheme.secondaryContainer.withValues(alpha: 0.72),
            colorScheme.primaryContainer.withValues(alpha: 0.54),
            colorScheme.surface,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.explore_rounded,
                color: colorScheme.secondary,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Nearby Match Tables',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            ratioKm == null
                ? 'Set your profile location to discover nearby hosted tables.'
                : 'Showing tables inside your ${ratioKm.toStringAsFixed(0)} km search area.\nOnly tables that did not start more than 2 hours ago are listed.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w700,
              height: 1.35,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInitialLoadingState(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
      decoration: BoxDecoration(
        color: colorScheme.surface.withValues(alpha: 0.92),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Column(
        children: [
          SizedBox(
            width: 32,
            height: 32,
            child: CircularProgressIndicator(
              strokeWidth: 3,
              color: colorScheme.primary,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Loading nearby tables...',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingErrorState(
    BuildContext context,
    RootHubException error,
  ) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: colorScheme.error.withValues(alpha: 0.5)),
        color: colorScheme.errorContainer.withValues(alpha: 0.45),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            error.title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w900,
              color: colorScheme.onErrorContainer,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            error.description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: colorScheme.onErrorContainer,
              fontWeight: FontWeight.w700,
              height: 1.35,
            ),
          ),
          const SizedBox(height: 12),
          FilledButton.icon(
            onPressed: () {
              ref.read(matchTablesProvider.notifier).refresh();
            },
            icon: const Icon(Icons.refresh_rounded),
            label: const Text('Try again'),
          ),
        ],
      ),
    );
  }

  Widget _buildNoMatchesState(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: colorScheme.outlineVariant),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            colorScheme.surfaceContainerHighest.withValues(alpha: 0.7),
            colorScheme.surfaceContainerLow.withValues(alpha: 0.5),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colorScheme.primaryContainer,
            ),
            child: Icon(
              Icons.map_rounded,
              color: colorScheme.onPrimaryContainer,
              size: 30,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'No tables in your area yet',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Be the first to start one. Host a new table so nearby players can subscribe.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w700,
              height: 1.35,
            ),
          ),
          const SizedBox(height: 14),
          FilledButton.icon(
            onPressed: () {
              ref.read(matchCreateTableProvider.notifier).startNewFlow();
              context.push(dashboardMatchCreatePath);
            },
            icon: const Icon(Icons.add_rounded),
            label: const Text('Host the first table'),
          ),
        ],
      ),
    );
  }

  Widget _buildTableCard(
    BuildContext context,
    MatchSchedulePairingAttempt table,
    PlayerData? currentPlayer,
    bool isSubscribing,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    final localizations = MaterialLocalizations.of(context);

    final tableId = table.id;
    final dateTime = table.attemptedAt.toLocal();
    final dateLabel = localizations.formatMediumDate(dateTime);
    final timeLabel = localizations.formatTimeOfDay(
      TimeOfDay.fromDateTime(dateTime),
    );

    final location = table.location;
    final googlePlace = location?.googlePlaceLocation;
    final manualLocation = location?.manualInputLocation;
    final locationTitle =
        googlePlace?.name ?? manualLocation?.title ?? 'Unknown location';
    final locationSubtitle =
        googlePlace?.shortFormattedAddress ??
        googlePlace?.formattedAddress ??
        manualLocation?.cityName ??
        'Address unavailable';

    final minPlayers = table.minAmountOfPlayers.playerCount;
    final maxPlayers = table.maxAmountOfPlayers.playerCount;
    final subscriptions = table.subscriptions ?? const <MatchSubscription>[];
    final subscribedPlayersCount = subscriptions.length;
    final isSubscribed =
        currentPlayer != null &&
        subscriptions.any((entry) => entry.playerDataId == currentPlayer.id);
    final isFull = subscribedPlayersCount >= maxPlayers;
    final remainingSeats = (maxPlayers - subscribedPlayersCount).clamp(
      0,
      maxPlayers,
    );

    final distanceLabel = _distanceLabel(
      currentPlayer,
      googlePlace,
    );

    final actionEnabled =
        tableId != null && !isSubscribing && !isSubscribed && !isFull;

    final actionLabel = switch ((isSubscribing, isFull)) {
      (true, _) => 'Joining...',
      (_, true) => 'Table Full',
      _ => 'Join Table',
    };

    final cardContent = Container(
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSubscribed
              ? colorScheme.primary
              : colorScheme.outlineVariant,
          width: isSubscribed ? 4 : 1.2,
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colorScheme.surface.withValues(alpha: 0.95),
            colorScheme.surfaceContainerHighest.withValues(alpha: 0.64),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withValues(
              alpha: isSubscribed ? 0.12 : 0.08,
            ),
            blurRadius: isSubscribed ? 22 : 18,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      table.title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    if (table.description?.trim().isNotEmpty == true) ...[
                      const SizedBox(height: 4),
                      Text(
                        table.description!.trim(),
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          fontWeight: FontWeight.w700,
                          height: 1.32,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Tooltip(
                triggerMode: TooltipTriggerMode.tap,
                message:
                    '$subscribedPlayersCount player${subscribedPlayersCount == 1 ? '' : 's'} subscribed and '
                    '$remainingSeats ${remainingSeats == 1 ? 'place' : 'places'} remaining to close the table.',
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(999),
                    color: colorScheme.primaryContainer.withValues(alpha: 0.76),
                  ),
                  child: Text(
                    '$subscribedPlayersCount/$maxPlayers',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w900,
                      color: colorScheme.onPrimaryContainer,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Icon(
                Icons.schedule_rounded,
                size: 18,
                color: colorScheme.primary,
              ),
              const SizedBox(width: 6),
              Flexible(
                fit: FlexFit.loose,
                child: Text(
                  '$dateLabel • $timeLabel',
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const Spacer(),
              _buildTimeStatusChip(
                context,
                dateTime,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.location_on_rounded,
                size: 18,
                color: colorScheme.secondary,
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      locationTitle,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      locationSubtitle,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Tooltip(
                message: 'Open full location details',
                child: IconButton(
                  visualDensity: VisualDensity.compact,
                  onPressed: () {
                    _showLocationInfoDialog(
                      context,
                      location,
                    );
                  },
                  icon: Icon(
                    Icons.info_outline_rounded,
                    color: colorScheme.primary,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildInfoChip(
                context,
                icon: Icons.groups_2_rounded,
                text: '$minPlayers-$maxPlayers players',
                tooltipMessage:
                    'This table can start with a minimum of $minPlayers players and accepts up to $maxPlayers players.',
                triggerMode: TooltipTriggerMode.tap,
              ),
              if (distanceLabel != null)
                _buildInfoChip(
                  context,
                  icon: Icons.near_me_rounded,
                  text: distanceLabel,
                ),
            ],
          ),
          if (!isSubscribed) ...[
            const SizedBox(height: 14),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: actionEnabled
                    ? () async {
                        await _openJoinTableBottomSheet(
                          context,
                          tableId: tableId,
                          fallbackTable: table,
                          currentPlayer: currentPlayer,
                        );
                      }
                    : null,
                style: FilledButton.styleFrom(
                  minimumSize: const Size(double.infinity, 56),
                  backgroundColor: colorScheme.primary,
                  foregroundColor: Colors.white,
                  disabledBackgroundColor: colorScheme.surfaceContainerHighest,
                  disabledForegroundColor: colorScheme.onSurfaceVariant,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: Text(
                  actionLabel,
                  style: GoogleFonts.getFont(
                    'MedievalSharp',
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.7,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );

    if (!isSubscribed) {
      return cardContent;
    }

    return Padding(
      padding: const EdgeInsets.only(top: 14),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          cardContent,
          Positioned(
            left: 14,
            top: -13,
            child: Container(
              padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(999),
                color: colorScheme.primary,
                boxShadow: [
                  BoxShadow(
                    color: colorScheme.shadow.withValues(alpha: 0.2),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Text(
                'Subscribed',
                style: GoogleFonts.getFont(
                  'MedievalSharp',
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoChip(
    BuildContext context, {
    required IconData icon,
    required String text,
    String? tooltipMessage,
    TooltipTriggerMode triggerMode = TooltipTriggerMode.longPress,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    final chip = Container(
      padding: const EdgeInsets.fromLTRB(10, 6, 10, 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.65),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 15,
            color: colorScheme.onSurfaceVariant,
          ),
          const SizedBox(width: 5),
          Text(
            text,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );

    if (tooltipMessage == null) {
      return chip;
    }

    return Tooltip(
      message: tooltipMessage,
      triggerMode: triggerMode,
      child: chip,
    );
  }

  Widget _buildTimeStatusChip(
    BuildContext context,
    DateTime tableStartAt,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    final remaining = tableStartAt.difference(_currentTime);
    final alreadyStarted = remaining.inSeconds <= 0;
    final chipLabel = alreadyStarted
        ? 'Already started'
        : _formatDurationToClock(remaining);

    return Tooltip(
      message: alreadyStarted
          ? 'This match already started. Recently started tables stay visible for a short period.'
          : 'Remaining time until the match starts.',
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 6, 10, 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(999),
          color: alreadyStarted
              ? colorScheme.tertiaryContainer.withValues(alpha: 0.85)
              : colorScheme.primaryContainer.withValues(alpha: 0.82),
        ),
        child: Text(
          chipLabel,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            fontWeight: FontWeight.w900,
            color: alreadyStarted
                ? colorScheme.onTertiaryContainer
                : colorScheme.onPrimaryContainer,
          ),
        ),
      ),
    );
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
                      return _buildJoinSheetLoading(
                        sheetContext,
                        fallbackTable,
                      );
                    }

                    if (snapshot.hasError) {
                      final error = snapshot.error is RootHubException
                          ? snapshot.error! as RootHubException
                          : defaultException;

                      return _buildJoinSheetError(
                        sheetContext,
                        error,
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
                    return _buildJoinSheetContent(
                      sheetContext,
                      detailedTable,
                      currentPlayer,
                      fallbackTable,
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

  Widget _buildJoinSheetLoading(
    BuildContext context,
    MatchSchedulePairingAttempt fallbackTable,
  ) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        Container(
          width: 50,
          height: 5,
          margin: const EdgeInsets.only(top: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(999),
            color: colorScheme.outlineVariant,
          ),
        ),
        Expanded(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 36,
                    height: 36,
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      color: colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    'Loading table details for "${fallbackTable.title}"...',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildJoinSheetError(
    BuildContext context,
    RootHubException error, {
    required VoidCallback onRetry,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 16, 18, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 50,
              height: 5,
              margin: const EdgeInsets.only(bottom: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(999),
                color: colorScheme.outlineVariant,
              ),
            ),
          ),
          Text(
            error.title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            error.description,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Spacer(),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('Close'),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: FilledButton.icon(
                  onPressed: onRetry,
                  icon: const Icon(Icons.refresh_rounded),
                  label: const Text('Retry'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildJoinSheetContent(
    BuildContext context,
    MatchScheduleInfo? tableInfo,
    PlayerData? currentPlayer,
    MatchSchedulePairingAttempt fallbackTable,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    final localizations = MaterialLocalizations.of(context);
    final table = tableInfo?.matchSchedule ?? fallbackTable;
    final startAt = table.attemptedAt.toLocal();
    final startLabel =
        '${localizations.formatMediumDate(startAt)} • '
        '${localizations.formatTimeOfDay(TimeOfDay.fromDateTime(startAt))}';
    final createdAt = table.createdAt.toLocal();
    final createdLabel =
        '${localizations.formatMediumDate(createdAt)} • '
        '${localizations.formatTimeOfDay(TimeOfDay.fromDateTime(createdAt))}';

    final location = table.location;
    final googlePlace = location?.googlePlaceLocation;
    final manualLocation = location?.manualInputLocation;
    final locationTitle =
        googlePlace?.name ?? manualLocation?.title ?? 'Unknown location';
    final locationSubtitle =
        googlePlace?.shortFormattedAddress ??
        googlePlace?.formattedAddress ??
        manualLocation?.cityName ??
        'Address unavailable';

    final minPlayers = table.minAmountOfPlayers.playerCount;
    final maxPlayers = table.maxAmountOfPlayers.playerCount;
    final subscriptions = table.subscriptions ?? const <MatchSubscription>[];
    final subscribedPlayersCount = subscriptions.length;
    final isSubscribed =
        currentPlayer != null &&
        subscriptions.any((entry) => entry.playerDataId == currentPlayer.id);

    final participatingPlayers =
        tableInfo?.players ?? const <MatchSchedulePlayerSnapshot>[];

    return Column(
      children: [
        Container(
          width: 50,
          height: 5,
          margin: const EdgeInsets.only(top: 12, bottom: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(999),
            color: colorScheme.outlineVariant,
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(18, 4, 18, 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Confirm table subscription',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  table.title,
                  style: GoogleFonts.cinzel(
                    fontSize: 29,
                    fontWeight: FontWeight.w700,
                    color: colorScheme.onSurface,
                  ),
                ),
                if (table.description?.trim().isNotEmpty == true) ...[
                  const SizedBox(height: 4),
                  Text(
                    table.description!.trim(),
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.w700,
                      height: 1.32,
                    ),
                  ),
                ],
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _buildInfoChip(
                      context,
                      icon: Icons.calendar_month_rounded,
                      text: startLabel,
                    ),
                    _buildInfoChip(
                      context,
                      icon: Icons.groups_2_rounded,
                      text: '$subscribedPlayersCount/$maxPlayers seats',
                    ),
                    _buildInfoChip(
                      context,
                      icon: Icons.person_outline_rounded,
                      text: table.host?.displayName ?? 'Unknown host',
                    ),
                    _buildInfoChip(
                      context,
                      icon: Icons.social_distance_rounded,
                      text: '$minPlayers-$maxPlayers players',
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: colorScheme.outlineVariant),
                    color: colorScheme.surfaceContainerHighest.withValues(
                      alpha: 0.55,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_rounded,
                            color: colorScheme.secondary,
                          ),
                          const SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              locationTitle,
                              style: Theme.of(context).textTheme.titleSmall
                                  ?.copyWith(
                                    fontWeight: FontWeight.w900,
                                  ),
                            ),
                          ),
                          IconButton(
                            visualDensity: VisualDensity.compact,
                            onPressed: () {
                              _showLocationInfoDialog(
                                context,
                                location,
                              );
                            },
                            icon: const Icon(Icons.info_outline_rounded),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(
                        locationSubtitle,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  'Players in this match',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  participatingPlayers.isEmpty
                      ? 'No players subscribed yet.'
                      : 'These are the current players that will participate.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 10),
                if (participatingPlayers.isEmpty)
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(12, 14, 12, 14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: colorScheme.surfaceContainerHighest.withValues(
                        alpha: 0.52,
                      ),
                    ),
                    child: Text(
                      'You can be the first player to lock this table in.',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
                else
                  for (final participant in participatingPlayers)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 14),
                      child: _buildParticipantCard(
                        context,
                        participant,
                      ),
                    ),
                const SizedBox(height: 2),
                Text(
                  'Match schedule metadata',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 6),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: colorScheme.surfaceContainerHighest.withValues(
                      alpha: 0.42,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ID: ${table.id ?? '-'}',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        'Host ID: ${table.playerDataId}',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        'Location ID: ${table.locationId}',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        'Created at: $createdLabel',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        'Starts at: $startLabel',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18, 10, 18, 14),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 52),
                    ),
                    child: const Text('Cancel'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: FilledButton(
                    onPressed: isSubscribed
                        ? null
                        : () => Navigator.of(context).pop(true),
                    style: FilledButton.styleFrom(
                      minimumSize: const Size(double.infinity, 52),
                      backgroundColor: colorScheme.primary,
                      foregroundColor: Colors.white,
                    ),
                    child: Text(
                      isSubscribed ? 'Already subscribed' : 'Confirm Join',
                      style: GoogleFonts.getFont(
                        'MedievalSharp',
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildParticipantCard(
    BuildContext context,
    MatchSchedulePlayerSnapshot playerSnapshot,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    final playerData = playerSnapshot.playerData;
    final factionColor = playerData.favoriteFaction.factionColor;
    final imageUrl = playerSnapshot.profileImageUrl;

    return SizedBox(
      height: 156,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 14,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(14, 14, 108, 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: factionColor.withValues(alpha: 0.64),
                  width: 1.7,
                ),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    colorScheme.surfaceContainerHighest.withValues(alpha: 0.96),
                    colorScheme.surfaceContainer.withValues(alpha: 0.86),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      _buildUserAvatar(
                        context,
                        imageUrl,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          playerData.displayName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                fontWeight: FontWeight.w900,
                              ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Favorite Faction',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    playerData.favoriteFaction.displayName.toUpperCase(),
                    style: GoogleFonts.cinzel(
                      fontSize: 21,
                      fontWeight: FontWeight.w800,
                      color: factionColor,
                      height: 1.06,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: -4,
            right: -6,
            child: Transform.rotate(
              angle: -0.08,
              child: Image.asset(
                playerData.favoriteFaction.getFactionImage,
                width: 128,
                height: 128,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserAvatar(
    BuildContext context,
    String? imageUrl,
  ) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: 38,
      height: 38,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: colorScheme.primary.withValues(alpha: 0.5),
          width: 1.4,
        ),
        color: colorScheme.surfaceContainerHighest,
      ),
      child: ClipOval(
        child: imageUrl == null || imageUrl.isEmpty
            ? Icon(
                Icons.person_rounded,
                color: colorScheme.onSurfaceVariant,
              )
            : Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) {
                  return Icon(
                    Icons.person_rounded,
                    color: colorScheme.onSurfaceVariant,
                  );
                },
              ),
      ),
    );
  }

  Future<void> _showLocationInfoDialog(
    BuildContext context,
    Location? location,
  ) async {
    final colorScheme = Theme.of(context).colorScheme;
    final google = location?.googlePlaceLocation;
    final manual = location?.manualInputLocation;

    await showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Location details'),
          content: SizedBox(
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildLocationDetailLine(
                    context,
                    label: 'Location.id',
                    value: '${location?.id ?? '-'}',
                  ),
                  _buildLocationDetailLine(
                    context,
                    label: 'googlePlaceLocationId',
                    value: '${location?.googlePlaceLocationId ?? '-'}',
                  ),
                  _buildLocationDetailLine(
                    context,
                    label: 'manualInputLocationId',
                    value: '${location?.manualInputLocationId ?? '-'}',
                  ),
                  _buildLocationDetailLine(
                    context,
                    label: 'pairingAttempts count',
                    value: '${location?.pairingAttempts?.length ?? 0}',
                  ),
                  _buildLocationDetailLine(
                    context,
                    label: 'playedMatches count',
                    value: '${location?.playedMatches?.length ?? 0}',
                  ),
                  if (google != null) ...[
                    const SizedBox(height: 10),
                    Text(
                      'GooglePlaceLocation',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w900,
                        color: colorScheme.primary,
                      ),
                    ),
                    _buildLocationDetailLine(
                      context,
                      label: 'id',
                      value: '${google.id ?? '-'}',
                    ),
                    _buildLocationDetailLine(
                      context,
                      label: 'providerPlaceId',
                      value: google.providerPlaceId,
                    ),
                    _buildLocationDetailLine(
                      context,
                      label: 'name',
                      value: google.name,
                    ),
                    _buildLocationDetailLine(
                      context,
                      label: 'formattedAddress',
                      value: google.formattedAddress ?? '-',
                    ),
                    _buildLocationDetailLine(
                      context,
                      label: 'shortFormattedAddress',
                      value: google.shortFormattedAddress ?? '-',
                    ),
                    _buildLocationDetailLine(
                      context,
                      label: 'lat',
                      value: google.lat.toStringAsFixed(6),
                    ),
                    _buildLocationDetailLine(
                      context,
                      label: 'lng',
                      value: google.lng.toStringAsFixed(6),
                    ),
                    _buildLocationDetailLine(
                      context,
                      label: 'url',
                      value: google.url ?? '-',
                    ),
                    _buildLocationDetailLine(
                      context,
                      label: 'websiteUri',
                      value: google.websiteUri ?? '-',
                    ),
                    _buildLocationDetailLine(
                      context,
                      label: 'phoneNumber',
                      value: google.phoneNumber ?? '-',
                    ),
                    _buildLocationDetailLine(
                      context,
                      label: 'types',
                      value: google.types?.join(', ') ?? '-',
                    ),
                    _buildLocationDetailLine(
                      context,
                      label: 'primaryType',
                      value: google.primaryType ?? '-',
                    ),
                    _buildLocationDetailLine(
                      context,
                      label: 'rating',
                      value: google.rating?.toStringAsFixed(1) ?? '-',
                    ),
                    _buildLocationDetailLine(
                      context,
                      label: 'userRatingCount',
                      value: '${google.userRatingCount ?? '-'}',
                    ),
                    _buildLocationDetailLine(
                      context,
                      label: 'priceLevel',
                      value: google.priceLevel ?? '-',
                    ),
                    _buildLocationDetailLine(
                      context,
                      label: 'primaryPhotoName',
                      value: google.primaryPhotoName ?? '-',
                    ),
                    _buildLocationDetailLine(
                      context,
                      label: 'timezone',
                      value: google.timezone ?? '-',
                    ),
                    _buildLocationDetailLine(
                      context,
                      label: 'isPublicPlace',
                      value: google.isPublicPlace ? 'true' : 'false',
                    ),
                    _buildLocationDetailLine(
                      context,
                      label: 'notes',
                      value: google.notes ?? '-',
                    ),
                    _buildLocationDetailLine(
                      context,
                      label: 'createdAt',
                      value: google.createdAt.toLocal().toIso8601String(),
                    ),
                    _buildLocationDetailLine(
                      context,
                      label: 'updatedAt',
                      value: google.updatedAt.toLocal().toIso8601String(),
                    ),
                  ],
                  if (manual != null) ...[
                    const SizedBox(height: 10),
                    Text(
                      'ManualInputLocation',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w900,
                        color: colorScheme.secondary,
                      ),
                    ),
                    _buildLocationDetailLine(
                      context,
                      label: 'id',
                      value: '${manual.id ?? '-'}',
                    ),
                    _buildLocationDetailLine(
                      context,
                      label: 'title',
                      value: manual.title,
                    ),
                    _buildLocationDetailLine(
                      context,
                      label: 'description',
                      value: manual.description ?? '-',
                    ),
                    _buildLocationDetailLine(
                      context,
                      label: 'cityName',
                      value: manual.cityName,
                    ),
                    _buildLocationDetailLine(
                      context,
                      label: 'country',
                      value: manual.country.toJson(),
                    ),
                    _buildLocationDetailLine(
                      context,
                      label: 'playerDataId',
                      value: '${manual.playerDataId}',
                    ),
                    _buildLocationDetailLine(
                      context,
                      label: 'creator',
                      value: manual.creator?.displayName ?? '-',
                    ),
                    _buildLocationDetailLine(
                      context,
                      label: 'createdAt',
                      value: manual.createdAt.toLocal().toIso8601String(),
                    ),
                    _buildLocationDetailLine(
                      context,
                      label: 'updatedAt',
                      value: manual.updatedAt.toLocal().toIso8601String(),
                    ),
                  ],
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildLocationDetailLine(
    BuildContext context, {
    required String label,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: RichText(
        text: TextSpan(
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.35),
          children: [
            TextSpan(
              text: '$label: ',
              style: const TextStyle(
                fontWeight: FontWeight.w800,
              ),
            ),
            TextSpan(
              text: value,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
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
