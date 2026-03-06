import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:root_hub_flutter/src/core/content/recomended_factions_content.dart';

class RecommendedCompositionsPlayerCountButtonWidget extends StatelessWidget {
  const RecommendedCompositionsPlayerCountButtonWidget({
    required this.playerCount,
    required this.isEnabled,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  final AmountOfPlayersInMatch playerCount;
  final bool isEnabled;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AnimatedOpacity(
      duration: Duration(milliseconds: 220),
      opacity: isEnabled ? 1 : 0.38,
      child: AnimatedScale(
        duration: Duration(milliseconds: 220),
        curve: Curves.easeOutCubic,
        scale: isSelected ? 1 : 0.94,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: isEnabled ? onTap : null,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 220),
              curve: Curves.easeOutCubic,
              width: isSelected ? 58 : 52,
              height: isSelected ? 58 : 52,
              decoration: BoxDecoration(
                color: isSelected
                    ? colorScheme.primary
                    : colorScheme.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isSelected
                      ? colorScheme.primary.withValues(alpha: 0.36)
                      : colorScheme.outline.withValues(alpha: 0.16),
                ),
                boxShadow: [
                  BoxShadow(
                    color:
                        (isSelected ? colorScheme.primary : colorScheme.shadow)
                            .withValues(
                              alpha: isSelected ? 0.2 : 0.06,
                            ),
                    blurRadius: isSelected ? 16 : 8,
                    offset: Offset(0, isSelected ? 8 : 4),
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: Text(
                '${playerCount.asInt}',
                style: GoogleFonts.medievalSharp(
                  fontSize: isSelected ? 24 : 22,
                  fontWeight: FontWeight.w400,
                  color: isSelected
                      ? colorScheme.onPrimary
                      : colorScheme.onSurface,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
