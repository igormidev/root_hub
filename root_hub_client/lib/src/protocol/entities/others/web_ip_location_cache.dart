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

abstract class WebIpLocationCache implements _i1.SerializableModel {
  WebIpLocationCache._({
    this.id,
    required this.ipAddress,
    required this.updatedAt,
    this.countryCode,
    this.countryName,
    this.city,
  });

  factory WebIpLocationCache({
    int? id,
    required String ipAddress,
    required DateTime updatedAt,
    String? countryCode,
    String? countryName,
    String? city,
  }) = _WebIpLocationCacheImpl;

  factory WebIpLocationCache.fromJson(Map<String, dynamic> jsonSerialization) {
    return WebIpLocationCache(
      id: jsonSerialization['id'] as int?,
      ipAddress: jsonSerialization['ipAddress'] as String,
      updatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
      countryCode: jsonSerialization['countryCode'] as String?,
      countryName: jsonSerialization['countryName'] as String?,
      city: jsonSerialization['city'] as String?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String ipAddress;

  DateTime updatedAt;

  String? countryCode;

  String? countryName;

  String? city;

  /// Returns a shallow copy of this [WebIpLocationCache]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  WebIpLocationCache copyWith({
    int? id,
    String? ipAddress,
    DateTime? updatedAt,
    String? countryCode,
    String? countryName,
    String? city,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'WebIpLocationCache',
      if (id != null) 'id': id,
      'ipAddress': ipAddress,
      'updatedAt': updatedAt.toJson(),
      if (countryCode != null) 'countryCode': countryCode,
      if (countryName != null) 'countryName': countryName,
      if (city != null) 'city': city,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _WebIpLocationCacheImpl extends WebIpLocationCache {
  _WebIpLocationCacheImpl({
    int? id,
    required String ipAddress,
    required DateTime updatedAt,
    String? countryCode,
    String? countryName,
    String? city,
  }) : super._(
         id: id,
         ipAddress: ipAddress,
         updatedAt: updatedAt,
         countryCode: countryCode,
         countryName: countryName,
         city: city,
       );

  /// Returns a shallow copy of this [WebIpLocationCache]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  WebIpLocationCache copyWith({
    Object? id = _Undefined,
    String? ipAddress,
    DateTime? updatedAt,
    Object? countryCode = _Undefined,
    Object? countryName = _Undefined,
    Object? city = _Undefined,
  }) {
    return WebIpLocationCache(
      id: id is int? ? id : this.id,
      ipAddress: ipAddress ?? this.ipAddress,
      updatedAt: updatedAt ?? this.updatedAt,
      countryCode: countryCode is String? ? countryCode : this.countryCode,
      countryName: countryName is String? ? countryName : this.countryName,
      city: city is String? ? city : this.city,
    );
  }
}
