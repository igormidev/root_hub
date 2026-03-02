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
import '../../entities/others/web_analytics_device_type.dart' as _i2;

abstract class WebAnalyticsClick implements _i1.SerializableModel {
  WebAnalyticsClick._({
    this.id,
    required this.createdAt,
    required this.requestPath,
    this.requestQuery,
    this.matchId,
    this.ipAddress,
    this.countryCode,
    this.countryName,
    this.city,
    required this.deviceType,
    this.osName,
    this.browserName,
    this.userAgent,
  });

  factory WebAnalyticsClick({
    int? id,
    required DateTime createdAt,
    required String requestPath,
    String? requestQuery,
    int? matchId,
    String? ipAddress,
    String? countryCode,
    String? countryName,
    String? city,
    required _i2.WebAnalyticsDeviceType deviceType,
    String? osName,
    String? browserName,
    String? userAgent,
  }) = _WebAnalyticsClickImpl;

  factory WebAnalyticsClick.fromJson(Map<String, dynamic> jsonSerialization) {
    return WebAnalyticsClick(
      id: jsonSerialization['id'] as int?,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      requestPath: jsonSerialization['requestPath'] as String,
      requestQuery: jsonSerialization['requestQuery'] as String?,
      matchId: jsonSerialization['matchId'] as int?,
      ipAddress: jsonSerialization['ipAddress'] as String?,
      countryCode: jsonSerialization['countryCode'] as String?,
      countryName: jsonSerialization['countryName'] as String?,
      city: jsonSerialization['city'] as String?,
      deviceType: _i2.WebAnalyticsDeviceType.fromJson(
        (jsonSerialization['deviceType'] as String),
      ),
      osName: jsonSerialization['osName'] as String?,
      browserName: jsonSerialization['browserName'] as String?,
      userAgent: jsonSerialization['userAgent'] as String?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  DateTime createdAt;

  String requestPath;

  String? requestQuery;

  int? matchId;

  String? ipAddress;

  String? countryCode;

  String? countryName;

  String? city;

  _i2.WebAnalyticsDeviceType deviceType;

  String? osName;

  String? browserName;

  String? userAgent;

  /// Returns a shallow copy of this [WebAnalyticsClick]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  WebAnalyticsClick copyWith({
    int? id,
    DateTime? createdAt,
    String? requestPath,
    String? requestQuery,
    int? matchId,
    String? ipAddress,
    String? countryCode,
    String? countryName,
    String? city,
    _i2.WebAnalyticsDeviceType? deviceType,
    String? osName,
    String? browserName,
    String? userAgent,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'WebAnalyticsClick',
      if (id != null) 'id': id,
      'createdAt': createdAt.toJson(),
      'requestPath': requestPath,
      if (requestQuery != null) 'requestQuery': requestQuery,
      if (matchId != null) 'matchId': matchId,
      if (ipAddress != null) 'ipAddress': ipAddress,
      if (countryCode != null) 'countryCode': countryCode,
      if (countryName != null) 'countryName': countryName,
      if (city != null) 'city': city,
      'deviceType': deviceType.toJson(),
      if (osName != null) 'osName': osName,
      if (browserName != null) 'browserName': browserName,
      if (userAgent != null) 'userAgent': userAgent,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _WebAnalyticsClickImpl extends WebAnalyticsClick {
  _WebAnalyticsClickImpl({
    int? id,
    required DateTime createdAt,
    required String requestPath,
    String? requestQuery,
    int? matchId,
    String? ipAddress,
    String? countryCode,
    String? countryName,
    String? city,
    required _i2.WebAnalyticsDeviceType deviceType,
    String? osName,
    String? browserName,
    String? userAgent,
  }) : super._(
         id: id,
         createdAt: createdAt,
         requestPath: requestPath,
         requestQuery: requestQuery,
         matchId: matchId,
         ipAddress: ipAddress,
         countryCode: countryCode,
         countryName: countryName,
         city: city,
         deviceType: deviceType,
         osName: osName,
         browserName: browserName,
         userAgent: userAgent,
       );

  /// Returns a shallow copy of this [WebAnalyticsClick]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  WebAnalyticsClick copyWith({
    Object? id = _Undefined,
    DateTime? createdAt,
    String? requestPath,
    Object? requestQuery = _Undefined,
    Object? matchId = _Undefined,
    Object? ipAddress = _Undefined,
    Object? countryCode = _Undefined,
    Object? countryName = _Undefined,
    Object? city = _Undefined,
    _i2.WebAnalyticsDeviceType? deviceType,
    Object? osName = _Undefined,
    Object? browserName = _Undefined,
    Object? userAgent = _Undefined,
  }) {
    return WebAnalyticsClick(
      id: id is int? ? id : this.id,
      createdAt: createdAt ?? this.createdAt,
      requestPath: requestPath ?? this.requestPath,
      requestQuery: requestQuery is String? ? requestQuery : this.requestQuery,
      matchId: matchId is int? ? matchId : this.matchId,
      ipAddress: ipAddress is String? ? ipAddress : this.ipAddress,
      countryCode: countryCode is String? ? countryCode : this.countryCode,
      countryName: countryName is String? ? countryName : this.countryName,
      city: city is String? ? city : this.city,
      deviceType: deviceType ?? this.deviceType,
      osName: osName is String? ? osName : this.osName,
      browserName: browserName is String? ? browserName : this.browserName,
      userAgent: userAgent is String? ? userAgent : this.userAgent,
    );
  }
}
