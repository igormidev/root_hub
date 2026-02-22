import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:root_hub_client/root_hub_client.dart';
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
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }

      ref.read(matchTablesProvider.notifier).ensureLoaded();
    });
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

    final distanceLabel = _distanceLabel(
      currentPlayer,
      googlePlace,
    );

    final actionEnabled =
        tableId != null && !isSubscribing && !isSubscribed && !isFull;

    final actionLabel = switch ((isSubscribing, isSubscribed, isFull)) {
      (true, _, _) => 'Joining...',
      (_, true, _) => 'Subscribed',
      (_, _, true) => 'Table Full',
      _ => 'Join Table',
    };

    return Container(
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: colorScheme.outlineVariant),
        color: colorScheme.surface.withValues(alpha: 0.95),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withValues(alpha: 0.08),
            blurRadius: 18,
            offset: const Offset(0, 8),
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
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(999),
                  color: colorScheme.primaryContainer.withValues(alpha: 0.7),
                ),
                child: Text(
                  '$subscribedPlayersCount/$maxPlayers',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.w900,
                    color: colorScheme.onPrimaryContainer,
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
              Text(
                '$dateLabel • $timeLabel',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
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
              ),
              if (distanceLabel != null)
                _buildInfoChip(
                  context,
                  icon: Icons.near_me_rounded,
                  text: distanceLabel,
                ),
              _buildInfoChip(
                context,
                icon: Icons.person_rounded,
                text: table.host?.displayName ?? 'Unknown host',
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: actionEnabled
                  ? () async {
                      final error = await ref
                          .read(matchTablesProvider.notifier)
                          .subscribeToTable(tableId);
                      if (!mounted || error == null) {
                        return;
                      }

                      await showErrorDialog(
                        this.context,
                        title: error.title,
                        description: error.description,
                      );
                    }
                  : null,
              style: FilledButton.styleFrom(
                backgroundColor: isSubscribed
                    ? colorScheme.tertiaryContainer
                    : colorScheme.primary,
                foregroundColor: isSubscribed
                    ? colorScheme.onTertiaryContainer
                    : colorScheme.onPrimary,
              ),
              child: Text(
                actionLabel,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w900,
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
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
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
