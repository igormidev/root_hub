import 'package:flutter/material.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';

class MatchCreateTableLocationNoSearchResultsWidget extends StatelessWidget {
  const MatchCreateTableLocationNoSearchResultsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: EdgeInsets.fromLTRB(12, 10, 12, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: colorScheme.outlineVariant),
        color: colorScheme.surface.withValues(alpha: 0.9),
      ),
      child: Text(
        t
            .match
            .ui_screens_match_create_table_location_no_search_results_widget
            .l20c9,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: colorScheme.onSurfaceVariant,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
