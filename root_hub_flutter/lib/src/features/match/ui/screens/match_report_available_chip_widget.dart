import 'package:flutter/material.dart';

class MatchReportAvailableChipWidget extends StatelessWidget {
  const MatchReportAvailableChipWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Tooltip(
      message: 'You can report this match result now.',
      triggerMode: TooltipTriggerMode.tap,
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 6, 10, 6),
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
            const SizedBox(width: 5),
            Text(
              'Report available',
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
