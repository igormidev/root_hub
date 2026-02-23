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
import '../../../entities/core/player_data.dart' as _i2;
import 'package:root_hub_client/src/protocol/protocol.dart' as _i3;

abstract class MatchSchedulePlayerSnapshot implements _i1.SerializableModel {
  MatchSchedulePlayerSnapshot._({
    required this.playerData,
    required this.subscribedAt,
    this.profileImageUrl,
  });

  factory MatchSchedulePlayerSnapshot({
    required _i2.PlayerData playerData,
    required DateTime subscribedAt,
    String? profileImageUrl,
  }) = _MatchSchedulePlayerSnapshotImpl;

  factory MatchSchedulePlayerSnapshot.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return MatchSchedulePlayerSnapshot(
      playerData: _i3.Protocol().deserialize<_i2.PlayerData>(
        jsonSerialization['playerData'],
      ),
      subscribedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['subscribedAt'],
      ),
      profileImageUrl: jsonSerialization['profileImageUrl'] as String?,
    );
  }

  _i2.PlayerData playerData;

  DateTime subscribedAt;

  String? profileImageUrl;

  /// Returns a shallow copy of this [MatchSchedulePlayerSnapshot]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  MatchSchedulePlayerSnapshot copyWith({
    _i2.PlayerData? playerData,
    DateTime? subscribedAt,
    String? profileImageUrl,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'MatchSchedulePlayerSnapshot',
      'playerData': playerData.toJson(),
      'subscribedAt': subscribedAt.toJson(),
      if (profileImageUrl != null) 'profileImageUrl': profileImageUrl,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MatchSchedulePlayerSnapshotImpl extends MatchSchedulePlayerSnapshot {
  _MatchSchedulePlayerSnapshotImpl({
    required _i2.PlayerData playerData,
    required DateTime subscribedAt,
    String? profileImageUrl,
  }) : super._(
         playerData: playerData,
         subscribedAt: subscribedAt,
         profileImageUrl: profileImageUrl,
       );

  /// Returns a shallow copy of this [MatchSchedulePlayerSnapshot]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  MatchSchedulePlayerSnapshot copyWith({
    _i2.PlayerData? playerData,
    DateTime? subscribedAt,
    Object? profileImageUrl = _Undefined,
  }) {
    return MatchSchedulePlayerSnapshot(
      playerData: playerData ?? this.playerData.copyWith(),
      subscribedAt: subscribedAt ?? this.subscribedAt,
      profileImageUrl: profileImageUrl is String?
          ? profileImageUrl
          : this.profileImageUrl,
    );
  }
}
