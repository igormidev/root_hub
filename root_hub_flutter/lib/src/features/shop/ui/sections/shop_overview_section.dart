import 'package:flutter/material.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';

class ShopOverviewSection extends StatelessWidget {
  const ShopOverviewSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.storefront_rounded,
              size: 24,
              color: colorScheme.primary,
            ),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                t.shop.ui_screens_shop_screen.shopHeaderTitle,
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Text(
          t.shop.ui_screens_shop_screen.shopHeaderDescription,
          style: textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w700,
            height: 1.36,
          ),
        ),
      ],
    );
  }
}
