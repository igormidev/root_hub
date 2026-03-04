import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';
import 'package:root_hub_flutter/src/core/extension/match_podium_extension.dart';
import 'package:root_hub_flutter/src/features/match/ui/sheets/match_table_info_bottom_actions_widget.dart';
import 'package:root_hub_flutter/src/features/match/ui/sheets/match_table_info_drag_handle_widget.dart';
import 'package:root_hub_flutter/src/features/match/ui/sheets/match_table_info_info_chip_widget.dart';
import 'package:root_hub_flutter/src/features/match/ui/sheets/match_table_info_participant_card_widget.dart';

class MatchTableInfoContentWidget extends StatelessWidget {
  final MatchSchedulePairingAttempt table;
  final List<MatchSchedulePlayerSnapshot> participatingPlayers;
  final int? currentPlayerId;
  final bool isUnsubscribing;
  final bool isRemovingPlayer;
  final VoidCallback onClose;
  final VoidCallback onUnsubscribe;
  final void Function(Location? location) onOpenLocationInfo;
  final Future<void> Function(MatchSchedulePairingAttempt table) onShareTable;
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
    required this.onOpenLocationInfo,
    required this.onShareTable,
    required this.onShowRemovePlayerDialog,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final localizations = MaterialLocalizations.of(context);

    final startAt = table.attemptedAt.toLocal();
    final canShareTable = table.id != null && table.id! > 0;
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
        googlePlace?.name ??
        manualLocation?.title ??
        t.match.ui_screens_match_table_card_widget.unknownLocation;
    final locationSubtitle =
        googlePlace?.shortFormattedAddress ??
        googlePlace?.formattedAddress ??
        manualLocation?.cityName ??
        t.match.ui_screens_match_table_card_widget.addressUnavailable;

    final minPlayers = table.minAmountOfPlayers.playerCount;
    final maxPlayers = table.maxAmountOfPlayers.playerCount;
    final subscriptions = table.subscriptions ?? <MatchSubscription>[];
    final subscribedPlayersCount = subscriptions.length;
    final notPlayedReasonDetails = table.notPlayedReasonDetails?.trim();
    final hasNotPlayedReasonDetails =
        notPlayedReasonDetails != null && notPlayedReasonDetails.isNotEmpty;
    final notPlayedMarkedByDisplayName = table.notPlayedMarkedBy?.displayName;

