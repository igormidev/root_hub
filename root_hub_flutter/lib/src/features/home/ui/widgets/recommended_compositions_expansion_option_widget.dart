import 'package:flutter/material.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';
import 'package:root_hub_flutter/src/core/content/recomended_factions_content.dart';
import 'package:root_hub_flutter/src/core/extension/recomended_factions_ui_extension.dart';

class RecommendedCompositionsExpansionOptionWidget extends StatelessWidget {
  const RecommendedCompositionsExpansionOptionWidget({
    required this.expansion,
    required this.isSelected,
    required this.onChanged,
    super.key,
  });

  final PurchasedExpansions expansion;
  final bool isSelected;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final accentColor = expansion.accentColor;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(22),
        onTap: () {
          onChanged(!isSelected);
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 220),
          curve: Curves.easeOutCubic,
          padding: EdgeInsets.fromLTRB(8, 10, 12, 10),
          decoration: BoxDecoration(
            color: isSelected
                ? accentColor.withValues(alpha: 0.1)
                : colorScheme.surface,
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: isSelected
                  ? accentColor.withValues(alpha: 0.4)
                  : colorScheme.outlineVariant.withValues(alpha: 0.56),
            ),
            boxShadow: [
              BoxShadow(
                color: (isSelected ? accentColor : colorScheme.shadow)
                    .withValues(
                      alpha: isSelected ? 0.12 : 0.05,
                    ),
                blurRadius: isSelected ? 16 : 10,
                offset: Offset(0, isSelected ? 8 : 4),
              ),
            ],
          ),
          child: Row(
            children: [
              IgnorePointer(
                child: Checkbox.adaptive(
                  value: isSelected,
                  onChanged: (_) {},
                  activeColor: accentColor,
                ),
              ),
              SizedBox(width: 4),
              Expanded(
                child: Text(
                  expansion.localizedTitle(t),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.w800,
                    height: 1.1,
                  ),
                ),
              ),
              SizedBox(width: 10),
              SizedBox(
                width: 110,
                child: Wrap(
                  alignment: WrapAlignment.end,
                  spacing: 4,
                  runSpacing: 4,
                  children: [
                    for (final faction in expansion.factionsInBox)
                      Image.asset(
                        faction.iconAssetPath,
                        width: 23,
                        height: 23,
                        fit: BoxFit.contain,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
