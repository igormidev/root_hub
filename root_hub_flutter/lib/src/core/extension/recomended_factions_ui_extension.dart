import 'package:flutter/material.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';
import 'package:root_hub_flutter/src/core/content/recomended_factions_content.dart';
import 'package:root_hub_flutter/src/core/extension/faction_ui_extension.dart';

extension PurchasedExpansionsUiExtension on PurchasedExpansions {
  String localizedTitle(Translations t) => switch (this) {
    PurchasedExpansions.baseGame =>
      t.home.ui_screens_recommended_compositions_screen.boxNames.baseGame,
    PurchasedExpansions.riverfolkExpansion =>
      t
          .home
          .ui_screens_recommended_compositions_screen
          .boxNames
          .riverfolkExpansion,
    PurchasedExpansions.underworldExpansion =>
      t
          .home
          .ui_screens_recommended_compositions_screen
          .boxNames
          .underworldExpansion,
    PurchasedExpansions.marauderExpansion =>
      t
          .home
          .ui_screens_recommended_compositions_screen
          .boxNames
          .marauderExpansion,
  };

  Color get accentColor => switch (this) {
    PurchasedExpansions.baseGame => Color(0xFF9F6B3A),
    PurchasedExpansions.riverfolkExpansion => Color(0xFF328B96),
    PurchasedExpansions.underworldExpansion => Color(0xFF7B5A9E),
    PurchasedExpansions.marauderExpansion => Color(0xFF9B4A3F),
  };
}

extension RecomendedFactionUiExtension on RecomendedFaction {
  Faction get faction => switch (this) {
    RecomendedFaction.marquiseDeCat => Faction.marquiseDeCat,
    RecomendedFaction.eyrieDynasties => Faction.eyrieDynasties,
    RecomendedFaction.woodlandAlliance => Faction.woodlandAlliance,
    RecomendedFaction.vagabond => Faction.vagabond,
    RecomendedFaction.riverfolkCompany => Faction.riverfolkCompany,
    RecomendedFaction.theLizardCult => Faction.theLizardCult,
    RecomendedFaction.undergroundDuchy => Faction.undergroundDuchy,
    RecomendedFaction.corvidConspiracy => Faction.corvidConspiracy,
    RecomendedFaction.lordOfTheHundreds => Faction.lordOfTheHundreds,
    RecomendedFaction.keepersInIron => Faction.keepersInIron,
  };

  String localizedName({AppLocale? locale}) =>
      faction.localizedDisplayName(locale: locale);

  String get iconAssetPath =>
      faction.getFactionIconPath(size: FactionIconSize.size80);

  Color get accentColor => faction.factionColor;
}

extension RecomendedFactionCompositionUiExtension
    on RecomendedFactionComposition {
  String localizedDescription({AppLocale? locale}) {
    final activeLocale = locale ?? LocaleSettings.currentLocale;

    return switch (activeLocale) {
      AppLocale.en => englishDescription,
      AppLocale.ptBr => brazilianPortugueseDescription,
      AppLocale.es => spanishDescription,
      AppLocale.fr => frenchDescription,
      AppLocale.de => germanDescription,
    };
  }
}
