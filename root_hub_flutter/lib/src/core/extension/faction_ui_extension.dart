import 'package:flutter/material.dart';
import 'package:root_hub_client/root_hub_client.dart';

enum FactionIconSize {
  size80._('80'),
  size256._('256'),
  size512._('512'),
  size1024._('1024');

  const FactionIconSize._(this.folderName);

  final String folderName;
}

extension FactionUiExtension on Faction {
  Color get factionColor => switch (this) {
    Faction.marquiseDeCat => const Color(0xFFFFA500), // orange
    Faction.eyrieDynasties => const Color(0xFF0000FF), // blue
    Faction.woodlandAlliance => const Color(0xFF008000), // green
    Faction.vagabond => const Color(0xFF808080), // gray
    Faction.riverfolkCompany => const Color(0xFF00FFFF), // cyan
    Faction.theLizardCult => const Color(0xFF9ACD32), // yellowgreen
    Faction.undergroundDuchy => const Color(0xFFD2B48C), // tan
    Faction.corvidConspiracy => const Color(0xFF800080), // purple
    Faction.lordOfTheHundreds => const Color(0xFFFF0000), // red
    Faction.keepersInIron => const Color(0xFFC0C0C0), // silver
  };

  String get getFactionBoardImage => switch (this) {
    Faction.marquiseDeCat => 'assets/faction_boards/marquise_de_cat.webp',
    Faction.eyrieDynasties => 'assets/faction_boards/eyrie_dynasties.webp',
    Faction.woodlandAlliance => 'assets/faction_boards/woodland_alliance.webp',
    Faction.vagabond => 'assets/faction_boards/vagabond.webp',
    Faction.riverfolkCompany => 'assets/faction_boards/riverfolk_company.webp',
    Faction.theLizardCult => 'assets/faction_boards/the_lizard_cult.webp',
    Faction.undergroundDuchy => 'assets/faction_boards/underground_duchy.webp',
    Faction.corvidConspiracy => 'assets/faction_boards/corvid_conspiracy.webp',
    Faction.lordOfTheHundreds =>
      'assets/faction_boards/lord_of_the_hundreds.webp',
    Faction.keepersInIron => 'assets/faction_boards/keepers_in_iron.webp',
  };

  // Default visual for larger surfaces (screens/sections).
  String get getFactionImage => switch (this) {
    Faction.marquiseDeCat => 'assets/faction_images/marquise_de_cat.png',
    Faction.eyrieDynasties => 'assets/faction_images/eyrie_dynasties.png',
    Faction.woodlandAlliance => 'assets/faction_images/woodland_alliance.webp',
    Faction.vagabond => 'assets/faction_images/vagabond.png',
    Faction.riverfolkCompany => 'assets/faction_images/riverfolk_company.png',
    Faction.theLizardCult => 'assets/faction_images/the_lizard_cult.png',
    Faction.undergroundDuchy => 'assets/faction_images/underground_duchy.png',
    Faction.corvidConspiracy => 'assets/faction_images/corvid_conspiracy.png',
    Faction.lordOfTheHundreds =>
      'assets/faction_images/lord_of_the_hundreds.png',
    Faction.keepersInIron => 'assets/faction_images/keepers_in_iron.png',
  };

  // Preferred for compact UI such as headers, chips and small cards.
  String get factionIcon => getFactionIconPath();

  String getFactionIconPath({
    FactionIconSize size = FactionIconSize.size256,
  }) => switch (this) {
    Faction.marquiseDeCat =>
      'assets/faction_icons/${size.folderName}/marquise_de_cat.png',
    Faction.eyrieDynasties =>
      'assets/faction_icons/${size.folderName}/eyrie_dynasties.png',
    Faction.woodlandAlliance =>
      'assets/faction_icons/${size.folderName}/woodland_alliance.png',
    Faction.vagabond => 'assets/faction_icons/${size.folderName}/vagabond.png',
    Faction.riverfolkCompany =>
      'assets/faction_icons/${size.folderName}/riverfolk_company.png',
    Faction.theLizardCult =>
      'assets/faction_icons/${size.folderName}/the_lizard_cult.png',
    Faction.undergroundDuchy =>
      'assets/faction_icons/${size.folderName}/underground_duchy.png',
    Faction.corvidConspiracy =>
      'assets/faction_icons/${size.folderName}/corvid_conspiracy.png',
    Faction.lordOfTheHundreds =>
      'assets/faction_icons/${size.folderName}/lord_of_the_hundreds.png',
    Faction.keepersInIron =>
      'assets/faction_icons/${size.folderName}/keepers_in_iron.png',
  };
}
