/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class PlatformStats implements _i1.SerializableModel {
  PlatformStats._({
    required this.totalMatchesPlayed,
    required this.totalWins,
    required this.winRate,
    required this.totalPossiblePoints,
    required this.totalPointsScored,
    required this.avgPoints,
    required this.playedGamesAsMarquiseDeCat,
    required this.playedGamesAsEyrieDynasties,
    required this.playedGamesAsWoodlandAlliance,
    required this.playedGamesAsVagabond,
    required this.playedGamesAsRiverfolkCompany,
    required this.playedGamesAsTheLizardCult,
    required this.playedGamesAsUndergroundDuchy,
    required this.playedGamesAsCorvidConspiracy,
    required this.playedGamesAsLordOfTheHundreds,
    required this.playedGamesAsKeepersInIron,
    required this.winsAsMarquiseDeCat,
    required this.winsAsEyrieDynasties,
    required this.winsAsWoodlandAlliance,
    required this.winsAsVagabond,
    required this.winsAsRiverfolkCompany,
    required this.winsAsTheLizardCult,
    required this.winsAsUndergroundDuchy,
    required this.winsAsCorvidConspiracy,
    required this.winsAsLordOfTheHundreds,
    required this.winsAsKeepersInIron,
    required this.winsRateAsMarquiseDeCat,
    required this.winsRateAsEyrieDynasties,
    required this.winsRateAsWoodlandAlliance,
    required this.winsRateAsVagabond,
    required this.winsRateAsRiverfolkCompany,
    required this.winsRateAsTheLizardCult,
    required this.winsRateAsUndergroundDuchy,
    required this.winsRateAsCorvidConspiracy,
    required this.winsRateAsLordOfTheHundreds,
    required this.winsRateAsKeepersInIron,
    required this.avgPointsScoredAsMarquiseDeCat,
    required this.avgPointsScoredAsEyrieDynasties,
    required this.avgPointsScoredAsWoodlandAlliance,
    required this.avgPointsScoredAsVagabond,
    required this.avgPointsScoredAsRiverfolkCompany,
    required this.avgPointsScoredAsTheLizardCult,
    required this.avgPointsScoredAsUndergroundDuchy,
    required this.avgPointsScoredAsCorvidConspiracy,
    required this.avgPointsScoredAsLordOfTheHundreds,
    required this.avgPointsScoredAsKeepersInIron,
  });

  factory PlatformStats({
    required int totalMatchesPlayed,
    required int totalWins,
    required double winRate,
    required int totalPossiblePoints,
    required int totalPointsScored,
    required double avgPoints,
    required int playedGamesAsMarquiseDeCat,
    required int playedGamesAsEyrieDynasties,
    required int playedGamesAsWoodlandAlliance,
    required int playedGamesAsVagabond,
    required int playedGamesAsRiverfolkCompany,
    required int playedGamesAsTheLizardCult,
    required int playedGamesAsUndergroundDuchy,
    required int playedGamesAsCorvidConspiracy,
    required int playedGamesAsLordOfTheHundreds,
    required int playedGamesAsKeepersInIron,
    required int winsAsMarquiseDeCat,
    required int winsAsEyrieDynasties,
    required int winsAsWoodlandAlliance,
    required int winsAsVagabond,
    required int winsAsRiverfolkCompany,
    required int winsAsTheLizardCult,
    required int winsAsUndergroundDuchy,
    required int winsAsCorvidConspiracy,
    required int winsAsLordOfTheHundreds,
    required int winsAsKeepersInIron,
    required double winsRateAsMarquiseDeCat,
    required double winsRateAsEyrieDynasties,
    required double winsRateAsWoodlandAlliance,
    required double winsRateAsVagabond,
    required double winsRateAsRiverfolkCompany,
    required double winsRateAsTheLizardCult,
    required double winsRateAsUndergroundDuchy,
    required double winsRateAsCorvidConspiracy,
    required double winsRateAsLordOfTheHundreds,
    required double winsRateAsKeepersInIron,
    required double avgPointsScoredAsMarquiseDeCat,
    required double avgPointsScoredAsEyrieDynasties,
    required double avgPointsScoredAsWoodlandAlliance,
    required double avgPointsScoredAsVagabond,
    required double avgPointsScoredAsRiverfolkCompany,
    required double avgPointsScoredAsTheLizardCult,
    required double avgPointsScoredAsUndergroundDuchy,
    required double avgPointsScoredAsCorvidConspiracy,
    required double avgPointsScoredAsLordOfTheHundreds,
    required double avgPointsScoredAsKeepersInIron,
  }) = _PlatformStatsImpl;

  factory PlatformStats.fromJson(Map<String, dynamic> jsonSerialization) {
    return PlatformStats(
      totalMatchesPlayed: jsonSerialization['totalMatchesPlayed'] as int,
      totalWins: jsonSerialization['totalWins'] as int,
      winRate: (jsonSerialization['winRate'] as num).toDouble(),
      totalPossiblePoints: jsonSerialization['totalPossiblePoints'] as int,
      totalPointsScored: jsonSerialization['totalPointsScored'] as int,
      avgPoints: (jsonSerialization['avgPoints'] as num).toDouble(),
      playedGamesAsMarquiseDeCat:
          jsonSerialization['playedGamesAsMarquiseDeCat'] as int,
      playedGamesAsEyrieDynasties:
          jsonSerialization['playedGamesAsEyrieDynasties'] as int,
      playedGamesAsWoodlandAlliance:
          jsonSerialization['playedGamesAsWoodlandAlliance'] as int,
      playedGamesAsVagabond: jsonSerialization['playedGamesAsVagabond'] as int,
      playedGamesAsRiverfolkCompany:
          jsonSerialization['playedGamesAsRiverfolkCompany'] as int,
      playedGamesAsTheLizardCult:
          jsonSerialization['playedGamesAsTheLizardCult'] as int,
      playedGamesAsUndergroundDuchy:
          jsonSerialization['playedGamesAsUndergroundDuchy'] as int,
      playedGamesAsCorvidConspiracy:
          jsonSerialization['playedGamesAsCorvidConspiracy'] as int,
      playedGamesAsLordOfTheHundreds:
          jsonSerialization['playedGamesAsLordOfTheHundreds'] as int,
      playedGamesAsKeepersInIron:
          jsonSerialization['playedGamesAsKeepersInIron'] as int,
      winsAsMarquiseDeCat: jsonSerialization['winsAsMarquiseDeCat'] as int,
      winsAsEyrieDynasties: jsonSerialization['winsAsEyrieDynasties'] as int,
      winsAsWoodlandAlliance:
          jsonSerialization['winsAsWoodlandAlliance'] as int,
      winsAsVagabond: jsonSerialization['winsAsVagabond'] as int,
      winsAsRiverfolkCompany:
          jsonSerialization['winsAsRiverfolkCompany'] as int,
      winsAsTheLizardCult: jsonSerialization['winsAsTheLizardCult'] as int,
      winsAsUndergroundDuchy:
          jsonSerialization['winsAsUndergroundDuchy'] as int,
      winsAsCorvidConspiracy:
          jsonSerialization['winsAsCorvidConspiracy'] as int,
      winsAsLordOfTheHundreds:
          jsonSerialization['winsAsLordOfTheHundreds'] as int,
      winsAsKeepersInIron: jsonSerialization['winsAsKeepersInIron'] as int,
      winsRateAsMarquiseDeCat:
          (jsonSerialization['winsRateAsMarquiseDeCat'] as num).toDouble(),
      winsRateAsEyrieDynasties:
          (jsonSerialization['winsRateAsEyrieDynasties'] as num).toDouble(),
      winsRateAsWoodlandAlliance:
          (jsonSerialization['winsRateAsWoodlandAlliance'] as num).toDouble(),
      winsRateAsVagabond: (jsonSerialization['winsRateAsVagabond'] as num)
          .toDouble(),
      winsRateAsRiverfolkCompany:
          (jsonSerialization['winsRateAsRiverfolkCompany'] as num).toDouble(),
      winsRateAsTheLizardCult:
          (jsonSerialization['winsRateAsTheLizardCult'] as num).toDouble(),
      winsRateAsUndergroundDuchy:
          (jsonSerialization['winsRateAsUndergroundDuchy'] as num).toDouble(),
      winsRateAsCorvidConspiracy:
          (jsonSerialization['winsRateAsCorvidConspiracy'] as num).toDouble(),
      winsRateAsLordOfTheHundreds:
          (jsonSerialization['winsRateAsLordOfTheHundreds'] as num).toDouble(),
      winsRateAsKeepersInIron:
          (jsonSerialization['winsRateAsKeepersInIron'] as num).toDouble(),
      avgPointsScoredAsMarquiseDeCat:
          (jsonSerialization['avgPointsScoredAsMarquiseDeCat'] as num)
              .toDouble(),
      avgPointsScoredAsEyrieDynasties:
          (jsonSerialization['avgPointsScoredAsEyrieDynasties'] as num)
              .toDouble(),
      avgPointsScoredAsWoodlandAlliance:
          (jsonSerialization['avgPointsScoredAsWoodlandAlliance'] as num)
              .toDouble(),
      avgPointsScoredAsVagabond:
          (jsonSerialization['avgPointsScoredAsVagabond'] as num).toDouble(),
      avgPointsScoredAsRiverfolkCompany:
          (jsonSerialization['avgPointsScoredAsRiverfolkCompany'] as num)
              .toDouble(),
      avgPointsScoredAsTheLizardCult:
          (jsonSerialization['avgPointsScoredAsTheLizardCult'] as num)
              .toDouble(),
      avgPointsScoredAsUndergroundDuchy:
          (jsonSerialization['avgPointsScoredAsUndergroundDuchy'] as num)
              .toDouble(),
      avgPointsScoredAsCorvidConspiracy:
          (jsonSerialization['avgPointsScoredAsCorvidConspiracy'] as num)
              .toDouble(),
      avgPointsScoredAsLordOfTheHundreds:
          (jsonSerialization['avgPointsScoredAsLordOfTheHundreds'] as num)
              .toDouble(),
      avgPointsScoredAsKeepersInIron:
          (jsonSerialization['avgPointsScoredAsKeepersInIron'] as num)
              .toDouble(),
    );
  }

  int totalMatchesPlayed;

  int totalWins;

  double winRate;

  int totalPossiblePoints;

  int totalPointsScored;

  double avgPoints;

  int playedGamesAsMarquiseDeCat;

  int playedGamesAsEyrieDynasties;

  int playedGamesAsWoodlandAlliance;

  int playedGamesAsVagabond;

  int playedGamesAsRiverfolkCompany;

  int playedGamesAsTheLizardCult;

  int playedGamesAsUndergroundDuchy;

  int playedGamesAsCorvidConspiracy;

  int playedGamesAsLordOfTheHundreds;

  int playedGamesAsKeepersInIron;

  int winsAsMarquiseDeCat;

  int winsAsEyrieDynasties;

  int winsAsWoodlandAlliance;

  int winsAsVagabond;

  int winsAsRiverfolkCompany;

  int winsAsTheLizardCult;

  int winsAsUndergroundDuchy;

  int winsAsCorvidConspiracy;

  int winsAsLordOfTheHundreds;

  int winsAsKeepersInIron;

  double winsRateAsMarquiseDeCat;

  double winsRateAsEyrieDynasties;

  double winsRateAsWoodlandAlliance;

  double winsRateAsVagabond;

  double winsRateAsRiverfolkCompany;

  double winsRateAsTheLizardCult;

  double winsRateAsUndergroundDuchy;

  double winsRateAsCorvidConspiracy;

  double winsRateAsLordOfTheHundreds;

  double winsRateAsKeepersInIron;

  double avgPointsScoredAsMarquiseDeCat;

  double avgPointsScoredAsEyrieDynasties;

  double avgPointsScoredAsWoodlandAlliance;

  double avgPointsScoredAsVagabond;

  double avgPointsScoredAsRiverfolkCompany;

  double avgPointsScoredAsTheLizardCult;

  double avgPointsScoredAsUndergroundDuchy;

  double avgPointsScoredAsCorvidConspiracy;

  double avgPointsScoredAsLordOfTheHundreds;

  double avgPointsScoredAsKeepersInIron;

  /// Returns a shallow copy of this [PlatformStats]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PlatformStats copyWith({
    int? totalMatchesPlayed,
    int? totalWins,
    double? winRate,
    int? totalPossiblePoints,
    int? totalPointsScored,
    double? avgPoints,
    int? playedGamesAsMarquiseDeCat,
    int? playedGamesAsEyrieDynasties,
    int? playedGamesAsWoodlandAlliance,
    int? playedGamesAsVagabond,
    int? playedGamesAsRiverfolkCompany,
    int? playedGamesAsTheLizardCult,
    int? playedGamesAsUndergroundDuchy,
    int? playedGamesAsCorvidConspiracy,
    int? playedGamesAsLordOfTheHundreds,
    int? playedGamesAsKeepersInIron,
    int? winsAsMarquiseDeCat,
    int? winsAsEyrieDynasties,
    int? winsAsWoodlandAlliance,
    int? winsAsVagabond,
    int? winsAsRiverfolkCompany,
    int? winsAsTheLizardCult,
    int? winsAsUndergroundDuchy,
    int? winsAsCorvidConspiracy,
    int? winsAsLordOfTheHundreds,
    int? winsAsKeepersInIron,
    double? winsRateAsMarquiseDeCat,
    double? winsRateAsEyrieDynasties,
    double? winsRateAsWoodlandAlliance,
    double? winsRateAsVagabond,
    double? winsRateAsRiverfolkCompany,
    double? winsRateAsTheLizardCult,
    double? winsRateAsUndergroundDuchy,
    double? winsRateAsCorvidConspiracy,
    double? winsRateAsLordOfTheHundreds,
    double? winsRateAsKeepersInIron,
    double? avgPointsScoredAsMarquiseDeCat,
    double? avgPointsScoredAsEyrieDynasties,
    double? avgPointsScoredAsWoodlandAlliance,
    double? avgPointsScoredAsVagabond,
    double? avgPointsScoredAsRiverfolkCompany,
    double? avgPointsScoredAsTheLizardCult,
    double? avgPointsScoredAsUndergroundDuchy,
    double? avgPointsScoredAsCorvidConspiracy,
    double? avgPointsScoredAsLordOfTheHundreds,
    double? avgPointsScoredAsKeepersInIron,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'PlatformStats',
      'totalMatchesPlayed': totalMatchesPlayed,
      'totalWins': totalWins,
      'winRate': winRate,
      'totalPossiblePoints': totalPossiblePoints,
      'totalPointsScored': totalPointsScored,
      'avgPoints': avgPoints,
      'playedGamesAsMarquiseDeCat': playedGamesAsMarquiseDeCat,
      'playedGamesAsEyrieDynasties': playedGamesAsEyrieDynasties,
      'playedGamesAsWoodlandAlliance': playedGamesAsWoodlandAlliance,
      'playedGamesAsVagabond': playedGamesAsVagabond,
      'playedGamesAsRiverfolkCompany': playedGamesAsRiverfolkCompany,
      'playedGamesAsTheLizardCult': playedGamesAsTheLizardCult,
      'playedGamesAsUndergroundDuchy': playedGamesAsUndergroundDuchy,
      'playedGamesAsCorvidConspiracy': playedGamesAsCorvidConspiracy,
      'playedGamesAsLordOfTheHundreds': playedGamesAsLordOfTheHundreds,
      'playedGamesAsKeepersInIron': playedGamesAsKeepersInIron,
      'winsAsMarquiseDeCat': winsAsMarquiseDeCat,
      'winsAsEyrieDynasties': winsAsEyrieDynasties,
      'winsAsWoodlandAlliance': winsAsWoodlandAlliance,
      'winsAsVagabond': winsAsVagabond,
      'winsAsRiverfolkCompany': winsAsRiverfolkCompany,
      'winsAsTheLizardCult': winsAsTheLizardCult,
      'winsAsUndergroundDuchy': winsAsUndergroundDuchy,
      'winsAsCorvidConspiracy': winsAsCorvidConspiracy,
      'winsAsLordOfTheHundreds': winsAsLordOfTheHundreds,
      'winsAsKeepersInIron': winsAsKeepersInIron,
      'winsRateAsMarquiseDeCat': winsRateAsMarquiseDeCat,
      'winsRateAsEyrieDynasties': winsRateAsEyrieDynasties,
      'winsRateAsWoodlandAlliance': winsRateAsWoodlandAlliance,
      'winsRateAsVagabond': winsRateAsVagabond,
      'winsRateAsRiverfolkCompany': winsRateAsRiverfolkCompany,
      'winsRateAsTheLizardCult': winsRateAsTheLizardCult,
      'winsRateAsUndergroundDuchy': winsRateAsUndergroundDuchy,
      'winsRateAsCorvidConspiracy': winsRateAsCorvidConspiracy,
      'winsRateAsLordOfTheHundreds': winsRateAsLordOfTheHundreds,
      'winsRateAsKeepersInIron': winsRateAsKeepersInIron,
      'avgPointsScoredAsMarquiseDeCat': avgPointsScoredAsMarquiseDeCat,
      'avgPointsScoredAsEyrieDynasties': avgPointsScoredAsEyrieDynasties,
      'avgPointsScoredAsWoodlandAlliance': avgPointsScoredAsWoodlandAlliance,
      'avgPointsScoredAsVagabond': avgPointsScoredAsVagabond,
      'avgPointsScoredAsRiverfolkCompany': avgPointsScoredAsRiverfolkCompany,
      'avgPointsScoredAsTheLizardCult': avgPointsScoredAsTheLizardCult,
      'avgPointsScoredAsUndergroundDuchy': avgPointsScoredAsUndergroundDuchy,
      'avgPointsScoredAsCorvidConspiracy': avgPointsScoredAsCorvidConspiracy,
      'avgPointsScoredAsLordOfTheHundreds': avgPointsScoredAsLordOfTheHundreds,
      'avgPointsScoredAsKeepersInIron': avgPointsScoredAsKeepersInIron,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _PlatformStatsImpl extends PlatformStats {
  _PlatformStatsImpl({
    required int totalMatchesPlayed,
    required int totalWins,
    required double winRate,
    required int totalPossiblePoints,
    required int totalPointsScored,
    required double avgPoints,
    required int playedGamesAsMarquiseDeCat,
    required int playedGamesAsEyrieDynasties,
    required int playedGamesAsWoodlandAlliance,
    required int playedGamesAsVagabond,
    required int playedGamesAsRiverfolkCompany,
    required int playedGamesAsTheLizardCult,
    required int playedGamesAsUndergroundDuchy,
    required int playedGamesAsCorvidConspiracy,
    required int playedGamesAsLordOfTheHundreds,
    required int playedGamesAsKeepersInIron,
    required int winsAsMarquiseDeCat,
    required int winsAsEyrieDynasties,
    required int winsAsWoodlandAlliance,
    required int winsAsVagabond,
    required int winsAsRiverfolkCompany,
    required int winsAsTheLizardCult,
    required int winsAsUndergroundDuchy,
    required int winsAsCorvidConspiracy,
    required int winsAsLordOfTheHundreds,
    required int winsAsKeepersInIron,
    required double winsRateAsMarquiseDeCat,
    required double winsRateAsEyrieDynasties,
    required double winsRateAsWoodlandAlliance,
    required double winsRateAsVagabond,
    required double winsRateAsRiverfolkCompany,
    required double winsRateAsTheLizardCult,
    required double winsRateAsUndergroundDuchy,
    required double winsRateAsCorvidConspiracy,
    required double winsRateAsLordOfTheHundreds,
    required double winsRateAsKeepersInIron,
    required double avgPointsScoredAsMarquiseDeCat,
    required double avgPointsScoredAsEyrieDynasties,
    required double avgPointsScoredAsWoodlandAlliance,
    required double avgPointsScoredAsVagabond,
    required double avgPointsScoredAsRiverfolkCompany,
    required double avgPointsScoredAsTheLizardCult,
    required double avgPointsScoredAsUndergroundDuchy,
    required double avgPointsScoredAsCorvidConspiracy,
    required double avgPointsScoredAsLordOfTheHundreds,
    required double avgPointsScoredAsKeepersInIron,
  }) : super._(
         totalMatchesPlayed: totalMatchesPlayed,
         totalWins: totalWins,
         winRate: winRate,
         totalPossiblePoints: totalPossiblePoints,
         totalPointsScored: totalPointsScored,
         avgPoints: avgPoints,
         playedGamesAsMarquiseDeCat: playedGamesAsMarquiseDeCat,
         playedGamesAsEyrieDynasties: playedGamesAsEyrieDynasties,
         playedGamesAsWoodlandAlliance: playedGamesAsWoodlandAlliance,
         playedGamesAsVagabond: playedGamesAsVagabond,
         playedGamesAsRiverfolkCompany: playedGamesAsRiverfolkCompany,
         playedGamesAsTheLizardCult: playedGamesAsTheLizardCult,
         playedGamesAsUndergroundDuchy: playedGamesAsUndergroundDuchy,
         playedGamesAsCorvidConspiracy: playedGamesAsCorvidConspiracy,
         playedGamesAsLordOfTheHundreds: playedGamesAsLordOfTheHundreds,
         playedGamesAsKeepersInIron: playedGamesAsKeepersInIron,
         winsAsMarquiseDeCat: winsAsMarquiseDeCat,
         winsAsEyrieDynasties: winsAsEyrieDynasties,
         winsAsWoodlandAlliance: winsAsWoodlandAlliance,
         winsAsVagabond: winsAsVagabond,
         winsAsRiverfolkCompany: winsAsRiverfolkCompany,
         winsAsTheLizardCult: winsAsTheLizardCult,
         winsAsUndergroundDuchy: winsAsUndergroundDuchy,
         winsAsCorvidConspiracy: winsAsCorvidConspiracy,
         winsAsLordOfTheHundreds: winsAsLordOfTheHundreds,
         winsAsKeepersInIron: winsAsKeepersInIron,
         winsRateAsMarquiseDeCat: winsRateAsMarquiseDeCat,
         winsRateAsEyrieDynasties: winsRateAsEyrieDynasties,
         winsRateAsWoodlandAlliance: winsRateAsWoodlandAlliance,
         winsRateAsVagabond: winsRateAsVagabond,
         winsRateAsRiverfolkCompany: winsRateAsRiverfolkCompany,
         winsRateAsTheLizardCult: winsRateAsTheLizardCult,
         winsRateAsUndergroundDuchy: winsRateAsUndergroundDuchy,
         winsRateAsCorvidConspiracy: winsRateAsCorvidConspiracy,
         winsRateAsLordOfTheHundreds: winsRateAsLordOfTheHundreds,
         winsRateAsKeepersInIron: winsRateAsKeepersInIron,
         avgPointsScoredAsMarquiseDeCat: avgPointsScoredAsMarquiseDeCat,
         avgPointsScoredAsEyrieDynasties: avgPointsScoredAsEyrieDynasties,
         avgPointsScoredAsWoodlandAlliance: avgPointsScoredAsWoodlandAlliance,
         avgPointsScoredAsVagabond: avgPointsScoredAsVagabond,
         avgPointsScoredAsRiverfolkCompany: avgPointsScoredAsRiverfolkCompany,
         avgPointsScoredAsTheLizardCult: avgPointsScoredAsTheLizardCult,
         avgPointsScoredAsUndergroundDuchy: avgPointsScoredAsUndergroundDuchy,
         avgPointsScoredAsCorvidConspiracy: avgPointsScoredAsCorvidConspiracy,
         avgPointsScoredAsLordOfTheHundreds: avgPointsScoredAsLordOfTheHundreds,
         avgPointsScoredAsKeepersInIron: avgPointsScoredAsKeepersInIron,
       );

  /// Returns a shallow copy of this [PlatformStats]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PlatformStats copyWith({
    int? totalMatchesPlayed,
    int? totalWins,
    double? winRate,
    int? totalPossiblePoints,
    int? totalPointsScored,
    double? avgPoints,
    int? playedGamesAsMarquiseDeCat,
    int? playedGamesAsEyrieDynasties,
    int? playedGamesAsWoodlandAlliance,
    int? playedGamesAsVagabond,
    int? playedGamesAsRiverfolkCompany,
    int? playedGamesAsTheLizardCult,
    int? playedGamesAsUndergroundDuchy,
    int? playedGamesAsCorvidConspiracy,
    int? playedGamesAsLordOfTheHundreds,
    int? playedGamesAsKeepersInIron,
    int? winsAsMarquiseDeCat,
    int? winsAsEyrieDynasties,
    int? winsAsWoodlandAlliance,
    int? winsAsVagabond,
    int? winsAsRiverfolkCompany,
    int? winsAsTheLizardCult,
    int? winsAsUndergroundDuchy,
    int? winsAsCorvidConspiracy,
    int? winsAsLordOfTheHundreds,
    int? winsAsKeepersInIron,
    double? winsRateAsMarquiseDeCat,
    double? winsRateAsEyrieDynasties,
    double? winsRateAsWoodlandAlliance,
    double? winsRateAsVagabond,
    double? winsRateAsRiverfolkCompany,
    double? winsRateAsTheLizardCult,
    double? winsRateAsUndergroundDuchy,
    double? winsRateAsCorvidConspiracy,
    double? winsRateAsLordOfTheHundreds,
    double? winsRateAsKeepersInIron,
    double? avgPointsScoredAsMarquiseDeCat,
    double? avgPointsScoredAsEyrieDynasties,
    double? avgPointsScoredAsWoodlandAlliance,
    double? avgPointsScoredAsVagabond,
    double? avgPointsScoredAsRiverfolkCompany,
    double? avgPointsScoredAsTheLizardCult,
    double? avgPointsScoredAsUndergroundDuchy,
    double? avgPointsScoredAsCorvidConspiracy,
    double? avgPointsScoredAsLordOfTheHundreds,
    double? avgPointsScoredAsKeepersInIron,
  }) {
    return PlatformStats(
      totalMatchesPlayed: totalMatchesPlayed ?? this.totalMatchesPlayed,
      totalWins: totalWins ?? this.totalWins,
      winRate: winRate ?? this.winRate,
      totalPossiblePoints: totalPossiblePoints ?? this.totalPossiblePoints,
      totalPointsScored: totalPointsScored ?? this.totalPointsScored,
      avgPoints: avgPoints ?? this.avgPoints,
      playedGamesAsMarquiseDeCat:
          playedGamesAsMarquiseDeCat ?? this.playedGamesAsMarquiseDeCat,
      playedGamesAsEyrieDynasties:
          playedGamesAsEyrieDynasties ?? this.playedGamesAsEyrieDynasties,
      playedGamesAsWoodlandAlliance:
          playedGamesAsWoodlandAlliance ?? this.playedGamesAsWoodlandAlliance,
      playedGamesAsVagabond:
          playedGamesAsVagabond ?? this.playedGamesAsVagabond,
      playedGamesAsRiverfolkCompany:
          playedGamesAsRiverfolkCompany ?? this.playedGamesAsRiverfolkCompany,
      playedGamesAsTheLizardCult:
          playedGamesAsTheLizardCult ?? this.playedGamesAsTheLizardCult,
      playedGamesAsUndergroundDuchy:
          playedGamesAsUndergroundDuchy ?? this.playedGamesAsUndergroundDuchy,
      playedGamesAsCorvidConspiracy:
          playedGamesAsCorvidConspiracy ?? this.playedGamesAsCorvidConspiracy,
      playedGamesAsLordOfTheHundreds:
          playedGamesAsLordOfTheHundreds ?? this.playedGamesAsLordOfTheHundreds,
      playedGamesAsKeepersInIron:
          playedGamesAsKeepersInIron ?? this.playedGamesAsKeepersInIron,
      winsAsMarquiseDeCat: winsAsMarquiseDeCat ?? this.winsAsMarquiseDeCat,
      winsAsEyrieDynasties: winsAsEyrieDynasties ?? this.winsAsEyrieDynasties,
      winsAsWoodlandAlliance:
          winsAsWoodlandAlliance ?? this.winsAsWoodlandAlliance,
      winsAsVagabond: winsAsVagabond ?? this.winsAsVagabond,
      winsAsRiverfolkCompany:
          winsAsRiverfolkCompany ?? this.winsAsRiverfolkCompany,
      winsAsTheLizardCult: winsAsTheLizardCult ?? this.winsAsTheLizardCult,
      winsAsUndergroundDuchy:
          winsAsUndergroundDuchy ?? this.winsAsUndergroundDuchy,
      winsAsCorvidConspiracy:
          winsAsCorvidConspiracy ?? this.winsAsCorvidConspiracy,
      winsAsLordOfTheHundreds:
          winsAsLordOfTheHundreds ?? this.winsAsLordOfTheHundreds,
      winsAsKeepersInIron: winsAsKeepersInIron ?? this.winsAsKeepersInIron,
      winsRateAsMarquiseDeCat:
          winsRateAsMarquiseDeCat ?? this.winsRateAsMarquiseDeCat,
      winsRateAsEyrieDynasties:
          winsRateAsEyrieDynasties ?? this.winsRateAsEyrieDynasties,
      winsRateAsWoodlandAlliance:
          winsRateAsWoodlandAlliance ?? this.winsRateAsWoodlandAlliance,
      winsRateAsVagabond: winsRateAsVagabond ?? this.winsRateAsVagabond,
      winsRateAsRiverfolkCompany:
          winsRateAsRiverfolkCompany ?? this.winsRateAsRiverfolkCompany,
      winsRateAsTheLizardCult:
          winsRateAsTheLizardCult ?? this.winsRateAsTheLizardCult,
      winsRateAsUndergroundDuchy:
          winsRateAsUndergroundDuchy ?? this.winsRateAsUndergroundDuchy,
      winsRateAsCorvidConspiracy:
          winsRateAsCorvidConspiracy ?? this.winsRateAsCorvidConspiracy,
      winsRateAsLordOfTheHundreds:
          winsRateAsLordOfTheHundreds ?? this.winsRateAsLordOfTheHundreds,
      winsRateAsKeepersInIron:
          winsRateAsKeepersInIron ?? this.winsRateAsKeepersInIron,
      avgPointsScoredAsMarquiseDeCat:
          avgPointsScoredAsMarquiseDeCat ?? this.avgPointsScoredAsMarquiseDeCat,
      avgPointsScoredAsEyrieDynasties:
          avgPointsScoredAsEyrieDynasties ??
          this.avgPointsScoredAsEyrieDynasties,
      avgPointsScoredAsWoodlandAlliance:
          avgPointsScoredAsWoodlandAlliance ??
          this.avgPointsScoredAsWoodlandAlliance,
      avgPointsScoredAsVagabond:
          avgPointsScoredAsVagabond ?? this.avgPointsScoredAsVagabond,
      avgPointsScoredAsRiverfolkCompany:
          avgPointsScoredAsRiverfolkCompany ??
          this.avgPointsScoredAsRiverfolkCompany,
      avgPointsScoredAsTheLizardCult:
          avgPointsScoredAsTheLizardCult ?? this.avgPointsScoredAsTheLizardCult,
      avgPointsScoredAsUndergroundDuchy:
          avgPointsScoredAsUndergroundDuchy ??
          this.avgPointsScoredAsUndergroundDuchy,
      avgPointsScoredAsCorvidConspiracy:
          avgPointsScoredAsCorvidConspiracy ??
          this.avgPointsScoredAsCorvidConspiracy,
      avgPointsScoredAsLordOfTheHundreds:
          avgPointsScoredAsLordOfTheHundreds ??
          this.avgPointsScoredAsLordOfTheHundreds,
      avgPointsScoredAsKeepersInIron:
          avgPointsScoredAsKeepersInIron ?? this.avgPointsScoredAsKeepersInIron,
    );
  }
}
