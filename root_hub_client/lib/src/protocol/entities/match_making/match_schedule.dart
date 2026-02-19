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
import '../../entities/core/match_podium.dart' as _i2;
import '../../entities/match_making/location.dart' as _i3;
import '../../entities/core/player_data.dart' as _i4;
import '../../entities/match_making/match_subscription.dart' as _i5;
import 'package:root_hub_client/src/protocol/protocol.dart' as _i6;

abstract class MatchSchedulePairingAttempt implements _i1.SerializableModel {
  MatchSchedulePairingAttempt._({
    this.id,
    required this.createdAt,
    this.aditionalInfo,
    this.guidelinesDescription,
    required this.minAmountOfPlayers,
    required this.maxAmountOfPlayers,
    required this.attemptedAt,
    required this.locationId,
    this.location,
    required this.playerDataId,
    this.playerData,
    this.subscriptions,
  });

  factory MatchSchedulePairingAttempt({
    int? id,
    required DateTime createdAt,
    String? aditionalInfo,
    String? guidelinesDescription,
    required _i2.MatchPodium minAmountOfPlayers,
    required _i2.MatchPodium maxAmountOfPlayers,
    required DateTime attemptedAt,
    required int locationId,
    _i3.Location? location,
    required int playerDataId,
    _i4.PlayerData? playerData,
    List<_i5.MatchSubscription>? subscriptions,
  }) = _MatchSchedulePairingAttemptImpl;

  factory MatchSchedulePairingAttempt.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return MatchSchedulePairingAttempt(
      id: jsonSerialization['id'] as int?,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      aditionalInfo: jsonSerialization['aditionalInfo'] as String?,
      guidelinesDescription:
          jsonSerialization['guidelinesDescription'] as String?,
      minAmountOfPlayers: _i2.MatchPodium.fromJson(
        (jsonSerialization['minAmountOfPlayers'] as String),
      ),
      maxAmountOfPlayers: _i2.MatchPodium.fromJson(
        (jsonSerialization['maxAmountOfPlayers'] as String),
      ),
      attemptedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['attemptedAt'],
      ),
      locationId: jsonSerialization['locationId'] as int,
      location: jsonSerialization['location'] == null
          ? null
          : _i6.Protocol().deserialize<_i3.Location>(
              jsonSerialization['location'],
            ),
      playerDataId: jsonSerialization['playerDataId'] as int,
      playerData: jsonSerialization['playerData'] == null
          ? null
          : _i6.Protocol().deserialize<_i4.PlayerData>(
              jsonSerialization['playerData'],
            ),
      subscriptions: jsonSerialization['subscriptions'] == null
          ? null
          : _i6.Protocol().deserialize<List<_i5.MatchSubscription>>(
              jsonSerialization['subscriptions'],
            ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  DateTime createdAt;

  String? aditionalInfo;

  String? guidelinesDescription;

  _i2.MatchPodium minAmountOfPlayers;

  _i2.MatchPodium maxAmountOfPlayers;

  DateTime attemptedAt;

  int locationId;

  _i3.Location? location;

  int playerDataId;

  _i4.PlayerData? playerData;

  List<_i5.MatchSubscription>? subscriptions;

  /// Returns a shallow copy of this [MatchSchedulePairingAttempt]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  MatchSchedulePairingAttempt copyWith({
    int? id,
    DateTime? createdAt,
    String? aditionalInfo,
    String? guidelinesDescription,
    _i2.MatchPodium? minAmountOfPlayers,
    _i2.MatchPodium? maxAmountOfPlayers,
    DateTime? attemptedAt,
    int? locationId,
    _i3.Location? location,
    int? playerDataId,
    _i4.PlayerData? playerData,
    List<_i5.MatchSubscription>? subscriptions,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'MatchSchedulePairingAttempt',
      if (id != null) 'id': id,
      'createdAt': createdAt.toJson(),
      if (aditionalInfo != null) 'aditionalInfo': aditionalInfo,
      if (guidelinesDescription != null)
        'guidelinesDescription': guidelinesDescription,
      'minAmountOfPlayers': minAmountOfPlayers.toJson(),
      'maxAmountOfPlayers': maxAmountOfPlayers.toJson(),
      'attemptedAt': attemptedAt.toJson(),
      'locationId': locationId,
      if (location != null) 'location': location?.toJson(),
      'playerDataId': playerDataId,
      if (playerData != null) 'playerData': playerData?.toJson(),
      if (subscriptions != null)
        'subscriptions': subscriptions?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MatchSchedulePairingAttemptImpl extends MatchSchedulePairingAttempt {
  _MatchSchedulePairingAttemptImpl({
    int? id,
    required DateTime createdAt,
    String? aditionalInfo,
    String? guidelinesDescription,
    required _i2.MatchPodium minAmountOfPlayers,
    required _i2.MatchPodium maxAmountOfPlayers,
    required DateTime attemptedAt,
    required int locationId,
    _i3.Location? location,
    required int playerDataId,
    _i4.PlayerData? playerData,
    List<_i5.MatchSubscription>? subscriptions,
  }) : super._(
         id: id,
         createdAt: createdAt,
         aditionalInfo: aditionalInfo,
         guidelinesDescription: guidelinesDescription,
         minAmountOfPlayers: minAmountOfPlayers,
         maxAmountOfPlayers: maxAmountOfPlayers,
         attemptedAt: attemptedAt,
         locationId: locationId,
         location: location,
         playerDataId: playerDataId,
         playerData: playerData,
         subscriptions: subscriptions,
       );

  /// Returns a shallow copy of this [MatchSchedulePairingAttempt]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  MatchSchedulePairingAttempt copyWith({
    Object? id = _Undefined,
    DateTime? createdAt,
    Object? aditionalInfo = _Undefined,
    Object? guidelinesDescription = _Undefined,
    _i2.MatchPodium? minAmountOfPlayers,
    _i2.MatchPodium? maxAmountOfPlayers,
    DateTime? attemptedAt,
    int? locationId,
    Object? location = _Undefined,
    int? playerDataId,
    Object? playerData = _Undefined,
    Object? subscriptions = _Undefined,
  }) {
    return MatchSchedulePairingAttempt(
      id: id is int? ? id : this.id,
      createdAt: createdAt ?? this.createdAt,
      aditionalInfo: aditionalInfo is String?
          ? aditionalInfo
          : this.aditionalInfo,
      guidelinesDescription: guidelinesDescription is String?
          ? guidelinesDescription
          : this.guidelinesDescription,
      minAmountOfPlayers: minAmountOfPlayers ?? this.minAmountOfPlayers,
      maxAmountOfPlayers: maxAmountOfPlayers ?? this.maxAmountOfPlayers,
      attemptedAt: attemptedAt ?? this.attemptedAt,
      locationId: locationId ?? this.locationId,
      location: location is _i3.Location?
          ? location
          : this.location?.copyWith(),
      playerDataId: playerDataId ?? this.playerDataId,
      playerData: playerData is _i4.PlayerData?
          ? playerData
          : this.playerData?.copyWith(),
      subscriptions: subscriptions is List<_i5.MatchSubscription>?
          ? subscriptions
          : this.subscriptions?.map((e0) => e0.copyWith()).toList(),
    );
  }
}
