import 'package:flutter/material.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';

class MatchNoMatchesStateWidget extends StatelessWidget {
  const MatchNoMatchesStateWidget({
    required this.onHostFirstTable,
    super.key,
  });

  final VoidCallback onHostFirstTable;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: EdgeInsets.fromLTRB(16, 20, 16, 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: colorScheme.outlineVariant),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            colorScheme.surfaceContainerHighest.withValues(alpha: 0.7),
            colorScheme.surfaceContainerLow.withValues(alpha: 0.5),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colorScheme.primaryContainer,
            ),
            child: Icon(
              Icons.map_rounded,
              color: colorScheme.onPrimaryContainer,
              size: 30,
            ),
          ),
          SizedBox(height: 12),
          Text(
            t
                .match
                .ui_screens_match_no_matches_state_widget
                .noTablesInYourAreaYet,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: 6),
          Text(
            t
                .match
                .ui_screens_match_no_matches_state_widget
                .beTheFirstToStartOneHostANewTableSoNearbyPlayersCanSubscribe,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w700,
              height: 1.35,
            ),
          ),
          SizedBox(height: 14),
          FilledButton.icon(
            onPressed: onHostFirstTable,
            icon: Icon(Icons.add_rounded),
            label: Text(
              t
                  .match
                  .ui_screens_match_no_matches_state_widget
                  .hostTheFirstTable,
            ),
          ),
        ],
      ),
    );
  }
}
