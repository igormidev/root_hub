import 'package:flutter/material.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';
import 'package:root_hub_flutter/src/core/content/shop_content.dart';
import 'package:root_hub_flutter/src/features/shop/ui/sections/shop_overview_section.dart';
import 'package:root_hub_flutter/src/features/shop/ui/sections/shop_product_list_section.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final country = _resolveCountry(LocaleSettings.currentLocale);
    final products =
        shopContents[country] ?? shopContents[ValidCountry.english] ?? const [];

    return ListView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.fromLTRB(16, 8, 16, 130),
      children: [
        ShopOverviewSection(),
        SizedBox(height: 16),
        ShopProductListSection(
          products: products,
          locale: country,
        ),
      ],
    );
  }

  ValidCountry _resolveCountry(AppLocale locale) {
    return switch (locale) {
      AppLocale.en => ValidCountry.english,
      AppLocale.ptBr => ValidCountry.portugueseBrazil,
      AppLocale.es => ValidCountry.spanish,
      AppLocale.fr => ValidCountry.french,
      AppLocale.de => ValidCountry.german,
    };
  }
}
