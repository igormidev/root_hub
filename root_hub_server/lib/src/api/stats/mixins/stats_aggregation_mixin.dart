import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class _StatsScope {
  const _StatsScope({
    this.whereClause,
    this.parameters,
  });

  final String? whereClause;
  final QueryParameters? parameters;
}

class FactionStatsSummary {
  const FactionStatsSummary({
    this.playedGames = 0,
    this.wins = 0,
    this.totalPointsScored = 0,
    this.pointsTrackedGames = 0,
  });

  final int playedGames;
  final int wins;
  final int totalPointsScored;
  final int pointsTrackedGames;

  double get winRate => _safeDivide(wins, playedGames);
  double get avgPoints => _safeDivide(totalPointsScored, pointsTrackedGames);
}

class StatsAggregationSummary {
  StatsAggregationSummary({
    required this.totalMatchesPlayed,
    required this.totalWins,
    required this.totalPointsScored,
    required this.pointsTrackedGames,
    required Map<Faction, FactionStatsSummary> factionStats,
  }) : _factionStats = factionStats;

  static const _maxPointsPerMatch = 30;

  final int totalMatchesPlayed;
  final int totalWins;
  final int totalPointsScored;
  final int pointsTrackedGames;
  final Map<Faction, FactionStatsSummary> _factionStats;

  int get totalPossiblePoints => pointsTrackedGames * _maxPointsPerMatch;
  double get winRate => _safeDivide(totalWins, totalMatchesPlayed);
  double get avgPoints => _safeDivide(totalPointsScored, pointsTrackedGames);

  FactionStatsSummary _faction(Faction faction) {
    return _factionStats[faction] ?? const FactionStatsSummary();
  }

  PlatformStats toPlatformStats() {
    return PlatformStats(
      totalMatchesPlayed: totalMatchesPlayed,
      totalWins: totalWins,
      winRate: winRate,
      totalPossiblePoints: totalPossiblePoints,
      totalPointsScored: totalPointsScored,
      avgPoints: avgPoints,
      playedGamesAsMarquiseDeCat: _faction(Faction.marquiseDeCat).playedGames,
      playedGamesAsEyrieDynasties: _faction(Faction.eyrieDynasties).playedGames,
      playedGamesAsWoodlandAlliance: _faction(
        Faction.woodlandAlliance,
      ).playedGames,
      playedGamesAsVagabond: _faction(Faction.vagabond).playedGames,
      playedGamesAsRiverfolkCompany: _faction(
        Faction.riverfolkCompany,
      ).playedGames,
      playedGamesAsTheLizardCult: _faction(Faction.theLizardCult).playedGames,
      playedGamesAsUndergroundDuchy: _faction(
        Faction.undergroundDuchy,
      ).playedGames,
      playedGamesAsCorvidConspiracy: _faction(
        Faction.corvidConspiracy,
      ).playedGames,
      playedGamesAsLordOfTheHundreds: _faction(
        Faction.lordOfTheHundreds,
      ).playedGames,
      playedGamesAsKeepersInIron: _faction(Faction.keepersInIron).playedGames,
      winsAsMarquiseDeCat: _faction(Faction.marquiseDeCat).wins,
      winsAsEyrieDynasties: _faction(Faction.eyrieDynasties).wins,
      winsAsWoodlandAlliance: _faction(Faction.woodlandAlliance).wins,
      winsAsVagabond: _faction(Faction.vagabond).wins,
      winsAsRiverfolkCompany: _faction(Faction.riverfolkCompany).wins,
      winsAsTheLizardCult: _faction(Faction.theLizardCult).wins,
      winsAsUndergroundDuchy: _faction(Faction.undergroundDuchy).wins,
      winsAsCorvidConspiracy: _faction(Faction.corvidConspiracy).wins,
      winsAsLordOfTheHundreds: _faction(Faction.lordOfTheHundreds).wins,
      winsAsKeepersInIron: _faction(Faction.keepersInIron).wins,
      winsRateAsMarquiseDeCat: _faction(Faction.marquiseDeCat).winRate,
      winsRateAsEyrieDynasties: _faction(Faction.eyrieDynasties).winRate,
      winsRateAsWoodlandAlliance: _faction(Faction.woodlandAlliance).winRate,
      winsRateAsVagabond: _faction(Faction.vagabond).winRate,
      winsRateAsRiverfolkCompany: _faction(Faction.riverfolkCompany).winRate,
      winsRateAsTheLizardCult: _faction(Faction.theLizardCult).winRate,
      winsRateAsUndergroundDuchy: _faction(Faction.undergroundDuchy).winRate,
      winsRateAsCorvidConspiracy: _faction(Faction.corvidConspiracy).winRate,
      winsRateAsLordOfTheHundreds: _faction(Faction.lordOfTheHundreds).winRate,
      winsRateAsKeepersInIron: _faction(Faction.keepersInIron).winRate,
      avgPointsScoredAsMarquiseDeCat: _faction(Faction.marquiseDeCat).avgPoints,
      avgPointsScoredAsEyrieDynasties: _faction(
        Faction.eyrieDynasties,
      ).avgPoints,
      avgPointsScoredAsWoodlandAlliance: _faction(
        Faction.woodlandAlliance,
      ).avgPoints,
      avgPointsScoredAsVagabond: _faction(Faction.vagabond).avgPoints,
      avgPointsScoredAsRiverfolkCompany: _faction(
        Faction.riverfolkCompany,
      ).avgPoints,
      avgPointsScoredAsTheLizardCult: _faction(Faction.theLizardCult).avgPoints,
      avgPointsScoredAsUndergroundDuchy: _faction(
        Faction.undergroundDuchy,
      ).avgPoints,
      avgPointsScoredAsCorvidConspiracy: _faction(
        Faction.corvidConspiracy,
      ).avgPoints,
      avgPointsScoredAsLordOfTheHundreds: _faction(
        Faction.lordOfTheHundreds,
      ).avgPoints,
      avgPointsScoredAsKeepersInIron: _faction(Faction.keepersInIron).avgPoints,
    );
  }

