import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';

class ShopOverviewSection extends StatelessWidget {
  const ShopOverviewSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: colorScheme.outlineVariant,
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colorScheme.primaryContainer.withValues(alpha: 0.22),
            colorScheme.tertiaryContainer.withValues(alpha: 0.24),
            colorScheme.surface.withValues(alpha: 0.96),
          ],
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 24,
            offset: Offset(0, 10),
            color: colorScheme.shadow.withValues(alpha: 0.09),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: colorScheme.primary.withValues(alpha: 0.12),
            ),
            child: Icon(
              Icons.storefront_rounded,
              color: colorScheme.primary,
              size: 24,
            ),
          ),
          SizedBox(height: 12),
          Text(
            t.shop.ui_screens_shop_screen.overviewTitle,
            style: textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: 8),
          Text(
            t.shop.ui_screens_shop_screen.overviewDescription,
            style: textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w700,
              height: 1.36,
            ),
          ),
          SizedBox(height: 12),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(999),
              color: colorScheme.primary.withValues(alpha: 0.1),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.zoom_in_rounded,
                  size: 16,
                  color: colorScheme.primary,
                ),
                SizedBox(width: 6),
                Flexible(
                  child: Text(
                    t.shop.ui_screens_shop_screen.imageInteractionHint,
                    style: GoogleFonts.getFont(
                      'MedievalSharp',
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
