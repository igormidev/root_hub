// ignore_for_file: feature_hardcoded_ui_string

final Map<ValidCountry, List<ProductContent>> shopContents = {
  ValidCountry.english: [
    ProductContent(
      product: RootProduct.baseGame,
      distributors: const [
        ProductDistributor(
          link:
              'https://www.amazon.com/Leder-Games-LED01000-Root/dp/B07F454YF3',
          shopBrand: ShopBrand.amazon,
        ),
        ProductDistributor(
          link: 'https://www.ebay.com/p/11024160185',
          shopBrand: ShopBrand.ebay,
        ),
      ],
    ),
    ProductContent(
      product: RootProduct.riverfolkExpansion,
      distributors: const [
        ProductDistributor(
          link:
              'https://www.amazon.com/Root-Riverfolk-Expansion-Strategy-Game/dp/B07GJWQP7S',
          shopBrand: ShopBrand.amazon,
        ),
        ProductDistributor(
          link: 'https://www.ebay.com/p/17022006957',
          shopBrand: ShopBrand.ebay,
        ),
      ],
    ),
    ProductContent(
      product: RootProduct.underworldExpansion,
      distributors: const [
        ProductDistributor(
          link:
              'https://www.amazon.com/Leder-Games-Root-Underworld-Expansion/dp/B084WYZXHF',
          shopBrand: ShopBrand.amazon,
        ),
        ProductDistributor(
          link: 'https://www.ebay.com/p/15036857079',
          shopBrand: ShopBrand.ebay,
        ),
      ],
    ),
    ProductContent(
      product: RootProduct.marauderExpansion,
      distributors: const [
        ProductDistributor(
          link:
              'https://www.amazon.com/PRE-ORDER-Root-Marauder-Expansion-Australia/dp/B0BD2XCNGT',
          shopBrand: ShopBrand.amazon,
        ),
        ProductDistributor(
          link: 'https://www.ebay.com/p/13055128786',
          shopBrand: ShopBrand.ebay,
        ),
      ],
    ),
  ],
  ValidCountry.german: [
    ProductContent(
      product: RootProduct.baseGame,
      distributors: const [
        ProductDistributor(
          link:
              'https://www.amazon.de/Spielworxx-Grundspiel-Kennerspiel-Strategiespiel-Spieler/dp/B07TJ75XQX',
          shopBrand: ShopBrand.amazon,
        ),
        ProductDistributor(
          link:
              'https://www.ebay.de/p/7032641132?srsltid=AfmBOopoo2pltVBpF-i4nti9lP9oMjKKJPch3wrqLdPWXdLVNOdYVTLj',
          shopBrand: ShopBrand.ebay,
        ),
      ],
    ),
    ProductContent(
      product: RootProduct.riverfolkExpansion,
      distributors: const [
        ProductDistributor(
          link:
              'https://www.amazon.de/Spielworxx-Erweiterung-Kennerspiel-Kampfspiel-Brettspiel/dp/B0BY9GFT84',
          shopBrand: ShopBrand.amazon,
        ),
        ProductDistributor(
          link:
              'https://www.ebay.de/p/11032635973?srsltid=AfmBOopU8B8jiNwvo_ml86_agAbw1eoHLcKgTh8QCHsWFygLeymVpRQ2',
          shopBrand: ShopBrand.ebay,
        ),
      ],
    ),
    ProductContent(
      product: RootProduct.underworldExpansion,
      distributors: const [
        ProductDistributor(
          link:
              'https://www.amazon.de/LDG-QBG-ROOT-103-DE-Root-Unterwelt-Erweiterung/dp/B09MHMCTMJ',
          shopBrand: ShopBrand.amazon,
        ),
        ProductDistributor(
          link:
              'https://www.ebay.de/itm/296932786364?srsltid=AfmBOorx4MmeaYvGUE-20NvW_XqH5Ia0WBheKYElbJCDwHULLol2Y2we',
          shopBrand: ShopBrand.ebay,
        ),
      ],
    ),
    ProductContent(
      product: RootProduct.marauderExpansion,
      distributors: const [
        ProductDistributor(
          link:
              'https://www.amazon.de/-/en/Spielworxx-Root-Marauder-Expansion-Connoisseur/dp/B0CBNSQT66',
          shopBrand: ShopBrand.amazon,
        ),
        ProductDistributor(
          link:
              'https://www.ebay.de/itm/296982615139?srsltid=AfmBOopbzOHA8mX5iOQBPzl9sn6c5TYHIgHo-kIZZvvrl4p4KiumEReg',
          shopBrand: ShopBrand.ebay,
        ),
      ],
    ),
  ],
  ValidCountry.french: [
    ProductContent(
      product: RootProduct.baseGame,
      distributors: const [
        ProductDistributor(
          link:
              'https://www.carrefour.fr/p/jeu-de-societe-matagot-root-3760146645165',
          shopBrand: ShopBrand.carrefour,
        ),
        ProductDistributor(
          link:
              'https://www.amazon.fr/Matagot-Root-Version-Francaise/dp/B07V5R226W',
          shopBrand: ShopBrand.amazon,
        ),
        ProductDistributor(
          link:
              'https://www.ebay.fr/p/4033547627?srsltid=AfmBOoqcSf4mHk6HU9bhtXjFs-mJ4HhFKceQ3EhtkLlmSwrz5rQv5KoA',
          shopBrand: ShopBrand.ebay,
        ),
      ],
    ),
    ProductContent(
      product: RootProduct.riverfolkExpansion,
      distributors: const [
        ProductDistributor(
          link:
              'https://www.amazon.fr/Root-61193-Riverfolk-Expansion/dp/B07GJWQP7S',
          shopBrand: ShopBrand.amazon,
        ),
        ProductDistributor(
          // Search page (stable) for French edition names: "Nomades de la Rivière"
          link:
              'https://www.ebay.fr/sch/i.html?_nkw=Root+Nomades+de+la+Riviere',
          shopBrand: ShopBrand.ebay,
        ),
      ],
    ),
    ProductContent(
      product: RootProduct.underworldExpansion,
      distributors: const [
        ProductDistributor(
          link:
              'https://www.amazon.fr/2Tomatoes-Root-Expansion-Les-Souterrains/dp/B09KPV1R4G',
          shopBrand: ShopBrand.amazon,
        ),
        ProductDistributor(
          link: 'https://www.ebay.fr/p/18049610644',
          shopBrand: ShopBrand.ebay,
        ),
      ],
    ),
    ProductContent(
      product: RootProduct.marauderExpansion,
      distributors: const [
        ProductDistributor(
          link:
              'https://www.amazon.fr/Spielworxx-SPWD0010-Root-Les-Maraudeurs/dp/B0CBNSQT66',
          shopBrand: ShopBrand.amazon,
        ),
        ProductDistributor(
          // Search page (stable) for French edition names: "Maraudeurs"
          link: 'https://www.ebay.fr/sch/i.html?_nkw=Root+Maraudeurs+Extension',
          shopBrand: ShopBrand.ebay,
        ),
      ],
    ),
  ],
  ValidCountry.portugueseBrazil: [
    ProductContent(
      product: RootProduct.baseGame,
      distributors: const [
        ProductDistributor(
          link:
              'https://www.carrefour.com.br/root-jogo-de-tabuleiro-meeple-br-mp909078827/p',
          shopBrand: ShopBrand.carrefour,
        ),
        ProductDistributor(
          link:
              'https://www.amazon.com.br/Meeple-BR-Jogos-Jogo-Tabuleiro/dp/B07S2ZW2W6',
          shopBrand: ShopBrand.amazon,
        ),
      ],
    ),
    ProductContent(
      product: RootProduct.riverfolkExpansion,
      distributors: const [
        ProductDistributor(
          link:
              'https://www.carrefour.com.br/expansao-do-jogo-de-tabuleiro-root-riverfolk-para-1-6-jogadores-com-mais-de-14-anos-mp954978722/p',
          shopBrand: ShopBrand.carrefour,
        ),
        ProductDistributor(
          link:
              'https://www.amazon.com.br/Root-Expans%C3%A3o-Ribeirinhos-Jogo-Tabuleiro/dp/B01149B1N0',
          shopBrand: ShopBrand.amazon,
        ),
      ],
    ),
    ProductContent(
      product: RootProduct.underworldExpansion,
      distributors: const [
        ProductDistributor(
          link:
              'https://www.amazon.com.br/MeepleBR-Root-Expans%C3%A3o-Tabuleiro-jogadores/dp/B09H9HCGK8',
          shopBrand: ShopBrand.amazon,
        ),
        ProductDistributor(
          link: 'https://www.ebay.com/p/15036857079',
          shopBrand: ShopBrand.ebay,
        ),
      ],
    ),
    ProductContent(
      product: RootProduct.marauderExpansion,
      distributors: const [
        ProductDistributor(
          link:
              'https://www.amazon.com.br/Meeple-BR-MEEROOSAC-Root-Saqueadores/dp/B0CLT1T1T7',
          shopBrand: ShopBrand.amazon,
        ),
        ProductDistributor(
          link: 'https://www.ebay.com/p/13055128786',
          shopBrand: ShopBrand.ebay,
        ),
      ],
    ),
  ],
  ValidCountry.spanish: [
    ProductContent(
      product: RootProduct.baseGame,
      distributors: const [
        ProductDistributor(
          link:
              'https://www.amazon.es/2-Tomatoes-Games-Root-8437016497388/dp/B07VL5RP8H',
          shopBrand: ShopBrand.amazon,
        ),
        ProductDistributor(
          link:
              'https://www.ebay.es/p/10032165954?srsltid=AfmBOoo70eJ2O6U4tiA1g5HWZIyTJo_TWgBzH6T3zxJeaMPS90S9Htp8',
          shopBrand: ShopBrand.ebay,
        ),
      ],
    ),
    ProductContent(
      product: RootProduct.riverfolkExpansion,
      distributors: const [
        ProductDistributor(
          link:
              'https://www.amazon.es/-/en/Tomatoes-Games-Root-Ribere%C3%B1os-Expansion/dp/B07VKPWSS1',
          shopBrand: ShopBrand.amazon,
        ),
        ProductDistributor(
          link:
              'https://www.carrefour.es/christmas-party-leder-games-root-the-riverfolk-expansion-basic-plus-expansion-board-game-cards/5743402020683/p',
          shopBrand: ShopBrand.carrefour,
        ),
        ProductDistributor(
          link:
              'https://www.ebay.es/p/24023266291?srsltid=AfmBOoqp-YCgE3Z76e73qmzOyGg2-xD5G2H0lVTnlErGIs60iGgjB2lU',
          shopBrand: ShopBrand.ebay,
        ),
      ],
    ),
    ProductContent(
      product: RootProduct.underworldExpansion,
      distributors: const [
        ProductDistributor(
          link:
              'https://www.amazon.es/MS-Edizioni-Root-Mundo-Subterr%C3%A1neo/dp/B08XJD3C7B',
          shopBrand: ShopBrand.amazon,
        ),
        ProductDistributor(
          // Search page (stable) using Spanish keywords.
          link:
              'https://www.ebay.es/sch/i.html?_nkw=Root+Mundo+Subterr%C3%A1neo',
          shopBrand: ShopBrand.ebay,
        ),
      ],
    ),
    ProductContent(
      product: RootProduct.marauderExpansion,
      distributors: const [
        ProductDistributor(
          link:
              'https://www.amazon.es/2Tomatoes-Games-Merodeadores-Jugadores-Tem%C3%A1tica/dp/B0CQ5FJ2HV',
          shopBrand: ShopBrand.amazon,
        ),
        ProductDistributor(
          link: 'https://www.ebay.es/p/22054720873',
          shopBrand: ShopBrand.ebay,
        ),
      ],
    ),
  ],
};