  PlayerStats toPlayerStats() {
    return PlayerStats(
      totalMatchesPlayed: totalMatchesPlayed,
      totalWins: totalWins,
      winRate: winRate,
      totalPossiblePoints: totalPossiblePoints,
      totalPointsScored: totalPointsScored,
      avgPoints: avgPoints,
      playedGamesAsMarquiseDeCat: _faction(Faction.marquiseDeCat).playedGames,
      playedGamesAsEyrieDynasties: _faction(Faction.eyrieDynasties).playedGames,
      playedGamesAsWoodlandAlliance: _faction(
        Faction.woodlandAlliance,
      ).playedGames,
      playedGamesAsVagabond: _faction(Faction.vagabond).playedGames,
      playedGamesAsRiverfolkCompany: _faction(
        Faction.riverfolkCompany,
      ).playedGames,
      playedGamesAsTheLizardCult: _faction(Faction.theLizardCult).playedGames,
      playedGamesAsUndergroundDuchy: _faction(
        Faction.undergroundDuchy,
      ).playedGames,
      playedGamesAsCorvidConspiracy: _faction(
        Faction.corvidConspiracy,
      ).playedGames,
      playedGamesAsLordOfTheHundreds: _faction(
        Faction.lordOfTheHundreds,
      ).playedGames,
      playedGamesAsKeepersInIron: _faction(Faction.keepersInIron).playedGames,
      winsAsMarquiseDeCat: _faction(Faction.marquiseDeCat).wins,
      winsAsEyrieDynasties: _faction(Faction.eyrieDynasties).wins,
      winsAsWoodlandAlliance: _faction(Faction.woodlandAlliance).wins,
      winsAsVagabond: _faction(Faction.vagabond).wins,
      winsAsRiverfolkCompany: _faction(Faction.riverfolkCompany).wins,
      winsAsTheLizardCult: _faction(Faction.theLizardCult).wins,
      winsAsUndergroundDuchy: _faction(Faction.undergroundDuchy).wins,
      winsAsCorvidConspiracy: _faction(Faction.corvidConspiracy).wins,
      winsAsLordOfTheHundreds: _faction(Faction.lordOfTheHundreds).wins,
      winsAsKeepersInIron: _faction(Faction.keepersInIron).wins,
      winsRateAsMarquiseDeCat: _faction(Faction.marquiseDeCat).winRate,
      winsRateAsEyrieDynasties: _faction(Faction.eyrieDynasties).winRate,
      winsRateAsWoodlandAlliance: _faction(Faction.woodlandAlliance).winRate,
      winsRateAsVagabond: _faction(Faction.vagabond).winRate,
      winsRateAsRiverfolkCompany: _faction(Faction.riverfolkCompany).winRate,
      winsRateAsTheLizardCult: _faction(Faction.theLizardCult).winRate,
      winsRateAsUndergroundDuchy: _faction(Faction.undergroundDuchy).winRate,
      winsRateAsCorvidConspiracy: _faction(Faction.corvidConspiracy).winRate,
      winsRateAsLordOfTheHundreds: _faction(Faction.lordOfTheHundreds).winRate,
      winsRateAsKeepersInIron: _faction(Faction.keepersInIron).winRate,
      avgPointsScoredAsMarquiseDeCat: _faction(Faction.marquiseDeCat).avgPoints,
      avgPointsScoredAsEyrieDynasties: _faction(
        Faction.eyrieDynasties,
      ).avgPoints,
      avgPointsScoredAsWoodlandAlliance: _faction(
        Faction.woodlandAlliance,
      ).avgPoints,
      avgPointsScoredAsVagabond: _faction(Faction.vagabond).avgPoints,
      avgPointsScoredAsRiverfolkCompany: _faction(
        Faction.riverfolkCompany,
      ).avgPoints,
      avgPointsScoredAsTheLizardCult: _faction(Faction.theLizardCult).avgPoints,
      avgPointsScoredAsUndergroundDuchy: _faction(
        Faction.undergroundDuchy,
      ).avgPoints,
      avgPointsScoredAsCorvidConspiracy: _faction(
        Faction.corvidConspiracy,
      ).avgPoints,
      avgPointsScoredAsLordOfTheHundreds: _faction(
        Faction.lordOfTheHundreds,
      ).avgPoints,
      avgPointsScoredAsKeepersInIron: _faction(Faction.keepersInIron).avgPoints,
    );
  }
}

