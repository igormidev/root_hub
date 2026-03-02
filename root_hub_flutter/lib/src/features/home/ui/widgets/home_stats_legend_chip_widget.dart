import 'package:flutter/material.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/core/extension/faction_ui_extension.dart';

class HomeStatsLegendChipWidget extends StatelessWidget {
  const HomeStatsLegendChipWidget({
    required this.faction,
    super.key,
  });

  final Faction faction;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 7,
      ),
      decoration: BoxDecoration(
        color: colorScheme.surface.withValues(alpha: 0.78),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.6),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: faction.factionColor,
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          SizedBox(width: 6),
          Image.asset(
            faction.getFactionIconPath(size: FactionIconSize.size80),
            width: 16,
            height: 16,
            fit: BoxFit.contain,
          ),
          SizedBox(width: 6),
          Text(
            faction.displayName,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}
