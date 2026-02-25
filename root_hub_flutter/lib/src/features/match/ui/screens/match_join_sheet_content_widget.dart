import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/core/extension/match_podium_extension.dart';
import 'package:root_hub_flutter/src/features/match/ui/screens/match_info_chip_widget.dart';
import 'package:root_hub_flutter/src/features/match/ui/screens/match_participant_card_widget.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';

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
    final subscriptions = table.subscriptions ?? <MatchSubscription>[];
    final subscribedPlayersCount = subscriptions.length;
    final isSubscribed =
        currentPlayer != null &&
        subscriptions.any((entry) => entry.playerDataId == currentPlayer?.id);

    final participatingPlayers =
        tableInfo?.players ?? <MatchSchedulePlayerSnapshot>[];
    final isClosed = table.closedForSubscriptions == true;

    return Column(
      children: [
        Container(
          width: 50,
          height: 5,
          margin: EdgeInsets.only(top: 12, bottom: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(999),
            color: colorScheme.outlineVariant,
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(18, 4, 18, 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  t
                      .match
                      .ui_screens_match_join_sheet_content_widget
                      .confirmTableSubscription,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  table.title,
                  style: GoogleFonts.cinzel(
                    fontSize: 29,
                    fontWeight: FontWeight.w700,
                    color: colorScheme.onSurface,
                  ),
                ),
                if (table.description?.trim().isNotEmpty == true) ...[
                  SizedBox(height: 4),
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
                  SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(12, 10, 12, 10),
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
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            t
                                    .match
                                    .ui_screens_match_join_sheet_content_widget
                                    .theHostHasClosedSubscriptionsForThisTable +
                                t
                                    .match
                                    .ui_screens_match_join_sheet_content_widget
                                    .newPlayersCannotJoinAtThisTime,
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
                SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                      onOpenChat();
                    },
                    icon: Icon(Icons.chat_bubble_rounded),
                    label: Text(
                      t
                          .match
                          .ui_screens_match_join_sheet_content_widget
                          .seeTableChat,
                    ),
                    style: FilledButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      maximumSize: Size(double.infinity, 50),
                      backgroundColor: colorScheme.primary,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 12),
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
                      text:
                          table.host?.displayName ??
                          t
                              .match
                              .ui_screens_match_join_sheet_content_widget
                              .unknownHost,
                    ),
                    MatchInfoChipWidget(
                      icon: Icons.social_distance_rounded,
                      text: '$minPlayers-$maxPlayers players',
                    ),
                  ],
                ),
                SizedBox(height: 14),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
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
                          SizedBox(width: 6),
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
                            icon: Icon(Icons.info_outline_rounded),
                          ),
                        ],
                      ),
                      SizedBox(height: 2),
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
                SizedBox(height: 14),
                Text(
                  t
                      .match
                      .ui_screens_match_join_sheet_content_widget
                      .playersInThisMatch,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  participatingPlayers.isEmpty
                      ? t
                            .match
                            .ui_screens_match_join_sheet_content_widget
                            .noPlayersSubscribedYet
                      : t
                            .match
                            .ui_screens_match_join_sheet_content_widget
                            .theseAreTheCurrentPlayersThatWillParticipate,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 10),
                if (participatingPlayers.isEmpty)
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(12, 14, 12, 14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: colorScheme.surfaceContainerHighest.withValues(
                        alpha: 0.52,
                      ),
                    ),
                    child: Text(
                      t
                          .match
                          .ui_screens_match_join_sheet_content_widget
                          .youCanBeTheFirstPlayerToLockThisTableIn,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
                else
                  for (final participant in participatingPlayers)
                    Padding(
                      padding: EdgeInsets.only(bottom: 14),
                      child: MatchParticipantCardWidget(
                        playerSnapshot: participant,
                      ),
                    ),
                SizedBox(height: 2),
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
            padding: EdgeInsets.fromLTRB(18, 10, 18, 14),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    style: OutlinedButton.styleFrom(
                      minimumSize: Size(double.infinity, 52),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      t.match.ui_screens_match_join_sheet_content_widget.cancel,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: FilledButton(
                    onPressed: isSubscribed || isClosed
                        ? null
                        : () => Navigator.of(context).pop(true),
                    style: FilledButton.styleFrom(
                      minimumSize: Size(double.infinity, 52),
                      maximumSize: Size(double.infinity, 52),
                      backgroundColor: colorScheme.primary,
                      foregroundColor: Colors.white,
                    ),
                    child: Text(
                      isSubscribed
                          ? t
                                .match
                                .ui_screens_match_join_sheet_content_widget
                                .alreadySubscribed
                          : isClosed
                          ? t
                                .match
                                .ui_screens_match_join_sheet_content_widget
                                .subscriptionsClosed
                          : t
                                .match
                                .ui_screens_match_join_sheet_content_widget
                                .confirmJoin,
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
