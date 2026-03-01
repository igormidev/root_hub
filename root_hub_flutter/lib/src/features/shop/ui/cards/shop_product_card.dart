import 'package:flutter/material.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';
import 'package:root_hub_flutter/src/core/content/shop_content.dart';
import 'package:root_hub_flutter/src/features/shop/ui/dialogs/shop_product_gallery_dialog.dart';
import 'package:root_hub_flutter/src/features/shop/ui/widgets/shop_marketplace_button_widget.dart';
import 'package:root_hub_flutter/src/features/shop/ui/widgets/shop_product_image_carousel_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class ShopProductCard extends StatelessWidget {
  const ShopProductCard({
    required this.content,
    required this.locale,
    super.key,
  });

  final ProductContent content;
  final ValidCountry locale;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: colorScheme.outlineVariant,
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colorScheme.surface.withValues(alpha: 0.98),
            colorScheme.surfaceContainerHigh.withValues(alpha: 0.56),
          ],
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            offset: Offset(0, 10),
            color: colorScheme.shadow.withValues(alpha: 0.08),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(12, 12, 12, 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShopProductImageCarouselWidget(
              images: content.images,
              heroTagPrefix: content.product.name,
              onImageTap: (index) {
                _openGallery(
                  context,
                  initialPage: index,
                );
              },
            ),
            SizedBox(height: 14),
            Text(
              content.title(locale),
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: 8),
            Text(
              content.description(locale),
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w700,
                height: 1.42,
              ),
            ),
            SizedBox(height: 14),
            Text(
              t.shop.ui_screens_shop_screen.whereToBuy,
              style: textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: 8),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: content.distributors.map((distributor) {
                return ShopMarketplaceButtonWidget(
                  distributor: distributor,
                  onTap: () {
                    _openStore(
                      context,
                      distributor,
                    );
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  void _openGallery(
    BuildContext context, {
    required int initialPage,
  }) {
    showDialog<void>(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.92),
      builder: (dialogContext) {
        return ShopProductGalleryDialog(
          images: content.images,
          initialPage: initialPage,
          productTitle: content.title(locale),
          heroTagPrefix: content.product.name,
        );
      },
    );
  }

  Future<void> _openStore(
    BuildContext context,
    ProductDistributor distributor,
  ) async {
    final uri = Uri.tryParse(distributor.link);
    if (uri == null) {
      if (!context.mounted) {
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            t.shop.ui_screens_shop_screen.invalidStoreUrl,
          ),
        ),
      );
      return;
    }

    final launched = await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );

    if (launched || !context.mounted) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          t.shop.ui_screens_shop_screen.unableToOpenStoreUrl,
        ),
      ),
    );
  }
}
