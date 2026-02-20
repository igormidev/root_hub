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
import '../../entities/match/player_perfomance_in_match.dart' as _i3;
import '../../entities/core/player.dart' as _i4;
import 'package:root_hub_client/src/protocol/protocol.dart' as _i5;

abstract class AnonymousPlayer implements _i1.SerializableModel {
  AnonymousPlayer._({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.createdByPlayerId,
    this.createdByPlayer,
    this.perfomances,
    this.player,
  });

  factory AnonymousPlayer({
    int? id,
    required String firstName,
    required String lastName,
    required int createdByPlayerId,
    _i2.PlayerData? createdByPlayer,
    List<_i3.PlayerPerfomanceInMatch>? perfomances,
    _i4.Player? player,
  }) = _AnonymousPlayerImpl;

  factory AnonymousPlayer.fromJson(Map<String, dynamic> jsonSerialization) {
    return AnonymousPlayer(
      id: jsonSerialization['id'] as int?,
      firstName: jsonSerialization['firstName'] as String,
      lastName: jsonSerialization['lastName'] as String,
      createdByPlayerId: jsonSerialization['createdByPlayerId'] as int,
      createdByPlayer: jsonSerialization['createdByPlayer'] == null
          ? null
          : _i5.Protocol().deserialize<_i2.PlayerData>(
              jsonSerialization['createdByPlayer'],
            ),
      perfomances: jsonSerialization['perfomances'] == null
          ? null
          : _i5.Protocol().deserialize<List<_i3.PlayerPerfomanceInMatch>>(
              jsonSerialization['perfomances'],
            ),
      player: jsonSerialization['player'] == null
          ? null
          : _i5.Protocol().deserialize<_i4.Player>(jsonSerialization['player']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String firstName;

  String lastName;

  int createdByPlayerId;

  _i2.PlayerData? createdByPlayer;

  List<_i3.PlayerPerfomanceInMatch>? perfomances;

  _i4.Player? player;

  /// Returns a shallow copy of this [AnonymousPlayer]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  AnonymousPlayer copyWith({
    int? id,
    String? firstName,
    String? lastName,
    int? createdByPlayerId,
    _i2.PlayerData? createdByPlayer,
    List<_i3.PlayerPerfomanceInMatch>? perfomances,
    _i4.Player? player,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AnonymousPlayer',
      if (id != null) 'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'createdByPlayerId': createdByPlayerId,
      if (createdByPlayer != null) 'createdByPlayer': createdByPlayer?.toJson(),
      if (perfomances != null)
        'perfomances': perfomances?.toJson(valueToJson: (v) => v.toJson()),
      if (player != null) 'player': player?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AnonymousPlayerImpl extends AnonymousPlayer {
  _AnonymousPlayerImpl({
    int? id,
    required String firstName,
    required String lastName,
    required int createdByPlayerId,
    _i2.PlayerData? createdByPlayer,
    List<_i3.PlayerPerfomanceInMatch>? perfomances,
    _i4.Player? player,
  }) : super._(
         id: id,
         firstName: firstName,
         lastName: lastName,
         createdByPlayerId: createdByPlayerId,
         createdByPlayer: createdByPlayer,
         perfomances: perfomances,
         player: player,
       );

  /// Returns a shallow copy of this [AnonymousPlayer]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  AnonymousPlayer copyWith({
    Object? id = _Undefined,
    String? firstName,
    String? lastName,
    int? createdByPlayerId,
    Object? createdByPlayer = _Undefined,
    Object? perfomances = _Undefined,
    Object? player = _Undefined,
  }) {
    return AnonymousPlayer(
      id: id is int? ? id : this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      createdByPlayerId: createdByPlayerId ?? this.createdByPlayerId,
      createdByPlayer: createdByPlayer is _i2.PlayerData?
          ? createdByPlayer
          : this.createdByPlayer?.copyWith(),
      perfomances: perfomances is List<_i3.PlayerPerfomanceInMatch>?
          ? perfomances
          : this.perfomances?.map((e0) => e0.copyWith()).toList(),
      player: player is _i4.Player? ? player : this.player?.copyWith(),
    );
  }
}
