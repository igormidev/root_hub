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
import '../../entities/core/push_notification_platform.dart' as _i2;
import '../../entities/core/player_data.dart' as _i3;
import 'package:root_hub_client/src/protocol/protocol.dart' as _i4;

abstract class PlayerPushNotificationToken implements _i1.SerializableModel {
  PlayerPushNotificationToken._({
    this.id,
    required this.token,
    required this.platform,
    bool? isActive,
    required this.lastConfirmedAt,
    required this.playerDataId,
    this.playerData,
  }) : isActive = isActive ?? true;

  factory PlayerPushNotificationToken({
    int? id,
    required String token,
    required _i2.PushNotificationPlatform platform,
    bool? isActive,
    required DateTime lastConfirmedAt,
    required int playerDataId,
    _i3.PlayerData? playerData,
  }) = _PlayerPushNotificationTokenImpl;

  factory PlayerPushNotificationToken.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return PlayerPushNotificationToken(
      id: jsonSerialization['id'] as int?,
      token: jsonSerialization['token'] as String,
      platform: _i2.PushNotificationPlatform.fromJson(
        (jsonSerialization['platform'] as String),
      ),
      isActive: jsonSerialization['isActive'] == null
          ? null
          : _i1.BoolJsonExtension.fromJson(jsonSerialization['isActive']),
      lastConfirmedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['lastConfirmedAt'],
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

  String token;

  _i2.PushNotificationPlatform platform;

  bool isActive;

  DateTime lastConfirmedAt;

  int playerDataId;

  _i3.PlayerData? playerData;

  /// Returns a shallow copy of this [PlayerPushNotificationToken]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PlayerPushNotificationToken copyWith({
    int? id,
    String? token,
    _i2.PushNotificationPlatform? platform,
    bool? isActive,
    DateTime? lastConfirmedAt,
    int? playerDataId,
    _i3.PlayerData? playerData,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'PlayerPushNotificationToken',
      if (id != null) 'id': id,
      'token': token,
      'platform': platform.toJson(),
      'isActive': isActive,
      'lastConfirmedAt': lastConfirmedAt.toJson(),
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

class _PlayerPushNotificationTokenImpl extends PlayerPushNotificationToken {
  _PlayerPushNotificationTokenImpl({
    int? id,
    required String token,
    required _i2.PushNotificationPlatform platform,
    bool? isActive,
    required DateTime lastConfirmedAt,
    required int playerDataId,
    _i3.PlayerData? playerData,
  }) : super._(
         id: id,
         token: token,
         platform: platform,
         isActive: isActive,
         lastConfirmedAt: lastConfirmedAt,
         playerDataId: playerDataId,
         playerData: playerData,
       );

  /// Returns a shallow copy of this [PlayerPushNotificationToken]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PlayerPushNotificationToken copyWith({
    Object? id = _Undefined,
    String? token,
    _i2.PushNotificationPlatform? platform,
    bool? isActive,
    DateTime? lastConfirmedAt,
    int? playerDataId,
    Object? playerData = _Undefined,
  }) {
    return PlayerPushNotificationToken(
      id: id is int? ? id : this.id,
      token: token ?? this.token,
      platform: platform ?? this.platform,
      isActive: isActive ?? this.isActive,
      lastConfirmedAt: lastConfirmedAt ?? this.lastConfirmedAt,
      playerDataId: playerDataId ?? this.playerDataId,
      playerData: playerData is _i3.PlayerData?
          ? playerData
          : this.playerData?.copyWith(),
    );
  }
}
