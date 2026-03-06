import 'package:flutter/material.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';
import 'package:root_hub_flutter/src/core/extension/faction_ui_extension.dart';

enum RootCommunityTool {
  reachCalculator,
  advancedSetupQuickguide,
  setupOrder,
  recommendedFactionsToPlay,
}

extension RootCommunityToolUiExtension on RootCommunityTool {
  IconData get icon => switch (this) {
    RootCommunityTool.reachCalculator => Icons.calculate_rounded,
    RootCommunityTool.advancedSetupQuickguide => Icons.menu_book_rounded,
    RootCommunityTool.setupOrder => Icons.format_list_numbered_rounded,
    RootCommunityTool.recommendedFactionsToPlay => Icons.group_work_rounded,
  };

  Color get accentColor => switch (this) {
    RootCommunityTool.reachCalculator => const Color(0xFF87613F),
    RootCommunityTool.advancedSetupQuickguide => const Color(0xFF3F6C8F),
    RootCommunityTool.setupOrder => const Color(0xFF4D7A57),
    RootCommunityTool.recommendedFactionsToPlay => const Color(0xFF7A5C45),
  };

  bool get isEnabled => true;

  String localizedTitle(Translations t) => switch (this) {
    RootCommunityTool.reachCalculator =>
      t.home.ui_sections_home_community_tools_section.reachCalculatorTitle,
    RootCommunityTool.advancedSetupQuickguide =>
      t
          .home
          .ui_sections_home_community_tools_section
          .advancedSetupQuickguideTitle,
    RootCommunityTool.setupOrder =>
      t.home.ui_sections_home_community_tools_section.setupOrderTitle,
    RootCommunityTool.recommendedFactionsToPlay =>
      t
          .home
          .ui_sections_home_community_tools_section
          .recommendedFactionsToPlayTitle,
  };
}

enum ReachCalculatorFactionStatus {
  available,
  unavailable,
  picked,
  banned,
}

enum ReachCalculatorFaction {
  marquiseDeCat,
  eyrieDynasties,
  woodlandAlliance,
  vagabond1,
  riverfolkCompany,
  lizardCult,
  corvidConspiracy,
  undergroundDuchy,
  vagabond2,
  lordOfTheHundreds,
  keepersInIron,
}

const Map<int, int> reachCalculatorRequiredReachByPlayerCount = <int, int>{
  2: 17,
  3: 18,
  4: 21,
  5: 25,
  6: 28,
};

const List<Faction> standardSetupOrderUniqueFactions = <Faction>[
  Faction.marquiseDeCat,
  Faction.eyrieDynasties,
  Faction.woodlandAlliance,
  Faction.vagabond,
  Faction.theLizardCult,
  Faction.riverfolkCompany,
  Faction.undergroundDuchy,
  Faction.corvidConspiracy,
  Faction.lordOfTheHundreds,
  Faction.keepersInIron,
];

class AdvancedSetupGuideContent {
  const AdvancedSetupGuideContent({
    required this.localizedBody,
    required this.englishBody,
  });

  final String localizedBody;
  final String englishBody;
}

extension ReachCalculatorFactionUiExtension on ReachCalculatorFaction {
  int get reach => switch (this) {
    ReachCalculatorFaction.marquiseDeCat => 10,
    ReachCalculatorFaction.eyrieDynasties => 7,
    ReachCalculatorFaction.woodlandAlliance => 3,
    ReachCalculatorFaction.vagabond1 => 5,
    ReachCalculatorFaction.riverfolkCompany => 5,
    ReachCalculatorFaction.lizardCult => 2,
    ReachCalculatorFaction.corvidConspiracy => 3,
    ReachCalculatorFaction.undergroundDuchy => 8,
    ReachCalculatorFaction.vagabond2 => 2,
    ReachCalculatorFaction.lordOfTheHundreds => 9,
    ReachCalculatorFaction.keepersInIron => 8,
  };

