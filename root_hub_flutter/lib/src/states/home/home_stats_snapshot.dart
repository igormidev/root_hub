import 'package:root_hub_client/root_hub_client.dart';

class HomeStatsSnapshot {
  const HomeStatsSnapshot({
    required this.totalMatchesPlayed,
    required this.totalWins,
    required this.winRate,
    required this.totalPossiblePoints,
    required this.totalPointsScored,
    required this.avgPoints,
    required this.playedGamesByFaction,
    required this.winsByFaction,
    required this.winsRateByFaction,
    required this.avgPointsByFaction,
  });

  factory HomeStatsSnapshot.fromPlatformStats(PlatformStats stats) {
    return HomeStatsSnapshot(
      totalMatchesPlayed: stats.totalMatchesPlayed,
      totalWins: stats.totalWins,
      winRate: stats.winRate,
      totalPossiblePoints: stats.totalPossiblePoints,
      totalPointsScored: stats.totalPointsScored,
      avgPoints: stats.avgPoints,
      playedGamesByFaction: {
        Faction.marquiseDeCat: stats.playedGamesAsMarquiseDeCat,
        Faction.eyrieDynasties: stats.playedGamesAsEyrieDynasties,
        Faction.woodlandAlliance: stats.playedGamesAsWoodlandAlliance,
        Faction.vagabond: stats.playedGamesAsVagabond,
        Faction.riverfolkCompany: stats.playedGamesAsRiverfolkCompany,
        Faction.theLizardCult: stats.playedGamesAsTheLizardCult,
        Faction.undergroundDuchy: stats.playedGamesAsUndergroundDuchy,
        Faction.corvidConspiracy: stats.playedGamesAsCorvidConspiracy,
        Faction.lordOfTheHundreds: stats.playedGamesAsLordOfTheHundreds,
        Faction.keepersInIron: stats.playedGamesAsKeepersInIron,
      },
      winsByFaction: {
        Faction.marquiseDeCat: stats.winsAsMarquiseDeCat,
        Faction.eyrieDynasties: stats.winsAsEyrieDynasties,
        Faction.woodlandAlliance: stats.winsAsWoodlandAlliance,
        Faction.vagabond: stats.winsAsVagabond,
        Faction.riverfolkCompany: stats.winsAsRiverfolkCompany,
        Faction.theLizardCult: stats.winsAsTheLizardCult,
        Faction.undergroundDuchy: stats.winsAsUndergroundDuchy,
        Faction.corvidConspiracy: stats.winsAsCorvidConspiracy,
        Faction.lordOfTheHundreds: stats.winsAsLordOfTheHundreds,
        Faction.keepersInIron: stats.winsAsKeepersInIron,
      },
      winsRateByFaction: {
        Faction.marquiseDeCat: stats.winsRateAsMarquiseDeCat,
        Faction.eyrieDynasties: stats.winsRateAsEyrieDynasties,
        Faction.woodlandAlliance: stats.winsRateAsWoodlandAlliance,
        Faction.vagabond: stats.winsRateAsVagabond,
        Faction.riverfolkCompany: stats.winsRateAsRiverfolkCompany,
        Faction.theLizardCult: stats.winsRateAsTheLizardCult,
        Faction.undergroundDuchy: stats.winsRateAsUndergroundDuchy,
        Faction.corvidConspiracy: stats.winsRateAsCorvidConspiracy,
        Faction.lordOfTheHundreds: stats.winsRateAsLordOfTheHundreds,
        Faction.keepersInIron: stats.winsRateAsKeepersInIron,
      },
      avgPointsByFaction: {
        Faction.marquiseDeCat: stats.avgPointsScoredAsMarquiseDeCat,
        Faction.eyrieDynasties: stats.avgPointsScoredAsEyrieDynasties,
        Faction.woodlandAlliance: stats.avgPointsScoredAsWoodlandAlliance,
        Faction.vagabond: stats.avgPointsScoredAsVagabond,
        Faction.riverfolkCompany: stats.avgPointsScoredAsRiverfolkCompany,
        Faction.theLizardCult: stats.avgPointsScoredAsTheLizardCult,
        Faction.undergroundDuchy: stats.avgPointsScoredAsUndergroundDuchy,
        Faction.corvidConspiracy: stats.avgPointsScoredAsCorvidConspiracy,
        Faction.lordOfTheHundreds: stats.avgPointsScoredAsLordOfTheHundreds,
        Faction.keepersInIron: stats.avgPointsScoredAsKeepersInIron,
      },
    );
  }

