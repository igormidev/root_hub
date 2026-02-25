import 'package:flutter/material.dart';

class MatchInfoChipWidget extends StatelessWidget {
  const MatchInfoChipWidget({
    required this.icon,
    required this.text,
    this.tooltipMessage,
    this.triggerMode = TooltipTriggerMode.longPress,
    super.key,
  });

  final IconData icon;
  final String text;
  final String? tooltipMessage;
  final TooltipTriggerMode triggerMode;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final chip = Container(
      padding: EdgeInsets.fromLTRB(10, 6, 10, 6),
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
          SizedBox(width: 5),
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

    if (tooltipMessage == null) {
      return chip;
    }

    return Tooltip(
      message: tooltipMessage,
      triggerMode: triggerMode,
      child: chip,
    );
  }
}
