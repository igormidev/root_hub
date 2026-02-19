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
import '../../entities/core/player_data.dart' as _i2;
import '../../entities/match/played_match.dart' as _i3;
import 'package:root_hub_client/src/protocol/protocol.dart' as _i4;

abstract class PlayerInMatch implements _i1.SerializableModel {
  PlayerInMatch._({
    this.id,
    required this.playerId,
    this.player,
    required this.matchId,
    this.match,
  });

  factory PlayerInMatch({
    int? id,
    required int playerId,
    _i2.PlayerData? player,
    required int matchId,
    _i3.PlayedMatch? match,
  }) = _PlayerInMatchImpl;

  factory PlayerInMatch.fromJson(Map<String, dynamic> jsonSerialization) {
    return PlayerInMatch(
      id: jsonSerialization['id'] as int?,
      playerId: jsonSerialization['playerId'] as int,
      player: jsonSerialization['player'] == null
          ? null
          : _i4.Protocol().deserialize<_i2.PlayerData>(
              jsonSerialization['player'],
            ),
      matchId: jsonSerialization['matchId'] as int,
      match: jsonSerialization['match'] == null
          ? null
          : _i4.Protocol().deserialize<_i3.PlayedMatch>(
              jsonSerialization['match'],
            ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int playerId;

  _i2.PlayerData? player;

  int matchId;

  _i3.PlayedMatch? match;

  /// Returns a shallow copy of this [PlayerInMatch]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PlayerInMatch copyWith({
    int? id,
    int? playerId,
    _i2.PlayerData? player,
    int? matchId,
    _i3.PlayedMatch? match,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'PlayerInMatch',
      if (id != null) 'id': id,
      'playerId': playerId,
      if (player != null) 'player': player?.toJson(),
      'matchId': matchId,
      if (match != null) 'match': match?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PlayerInMatchImpl extends PlayerInMatch {
  _PlayerInMatchImpl({
    int? id,
    required int playerId,
    _i2.PlayerData? player,
    required int matchId,
    _i3.PlayedMatch? match,
  }) : super._(
         id: id,
         playerId: playerId,
         player: player,
         matchId: matchId,
         match: match,
       );

  /// Returns a shallow copy of this [PlayerInMatch]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PlayerInMatch copyWith({
    Object? id = _Undefined,
    int? playerId,
    Object? player = _Undefined,
    int? matchId,
    Object? match = _Undefined,
  }) {
    return PlayerInMatch(
      id: id is int? ? id : this.id,
      playerId: playerId ?? this.playerId,
      player: player is _i2.PlayerData? ? player : this.player?.copyWith(),
      matchId: matchId ?? this.matchId,
      match: match is _i3.PlayedMatch? ? match : this.match?.copyWith(),
    );
  }
}
