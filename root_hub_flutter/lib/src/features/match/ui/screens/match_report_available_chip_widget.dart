import 'package:flutter/material.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';

class MatchReportAvailableChipWidget extends StatelessWidget {
  const MatchReportAvailableChipWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Tooltip(
      message: t.match.ui_screens_match_report_available_chip_widget.l13c16,
      triggerMode: TooltipTriggerMode.tap,
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 6, 10, 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(999),
          color: colorScheme.errorContainer.withValues(alpha: 0.72),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.info_outline_rounded,
              size: 15,
              color: colorScheme.onErrorContainer,
            ),
            SizedBox(width: 5),
            Text(
              t.match.ui_screens_match_report_available_chip_widget.l31c15,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: colorScheme.onErrorContainer,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
