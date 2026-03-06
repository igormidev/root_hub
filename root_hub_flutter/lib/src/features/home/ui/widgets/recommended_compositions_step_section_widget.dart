import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecommendedCompositionsStepSectionWidget extends StatelessWidget {
  const RecommendedCompositionsStepSectionWidget({
    required this.title,
    required this.description,
    required this.child,
    super.key,
  });

  final String title;
  final String description;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.cormorantGaramond(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            color: colorScheme.onSurface,
            height: 0.98,
          ),
        ),
        SizedBox(height: 6),
        Text(
          description,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w700,
            height: 1.35,
          ),
        ),
        SizedBox(height: 14),
        child,
      ],
    );
  }
}