mixin StatsAggregationMixin {
  static const _allFactions = <Faction>[
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

  Future<StatsAggregationSummary?> loadPlatformStatsSummary(
    Session session,
  ) async {
    return _loadStatsSummary(
      session,
      const _StatsScope(),
    );
  }

  Future<StatsAggregationSummary?> loadPlayerStatsSummary(
    Session session, {
    required int playerDataId,
  }) async {
    return _loadStatsSummary(
      session,
      _StatsScope(
        whereClause: 'ppm."playerDataId" = @playerDataId',
        parameters: QueryParameters.named(
          <String, Object?>{
            'playerDataId': playerDataId,
          },
        ),
      ),
    );
  }

  Future<StatsAggregationSummary?> _loadStatsSummary(
    Session session,
    _StatsScope scope,
  ) async {
    final totalsQuery = session.db.unsafeQuery(
      _buildTotalsQuery(scope),
      parameters: scope.parameters,
    );
    final factionQuery = session.db.unsafeQuery(
      _buildFactionQuery(scope),
      parameters: scope.parameters,
    );

    final totalsResult = await totalsQuery;
    if (totalsResult.isEmpty) {
      return null;
    }

    final totalsRow = totalsResult.first.toColumnMap();
    final totalMatchesPlayed = _toInt(totalsRow['total_matches_played']);
    if (totalMatchesPlayed <= 0) {
      return null;
    }

    final totalWins = _toInt(totalsRow['total_wins']);
    final totalPointsScored = _toInt(totalsRow['total_points_scored']);
    final pointsTrackedGames = _toInt(totalsRow['points_tracked_games']);

    final factionResult = await factionQuery;
    final factionStats = <Faction, FactionStatsSummary>{
      for (final faction in _allFactions) faction: const FactionStatsSummary(),
    };

    for (final row in factionResult) {
      final rowMap = row.toColumnMap();
      final rawFaction = rowMap['faction'];
      if (rawFaction is! String) {
        continue;
      }

      final faction = Faction.fromJson(rawFaction);
      factionStats[faction] = FactionStatsSummary(
        playedGames: _toInt(rowMap['played_games']),
        wins: _toInt(rowMap['wins']),
        totalPointsScored: _toInt(rowMap['total_points_scored']),
        pointsTrackedGames: _toInt(rowMap['points_tracked_games']),
      );
    }

    return StatsAggregationSummary(
      totalMatchesPlayed: totalMatchesPlayed,
      totalWins: totalWins,
      totalPointsScored: totalPointsScored,
      pointsTrackedGames: pointsTrackedGames,
      factionStats: factionStats,
    );
  }

  String _buildTotalsQuery(_StatsScope scope) {
    return '''
      SELECT
        COUNT(*)::bigint AS total_matches_played,
        COALESCE(SUM(CASE WHEN ppm."didWin" THEN 1 ELSE 0 END), 0)::bigint AS total_wins,
        COALESCE(SUM(CASE WHEN ppm."scoreInMatch" IS NOT NULL THEN ppm."scoreInMatch" ELSE 0 END), 0)::bigint AS total_points_scored,
        COALESCE(SUM(CASE WHEN ppm."scoreInMatch" IS NOT NULL THEN 1 ELSE 0 END), 0)::bigint AS points_tracked_games
      ${_buildFromClause(scope)}
      ${_buildWhereClause(scope)}
    ''';
  }

  String _buildFactionQuery(_StatsScope scope) {
    return '''
      SELECT
        ppm."factionUsedInMatch"::text AS faction,
        COUNT(*)::bigint AS played_games,
        COALESCE(SUM(CASE WHEN ppm."didWin" THEN 1 ELSE 0 END), 0)::bigint AS wins,
        COALESCE(SUM(CASE WHEN ppm."scoreInMatch" IS NOT NULL THEN ppm."scoreInMatch" ELSE 0 END), 0)::bigint AS total_points_scored,
        COALESCE(SUM(CASE WHEN ppm."scoreInMatch" IS NOT NULL THEN 1 ELSE 0 END), 0)::bigint AS points_tracked_games
      ${_buildFromClause(scope)}
      ${_buildWhereClause(scope)}
      GROUP BY ppm."factionUsedInMatch"
    ''';
  }

  String _buildFromClause(_StatsScope scope) {
    return 'FROM player_perfomance_in_match ppm';
  }

  String _buildWhereClause(_StatsScope scope) {
    if (scope.whereClause == null) {
      return '';
    }

    return 'WHERE ${scope.whereClause}';
  }
}

int _toInt(Object? value) {
  return switch (value) {
    int typedInt => typedInt,
    BigInt bigIntValue => bigIntValue.toInt(),
    num number => number.toInt(),
    String asString => int.tryParse(asString) ?? 0,
    _ => 0,
  };
}

double _safeDivide(num numerator, num denominator) {
  if (denominator == 0) {
    return 0;
  }

  return numerator / denominator;
}
