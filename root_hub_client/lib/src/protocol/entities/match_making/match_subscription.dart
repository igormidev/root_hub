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
import '../../entities/match_making/match_schedule.dart' as _i2;
import '../../entities/core/player_data.dart' as _i3;
import 'package:root_hub_client/src/protocol/protocol.dart' as _i4;

abstract class MatchSubscription implements _i1.SerializableModel {
  MatchSubscription._({
    this.id,
    required this.subscribedAt,
    required this.matchSchedulePairingAttemptId,
    this.matchSchedulePairingAttempt,
    required this.playerDataId,
    this.playerData,
  });

  factory MatchSubscription({
    int? id,
    required DateTime subscribedAt,
    required int matchSchedulePairingAttemptId,
    _i2.MatchSchedulePairingAttempt? matchSchedulePairingAttempt,
    required int playerDataId,
    _i3.PlayerData? playerData,
  }) = _MatchSubscriptionImpl;

  factory MatchSubscription.fromJson(Map<String, dynamic> jsonSerialization) {
    return MatchSubscription(
      id: jsonSerialization['id'] as int?,
      subscribedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['subscribedAt'],
      ),
      matchSchedulePairingAttemptId:
          jsonSerialization['matchSchedulePairingAttemptId'] as int,
      matchSchedulePairingAttempt:
          jsonSerialization['matchSchedulePairingAttempt'] == null
          ? null
          : _i4.Protocol().deserialize<_i2.MatchSchedulePairingAttempt>(
              jsonSerialization['matchSchedulePairingAttempt'],
            ),
      playerDataId: jsonSerialization['playerDataId'] as int,
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

  DateTime subscribedAt;

  int matchSchedulePairingAttemptId;

  _i2.MatchSchedulePairingAttempt? matchSchedulePairingAttempt;

  int playerDataId;

  _i3.PlayerData? playerData;

  /// Returns a shallow copy of this [MatchSubscription]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  MatchSubscription copyWith({
    int? id,
    DateTime? subscribedAt,
    int? matchSchedulePairingAttemptId,
    _i2.MatchSchedulePairingAttempt? matchSchedulePairingAttempt,
    int? playerDataId,
    _i3.PlayerData? playerData,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'MatchSubscription',
      if (id != null) 'id': id,
      'subscribedAt': subscribedAt.toJson(),
      'matchSchedulePairingAttemptId': matchSchedulePairingAttemptId,
      if (matchSchedulePairingAttempt != null)
        'matchSchedulePairingAttempt': matchSchedulePairingAttempt?.toJson(),
      'playerDataId': playerDataId,
      if (playerData != null) 'playerData': playerData?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MatchSubscriptionImpl extends MatchSubscription {
  _MatchSubscriptionImpl({
    int? id,
    required DateTime subscribedAt,
    required int matchSchedulePairingAttemptId,
    _i2.MatchSchedulePairingAttempt? matchSchedulePairingAttempt,
    required int playerDataId,
    _i3.PlayerData? playerData,
  }) : super._(
         id: id,
         subscribedAt: subscribedAt,
         matchSchedulePairingAttemptId: matchSchedulePairingAttemptId,
         matchSchedulePairingAttempt: matchSchedulePairingAttempt,
         playerDataId: playerDataId,
         playerData: playerData,
       );

  /// Returns a shallow copy of this [MatchSubscription]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  MatchSubscription copyWith({
    Object? id = _Undefined,
    DateTime? subscribedAt,
    int? matchSchedulePairingAttemptId,
    Object? matchSchedulePairingAttempt = _Undefined,
    int? playerDataId,
    Object? playerData = _Undefined,
  }) {
    return MatchSubscription(
      id: id is int? ? id : this.id,
      subscribedAt: subscribedAt ?? this.subscribedAt,
      matchSchedulePairingAttemptId:
          matchSchedulePairingAttemptId ?? this.matchSchedulePairingAttemptId,
      matchSchedulePairingAttempt:
          matchSchedulePairingAttempt is _i2.MatchSchedulePairingAttempt?
          ? matchSchedulePairingAttempt
          : this.matchSchedulePairingAttempt?.copyWith(),
      playerDataId: playerDataId ?? this.playerDataId,
      playerData: playerData is _i3.PlayerData?
          ? playerData
          : this.playerData?.copyWith(),
    );
  }
}
