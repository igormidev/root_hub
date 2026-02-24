import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
import 'package:root_hub_flutter/src/features/register_match/ui/sheets/register_match_picker_sheet.dart';
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FloatingActionButton.small(
                heroTag: 'host-match-fab',
                onPressed: () {
                  ref.read(matchCreateTableProvider.notifier).startNewFlow();
                  context.push(dashboardMatchCreatePath);
                },
                tooltip: 'Host Table',
                backgroundColor: colorScheme.secondaryContainer,
                foregroundColor: colorScheme.onSecondaryContainer,
                child: const Icon(Icons.campaign_rounded),
              ),
              const SizedBox(height: 10),
              Stack(
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
                  if (registerMatchState.pendingMatchesCount > 0)
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
                          '${registerMatchState.pendingMatchesCount}',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.labelSmall
                              ?.copyWith(
                                color: colorScheme.onError,
                                fontWeight: FontWeight.w900,
                              ),
                        ),
                      ),
                    ),
                ],
              ),
            ],
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

    await ref.read(registerMatchProvider.notifier).refreshPendingMatchesCount();

    if (submitted == true) {
      await ref
          .read(matchTablesProvider.notifier)
          .loadTablesInArea(showLoadingIndicator: false);
    }
  }

  Widget _buildNearbyHeader(
    BuildContext context,
    PlayerData? playerData,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    final ratioKm = playerData?.currentLocation?.ratio;
    final nearbySummary = ratioKm == null
        ? 'Set profile location'
        : '${ratioKm.toStringAsFixed(0)} km search area';

    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 6, 4, 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.explore_rounded,
                color: colorScheme.secondary,
                size: 22,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Match Finder',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Flexible(
                child: Text(
                  'Nearby Match Tables',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: colorScheme.onSurface,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Container(
                  width: 5,
                  height: 5,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: colorScheme.onSurfaceVariant.withValues(alpha: 0.8),
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  nearbySummary,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            'Only tables that did not start more than 2 hours ago are listed.',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
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
    final isClosed = table.closedForSubscriptions == true;
    final remainingSeats = (maxPlayers - subscribedPlayersCount).clamp(
      0,
      maxPlayers,
    );

    final distanceLabel = _distanceLabel(
      currentPlayer,
      googlePlace,
    );

    final actionEnabled =
        tableId != null &&
        !isSubscribing &&
        !isSubscribed &&
        !isFull &&
        !isClosed;
    final canOpenSubscribedChat = tableId != null && isSubscribed;

    final actionLabel = switch ((isSubscribing, isClosed, isFull)) {
      (true, _, _) => 'Joining...',
      (_, true, _) => 'Closed',
      (_, _, true) => 'Table Full',
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
              Expanded(
                child: Text(
                  '$dateLabel • $timeLabel',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const SizedBox(width: 8),
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
              if (isClosed)
                _buildInfoChip(
                  context,
                  icon: Icons.lock_rounded,
                  text: 'Subscriptions closed',
                ),
              if (distanceLabel != null)
                _buildInfoChip(
                  context,
                  icon: Icons.near_me_rounded,
                  text: distanceLabel,
                ),
              if (isSubscribed)
                _buildInfoChip(
                  context,
                  icon: Icons.chat_bubble_rounded,
                  text: 'Tap card to open chat',
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
                  maximumSize: const Size(double.infinity, 56),
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

    final subscribedCardContent = canOpenSubscribedChat
        ? Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                context.push(
                  dashboardMatchChatPathForMatch(tableId),
                  extra: table.title,
                );
              },
              child: cardContent,
            ),
          )
        : cardContent;

    return Padding(
      padding: const EdgeInsets.only(top: 14),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          subscribedCardContent,
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
                      tableId,
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
    int tableId,
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
    final isClosed = table.closedForSubscriptions == true;

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
                if (isClosed) ...[
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: colorScheme.error.withValues(alpha: 0.5),
                      ),
                      color: colorScheme.errorContainer.withValues(alpha: 0.3),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.lock_rounded,
                          color: colorScheme.onErrorContainer,
                          size: 20,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'The host has closed subscriptions for this table. '
                            'New players cannot join at this time.',
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  color: colorScheme.onErrorContainer,
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                      if (!mounted) {
                        return;
                      }
                      this.context.push(
                        dashboardMatchChatPathForMatch(tableId),
                        extra: table.title,
                      );
                    },
                    icon: const Icon(Icons.chat_bubble_rounded),
                    label: const Text('See table chat'),
                    style: FilledButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      maximumSize: const Size(double.infinity, 50),
                      backgroundColor: colorScheme.primary,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
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
                  'Created at: $createdLabel',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w700,
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
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Cancel'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: FilledButton(
                    onPressed: isSubscribed || isClosed
                        ? null
                        : () => Navigator.of(context).pop(true),
                    style: FilledButton.styleFrom(
                      minimumSize: const Size(double.infinity, 52),
                      maximumSize: const Size(double.infinity, 52),
                      backgroundColor: colorScheme.primary,
                      foregroundColor: Colors.white,
                    ),
                    child: Text(
                      isSubscribed
                          ? 'Already subscribed'
                          : isClosed
                          ? 'Subscriptions closed'
                          : 'Confirm Join',
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
    final imageUrl = playerSnapshot.profileImageUrl?.trim();

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
                _buildLocationHeaderImage(
                  context: dialogContext,
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
                            _buildLocationMetaChip(
                              dialogContext,
                              icon: Icons.star_rounded,
                              label:
                                  'Rating ${google!.rating!.toStringAsFixed(1)}',
                            ),
                          if (google?.userRatingCount != null)
                            _buildLocationMetaChip(
                              dialogContext,
                              icon: Icons.groups_2_rounded,
                              label: '${google!.userRatingCount} ratings',
                            ),
                          if (google?.timezone != null &&
                              google!.timezone!.trim().isNotEmpty)
                            _buildLocationMetaChip(
                              dialogContext,
                              icon: Icons.schedule_rounded,
                              label: google.timezone!,
                            ),
                          for (final type in types)
                            _buildLocationMetaChip(
                              dialogContext,
                              icon: Icons.sell_rounded,
                              label: type,
                            ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      if (google?.url != null && google!.url!.trim().isNotEmpty)
                        _buildActionableInfoRow(
                          dialogContext,
                          icon: Icons.map_rounded,
                          label: 'Map link',
                          value: google.url!.trim(),
                          onActionTap: () =>
                              _launchExternalUrl(google.url!.trim()),
                        ),
                      if (google?.websiteUri != null &&
                          google!.websiteUri!.trim().isNotEmpty)
                        _buildActionableInfoRow(
                          dialogContext,
                          icon: Icons.language_rounded,
                          label: 'Website',
                          value: google.websiteUri!.trim(),
                          onActionTap: () =>
                              _launchExternalUrl(google.websiteUri!.trim()),
                        ),
                      if (google?.phoneNumber != null &&
                          google!.phoneNumber!.trim().isNotEmpty)
                        _buildActionableInfoRow(
                          dialogContext,
                          icon: Icons.phone_rounded,
                          label: 'Phone',
                          value: google.phoneNumber!.trim(),
                          onActionTap: () =>
                              _launchPhone(google.phoneNumber!.trim()),
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

  Widget _buildLocationHeaderImage({
    required BuildContext context,
    required String locationTitle,
    required String locationSubtitle,
    required GooglePlaceLocation? google,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final lat = google?.lat;
    final lng = google?.lng;
    final canBuildStaticMap = lat != null && lng != null;
    final headerImageUrl = canBuildStaticMap
        ? _buildStaticMapUrl(lat, lng)
        : null;

    return SizedBox(
      height: 188,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (headerImageUrl != null)
            Image.network(
              headerImageUrl,
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) {
                return Container(
                  color: colorScheme.primaryContainer,
                );
              },
            )
          else
            Container(
              color: colorScheme.primaryContainer,
            ),
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withValues(alpha: 0.08),
                  Colors.black.withValues(alpha: 0.6),
                ],
              ),
            ),
          ),
          Positioned(
            left: 14,
            right: 14,
            bottom: 12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Location Details',
                  style: GoogleFonts.cinzel(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  locationTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  locationSubtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white.withValues(alpha: 0.92),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _buildStaticMapUrl(double latitude, double longitude) {
    final normalizedLatitude = latitude.toStringAsFixed(6);
    final normalizedLongitude = longitude.toStringAsFixed(6);

    return Uri.https(
      'staticmap.openstreetmap.de',
      '/staticmap.php',
      {
        'center': '$normalizedLatitude,$normalizedLongitude',
        'zoom': '14',
        'size': '1200x420',
        'markers': '$normalizedLatitude,$normalizedLongitude,lightblue1',
      },
    ).toString();
  }

  Widget _buildLocationMetaChip(
    BuildContext context, {
    required IconData icon,
    required String label,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.7),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 14,
            color: colorScheme.onSurfaceVariant,
          ),
          const SizedBox(width: 5),
          Text(
            label,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w800,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionableInfoRow(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
    required VoidCallback onActionTap,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(10, 9, 10, 9),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: colorScheme.outlineVariant),
          color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.45),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: colorScheme.primary,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 1),
                  Text(
                    value,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Tooltip(
                  message: 'Copy $label',
                  child: IconButton(
                    visualDensity: VisualDensity.compact,
                    onPressed: () => _copyValue(
                      value: value,
                      label: label,
                    ),
                    icon: const Icon(Icons.copy_rounded),
                  ),
                ),
                Tooltip(
                  message: 'Open $label',
                  child: IconButton(
                    visualDensity: VisualDensity.compact,
                    onPressed: onActionTap,
                    icon: const Icon(Icons.open_in_new_rounded),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
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
