import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/core/extension/match_podium_extension.dart';
import 'package:root_hub_flutter/src/features/match/ui/screens/match_info_chip_widget.dart';
import 'package:root_hub_flutter/src/features/match/ui/screens/match_participant_card_widget.dart';

class MatchJoinSheetContentWidget extends StatelessWidget {
  const MatchJoinSheetContentWidget({
    required this.tableId,
    required this.tableInfo,
    required this.currentPlayer,
    required this.fallbackTable,
    required this.onOpenChat,
    required this.onOpenLocationInfo,
    super.key,
  });

  final int tableId;
  final MatchScheduleInfo? tableInfo;
  final PlayerData? currentPlayer;
  final MatchSchedulePairingAttempt fallbackTable;
  final VoidCallback onOpenChat;
  final void Function(Location? location) onOpenLocationInfo;

  @override
  Widget build(BuildContext context) {
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
        subscriptions.any((entry) => entry.playerDataId == currentPlayer?.id);

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
                      onOpenChat();
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
                    MatchInfoChipWidget(
                      icon: Icons.calendar_month_rounded,
                      text: startLabel,
                    ),
                    MatchInfoChipWidget(
                      icon: Icons.groups_2_rounded,
                      text: '$subscribedPlayersCount/$maxPlayers seats',
                    ),
                    MatchInfoChipWidget(
                      icon: Icons.person_outline_rounded,
                      text: table.host?.displayName ?? 'Unknown host',
                    ),
                    MatchInfoChipWidget(
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
                              onOpenLocationInfo(location);
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
                      child: MatchParticipantCardWidget(
                        playerSnapshot: participant,
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
}
