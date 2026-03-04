import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/core/extension/match_podium_extension.dart';
import 'package:root_hub_flutter/src/features/match/ui/screens/match_info_chip_widget.dart';
import 'package:root_hub_flutter/src/features/match/ui/screens/match_report_available_chip_widget.dart';
import 'package:root_hub_flutter/src/features/match/ui/screens/match_time_status_chip_widget.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';

class MatchTableCardWidget extends StatelessWidget {
  const MatchTableCardWidget({
    required this.table,
    required this.currentPlayer,
    required this.isSubscribing,
    required this.canReportResultNow,
    required this.currentTime,
    required this.distanceLabel,
    required this.formatDurationToClock,
    required this.onOpenLocationInfo,
    required this.onOpenJoinTable,
    required this.onOpenSubscribedChat,
    required this.onShareTable,
    super.key,
  });

  final MatchSchedulePairingAttempt table;
  final PlayerData? currentPlayer;
  final bool isSubscribing;
  final bool canReportResultNow;
  final DateTime currentTime;
  final String? distanceLabel;
  final String Function(Duration duration) formatDurationToClock;
  final void Function(Location? location) onOpenLocationInfo;
  final Future<void> Function({
    required int? tableId,
    required MatchSchedulePairingAttempt fallbackTable,
    required PlayerData? currentPlayer,
  })
  onOpenJoinTable;
  final void Function(int tableId, String tableTitle) onOpenSubscribedChat;
  final Future<void> Function(MatchSchedulePairingAttempt table) onShareTable;

  @override
  Widget build(BuildContext context) {
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
    final isSubscribed =
        currentPlayer != null &&
        subscriptions.any((entry) => entry.playerDataId == currentPlayer?.id);
    final isFull = subscribedPlayersCount >= maxPlayers;
    final isClosed = table.closedForSubscriptions == true;
    final remainingSeats = (maxPlayers - subscribedPlayersCount).clamp(
      0,
      maxPlayers,
    );

    final actionEnabled =
        tableId != null &&
        !isSubscribing &&
        !isSubscribed &&
        !isFull &&
        !isClosed;
    final canOpenSubscribedChat = tableId != null && isSubscribed;

    final actionLabel = switch ((isSubscribing, isClosed, isFull)) {
      (true, _, _) => t.match.ui_screens_match_table_card_widget.joining,
      (_, true, _) => t.match.ui_screens_match_table_card_widget.closed,
      (_, _, true) => t.match.ui_screens_match_table_card_widget.tableFull,
      _ => t.match.ui_screens_match_table_card_widget.joinTable,
    };

    final cardContent = Container(
      padding: EdgeInsets.fromLTRB(14, 14, 14, 14),
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
            offset: Offset(0, 10),
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
                      SizedBox(height: 4),
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
              SizedBox(width: 8),
              Tooltip(
                message:
                    t.match.ui_screens_match_table_card_widget.shareThisMatch,
                child: FilledButton.tonalIcon(
                  onPressed: () async {
                    await onShareTable(table);
                  },
                  style: FilledButton.styleFrom(
                    visualDensity: VisualDensity.compact,
                    padding: EdgeInsets.fromLTRB(10, 6, 10, 6),
                    minimumSize: Size(0, 34),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  icon: Icon(
                    Icons.share_rounded,
                    size: 16,
                  ),
                  label: Text(
                    t.match.ui_screens_match_table_card_widget.share,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8),
              Tooltip(
                triggerMode: TooltipTriggerMode.tap,
                message: t.match.ui_screens_match_table_card_widget
                    .subscriptionTooltip(
                      subscribedPlayersCount: subscribedPlayersCount.toString(),
                      playersWord: subscribedPlayersCount == 1
                          ? t.match.ui_screens_match_table_card_widget.player
                          : t.match.ui_screens_match_table_card_widget.players,
                      remainingSeats: remainingSeats.toString(),
                      placesWord: remainingSeats == 1
                          ? t.match.ui_screens_match_table_card_widget.place
                          : t.match.ui_screens_match_table_card_widget.places,
                    ),
                child: Container(
                  padding: EdgeInsets.symmetric(
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
          SizedBox(height: 12),
          Row(
            children: [
              Icon(
                Icons.schedule_rounded,
                size: 18,
                color: colorScheme.primary,
              ),
              SizedBox(width: 6),
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
              SizedBox(width: 8),
              MatchTimeStatusChipWidget(
                currentTime: currentTime,
                tableStartAt: dateTime,
                formatDurationToClock: formatDurationToClock,
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.location_on_rounded,
                size: 18,
                color: colorScheme.secondary,
              ),
              SizedBox(width: 6),
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
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
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
            ],
          ),
          SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              MatchInfoChipWidget(
                icon: Icons.groups_2_rounded,
                text: t.match.ui_screens_match_table_card_widget.playersRange(
                  minPlayers: minPlayers,
                  maxPlayers: maxPlayers,
                ),
                tooltipMessage: t.match.ui_screens_match_table_card_widget
                    .playersRangeTooltip(
                      minPlayers: minPlayers,
                      maxPlayers: maxPlayers,
                    ),
                triggerMode: TooltipTriggerMode.tap,
              ),
              if (isClosed)
                MatchInfoChipWidget(
                  icon: Icons.lock_rounded,
                  text: t
                      .match
                      .ui_screens_match_table_card_widget
                      .subscriptionsClosed,
                ),
              if (distanceLabel != null)
                MatchInfoChipWidget(
                  icon: Icons.near_me_rounded,
                  text: distanceLabel!,
                ),
              if (isSubscribed)
                MatchInfoChipWidget(
                  icon: Icons.chat_bubble_rounded,
                  text: t
                      .match
                      .ui_screens_match_table_card_widget
                      .tapCardToOpenChat,
                ),
              if (canReportResultNow) MatchReportAvailableChipWidget(),
            ],
          ),
          if (!isSubscribed) ...[
            SizedBox(height: 14),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: actionEnabled
                    ? () async {
                        await onOpenJoinTable(
                          tableId: tableId,
                          fallbackTable: table,
                          currentPlayer: currentPlayer,
                        );
                      }
                    : null,
                style: FilledButton.styleFrom(
                  minimumSize: Size(double.infinity, 56),
                  maximumSize: Size(double.infinity, 56),
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
                onOpenSubscribedChat(tableId, table.title);
              },
              child: cardContent,
            ),
          )
        : cardContent;

    return Padding(
      padding: EdgeInsets.only(top: 14),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          subscribedCardContent,
          Positioned(
            left: 14,
            top: -13,
            child: Container(
              padding: EdgeInsets.fromLTRB(12, 4, 12, 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(999),
                color: colorScheme.primary,
                boxShadow: [
                  BoxShadow(
                    color: colorScheme.shadow.withValues(alpha: 0.2),
                    blurRadius: 12,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Text(
                t.match.ui_screens_match_table_card_widget.subscribed,
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
}
