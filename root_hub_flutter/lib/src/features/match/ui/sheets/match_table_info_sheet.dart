import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/core/extension/faction_ui_extension.dart';
import 'package:root_hub_flutter/src/core/extension/match_podium_extension.dart';
import 'package:root_hub_flutter/src/design_system/default_error_snackbar.dart';
import 'package:root_hub_flutter/src/states/auth_flow/auth_flow_provider.dart';
import 'package:root_hub_flutter/src/states/auth_flow/auth_flow_state.dart';
import 'package:root_hub_flutter/src/states/match/match_chat_provider.dart';
import 'package:root_hub_flutter/src/states/match/match_tables_provider.dart';

class MatchTableInfoSheet extends ConsumerStatefulWidget {
  final int scheduledMatchId;

  const MatchTableInfoSheet({
    super.key,
    required this.scheduledMatchId,
  });

  @override
  ConsumerState<MatchTableInfoSheet> createState() =>
      _MatchTableInfoSheetState();
}

class _MatchTableInfoSheetState extends ConsumerState<MatchTableInfoSheet> {
  late Future<MatchScheduleInfo> _detailsFuture;
  bool _isUnsubscribing = false;
  bool _isRemovingPlayer = false;

  @override
  void initState() {
    super.initState();
    _detailsFuture = ref
        .read(matchTablesProvider.notifier)
        .getTableDetails(widget.scheduledMatchId, forceRefresh: true);
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.8,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(28),
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: FutureBuilder<MatchScheduleInfo>(
          future: _detailsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return _buildLoading(context);
            }

            if (snapshot.hasError) {
              final error = snapshot.error is RootHubException
                  ? snapshot.error! as RootHubException
                  : defaultException;
              return _buildError(context, error);
            }

            final tableInfo = snapshot.data;
            return _buildContent(context, tableInfo);
          },
        ),
      ),
    );
  }

  Widget _buildLoading(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        _buildDragHandle(context),
        Expanded(
          child: Center(
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
                  'Loading table details...',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildError(BuildContext context, RootHubException error) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 16, 18, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: _buildDragHandle(context)),
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
                  onPressed: () {
                    setState(() {
                      _detailsFuture = ref
                          .read(matchTablesProvider.notifier)
                          .getTableDetails(
                            widget.scheduledMatchId,
                            forceRefresh: true,
                          );
                    });
                  },
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

  Widget _buildContent(BuildContext context, MatchScheduleInfo? tableInfo) {
    final colorScheme = Theme.of(context).colorScheme;
    final localizations = MaterialLocalizations.of(context);
    final table = tableInfo?.matchSchedule;

    if (table == null) {
      return _buildError(
        context,
        RootHubException(
          title: 'Table not found',
          description: 'Unable to load table details.',
        ),
      );
    }

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

    final participatingPlayers =
        tableInfo?.players ?? const <MatchSchedulePlayerSnapshot>[];

    return Column(
      children: [
        _buildDragHandle(context),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(18, 4, 18, 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Table Details',
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
                                  ?.copyWith(fontWeight: FontWeight.w900),
                            ),
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
                      'No players have joined this table yet.',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
                else
                  for (final participant in participatingPlayers)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 14),
                      child: _buildParticipantCard(context, participant),
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
        _buildBottomActions(
          context,
          table: table,
          participatingPlayers: participatingPlayers,
        ),
      ],
    );
  }

  Future<void> _confirmUnsubscribe(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Leave this table?'),
          content: const Text(
            'You will be unsubscribed from this match and removed from the '
            'players list. You can rejoin later if seats are still available.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(false),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () => Navigator.of(dialogContext).pop(true),
              style: FilledButton.styleFrom(
                backgroundColor: Theme.of(dialogContext).colorScheme.error,
                foregroundColor: Theme.of(dialogContext).colorScheme.onError,
              ),
              child: const Text('Leave'),
            ),
          ],
        );
      },
    );

    if (confirmed != true || !mounted) {
      return;
    }

    setState(() => _isUnsubscribing = true);

    final error = await ref
        .read(matchChatProvider.notifier)
        .unsubscribeFromTable();

    if (!mounted) {
      return;
    }

    if (error != null) {
      setState(() => _isUnsubscribing = false);
      await showErrorDialog(
        context,
        title: error.title,
        description: error.description,
      );
      return;
    }

    Navigator.of(context).pop(true);
  }

  Widget _buildBottomActions(
    BuildContext context, {
    required MatchSchedulePairingAttempt table,
    required List<MatchSchedulePlayerSnapshot> participatingPlayers,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final authState = ref.watch(authFlowProvider);
    final currentPlayer = authState.maybeWhen(
      authenticated: (playerData) => playerData,
      orElse: () => null,
    );
    final isHost =
        currentPlayer?.id != null && table.playerDataId == currentPlayer!.id;

    final removablePlayers = participatingPlayers
        .where((p) => p.playerData.id != currentPlayer?.id)
        .toList();

    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(18, 10, 18, 14),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
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
                    child: const Text('Close'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: FilledButton.icon(
                    onPressed: _isUnsubscribing
                        ? null
                        : () => _confirmUnsubscribe(context),
                    style: FilledButton.styleFrom(
                      minimumSize: const Size(double.infinity, 52),
                      maximumSize: const Size(double.infinity, 52),
                      backgroundColor: colorScheme.error,
                      foregroundColor: colorScheme.onError,
                    ),
                    icon: _isUnsubscribing
                        ? SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: colorScheme.onError,
                            ),
                          )
                        : const Icon(Icons.person_remove_rounded),
                    label: Text(
                      _isUnsubscribing ? 'Leaving...' : 'Leave Table',
                    ),
                  ),
                ),
              ],
            ),
            if (isHost && removablePlayers.isNotEmpty) ...[
              const SizedBox(height: 10),
              OutlinedButton.icon(
                onPressed: _isRemovingPlayer
                    ? null
                    : () => _showRemovePlayerDialog(
                        context,
                        removablePlayers: removablePlayers,
                      ),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 52),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  side: BorderSide(
                    color: colorScheme.error.withValues(alpha: 0.5),
                  ),
                  foregroundColor: colorScheme.error,
                ),
                icon: _isRemovingPlayer
                    ? SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: colorScheme.error,
                        ),
                      )
                    : const Icon(Icons.group_remove_rounded),
                label: Text(
                  _isRemovingPlayer ? 'Removing...' : 'Remove Player',
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Future<void> _showRemovePlayerDialog(
    BuildContext context, {
    required List<MatchSchedulePlayerSnapshot> removablePlayers,
  }) async {
    final colorScheme = Theme.of(context).colorScheme;

    final selectedPlayer = await showDialog<MatchSchedulePlayerSnapshot>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Remove a Player'),
          content: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Select a player to remove from the table.',
                  style: Theme.of(dialogContext).textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 16),
                ...removablePlayers.map(
                  (player) => _buildRemovePlayerTile(
                    dialogContext,
                    player: player,
                    onTap: () => Navigator.of(dialogContext).pop(player),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );

    if (selectedPlayer == null || !mounted) {
      return;
    }

    await _confirmRemovePlayer(context, player: selectedPlayer);
  }

  Widget _buildRemovePlayerTile(
    BuildContext context, {
    required MatchSchedulePlayerSnapshot player,
    required VoidCallback onTap,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final playerData = player.playerData;
    final factionColor = playerData.favoriteFaction.factionColor;
    final imageUrl = player.profileImageUrl?.trim();

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: factionColor.withValues(alpha: 0.4),
            ),
            color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.4),
          ),
          child: Row(
            children: [
              _buildUserAvatar(context, imageUrl),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      playerData.displayName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      playerData.favoriteFaction.displayName,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: factionColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.close_rounded,
                color: colorScheme.error,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _confirmRemovePlayer(
    BuildContext context, {
    required MatchSchedulePlayerSnapshot player,
  }) async {
    final playerName = player.playerData.displayName;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: Text('Remove $playerName?'),
          content: Text(
            '$playerName will be removed from the table and will need to '
            'rejoin if seats are still available.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(false),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () => Navigator.of(dialogContext).pop(true),
              style: FilledButton.styleFrom(
                backgroundColor: Theme.of(dialogContext).colorScheme.error,
                foregroundColor: Theme.of(dialogContext).colorScheme.onError,
              ),
              child: const Text('Remove'),
            ),
          ],
        );
      },
    );

    if (confirmed != true || !mounted) {
      return;
    }

    final playerDataId = player.playerData.id;
    if (playerDataId == null) {
      return;
    }

    setState(() => _isRemovingPlayer = true);

    final error = await ref
        .read(matchChatProvider.notifier)
        .removePlayerFromTable(playerDataId: playerDataId);

    if (!mounted) {
      return;
    }

    if (error != null) {
      setState(() => _isRemovingPlayer = false);
      await showErrorDialog(
        context,
        title: error.title,
        description: error.description,
      );
      return;
    }

    setState(() {
      _isRemovingPlayer = false;
      _detailsFuture = ref
          .read(matchTablesProvider.notifier)
          .getTableDetails(widget.scheduledMatchId, forceRefresh: true);
    });
  }

  Widget _buildDragHandle(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: 50,
      height: 5,
      margin: const EdgeInsets.only(top: 12, bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        color: colorScheme.outlineVariant,
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
          Icon(icon, size: 15, color: colorScheme.onSurfaceVariant),
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
                      _buildUserAvatar(context, imageUrl),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          playerData.displayName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.w900),
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

  Widget _buildUserAvatar(BuildContext context, String? imageUrl) {
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
}
