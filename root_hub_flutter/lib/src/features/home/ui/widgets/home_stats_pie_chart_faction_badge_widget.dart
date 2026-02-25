import 'package:flutter/material.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/core/extension/faction_ui_extension.dart';

class HomeStatsPieChartFactionBadgeWidget extends StatelessWidget {
  const HomeStatsPieChartFactionBadgeWidget({
    required this.faction,
    super.key,
  });

  final Faction faction;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.94),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Color(0x1F000000),
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Image.asset(
          faction.getFactionIconPath(size: FactionIconSize.size80),
          width: 20,
          height: 20,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
