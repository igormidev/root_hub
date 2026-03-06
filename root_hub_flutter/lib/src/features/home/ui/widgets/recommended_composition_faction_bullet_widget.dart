import 'package:flutter/material.dart';
import 'package:root_hub_flutter/src/core/content/recomended_factions_content.dart';
import 'package:root_hub_flutter/src/core/extension/recomended_factions_ui_extension.dart';

class RecommendedCompositionFactionBulletWidget extends StatelessWidget {
  const RecommendedCompositionFactionBulletWidget({
    required this.faction,
    required this.label,
    super.key,
  });

  final RecomendedFaction faction;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 6,
          height: 6,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: faction.accentColor,
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w800,
              height: 1.1,
            ),
          ),
        ),
        SizedBox(width: 10),
        Image.asset(
          faction.iconAssetPath,
          width: 25,
          height: 25,
          fit: BoxFit.contain,
        ),
      ],
    );
  }
}
