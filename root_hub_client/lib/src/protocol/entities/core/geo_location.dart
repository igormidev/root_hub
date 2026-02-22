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
import 'package:root_hub_client/src/protocol/protocol.dart' as _i3;

abstract class GeoLocation implements _i1.SerializableModel {
  GeoLocation._({
    this.id,
    required this.x,
    required this.y,
    required this.ratio,
    this.playerData,
  });

  factory GeoLocation({
    int? id,
    required double x,
    required double y,
    required double ratio,
    _i2.PlayerData? playerData,
  }) = _GeoLocationImpl;

  factory GeoLocation.fromJson(Map<String, dynamic> jsonSerialization) {
    return GeoLocation(
      id: jsonSerialization['id'] as int?,
      x: (jsonSerialization['x'] as num).toDouble(),
      y: (jsonSerialization['y'] as num).toDouble(),
      ratio: (jsonSerialization['ratio'] as num).toDouble(),
      playerData: jsonSerialization['playerData'] == null
          ? null
          : _i3.Protocol().deserialize<_i2.PlayerData>(
              jsonSerialization['playerData'],
            ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  double x;

  double y;

  double ratio;

  _i2.PlayerData? playerData;

  /// Returns a shallow copy of this [GeoLocation]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  GeoLocation copyWith({
    int? id,
    double? x,
    double? y,
    double? ratio,
    _i2.PlayerData? playerData,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'GeoLocation',
      if (id != null) 'id': id,
      'x': x,
      'y': y,
      'ratio': ratio,
      if (playerData != null) 'playerData': playerData?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _GeoLocationImpl extends GeoLocation {
  _GeoLocationImpl({
    int? id,
    required double x,
    required double y,
    required double ratio,
    _i2.PlayerData? playerData,
  }) : super._(
         id: id,
         x: x,
         y: y,
         ratio: ratio,
         playerData: playerData,
       );

  /// Returns a shallow copy of this [GeoLocation]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  GeoLocation copyWith({
    Object? id = _Undefined,
    double? x,
    double? y,
    double? ratio,
    Object? playerData = _Undefined,
  }) {
    return GeoLocation(
      id: id is int? ? id : this.id,
      x: x ?? this.x,
      y: y ?? this.y,
      ratio: ratio ?? this.ratio,
      playerData: playerData is _i2.PlayerData?
          ? playerData
          : this.playerData?.copyWith(),
    );
  }
}
