import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/core/extension/match_podium_extension.dart';
import 'package:root_hub_flutter/src/features/match/ui/sheets/match_table_info_bottom_actions_widget.dart';
import 'package:root_hub_flutter/src/features/match/ui/sheets/match_table_info_drag_handle_widget.dart';
import 'package:root_hub_flutter/src/features/match/ui/sheets/match_table_info_info_chip_widget.dart';
import 'package:root_hub_flutter/src/features/match/ui/sheets/match_table_info_participant_card_widget.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';

class MatchTableInfoContentWidget extends StatelessWidget {
  final MatchSchedulePairingAttempt table;
  final List<MatchSchedulePlayerSnapshot> participatingPlayers;
  final int? currentPlayerId;
  final bool isUnsubscribing;
  final bool isRemovingPlayer;
  final VoidCallback onClose;
  final VoidCallback onUnsubscribe;
  final Future<void> Function(List<MatchSchedulePlayerSnapshot>)
  onShowRemovePlayerDialog;

  const MatchTableInfoContentWidget({
    super.key,
    required this.table,
    required this.participatingPlayers,
    required this.currentPlayerId,
    required this.isUnsubscribing,
    required this.isRemovingPlayer,
    required this.onClose,
    required this.onUnsubscribe,
    required this.onShowRemovePlayerDialog,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final localizations = MaterialLocalizations.of(context);

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

    return Column(
      children: [
        MatchTableInfoDragHandleWidget(),
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(18, 4, 18, 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  t.match.ui_sheets_match_table_info_content_widget.l73c19,
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
                SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    MatchTableInfoInfoChipWidget(
                      icon: Icons.calendar_month_rounded,
                      text: startLabel,
                    ),
                    MatchTableInfoInfoChipWidget(
                      icon: Icons.groups_2_rounded,
                      text: '$subscribedPlayersCount/$maxPlayers seats',
                    ),
                    MatchTableInfoInfoChipWidget(
                      icon: Icons.person_outline_rounded,
                      text:
                          table.host?.displayName ??
                          t
                              .match
                              .ui_sheets_match_table_info_content_widget
                              .l114c56,
                    ),
                    MatchTableInfoInfoChipWidget(
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
                                  ?.copyWith(fontWeight: FontWeight.w900),
                            ),
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
                  t.match.ui_sheets_match_table_info_content_widget.l165c19,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  participatingPlayers.isEmpty
                      ? t
                            .match
                            .ui_sheets_match_table_info_content_widget
                            .l173c25
                      : t
                            .match
                            .ui_sheets_match_table_info_content_widget
                            .l174c25,
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
                      t.match.ui_sheets_match_table_info_content_widget.l192c23,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
                else
                  for (final participant in participatingPlayers)
                    Padding(
                      padding: EdgeInsets.only(bottom: 14),
                      child: MatchTableInfoParticipantCardWidget(
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
        MatchTableInfoBottomActionsWidget(
          table: table,
          participatingPlayers: participatingPlayers,
          currentPlayerId: currentPlayerId,
          isUnsubscribing: isUnsubscribing,
          isRemovingPlayer: isRemovingPlayer,
          onClose: onClose,
          onUnsubscribe: onUnsubscribe,
          onShowRemovePlayerDialog: onShowRemovePlayerDialog,
        ),
      ],
    );
  }
}
