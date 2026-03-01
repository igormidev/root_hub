import 'package:flutter/material.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';
import 'package:root_hub_flutter/src/core/content/shop_content.dart';

class ShopMarketplaceButtonWidget extends StatelessWidget {
  const ShopMarketplaceButtonWidget({
    required this.distributor,
    required this.onTap,
    super.key,
  });

  final ProductDistributor distributor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Ink(
          width: 160,
          padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: colorScheme.outlineVariant,
            ),
            color: colorScheme.surfaceContainerLow.withValues(alpha: 0.82),
          ),
          child: Row(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                clipBehavior: Clip.antiAlias,
                child: Padding(
                  padding: EdgeInsets.all(3),
                  child: Image.network(
                    distributor.shopBrand.logoPngUrl,
                    fit: BoxFit.contain,
                    errorBuilder: (context, _, _) {
                      return Icon(
                        Icons.storefront_rounded,
                        color: colorScheme.primary,
                        size: 16,
                      );
                    },
                  ),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  t.shop.ui_screens_shop_screen.buyAt(
                    store: distributor.shopBrand.displayName,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              SizedBox(width: 4),
              Icon(
                Icons.open_in_new_rounded,
                size: 18,
                color: colorScheme.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
