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
import '../../entities/core/anonymous_player.dart' as _i2;
import '../../entities/core/player_data.dart' as _i3;
import '../../entities/match/played_match.dart' as _i4;
import '../../entities/core/faction.dart' as _i5;
import 'package:root_hub_client/src/protocol/protocol.dart' as _i6;

abstract class PlayerPerfomanceInMatch implements _i1.SerializableModel {
  PlayerPerfomanceInMatch._({
    this.id,
    this.anonymousPlayerId,
    this.anonymousPlayer,
    this.playerDataId,
    this.playerData,
    required this.playedMatchId,
    this.playedMatch,
    required this.factionUsedInMatch,
    required this.didWin,
    this.scoreInMatch,
  });

  factory PlayerPerfomanceInMatch({
    int? id,
    int? anonymousPlayerId,
    _i2.AnonymousPlayer? anonymousPlayer,
    int? playerDataId,
    _i3.PlayerData? playerData,
    required int playedMatchId,
    _i4.PlayedMatch? playedMatch,
    required _i5.Faction factionUsedInMatch,
    required bool didWin,
    int? scoreInMatch,
  }) = _PlayerPerfomanceInMatchImpl;

  factory PlayerPerfomanceInMatch.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return PlayerPerfomanceInMatch(
      id: jsonSerialization['id'] as int?,
      anonymousPlayerId: jsonSerialization['anonymousPlayerId'] as int?,
      anonymousPlayer: jsonSerialization['anonymousPlayer'] == null
          ? null
          : _i6.Protocol().deserialize<_i2.AnonymousPlayer>(
              jsonSerialization['anonymousPlayer'],
            ),
      playerDataId: jsonSerialization['playerDataId'] as int?,
      playerData: jsonSerialization['playerData'] == null
          ? null
          : _i6.Protocol().deserialize<_i3.PlayerData>(
              jsonSerialization['playerData'],
            ),
      playedMatchId: jsonSerialization['playedMatchId'] as int,
      playedMatch: jsonSerialization['playedMatch'] == null
          ? null
          : _i6.Protocol().deserialize<_i4.PlayedMatch>(
              jsonSerialization['playedMatch'],
            ),
      factionUsedInMatch: _i5.Faction.fromJson(
        (jsonSerialization['factionUsedInMatch'] as String),
      ),
      didWin: jsonSerialization['didWin'] as bool,
      scoreInMatch: jsonSerialization['scoreInMatch'] as int?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int? anonymousPlayerId;

  _i2.AnonymousPlayer? anonymousPlayer;

  int? playerDataId;

  _i3.PlayerData? playerData;

  int playedMatchId;

  _i4.PlayedMatch? playedMatch;

  _i5.Faction factionUsedInMatch;

  bool didWin;

  int? scoreInMatch;

  /// Returns a shallow copy of this [PlayerPerfomanceInMatch]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PlayerPerfomanceInMatch copyWith({
    int? id,
    int? anonymousPlayerId,
    _i2.AnonymousPlayer? anonymousPlayer,
    int? playerDataId,
    _i3.PlayerData? playerData,
    int? playedMatchId,
    _i4.PlayedMatch? playedMatch,
    _i5.Faction? factionUsedInMatch,
    bool? didWin,
    int? scoreInMatch,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'PlayerPerfomanceInMatch',
      if (id != null) 'id': id,
      if (anonymousPlayerId != null) 'anonymousPlayerId': anonymousPlayerId,
      if (anonymousPlayer != null) 'anonymousPlayer': anonymousPlayer?.toJson(),
      if (playerDataId != null) 'playerDataId': playerDataId,
      if (playerData != null) 'playerData': playerData?.toJson(),
      'playedMatchId': playedMatchId,
      if (playedMatch != null) 'playedMatch': playedMatch?.toJson(),
      'factionUsedInMatch': factionUsedInMatch.toJson(),
      'didWin': didWin,
      if (scoreInMatch != null) 'scoreInMatch': scoreInMatch,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PlayerPerfomanceInMatchImpl extends PlayerPerfomanceInMatch {
  _PlayerPerfomanceInMatchImpl({
    int? id,
    int? anonymousPlayerId,
    _i2.AnonymousPlayer? anonymousPlayer,
    int? playerDataId,
    _i3.PlayerData? playerData,
    required int playedMatchId,
    _i4.PlayedMatch? playedMatch,
    required _i5.Faction factionUsedInMatch,
    required bool didWin,
    int? scoreInMatch,
  }) : super._(
         id: id,
         anonymousPlayerId: anonymousPlayerId,
         anonymousPlayer: anonymousPlayer,
         playerDataId: playerDataId,
         playerData: playerData,
         playedMatchId: playedMatchId,
         playedMatch: playedMatch,
         factionUsedInMatch: factionUsedInMatch,
         didWin: didWin,
         scoreInMatch: scoreInMatch,
       );

  /// Returns a shallow copy of this [PlayerPerfomanceInMatch]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PlayerPerfomanceInMatch copyWith({
    Object? id = _Undefined,
    Object? anonymousPlayerId = _Undefined,
    Object? anonymousPlayer = _Undefined,
    Object? playerDataId = _Undefined,
    Object? playerData = _Undefined,
    int? playedMatchId,
    Object? playedMatch = _Undefined,
    _i5.Faction? factionUsedInMatch,
    bool? didWin,
    Object? scoreInMatch = _Undefined,
  }) {
    return PlayerPerfomanceInMatch(
      id: id is int? ? id : this.id,
      anonymousPlayerId: anonymousPlayerId is int?
          ? anonymousPlayerId
          : this.anonymousPlayerId,
      anonymousPlayer: anonymousPlayer is _i2.AnonymousPlayer?
          ? anonymousPlayer
          : this.anonymousPlayer?.copyWith(),
      playerDataId: playerDataId is int? ? playerDataId : this.playerDataId,
      playerData: playerData is _i3.PlayerData?
          ? playerData
          : this.playerData?.copyWith(),
      playedMatchId: playedMatchId ?? this.playedMatchId,
      playedMatch: playedMatch is _i4.PlayedMatch?
          ? playedMatch
          : this.playedMatch?.copyWith(),
      factionUsedInMatch: factionUsedInMatch ?? this.factionUsedInMatch,
      didWin: didWin ?? this.didWin,
      scoreInMatch: scoreInMatch is int? ? scoreInMatch : this.scoreInMatch,
    );
  }
}
