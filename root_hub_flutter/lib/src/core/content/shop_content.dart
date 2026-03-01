final Map<ValidCountry, List<ProductContent>> shopContents = {
  ValidCountry.english: [
    // Add more products for English market
    ProductContent(
      product: RootProduct.baseGame,
      distributors: [],
    ),
    ProductContent(
      product: RootProduct.riverfolkExpansion,
      distributors: [],
    ),
    ProductContent(
      product: RootProduct.underworldExpansion,
      distributors: [],
    ),
    ProductContent(
      product: RootProduct.marauderExpansion,
      distributors: [],
    ),
  ],
  ValidCountry.german: [
    // Add products for German market
    ProductContent(
      product: RootProduct.baseGame,
      distributors: [],
    ),
    ProductContent(
      product: RootProduct.riverfolkExpansion,
      distributors: [],
    ),
    ProductContent(
      product: RootProduct.underworldExpansion,
      distributors: [],
    ),
    ProductContent(
      product: RootProduct.marauderExpansion,
      distributors: [],
    ),
  ],
  ValidCountry.french: [
    // Add products for French market
    ProductContent(
      product: RootProduct.baseGame,
      distributors: [],
    ),
    ProductContent(
      product: RootProduct.riverfolkExpansion,
      distributors: [],
    ),
    ProductContent(
      product: RootProduct.underworldExpansion,
      distributors: [],
    ),
    ProductContent(
      product: RootProduct.marauderExpansion,
      distributors: [],
    ),
  ],
  ValidCountry.portugueseBrazil: [
    // Add products for Portuguese (Brazil) market
    ProductContent(
      product: RootProduct.baseGame,
      distributors: [],
    ),
    ProductContent(
      product: RootProduct.riverfolkExpansion,
      distributors: [],
    ),
    ProductContent(
      product: RootProduct.underworldExpansion,
      distributors: [],
    ),
    ProductContent(
      product: RootProduct.marauderExpansion,
      distributors: [],
    ),
  ],
  ValidCountry.spanish: [
    // Add products for Spanish market
    ProductContent(
      product: RootProduct.baseGame,
      distributors: [],
    ),
    ProductContent(
      product: RootProduct.riverfolkExpansion,
      distributors: [],
    ),
    ProductContent(
      product: RootProduct.underworldExpansion,
      distributors: [],
    ),
    ProductContent(
      product: RootProduct.marauderExpansion,
      distributors: [],
    ),
  ],
};

class ProductContent {
  List<String> get images => product.promotionalImages;
  final RootProduct product;
  final List<ProductDistributor> distributors;
  const ProductContent({
    required this.product,
    required this.distributors,
  });
}

class ProductDistributor {
  final String link;
  final ShopBrand shopBrand;
  const ProductDistributor({
    required this.link,
    required this.shopBrand,
  });
}

enum RootProduct {
  baseGame,
  riverfolkExpansion,
  underworldExpansion,
  marauderExpansion;

  List<String> get promotionalImages {
    return switch (this) {
      RootProduct.baseGame => [
        'https://jogandocasualmente.com.br/wp-content/uploads/2021/06/review-root-android-capa.jpg',
        'https://ledergames.com/cdn/shop/products/50-RootBaseGameBoxwGameSetup-Editv2-Web.png?height=1024&v=1617976948',
        'https://www.wizardtag.com/wp-content/uploads/2023/11/root-1-1024x768.jpg',
        'https://magicomens.com/cdn/shop/products/root3_800x.jpg?v=1637498984',
      ],
      RootProduct.riverfolkExpansion => [
        'https://www.boardgamemadness.ph/cdn/shop/files/image_9f08f6d1-7ad1-495d-8527-98069c82db7f.heic?v=1746384215',
        'https://m.media-amazon.com/images/I/81xwAwkjzYL.jpg',
        'https://www.thegamesteward.com/cdn/shop/products/root-riverfolk-retail-edition-retail-board-game-expansion-leder-games-31533950795928.png?v=1628672636&width=1623',
        'https://m.media-amazon.com/images/I/811zb1RuWpL._AC_UF894,1000_QL80_.jpg',
        'https://store.tngames.ca/cdn/shop/products/RootRiverfolk_02_components_1200x1200.jpg?v=1595553815',
      ],
      RootProduct.underworldExpansion => [
        'https://storage.googleapis.com/ludopedia-imagens-jogo/c8ff9_128351.jpg',
        'https://www.thegamesteward.com/cdn/shop/products/root-underworld-retail-edition-retail-board-game-expansion-leder-games-24573317775512.png?v=1608169923&width=1623',
        'https://ledergames.com/cdn/shop/products/57-RootFactionBoardwithComponentsDutchy-Edit-Web.png?height=1024&v=1617977143',
        'https://thehouseofgames.eu/cdn/shop/files/root-underworld-2.png?v=1742999731',
        'https://m.media-amazon.com/images/I/81-zAUYPrZL._AC_UF894,1000_QL80_.jpg',
        'https://victorypointlgs.com/cdn/shop/products/91vHasof_-L._AC_SL1500_868x700.jpg?v=1600370412',
      ],
      RootProduct.marauderExpansion => [
        'https://www.boardgamemadness.ph/cdn/shop/files/image_5f7167c4-9475-4b68-84be-ca33a5cad62e.heic?v=1746384216&width=1445',
        'https://ledergames.com/cdn/shop/files/MarauderPlayerBadger.jpg?height=1024&v=1758655239',
        'https://ledergames.com/cdn/shop/files/MarauderRatsBoard.jpg?height=1024&v=1758655267'
            'https://theboardgameschronicle.com/wp-content/uploads/2022/05/03f.jpg',
        'https://cdn3.philibertnet.com/617914-thickbox_default/root-extension-maraude.jpg',
      ],
    };
  }
}

enum ShopBrand { amazon, aliexpress, ebay, carrefour }

enum ValidCountry { english, german, french, portugueseBrazil, spanish }