  Faction get baseFaction => switch (this) {
    ReachCalculatorFaction.marquiseDeCat => Faction.marquiseDeCat,
    ReachCalculatorFaction.eyrieDynasties => Faction.eyrieDynasties,
    ReachCalculatorFaction.woodlandAlliance => Faction.woodlandAlliance,
    ReachCalculatorFaction.vagabond1 => Faction.vagabond,
    ReachCalculatorFaction.riverfolkCompany => Faction.riverfolkCompany,
    ReachCalculatorFaction.lizardCult => Faction.theLizardCult,
    ReachCalculatorFaction.corvidConspiracy => Faction.corvidConspiracy,
    ReachCalculatorFaction.undergroundDuchy => Faction.undergroundDuchy,
    ReachCalculatorFaction.vagabond2 => Faction.vagabond,
    ReachCalculatorFaction.lordOfTheHundreds => Faction.lordOfTheHundreds,
    ReachCalculatorFaction.keepersInIron => Faction.keepersInIron,
  };

  String get iconAssetPath =>
      baseFaction.getFactionIconPath(size: FactionIconSize.size256);

  Color get accentColor => baseFaction.factionColor;

  String localizedName({AppLocale? locale}) {
    final activeLocale = locale ?? LocaleSettings.currentLocale;
    final baseName = baseFaction.localizedDisplayName(locale: activeLocale);
    final translations = _translationsForLocale(activeLocale);

    return switch (this) {
      ReachCalculatorFaction.vagabond2 =>
        '$baseName ${translations.home.ui_content_root_community_tools_content.vagabondSecondSuffix}',
      _ => baseName,
    };
  }
}

String buildAdvancedSetupOverviewBody({
  AppLocale? locale,
}) {
  final translations = _translationsForLocale(locale);

  return translations
      .home
      .ui_content_root_community_tools_content
      .advancedSetupOverviewBody
      .trim();
}

AdvancedSetupGuideContent buildAdvancedSetupFactionGuideContent(
  Faction faction, {
  AppLocale? locale,
}) {
  final activeLocale = locale ?? LocaleSettings.currentLocale;

  return AdvancedSetupGuideContent(
    localizedBody: _buildAdvancedSetupFactionBody(
      faction: faction,
      locale: activeLocale,
    ),
    englishBody: _buildAdvancedSetupFactionBody(
      faction: faction,
      locale: AppLocale.en,
    ),
  );
}

String buildSetupOrderSecondVagabondBody({
  AppLocale? locale,
}) {
  final translations = _translationsForLocale(locale);

  return translations
      .home
      .ui_content_root_community_tools_content
      .setupOrderSecondVagabondBody
      .trim();
}

String _buildAdvancedSetupFactionBody({
  required Faction faction,
  required AppLocale locale,
}) {
  final guideBodies = _translationsForLocale(locale)
      .home
      .ui_content_root_community_tools_content
      .advancedSetupFactionGuideBodies;

  return switch (faction) {
    Faction.marquiseDeCat => guideBodies.marquiseDeCat,
    Faction.eyrieDynasties => guideBodies.eyrieDynasties,
    Faction.woodlandAlliance => guideBodies.woodlandAlliance,
    Faction.vagabond => guideBodies.vagabond,
    Faction.theLizardCult => guideBodies.theLizardCult,
    Faction.riverfolkCompany => guideBodies.riverfolkCompany,
    Faction.undergroundDuchy => guideBodies.undergroundDuchy,
    Faction.corvidConspiracy => guideBodies.corvidConspiracy,
    Faction.lordOfTheHundreds => guideBodies.lordOfTheHundreds,
    Faction.keepersInIron => guideBodies.keepersInIron,
  }.trim();
}

Translations _translationsForLocale(AppLocale? locale) {
  final activeLocale = locale ?? LocaleSettings.currentLocale;
  if (activeLocale == LocaleSettings.currentLocale) {
    return t;
  }
  if (activeLocale == AppLocale.en) {
    return AppLocale.en.buildSync();
  }

  return activeLocale.translations;
}
