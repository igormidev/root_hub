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
import '../../entities/match_making/google_place_location.dart' as _i2;
import '../../entities/match_making/manual_input_location.dart' as _i3;
import '../../entities/match_making/match_schedule.dart' as _i4;
import 'package:root_hub_client/src/protocol/protocol.dart' as _i5;

abstract class Location implements _i1.SerializableModel {
  Location._({
    this.id,
    this.googlePlaceLocationId,
    this.googlePlaceLocation,
    this.manualInputLocationId,
    this.manualInputLocation,
    this.pairingAttempts,
  });

  factory Location({
    int? id,
    int? googlePlaceLocationId,
    _i2.GooglePlaceLocation? googlePlaceLocation,
    int? manualInputLocationId,
    _i3.ManualInputLocation? manualInputLocation,
    List<_i4.MatchSchedulePairingAttempt>? pairingAttempts,
  }) = _LocationImpl;

  factory Location.fromJson(Map<String, dynamic> jsonSerialization) {
    return Location(
      id: jsonSerialization['id'] as int?,
      googlePlaceLocationId: jsonSerialization['googlePlaceLocationId'] as int?,
      googlePlaceLocation: jsonSerialization['googlePlaceLocation'] == null
          ? null
          : _i5.Protocol().deserialize<_i2.GooglePlaceLocation>(
              jsonSerialization['googlePlaceLocation'],
            ),
      manualInputLocationId: jsonSerialization['manualInputLocationId'] as int?,
      manualInputLocation: jsonSerialization['manualInputLocation'] == null
          ? null
          : _i5.Protocol().deserialize<_i3.ManualInputLocation>(
              jsonSerialization['manualInputLocation'],
            ),
      pairingAttempts: jsonSerialization['pairingAttempts'] == null
          ? null
          : _i5.Protocol().deserialize<List<_i4.MatchSchedulePairingAttempt>>(
              jsonSerialization['pairingAttempts'],
            ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int? googlePlaceLocationId;

  _i2.GooglePlaceLocation? googlePlaceLocation;

  int? manualInputLocationId;

  _i3.ManualInputLocation? manualInputLocation;

  List<_i4.MatchSchedulePairingAttempt>? pairingAttempts;

  /// Returns a shallow copy of this [Location]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Location copyWith({
    int? id,
    int? googlePlaceLocationId,
    _i2.GooglePlaceLocation? googlePlaceLocation,
    int? manualInputLocationId,
    _i3.ManualInputLocation? manualInputLocation,
    List<_i4.MatchSchedulePairingAttempt>? pairingAttempts,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Location',
      if (id != null) 'id': id,
      if (googlePlaceLocationId != null)
        'googlePlaceLocationId': googlePlaceLocationId,
      if (googlePlaceLocation != null)
        'googlePlaceLocation': googlePlaceLocation?.toJson(),
      if (manualInputLocationId != null)
        'manualInputLocationId': manualInputLocationId,
      if (manualInputLocation != null)
        'manualInputLocation': manualInputLocation?.toJson(),
      if (pairingAttempts != null)
        'pairingAttempts': pairingAttempts?.toJson(
          valueToJson: (v) => v.toJson(),
        ),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _LocationImpl extends Location {
  _LocationImpl({
    int? id,
    int? googlePlaceLocationId,
    _i2.GooglePlaceLocation? googlePlaceLocation,
    int? manualInputLocationId,
    _i3.ManualInputLocation? manualInputLocation,
    List<_i4.MatchSchedulePairingAttempt>? pairingAttempts,
  }) : super._(
         id: id,
         googlePlaceLocationId: googlePlaceLocationId,
         googlePlaceLocation: googlePlaceLocation,
         manualInputLocationId: manualInputLocationId,
         manualInputLocation: manualInputLocation,
         pairingAttempts: pairingAttempts,
       );

  /// Returns a shallow copy of this [Location]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Location copyWith({
    Object? id = _Undefined,
    Object? googlePlaceLocationId = _Undefined,
    Object? googlePlaceLocation = _Undefined,
    Object? manualInputLocationId = _Undefined,
    Object? manualInputLocation = _Undefined,
    Object? pairingAttempts = _Undefined,
  }) {
    return Location(
      id: id is int? ? id : this.id,
      googlePlaceLocationId: googlePlaceLocationId is int?
          ? googlePlaceLocationId
          : this.googlePlaceLocationId,
      googlePlaceLocation: googlePlaceLocation is _i2.GooglePlaceLocation?
          ? googlePlaceLocation
          : this.googlePlaceLocation?.copyWith(),
      manualInputLocationId: manualInputLocationId is int?
          ? manualInputLocationId
          : this.manualInputLocationId,
      manualInputLocation: manualInputLocation is _i3.ManualInputLocation?
          ? manualInputLocation
          : this.manualInputLocation?.copyWith(),
      pairingAttempts: pairingAttempts is List<_i4.MatchSchedulePairingAttempt>?
          ? pairingAttempts
          : this.pairingAttempts?.map((e0) => e0.copyWith()).toList(),
    );
  }
}
