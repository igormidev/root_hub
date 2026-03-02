import 'package:flutter/material.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';

class MatchTimeStatusChipWidget extends StatelessWidget {
  const MatchTimeStatusChipWidget({
    required this.currentTime,
    required this.tableStartAt,
    required this.formatDurationToClock,
    super.key,
  });

  final DateTime currentTime;
  final DateTime tableStartAt;
  final String Function(Duration duration) formatDurationToClock;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final remaining = tableStartAt.difference(currentTime);
    final alreadyStarted = remaining.inSeconds <= 0;
    final chipLabel = alreadyStarted
        ? 'Already started'
        : formatDurationToClock(remaining);

    return Tooltip(
      triggerMode: TooltipTriggerMode.tap,
      preferBelow: false,
      message: alreadyStarted
          ? t
                .match
                .ui_screens_match_time_status_chip_widget
                .thisMatchAlreadyStartedRecentlyStartedTablesStayVisibleForAShortPeriod
          : t
                .match
                .ui_screens_match_time_status_chip_widget
                .remainingTimeUntilTheMatchStarts,
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 6, 10, 6),
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
}