class ProductContent {
  List<String> get images => product.promotionalImages;

  /// Localized title for this product.
  String title(ValidCountry locale) => product.title(locale);

  /// Localized description for this product.
  String description(ValidCountry locale) => product.description(locale);

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
        'https://ledergames.com/cdn/shop/files/MarauderRatsBoard.jpg?height=1024&v=1758655267',
        'https://theboardgameschronicle.com/wp-content/uploads/2022/05/03f.jpg',
        'https://cdn3.philibertnet.com/617914-thickbox_default/root-extension-maraude.jpg',
      ],
    };
  }

  String title(ValidCountry locale) {
    return switch (this) {
      RootProduct.baseGame => switch (locale) {
        ValidCountry.english => 'Root',
        ValidCountry.portugueseBrazil => 'Root',
        ValidCountry.spanish => 'Root',
        ValidCountry.french => 'Root',
        ValidCountry.german => 'Root',
      },
      RootProduct.riverfolkExpansion => switch (locale) {
        ValidCountry.english => 'Root: The Riverfolk Expansion',
        ValidCountry.portugueseBrazil => 'Root: Expansão Ribeirinhos',
        ValidCountry.spanish => 'Root: Los Ribereños',
        ValidCountry.french => 'Root : La Rivière',
        ValidCountry.german => 'Root: Flussvolk-Erweiterung',
      },
      RootProduct.underworldExpansion => switch (locale) {
        ValidCountry.english => 'Root: The Underworld Expansion',
        ValidCountry.portugueseBrazil => 'Root: Expansão Submundo',
        ValidCountry.spanish => 'Root: El Mundo Subterráneo',
        ValidCountry.french => 'Root : Monde Souterrain',
        ValidCountry.german => 'Root: Unterwelt-Erweiterung',
      },
      RootProduct.marauderExpansion => switch (locale) {
        ValidCountry.english => 'Root: The Marauder Expansion',
        ValidCountry.portugueseBrazil => 'Root: Expansão Saqueadores',
        ValidCountry.spanish => 'Root: Los Merodeadores',
        ValidCountry.french => 'Root : Maraude',
        ValidCountry.german => 'Root: Marodeur-Erweiterung',
      },
    };
  }

  String description(ValidCountry locale) {
    return switch (this) {
      RootProduct.baseGame => switch (locale) {
        ValidCountry.english =>
          "Root is a game of woodland might and right: each faction plays by its own rules and fights for control of the forest.\n"
              "\n"
              "Play as:\n"
              "• Marquise de Cat\n"
              "• Eyrie Dynasties\n"
              "• Woodland Alliance\n"
              "• Vagabond\n"
              "\n"
              "In the box:\n"
              "• Booklets: Walkthrough, Learning to Play, and The Law of Root (rules reference).\n"
              "• Cardboard: 28 Buildings (7 Roosts, 6 Sawmills, 6 Recruiters, 6 Workshops, 3 Bases); 19 Tokens (10 Sympathy, 8 Wood, 1 Keep); 12 Clearing Markers (4 Rabbit, 4 Fox, 4 Mouse); 4 Ruins; 4 Victory Point Markers; 3 Relationship Markers; 23 Items (4 Boots, 4 Swords, 4 Bags, 3 Hammers, 3 Teas, 2 Coins, 2 Crossbows, 1 Torch).\n"
              "• Wood: 55 Warriors (25 Marquise, 20 Eyrie, 10 Alliance); 1 Vagabond Pawn.\n"
              "• Cards: 54-card shared deck; 16 Faction Overviews; 4 Eyrie Leaders; 2 Loyal Viziers; 3 Vagabond Characters; 15 Quests; 4 Walkthroughs.\n"
              "• Other: Double-sided board (Fall & Winter maps); 2 Dice; 4 Faction Boards.",
        ValidCountry.portugueseBrazil =>
          "Root é um jogo assimétrico de aventura e guerra: cada facção segue suas próprias regras e disputa o controle da floresta.\n"
              "\n"
              "Jogue como:\n"
              "• Marqueses\n"
              "• Dinastia das Rapinas\n"
              "• Aliança da Floresta\n"
              "• Malandro\n"
              "\n"
              "Na caixa:\n"
              "• Livretos: Walkthrough (guia passo a passo), Aprenda a Jogar e As Leis de Root (referência de regras).\n"
              "• Papelão: 28 Construções (7 Ninhos, 6 Serrarias, 6 Recrutadores, 6 Oficinas, 3 Bases); 19 Fichas (10 Simpatia, 8 Madeira, 1 Torre da Guarda); 12 Marcadores de Clareira (4 Coelho, 4 Raposa, 4 Rato); 4 Ruínas; 4 Marcadores de Pontos de Vitória; 3 Marcadores de Relacionamento; 23 Itens (4 Botas, 4 Espadas, 4 Bolsas, 3 Martelos, 3 Chás, 2 Moedas, 2 Bestas, 1 Tocha).\n"
              "• Madeira: 55 Guerreiros (25 Marqueses, 20 Dinastia, 10 Aliança); 1 Peão do Malandro.\n"
              "• Cartas: baralho compartilhado de 54 cartas; 16 Visões Gerais de Facção; 4 Líderes da Dinastia; 2 Vizires Leais; 3 Personagens do Malandro; 15 Missões; 4 Walkthroughs.\n"
              "• Outros: tabuleiro dupla-face (mapas de Outono e Inverno); 2 Dados; 4 Tabuleiros de Facção.",
        ValidCountry.spanish =>
          "Root es un juego asimétrico de aventura y guerra: cada facción tiene reglas propias y lucha por el control del bosque.\n"
              "\n"
              "Juega como:\n"
              "• Marquesa de Gato\n"
              "• Dinastías del Nido del Águila\n"
              "• Alianza de la Tierra de los Bosques\n"
              "• Vagabundo\n"
              "\n"
              "En la caja:\n"
              "• Folletos: Walkthrough (guía paso a paso), Aprende a jugar y Ley de Root (referencia de reglas).\n"
              "• Cartón: 28 Edificios (7 Nidos, 6 Aserraderos, 6 Reclutadores, 6 Talleres, 3 Bases); 19 Fichas (10 Simpatía, 8 Madera, 1 Castillo); 12 Marcadores de Claro (4 Conejo, 4 Zorro, 4 Ratón); 4 Ruinas; 4 Marcadores de Puntos de Victoria; 3 Marcadores de Relación; 23 Objetos (4 Botas, 4 Espadas, 4 Bolsas, 3 Martillos, 3 Tés, 2 Monedas, 2 Ballestas, 1 Antorcha).\n"
              "• Madera: 55 Guerreros (25 Marquesa, 20 Nido, 10 Alianza); 1 Peón de Vagabundo.\n"
              "• Cartas: mazo compartido de 54 cartas; 16 Resúmenes de facción; 4 Líderes del Nido; 2 Visires Leales; 3 Personajes del Vagabundo; 15 Misiones; 4 Walkthroughs.\n"
              "• Otros: tablero a doble cara (mapas de Otoño e Invierno); 2 Dados; 4 Tableros de facción.",
        ValidCountry.french =>
          "Root est un jeu asymétrique d’aventure et de guerre: chaque faction suit ses propres règles et marque des points à sa manière.\n"
              "\n"
              "Incarnez:\n"
              "• Marquise de Chat\n"
              "• Dynasties de la Canopée\n"
              "• Alliance de la Forêt\n"
              "• Vagabond\n"
              "\n"
              "Dans la boîte:\n"
              "• Livrets: Walkthrough (guide pas à pas), Livret d’Apprentissage et La Loi de Root (référence de règles).\n"
              "• Carton: 28 Bâtiments (7 Nids, 6 Scieries, 6 Recruteurs, 6 Ateliers, 3 Bases); 19 Jetons (10 Sympathie, 8 Bois, 1 Fort); 12 Marqueurs de Clairière (4 Lapin, 4 Renard, 4 Souris); 4 Ruines; 4 Marqueurs de Points de victoire; 3 Marqueurs de Relation; 23 Objets (4 Bottes, 4 Épées, 4 Sacs, 3 Marteaux, 3 Thés, 2 Pièces, 2 Arbalètes, 1 Torche).\n"
              "• Bois: 55 Guerriers (25 Marquise, 20 Dynasties, 10 Alliance); 1 Pion Vagabond.\n"
              "• Cartes: paquet commun de 54 cartes; 16 cartes d’aperçu de faction; 4 Leaders des Dynasties; 2 Vizirs Loyaux; 3 Personnages du Vagabond; 15 Quêtes; 4 Walkthroughs.\n"
              "• Autres: plateau recto-verso (cartes Automne & Hiver); 2 Dés; 4 Plateaux de faction.",
        ValidCountry.german =>
          "Root ist ein asymmetrisches Abenteuer- und Kriegsspiel: Jede Fraktion hat eigene Regeln und kämpft um die Kontrolle im Waldland.\n"
              "\n"
              "Spiele als:\n"
              "• Marquise de Katz\n"
              "• Baumkronen-Dynastie\n"
              "• Waldland-Allianz\n"
              "• Vagabund\n"
              "\n"
              "In der Box:\n"
              "• Hefte: Wanderung durch Root, Spielanleitung und dieses Gesetz.\n"
              "• Pappmarker: 28 Gebäude (7 Nester, 6 Sägemühlen, 6 Rekrutierer, 6 Werkstätten, 3 Stützpunkte); 19 Plättchen (10 Sympathie, 8 Holz, 1 Festung); 12 Lichtungsmarker (4 Hase, 4 Fuchs, 4 Maus); 4 Ruinen; 4 Siegpunktemarker; 3 Beziehungsmarker; 23 Gegenstände (4 Stiefel, 4 Schwerter, 4 Beutel, 3 Hämmer, 3 Tees, 2 Münzen, 2 Armbrüste, 1 Fackel).\n"
              "• Holzmarker: 55 Krieger (25 Marquise, 20 Dynastie, 10 Allianz); 1 Vagabund-Spielfigur.\n"
              "• Karten: 54 Karten für den gemeinsamen Nachziehstapel; 16 Übersichtskarten; 4 Anführer der Dynastie; 2 Treue Wesire; 3 Charaktere des Vagabunden; 15 Aufgaben; 4 Beispielrundenübersichten.\n"
              "• Sonstiges: Spielplan (Herbst- und Winterseite); 2 Würfel; 4 Fraktionstableaus (Marquise, Dynastie, Allianz, Vagabund).",
      },
      RootProduct.riverfolkExpansion => switch (locale) {
        ValidCountry.english =>
          "The Riverfolk Expansion adds new factions and new table dynamics—trade, deals, and faith.\n"
              "\n"
              "Adds factions:\n"
              "• Riverfolk Company\n"
              "• Lizard Cult\n"
              "\n"
              "Also included:\n"
              "• Second Vagabond\n"
              "• Mechanical Marquise (automated opponent)\n"
              "\n"
              "In the box (requires Root base game):\n"
              "• Booklet: Learning to Play.\n"
              "• Cardboard: 15 Buildings (15 Gardens); 9 Tokens (9 Trade Posts); 3 Victory Point Markers; 1 Outcast Marker; 9 Relationship Markers; 11 Items (3 Boots, 3 Swords, 1 Bag, 1 Hammer, 1 Torch, 1 Coin, 1 Crossbow); 17 spare pieces (letter-backed) for future scenarios.\n"
              "• Wood: 40 Warriors (25 Lizard, 15 Riverfolk); 1 Vagabond Pawn.\n"
              "• Cards: 4 Spies; 2 Faction Overviews; 3 Vagabond Characters.\n"
              "• Other: 4 Faction Boards (Second Vagabond, Mechanical Marquise, Riverfolk Company, Lizard Cult); 3 Service Markers; 1 Card Stand.",
        ValidCountry.portugueseBrazil =>
          "A Expansão Ribeirinhos adiciona novas facções e traz negociação para a mesa — serviços, acordos e influência.\n"
              "\n"
              "Inclui as facções:\n"
              "• Companhia Ribeirinha\n"
              "• Lagartos Cultistas\n"
              "\n"
              "Também inclui:\n"
              "• Segundo Malandro\n"
              "• Marqueses Mecânicos (facção automática)\n"
              "\n"
              "Na caixa (requer o jogo base Root):\n"
              "• Livreto: Aprenda a Jogar.\n"
              "• Papelão: 15 Construções (15 Jardins); 9 Fichas (9 Entrepostos Comerciais); 3 Marcadores de Pontos de Vitória; 1 Marcador de Pária; 9 Marcadores de Relacionamento; 11 Itens (3 Botas, 3 Espadas, 1 Bolsa, 1 Martelo, 1 Tocha, 1 Moeda, 1 Besta); 17 peças sobressalentes com letras (para cenários futuros).\n"
              "• Madeira: 40 Guerreiros (25 Lagartos, 15 Ribeirinhos); 1 Peão do Malandro.\n"
              "• Cartas: 4 Espiões; 2 Visões Gerais de Facção; 3 Personagens do Malandro.\n"
              "• Outros: 4 Tabuleiros de Facção (Segundo Malandro, Marqueses Mecânicos, Companhia Ribeirinha, Lagartos Cultistas); 3 Marcadores de Serviço; 1 Suporte de Cartas.",
        ValidCountry.spanish =>
          "La expansión Los Ribereños añade nuevas facciones y cambia la política de la mesa: comercio, tratos y fe.\n"
              "\n"
              "Incluye las facciones:\n"
              "• Culto del Lagarto\n"
              "• Compañía de la Gente del Río\n"
              "\n"
              "También incluye:\n"
              "• Segundo Vagabundo\n"
              "• Marquesa Mecánica (facción automática)\n"
              "\n"
              "En la caja (requiere el juego base Root):\n"
              "• Folleto: Aprende a jugar.\n"
              "• Cartón: 15 Edificios (15 Jardines); 9 Fichas (9 Puestos Comerciales); 3 Marcadores de Puntos de Victoria; 1 Marcador de Marginado; 9 Marcadores de Relación; 11 Objetos (3 Botas, 3 Espadas, 1 Bolsa, 1 Martillo, 1 Antorcha, 1 Moneda, 1 Ballesta); 17 piezas de repuesto con letra para escenarios futuros.\n"
              "• Madera: 40 Guerreros (25 Lagartos, 15 Ribereños); 1 Peón de Vagabundo.\n"
              "• Cartas: 4 Espías; 2 Resúmenes de facción; 3 Personajes del Vagabundo.\n"
              "• Otros: 4 Tableros de facción (Segundo Vagabundo, Marquesa Mecánica, Compañía de la Gente del Río, Culto del Lagarto); 3 Marcadores de Servicio; 1 Soporte para cartas.",
        ValidCountry.french =>
          "L’extension La Rivière ajoute de nouvelles façons d’influencer la forêt: négociation, services et conversions.\n"
              "\n"
              "Inclut les factions:\n"
              "• Compagnie de la Rivière\n"
              "• Culte des Lézards\n"
              "\n"
              "Également inclus:\n"
              "• Second Vagabond\n"
              "• Marquise Mécanique (faction automatisée)\n"
              "\n"
              "Dans la boîte (nécessite Root – jeu de base):\n"
              "• Livret: Livret d’Apprentissage.\n"
              "• Carton: 15 Bâtiments (15 Jardins); 9 Jetons (9 Comptoirs commerciaux); 3 Marqueurs de Points de victoire; 1 Marqueur de Paria; 9 Marqueurs de Relation; 11 Objets (3 Bottes, 3 Épées, 1 Sac, 1 Marteau, 1 Torche, 1 Pièce, 1 Arbalète); 17 pièces de réserve avec lettres pour de futurs scénarios.\n"
              "• Bois: 40 Guerriers (25 Lézards, 15 Compagnie de la Rivière); 1 Pion Vagabond.\n"
              "• Cartes: 4 Espions; 2 cartes d’aperçu; 3 Personnages du Vagabond.\n"
              "• Autres: 4 Plateaux de faction (Second Vagabond, Marquise Mécanique, Compagnie de la Rivière, Culte des Lézards); 3 Marqueurs de Service; 1 Porte-cartes.",
        ValidCountry.german =>
          "Die Flussvolk-Erweiterung bringt Handel, Absprachen und Glauben in deine Root-Partien.\n"
              "\n"
              "Enthält die Fraktionen:\n"
              "• Flussvolk-Kompanie\n"
              "• Echsen-Kult\n"
              "\n"
              "Ebenfalls enthalten:\n"
              "• Vagabundin\n"
              "• Mechanische Marquise (automatisierte Fraktion)\n"
              "\n"
              "In der Box (benötigt Root – Grundspiel):\n"
              "• Heft: Spielanleitung.\n"
              "• Pappmarker: 15 Gebäude (15 Gärten); 9 Plättchen (9 Handelsposten); 3 Siegpunktemarker; 1 Verstoßenenmarker; 9 Beziehungsmarker; 11 Gegenstände (3 Stiefel, 3 Schwerter, 1 Beutel, 1 Hammer, 1 Fackel, 1 Münze, 1 Armbrust); 17 weitere Plättchen mit Buchstabenrückseite für zukünftige Szenarien.\n"
              "• Holzmarker: 40 Krieger (25 Echsen, 15 Flussvolk); 1 Vagabundin-Spielfigur.\n"
              "• Karten: 4 Spione; 2 Übersichtskarten; 3 Charaktere der Vagabundin.\n"
              "• Sonstiges: Fraktionstableaus (Vagabundin, Mechanische Marquise, Flussvolk-Kompanie, Echsen-Kult); 3 Dienstmarker; 1 Kartenhalter.",
      },
      RootProduct.underworldExpansion => switch (locale) {
        ValidCountry.english =>
          "The Underworld Expansion adds two new factions and two new maps that reshape movement and territory control.\n"
              "\n"
              "Adds factions:\n"
              "• Underground Duchy\n"
              "• Corvid Conspiracy\n"
              "\n"
              "Adds maps:\n"
              "• Lake map (with the Ferry)\n"
              "• Mountain map (with closed paths and the Tower)\n"
              "\n"
              "In the box (requires Root base game):\n"
              "• Booklets: Learning to Play and The Law of Root (rules reference).\n"
              "• Cardboard: 6 Buildings (3 Markets, 3 Citadels); 19 Tokens (8 Plots, 8 Spare Plots, 3 Tunnels); the Burrow; 4 Relationship Markers; 2 Victory Point Markers; 6 Closed Path Markers.\n"
              "• Wood: 35 Warriors (20 Duchy, 15 Corvid); 1 Ferry; 1 Tower; 9 Crowns.\n"
              "• Cards: 9 Ministers; 2 Overviews.\n"
              "• Other: Double-sided board (Lake & Mountain maps); 2 Dice; 2 Faction Boards (Duchy, Corvid).",
        ValidCountry.portugueseBrazil =>
          "A Expansão Submundo aprofunda o conflito com duas novas facções e dois novos mapas.\n"
              "\n"
              "Inclui as facções:\n"
              "• Ducado Subterrâneo\n"
              "• Conspiração Corvídea\n"
              "\n"
              "Inclui os mapas:\n"
              "• Lago (com a Balsa)\n"
              "• Montanha (com caminhos bloqueados e a Torre)\n"
              "\n"
              "Na caixa (requer o jogo base Root):\n"
              "• Livretos: Aprenda a Jogar e As Leis de Root.\n"
              "• Papelão: 6 Construções (3 Mercados, 3 Cidadelas); 19 Fichas (8 Planos, 8 Planos Sobressalentes, 3 Túneis); a Toca; 4 Marcadores de Relacionamento; 2 Marcadores de Pontos de Vitória; 6 Marcadores de Caminho Bloqueado.\n"
              "• Madeira: 35 Guerreiros (20 Ducado, 15 Corvídea); 1 Balsa; 1 Torre; 9 Coroas.\n"
              "• Cartas: 9 Ministros; 2 Visões Gerais.\n"
              "• Outros: tabuleiro (mapas do Lago e da Montanha); 2 Dados; 2 Tabuleiros de Facção (Ducado, Corvídea).",
        ValidCountry.spanish =>
          "La expansión El Mundo Subterráneo añade nuevas facciones y dos mapas que cambian el ritmo de la partida.\n"
              "\n"
              "Incluye las facciones:\n"
              "• Ducado Subterráneo\n"
              "• Conspiración Córvida\n"
              "\n"
              "Incluye los mapas:\n"
              "• Lago (con el Ferry)\n"
              "• Montaña (con caminos cerrados y la Torre)\n"
              "\n"
              "En la caja (requiere el juego base Root):\n"
              "• Folletos: Aprende a jugar y Ley de Root.\n"
              "• Cartón: 6 Edificios (3 Mercados, 3 Ciudadelas); 19 Fichas (8 Intrigas, 8 Intrigas de repuesto, 3 Túneles); la Madriguera; 4 Marcadores de Relación; 2 Marcadores de Puntos de Victoria; 6 Marcadores de Camino Cerrado.\n"
              "• Madera: 35 Guerreros (20 Ducado, 15 Córvidos); 1 Ferry; 1 Torre; 9 Coronas.\n"
              "• Cartas: 9 Ministros; 2 Resúmenes.\n"
              "• Otros: tablero (mapas de Lago y Montaña); 2 Dados; 2 Tableros de facción (Ducado, Córvidos).",
        ValidCountry.french =>
          "Monde Souterrain introduit deux nouvelles factions et deux nouvelles cartes (Lac & Montagne).\n"
              "\n"
              "Inclut les factions:\n"
              "• Duché du Monde Souterrain\n"
              "• Conspiration des Corvidés\n"
              "\n"
              "Inclut les cartes:\n"
              "• Lac (avec le Ferry)\n"
              "• Montagne (avec chemins fermés et la Tour)\n"
              "\n"
              "Dans la boîte (nécessite Root – jeu de base):\n"
              "• Livrets: Livret d’Apprentissage et La Loi de Root.\n"
              "• Carton: 6 Bâtiments (3 Marchés, 3 Citadelles); 19 Jetons (8 Complots, 8 Complots de réserve, 3 Tunnels); la Tanière; 4 Marqueurs de Relation; 2 Marqueurs de Points de victoire; 6 Marqueurs de Chemin Fermé.\n"
              "• Bois: 35 Guerriers (20 Duché, 15 Corvidés); 1 Ferry; 1 Tour; 9 Couronnes.\n"
              "• Cartes: 9 Ministres; 2 cartes d’aperçu.\n"
              "• Autres: plateau recto-verso (cartes Lac & Montagne); 2 Dés; 2 Plateaux de faction (Duché, Corvidés).",
        ValidCountry.german =>
          "Die Unterwelt-Erweiterung fügt zwei neue Fraktionen und zwei neue Spielplanseiten hinzu.\n"
              "\n"
              "Enthält die Fraktionen:\n"
              "• Untergrund-Herzogtum\n"
              "• Krähen-Komplott\n"
              "\n"
              "Enthält die Spielpläne:\n"
              "• Seeseite (mit der Fähre)\n"
              "• Gebirgsseite (mit versperrten Wegen und dem Turm)\n"
              "\n"
              "In der Box (benötigt Root – Grundspiel):\n"
              "• Hefte: Spielanleitung und dieses Gesetz.\n"
              "• Pappmarker: 6 Gebäude (3 Märkte, 3 Zitadellen); 19 Plättchen (8 Pläne, 8 Ersatzpläne, 3 Tunnel); die Erdhöhle; 4 Beziehungsmarker; 2 Siegpunktemarker; 6 Marker für versperrte Wege.\n"
              "• Holzmarker: 35 Krieger (20 Herzogtum, 15 Krähen); 1 Fähre; 1 Turm; 9 Kronen.\n"
              "• Karten: 9 Minister; 2 Übersichtskarten.\n"
              "• Sonstiges: Spielplan (See- und Gebirgsseite); 2 Würfel; 2 Fraktionstableaus (Herzogtum, Krähen).",
      },
      RootProduct.marauderExpansion => switch (locale) {
        ValidCountry.english =>
          "The Marauder Expansion introduces two new militant factions, hirelings, and new setup tools to keep every game fresh.\n"
              "\n"
              "Adds factions:\n"
              "• Lord of the Hundreds\n"
              "• Keepers in Iron\n"
              "\n"
              "In the box (requires Root base game):\n"
              "• Booklets: Learning to Play and The Law of Root (rules reference).\n"
              "• Cardboard: 9 Buildings (3 Waystations, 6 Strongholds); 17 Tokens (12 Relics, 5 Mobs); 4 Relationship Markers; 2 Victory Point Markers; 12 Control Markers; 3 Club Items; 3 Hireling Markers; 11 Extra Markers (9 Victory Points, 2 Relationships).\n"
              "• Wood: 56 Warriors (20 Hundreds, 15 Keepers, 12 Patrol, 5 Dynasty, 4 Uprising); 1 Hundreds Warlord; 1 Exile Pawn.\n"
              "• Cards: 8 Moods; 3 Faithful Retainers; 10 Faction Setup cards; 4 Hirelings; 2 Overviews.\n"
              "• Other: 2 Faction Boards (Hundreds, Keepers); 3 Dice (Mob, Uprising, Control).",
        ValidCountry.portugueseBrazil =>
          "A Expansão Saqueadores eleva a escala da guerra com duas facções militantes, Capangas (hirelings) e novas cartas de preparação.\n"
              "\n"
              "Inclui as facções:\n"
              "• Senhor das Centenas\n"
              "• Guardiões de Ferro\n"
              "\n"
              "Na caixa (requer o jogo base Root):\n"
              "• Livretos: Aprenda a Jogar e As Leis de Root.\n"
              "• Papelão: 9 Construções (3 Postos Avançados, 6 Fortalezas); 17 Fichas (12 Relíquias, 5 Turbas); 4 Marcadores de Relacionamento; 2 Marcadores de Pontos de Vitória; 12 Marcadores de Controle; 3 Itens de Clava; 3 Marcadores de Capanga; 11 Marcadores Extras (9 Pontos de Vitória, 2 Relacionamentos).\n"
              "• Madeira: 56 Guerreiros (20 Centenas, 15 Guardiões, 12 Patrulha, 5 Dinastia, 4 Levante); 1 Senhor da Guerra das Centenas; 1 Peão do Exilado.\n"
              "• Cartas: 8 Humores; 3 Retentores Fiéis; 10 Cartas de Preparação de Facção; 4 Cartas de Capanga; 2 Visões Gerais.\n"
              "• Outros: 2 Tabuleiros de Facção (Centenas, Guardiões); 3 Dados (Turba, Levante, Controle).",
        ValidCountry.spanish =>
          "La expansión Los Merodeadores introduce dos facciones militantes, mercenarios (hirelings) y nuevas cartas de preparación.\n"
              "\n"
              "Incluye las facciones:\n"
              "• Señor de los Cientos\n"
              "• Guardianes de Hierro\n"
              "\n"
              "En la caja (requiere el juego base Root):\n"
              "• Folletos: Aprende a jugar y Ley de Root.\n"
              "• Cartón: 9 Edificios (3 Waystations, 6 Fortalezas); 17 Fichas (12 Reliquias, 5 Turbas); 4 Marcadores de Relación; 2 Marcadores de Puntos de Victoria; 12 Marcadores de Control; 3 Objetos de Garrote; 3 Marcadores de Mercenario; 11 Marcadores Extra (9 Puntos de Victoria, 2 Relaciones).\n"
              "• Madera: 56 Guerreros (20 Cientos, 15 Guardianes, 12 Patrulla, 5 Dinastía, 4 Levantamiento); 1 Caudillo de los Cientos; 1 Peón del Exiliado.\n"
              "• Cartas: 8 Estados de ánimo; 3 Retenedores Fieles; 10 Cartas de Preparación de facción; 4 Cartas de Mercenario; 2 Resúmenes.\n"
              "• Otros: 2 Tableros de facción (Cientos, Guardianes); 3 Dados (Turba, Levantamiento, Control).",
        ValidCountry.french =>
          "L’extension Maraude introduit deux factions militantes, des Nomades et de nouveaux outils de mise en place.\n"
              "\n"
              "Inclut les factions:\n"
              "• Seigneur des Cents\n"
              "• Gardiens de Fer\n"
              "\n"
              "Dans la boîte (nécessite Root – jeu de base):\n"
              "• Livrets: Livret d’Apprentissage et La Loi de Root.\n"
              "• Carton: 9 Bâtiments (3 Haltes, 6 Bastions); 17 Jetons (12 Reliques, 5 Meutes); 4 Marqueurs de Relation; 2 Marqueurs de Points de victoire; 12 Marqueurs de Contrôle; 3 Objets « massue »; 3 Marqueurs de Nomade; 11 Marqueurs supplémentaires (9 Points de victoire, 2 Relations).\n"
              "• Bois: 56 Guerriers (20 Cents, 15 Gardiens, 12 Patrouille, 5 Dynasties, 4 Soulèvement); 1 Chef de guerre des Cents; 1 Pion de l’Exilé.\n"
              "• Cartes: 8 Humeurs; 3 Reteneurs fidèles; 10 Cartes de mise en place de faction; 4 Cartes de Nomade; 2 cartes d’aperçu.\n"
              "• Autres: 2 Plateaux de faction (Cents, Gardiens); 3 Dés (Meute, Soulèvement, Contrôle).",
        ValidCountry.german =>
          "Die Marodeur-Erweiterung bringt zwei neue militante Fraktionen, Heuerlinge und neue Aufbauhilfen.\n"
              "\n"
              "Enthält die Fraktionen:\n"
              "• Herr der Scharen\n"
              "• Eisenwächter\n"
              "\n"
              "In der Box (benötigt Root – Grundspiel):\n"
              "• Hefte: Spielanleitung und dieses Gesetz.\n"
              "• Pappmarker: 9 Gebäude (3 Lagerplätze, 6 Bollwerke); 17 Plättchen (12 Relikte, 5 Meuten); 4 Beziehungsmarker; 2 Siegpunktemarker; 12 Kontrollmarker; 3 Knüppel-Gegenstände; 3 Heuerlingehinweise; 11 weitere Marker (9 Siegpunkte, 2 Beziehungsmarker).\n"
              "• Holzmarker: 56 Krieger (20 Scharen, 15 Wächter, 12 Patrouille, 5 Dynastie, 4 Aufstand); 1 Scharen-Kriegsherr; 1 Exilanten-Spielfigur.\n"
              "• Karten: 8 Launen; 3 Treuer Vasall; 10 Fraktionsaufbauhilfen; 4 Heuerlinge; 2 Übersichtskarten.\n"
              "• Sonstiges: 2 Fraktionstableaus (Herr der Scharen, Eisenwächter); 3 Würfel (Meute, Aufstand, Kontrolle).",
      },
    };
  }
}

enum ShopBrand { amazon, aliexpress, ebay, carrefour }

enum ValidCountry { english, german, french, portugueseBrazil, spanish }

extension ShopBrandUiMetadataX on ShopBrand {
  String get displayName {
    return switch (this) {
      ShopBrand.amazon => 'Amazon',
      ShopBrand.aliexpress => 'AliExpress',
      ShopBrand.ebay => 'eBay',
      ShopBrand.carrefour => 'Carrefour',
    };
  }

  /// Wikimedia-hosted PNG thumbnails for stable rendering in Flutter.
  String get logoPngUrl {
    return switch (this) {
      ShopBrand.amazon =>
        'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Amazon_logo.svg/960px-Amazon_logo.svg.png',
      ShopBrand.aliexpress =>
        'https://upload.wikimedia.org/wikipedia/commons/2/2a/AliExpress_logo_2.png',
      ShopBrand.ebay =>
        'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/EBay_logo.svg/960px-EBay_logo.svg.png',
      ShopBrand.carrefour =>
        'https://upload.wikimedia.org/wikipedia/commons/1/13/Carrefour_International_Logo.png',
    };
  }
}
