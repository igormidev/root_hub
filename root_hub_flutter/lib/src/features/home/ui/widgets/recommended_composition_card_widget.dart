import 'package:flutter/material.dart';
import 'package:root_hub_flutter/src/core/content/recomended_factions_content.dart';
import 'package:root_hub_flutter/src/core/extension/recomended_factions_ui_extension.dart';
import 'package:root_hub_flutter/src/features/home/ui/widgets/recommended_composition_faction_bullet_widget.dart';

class RecommendedCompositionCardWidget extends StatelessWidget {
  const RecommendedCompositionCardWidget({
    required this.composition,
    super.key,
  });

  final RecomendedFactionComposition composition;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final accentColor = composition.factions.first.accentColor;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: accentColor.withValues(alpha: 0.24),
        ),
        boxShadow: [
          BoxShadow(
            color: accentColor.withValues(alpha: 0.08),
            blurRadius: 18,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(23),
        child: Column(
          children: [
            Container(
              height: 4,
              color: accentColor.withValues(alpha: 0.84),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: Column(
                children: [
                  for (
                    var index = 0;
                    index < composition.factions.length;
                    index++
                  ) ...[
                    if (index != 0) SizedBox(height: 10),
                    RecommendedCompositionFactionBulletWidget(
                      faction: composition.factions[index],
                      label: composition.factions[index].localizedName(),
                    ),
                  ],
                  SizedBox(height: 14),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: accentColor.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Text(
                      composition.localizedDescription(),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w700,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
