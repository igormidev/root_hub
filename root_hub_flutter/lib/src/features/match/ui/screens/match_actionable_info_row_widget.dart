import 'package:flutter/material.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';

class MatchActionableInfoRowWidget extends StatelessWidget {
  const MatchActionableInfoRowWidget({
    required this.icon,
    required this.label,
    required this.value,
    required this.onCopyTap,
    required this.onActionTap,
    super.key,
  });

  final IconData icon;
  final String label;
  final String value;
  final VoidCallback onCopyTap;
  final VoidCallback onActionTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(10, 9, 10, 9),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: colorScheme.outlineVariant),
          color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.45),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: colorScheme.primary,
            ),
            SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: 1),
                  Text(
                    value,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Tooltip(
                  message: t.match.ui_screens_match_actionable_info_row_widget
                      .copyLabel(label: label),
                  child: IconButton(
                    visualDensity: VisualDensity.compact,
                    onPressed: onCopyTap,
                    icon: Icon(Icons.copy_rounded),
                  ),
                ),
                Tooltip(
                  message: t.match.ui_screens_match_actionable_info_row_widget
                      .openLabel(label: label),
                  child: IconButton(
                    visualDensity: VisualDensity.compact,
                    onPressed: onActionTap,
                    icon: Icon(Icons.open_in_new_rounded),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