  factory HomeStatsSnapshot.fromPlayerStats(PlayerStats stats) {
    return HomeStatsSnapshot(
      totalMatchesPlayed: stats.totalMatchesPlayed,
      totalWins: stats.totalWins,
      winRate: stats.winRate,
      totalPossiblePoints: stats.totalPossiblePoints,
      totalPointsScored: stats.totalPointsScored,
      avgPoints: stats.avgPoints,
      playedGamesByFaction: {
        Faction.marquiseDeCat: stats.playedGamesAsMarquiseDeCat,
        Faction.eyrieDynasties: stats.playedGamesAsEyrieDynasties,
        Faction.woodlandAlliance: stats.playedGamesAsWoodlandAlliance,
        Faction.vagabond: stats.playedGamesAsVagabond,
        Faction.riverfolkCompany: stats.playedGamesAsRiverfolkCompany,
        Faction.theLizardCult: stats.playedGamesAsTheLizardCult,
        Faction.undergroundDuchy: stats.playedGamesAsUndergroundDuchy,
        Faction.corvidConspiracy: stats.playedGamesAsCorvidConspiracy,
        Faction.lordOfTheHundreds: stats.playedGamesAsLordOfTheHundreds,
        Faction.keepersInIron: stats.playedGamesAsKeepersInIron,
      },
      winsByFaction: {
        Faction.marquiseDeCat: stats.winsAsMarquiseDeCat,
        Faction.eyrieDynasties: stats.winsAsEyrieDynasties,
        Faction.woodlandAlliance: stats.winsAsWoodlandAlliance,
        Faction.vagabond: stats.winsAsVagabond,
        Faction.riverfolkCompany: stats.winsAsRiverfolkCompany,
        Faction.theLizardCult: stats.winsAsTheLizardCult,
        Faction.undergroundDuchy: stats.winsAsUndergroundDuchy,
        Faction.corvidConspiracy: stats.winsAsCorvidConspiracy,
        Faction.lordOfTheHundreds: stats.winsAsLordOfTheHundreds,
        Faction.keepersInIron: stats.winsAsKeepersInIron,
      },
      winsRateByFaction: {
        Faction.marquiseDeCat: stats.winsRateAsMarquiseDeCat,
        Faction.eyrieDynasties: stats.winsRateAsEyrieDynasties,
        Faction.woodlandAlliance: stats.winsRateAsWoodlandAlliance,
        Faction.vagabond: stats.winsRateAsVagabond,
        Faction.riverfolkCompany: stats.winsRateAsRiverfolkCompany,
        Faction.theLizardCult: stats.winsRateAsTheLizardCult,
        Faction.undergroundDuchy: stats.winsRateAsUndergroundDuchy,
        Faction.corvidConspiracy: stats.winsRateAsCorvidConspiracy,
        Faction.lordOfTheHundreds: stats.winsRateAsLordOfTheHundreds,
        Faction.keepersInIron: stats.winsRateAsKeepersInIron,
      },
      avgPointsByFaction: {
        Faction.marquiseDeCat: stats.avgPointsScoredAsMarquiseDeCat,
        Faction.eyrieDynasties: stats.avgPointsScoredAsEyrieDynasties,
        Faction.woodlandAlliance: stats.avgPointsScoredAsWoodlandAlliance,
        Faction.vagabond: stats.avgPointsScoredAsVagabond,
        Faction.riverfolkCompany: stats.avgPointsScoredAsRiverfolkCompany,
        Faction.theLizardCult: stats.avgPointsScoredAsTheLizardCult,
        Faction.undergroundDuchy: stats.avgPointsScoredAsUndergroundDuchy,
        Faction.corvidConspiracy: stats.avgPointsScoredAsCorvidConspiracy,
        Faction.lordOfTheHundreds: stats.avgPointsScoredAsLordOfTheHundreds,
        Faction.keepersInIron: stats.avgPointsScoredAsKeepersInIron,
      },
    );
  }

  final int totalMatchesPlayed;
  final int totalWins;
  final double winRate;
  final int totalPossiblePoints;
  final int totalPointsScored;
  final double avgPoints;

  final Map<Faction, int> playedGamesByFaction;
  final Map<Faction, int> winsByFaction;
  final Map<Faction, double> winsRateByFaction;
  final Map<Faction, double> avgPointsByFaction;

  static const allFactions = <Faction>[
    Faction.marquiseDeCat,
    Faction.eyrieDynasties,
    Faction.woodlandAlliance,
    Faction.vagabond,
    Faction.riverfolkCompany,
    Faction.theLizardCult,
    Faction.undergroundDuchy,
    Faction.corvidConspiracy,
    Faction.lordOfTheHundreds,
    Faction.keepersInIron,
  ];

  int playedGamesForFaction(Faction faction) {
    return playedGamesByFaction[faction] ?? 0;
  }

  int winsForFaction(Faction faction) {
    return winsByFaction[faction] ?? 0;
  }

  double winRateForFaction(Faction faction) {
    return winsRateByFaction[faction] ?? 0;
  }

  double avgPointsForFaction(Faction faction) {
    return avgPointsByFaction[faction] ?? 0;
  }
}
