import 'package:flutter/material.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ListView(
      padding: EdgeInsets.fromLTRB(16, 4, 16, 22),
      children: [
        Container(
          padding: EdgeInsets.all(18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: colorScheme.outlineVariant),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                colorScheme.tertiary.withValues(alpha: 0.12),
                colorScheme.primary.withValues(alpha: 0.1),
                colorScheme.surface,
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.storefront_rounded,
                color: colorScheme.tertiary,
                size: 30,
              ),
              SizedBox(height: 10),
              Text(
                t.shop.ui_screens_shop_screen.shopFeaturePlaceholder,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 8),
              Text(
                t
                        .shop
                        .ui_screens_shop_screen
                        .thisAreaWillHostFutureDigitalGoodsCosmeticsAnd +
                    t
                        .shop
                        .ui_screens_shop_screen
                        .communityDrivenBundlesForRootPlayers,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 14),
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: colorScheme.outlineVariant),
            color: colorScheme.surface.withValues(alpha: 0.9),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                t.shop.ui_screens_shop_screen.roadmapPlaceholder,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 8),
              Text(
                t
                        .shop
                        .ui_screens_shop_screen
                        .plannedThemedProfilePacksFactionCosmeticsAndEvent +
                    t
                        .shop
                        .ui_screens_shop_screen
                        .supporterPacksLinkedToCommunityTournaments,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
