import 'package:flutter/material.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';
import 'package:root_hub_flutter/src/core/content/shop_content.dart';
import 'package:root_hub_flutter/src/features/shop/ui/cards/shop_product_card.dart';

class ShopProductListSection extends StatelessWidget {
  const ShopProductListSection({
    required this.products,
    required this.locale,
    super.key,
  });

  final List<ProductContent> products;
  final ValidCountry locale;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (products.isEmpty)
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(14, 16, 14, 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: colorScheme.outlineVariant,
              ),
              color: colorScheme.surfaceContainerHigh.withValues(alpha: 0.55),
            ),
            child: Text(
              t.shop.ui_screens_shop_screen.noProductsAvailable,
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        else
          ...products.indexed.map((entry) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: entry.$1 == products.length - 1 ? 0 : 16,
              ),
              child: ShopProductCard(
                content: entry.$2,
                locale: locale,
              ),
            );
          }),
      ],
    );
  }
}
