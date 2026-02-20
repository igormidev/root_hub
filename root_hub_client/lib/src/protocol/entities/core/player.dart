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
import 'package:root_hub_client/src/protocol/protocol.dart' as _i4;

abstract class Player implements _i1.SerializableModel {
  Player._({
    this.id,
    this.anonymousPlayerId,
    this.anonymousPlayer,
    this.playerDataId,
    this.playerData,
  });

  factory Player({
    int? id,
    int? anonymousPlayerId,
    _i2.AnonymousPlayer? anonymousPlayer,
    int? playerDataId,
    _i3.PlayerData? playerData,
  }) = _PlayerImpl;

  factory Player.fromJson(Map<String, dynamic> jsonSerialization) {
    return Player(
      id: jsonSerialization['id'] as int?,
      anonymousPlayerId: jsonSerialization['anonymousPlayerId'] as int?,
      anonymousPlayer: jsonSerialization['anonymousPlayer'] == null
          ? null
          : _i4.Protocol().deserialize<_i2.AnonymousPlayer>(
              jsonSerialization['anonymousPlayer'],
            ),
      playerDataId: jsonSerialization['playerDataId'] as int?,
      playerData: jsonSerialization['playerData'] == null
          ? null
          : _i4.Protocol().deserialize<_i3.PlayerData>(
              jsonSerialization['playerData'],
            ),
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

  /// Returns a shallow copy of this [Player]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Player copyWith({
    int? id,
    int? anonymousPlayerId,
    _i2.AnonymousPlayer? anonymousPlayer,
    int? playerDataId,
    _i3.PlayerData? playerData,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Player',
      if (id != null) 'id': id,
      if (anonymousPlayerId != null) 'anonymousPlayerId': anonymousPlayerId,
      if (anonymousPlayer != null) 'anonymousPlayer': anonymousPlayer?.toJson(),
      if (playerDataId != null) 'playerDataId': playerDataId,
      if (playerData != null) 'playerData': playerData?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PlayerImpl extends Player {
  _PlayerImpl({
    int? id,
    int? anonymousPlayerId,
    _i2.AnonymousPlayer? anonymousPlayer,
    int? playerDataId,
    _i3.PlayerData? playerData,
  }) : super._(
         id: id,
         anonymousPlayerId: anonymousPlayerId,
         anonymousPlayer: anonymousPlayer,
         playerDataId: playerDataId,
         playerData: playerData,
       );

  /// Returns a shallow copy of this [Player]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Player copyWith({
    Object? id = _Undefined,
    Object? anonymousPlayerId = _Undefined,
    Object? anonymousPlayer = _Undefined,
    Object? playerDataId = _Undefined,
    Object? playerData = _Undefined,
  }) {
    return Player(
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
    );
  }
}