    return Column(
      children: [
        MatchTableInfoDragHandleWidget(),
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(18, 16, 18, 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        table.title,
                        style: GoogleFonts.cinzel(
                          fontSize: 29,
                          fontWeight: FontWeight.w700,
                          color: colorScheme.onSurface,
                        ),
                      ),
                    ),
                    if (canShareTable) ...[
                      SizedBox(width: 10),
                      Tooltip(
                        message: t
                            .match
                            .ui_screens_match_table_card_widget
                            .shareThisMatch,
                        child: FilledButton.tonalIcon(
                          onPressed: () async {
                            await onShareTable(table);
                          },
                          style: FilledButton.styleFrom(
                            visualDensity: VisualDensity.compact,
                            padding: EdgeInsets.fromLTRB(10, 6, 10, 6),
                            minimumSize: Size(0, 42),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          icon: Icon(
                            Icons.share_rounded,
                            size: 18,
                          ),
                          label: Text(
                            t.match.ui_screens_match_table_card_widget.share,
                            style: Theme.of(context).textTheme.labelLarge
                                ?.copyWith(fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                    ],
                  ],
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
                      text: t.match.ui_sheets_match_table_info_content_widget
                          .seatsCount(
                            subscribedPlayersCount: subscribedPlayersCount,
                            maxPlayers: maxPlayers,
                          ),
                    ),
                    MatchTableInfoInfoChipWidget(
                      icon: Icons.person_outline_rounded,
                      text:
                          table.host?.displayName ??
                          t
                              .match
                              .ui_sheets_match_table_info_content_widget
                              .unknownHost,
                    ),
                    MatchTableInfoInfoChipWidget(
                      icon: Icons.social_distance_rounded,
                      text: t.match.ui_sheets_match_table_info_content_widget
                          .playersRange(
                            minPlayers: minPlayers,
                            maxPlayers: maxPlayers,
                          ),
                    ),
                    MatchTableInfoInfoChipWidget(
                      icon: Icons.task_alt_rounded,
                      text: t.match.ui_sheets_match_table_info_content_widget
                          .statusValue(
                            value: _statusLabel(table.status),
                          ),
                    ),
                  ],
                ),
                if (table.status == MatchScheduleStatus.notPlayed) ...[
                  SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: colorScheme.errorContainer),
                      color: colorScheme.errorContainer.withValues(alpha: 0.36),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          t
                              .match
                              .ui_sheets_match_table_info_content_widget
                              .thisMatchWasMarkedAsNotPlayed,
                          style: Theme.of(context).textTheme.titleSmall
                              ?.copyWith(
                                fontWeight: FontWeight.w900,
                                color: colorScheme.onErrorContainer,
                              ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          t.match.ui_sheets_match_table_info_content_widget
                              .reasonValue(
                                value: _notPlayedReasonLabel(
                                  table.notPlayedReason,
                                ),
                              ),
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                fontWeight: FontWeight.w800,
                                color: colorScheme.onErrorContainer,
                              ),
                        ),
                        if (notPlayedMarkedByDisplayName != null) ...[
                          SizedBox(height: 2),
                          Text(
                            t.match.ui_sheets_match_table_info_content_widget
                                .markedByValue(
                                  value: notPlayedMarkedByDisplayName,
                                ),
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: colorScheme.onErrorContainer,
                                ),
                          ),
                        ],
                        if (hasNotPlayedReasonDetails) ...[
                          SizedBox(height: 4),
                          Text(
                            t.match.ui_sheets_match_table_info_content_widget
                                .detailsValue(
                                  value: notPlayedReasonDetails,
                                ),
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: colorScheme.onErrorContainer,
                                ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
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
                          SizedBox(width: 6),
                          Tooltip(
                            message: t
                                .match
                                .ui_screens_match_table_card_widget
                                .openFullLocationDetails,
                            child: IconButton(
                              visualDensity: VisualDensity.compact,
                              onPressed: () {
                                onOpenLocationInfo(location);
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
                      .ui_sheets_match_table_info_content_widget
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
                            .ui_sheets_match_table_info_content_widget
                            .noPlayersSubscribedYet
                      : t
                            .match
                            .ui_sheets_match_table_info_content_widget
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
                          .ui_sheets_match_table_info_content_widget
                          .noPlayersHaveJoinedThisTableYet,
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
                  t.match.ui_sheets_match_table_info_content_widget
                      .createdAtValue(value: createdLabel),
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

  String _statusLabel(MatchScheduleStatus status) {
    final contentT = t.match.ui_sheets_match_table_info_content_widget;

    switch (status) {
      case MatchScheduleStatus.scheduled:
        return contentT.statusScheduled;
      case MatchScheduleStatus.notPlayed:
        return contentT.statusNotPlayed;
      case MatchScheduleStatus.played:
        return contentT.statusPlayed;
    }
  }

  String _notPlayedReasonLabel(MatchScheduleNotPlayedReason? reason) {
    final contentT = t.match.ui_sheets_match_table_info_content_widget;

    switch (reason) {
      case MatchScheduleNotPlayedReason.notEnoughPlayers:
        return contentT.reasonNotEnoughPlayers;
      case MatchScheduleNotPlayedReason.hostUnavailable:
        return contentT.reasonHostUnavailable;
      case MatchScheduleNotPlayedReason.noGameCopyAvailable:
        return contentT.reasonNoGameCopyAvailable;
      case MatchScheduleNotPlayedReason.venueIssue:
        return contentT.reasonVenueIssue;
      case MatchScheduleNotPlayedReason.playerNoShow:
        return contentT.reasonPlayerNoShow;
      case MatchScheduleNotPlayedReason.weatherOrEmergency:
        return contentT.reasonWeatherOrEmergency;
      case MatchScheduleNotPlayedReason.expiredWithoutResult:
        return contentT.reasonExpiredWithoutResult;
      case MatchScheduleNotPlayedReason.other:
        return contentT.reasonOther;
      case null:
        return contentT.reasonNotProvided;
    }
  }
}
