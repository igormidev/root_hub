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
import '../../entities/core/country.dart' as _i2;
import '../../entities/match_making/location.dart' as _i3;
import 'package:root_hub_client/src/protocol/protocol.dart' as _i4;

abstract class ManualInputLocation implements _i1.SerializableModel {
  ManualInputLocation._({
    this.id,
    required this.title,
    this.description,
    required this.cityName,
    required this.country,
    this.location,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ManualInputLocation({
    int? id,
    required String title,
    String? description,
    required String cityName,
    required _i2.Country country,
    _i3.Location? location,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ManualInputLocationImpl;

  factory ManualInputLocation.fromJson(Map<String, dynamic> jsonSerialization) {
    return ManualInputLocation(
      id: jsonSerialization['id'] as int?,
      title: jsonSerialization['title'] as String,
      description: jsonSerialization['description'] as String?,
      cityName: jsonSerialization['cityName'] as String,
      country: _i2.Country.fromJson((jsonSerialization['country'] as String)),
      location: jsonSerialization['location'] == null
          ? null
          : _i4.Protocol().deserialize<_i3.Location>(
              jsonSerialization['location'],
            ),
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String title;

  String? description;

  String cityName;

  _i2.Country country;

  _i3.Location? location;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [ManualInputLocation]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ManualInputLocation copyWith({
    int? id,
    String? title,
    String? description,
    String? cityName,
    _i2.Country? country,
    _i3.Location? location,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ManualInputLocation',
      if (id != null) 'id': id,
      'title': title,
      if (description != null) 'description': description,
      'cityName': cityName,
      'country': country.toJson(),
      if (location != null) 'location': location?.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ManualInputLocationImpl extends ManualInputLocation {
  _ManualInputLocationImpl({
    int? id,
    required String title,
    String? description,
    required String cityName,
    required _i2.Country country,
    _i3.Location? location,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
         id: id,
         title: title,
         description: description,
         cityName: cityName,
         country: country,
         location: location,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [ManualInputLocation]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ManualInputLocation copyWith({
    Object? id = _Undefined,
    String? title,
    Object? description = _Undefined,
    String? cityName,
    _i2.Country? country,
    Object? location = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ManualInputLocation(
      id: id is int? ? id : this.id,
      title: title ?? this.title,
      description: description is String? ? description : this.description,
      cityName: cityName ?? this.cityName,
      country: country ?? this.country,
      location: location is _i3.Location?
          ? location
          : this.location?.copyWith(),
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
