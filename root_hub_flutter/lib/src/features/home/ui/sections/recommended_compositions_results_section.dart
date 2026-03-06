import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';
import 'package:root_hub_flutter/src/core/content/recomended_factions_content.dart';
import 'package:root_hub_flutter/src/features/home/ui/widgets/recommended_composition_card_widget.dart';

class RecommendedCompositionsResultsSection extends StatelessWidget {
  const RecommendedCompositionsResultsSection({
    required this.compositions,
    super.key,
  });

  final List<RecomendedFactionComposition> compositions;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      key: key,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.home.ui_screens_recommended_compositions_screen.resultsTitle,
          style: GoogleFonts.cormorantGaramond(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            color: colorScheme.onSurface,
            height: 0.98,
          ),
        ),
        SizedBox(height: 6),
        Text(
          t.home.ui_screens_recommended_compositions_screen.resultsDescription,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w700,
            height: 1.35,
          ),
        ),
        SizedBox(height: 16),
        for (var index = 0; index < compositions.length; index++) ...[
          if (index != 0) SizedBox(height: 14),
          RecommendedCompositionCardWidget(
                composition: compositions[index],
              )
              .animate(delay: (80 * index).ms)
              .fadeIn(duration: 280.ms)
              .slideY(begin: 0.08, end: 0, duration: 420.ms),
        ],
      ],
    );
  }
}
