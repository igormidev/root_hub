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
import 'package:serverpod/serverpod.dart' as _i1;
import '../../../entities/others/web_analytics_device_type.dart' as _i2;

abstract class WebAnalyticsClickItem
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  WebAnalyticsClickItem._({
    required this.clickId,
    required this.clickedAt,
    this.matchId,
    this.countryCode,
    this.countryName,
    this.city,
    required this.deviceType,
    this.osName,
    this.browserName,
    required this.requestPath,
    this.requestQuery,
    this.ipAddress,
  });

  factory WebAnalyticsClickItem({
    required int clickId,
    required DateTime clickedAt,
    int? matchId,
    String? countryCode,
    String? countryName,
    String? city,
    required _i2.WebAnalyticsDeviceType deviceType,
    String? osName,
    String? browserName,
    required String requestPath,
    String? requestQuery,
    String? ipAddress,
  }) = _WebAnalyticsClickItemImpl;

  factory WebAnalyticsClickItem.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return WebAnalyticsClickItem(
      clickId: jsonSerialization['clickId'] as int,
      clickedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['clickedAt'],
      ),
      matchId: jsonSerialization['matchId'] as int?,
      countryCode: jsonSerialization['countryCode'] as String?,
      countryName: jsonSerialization['countryName'] as String?,
      city: jsonSerialization['city'] as String?,
      deviceType: _i2.WebAnalyticsDeviceType.fromJson(
        (jsonSerialization['deviceType'] as String),
      ),
      osName: jsonSerialization['osName'] as String?,
      browserName: jsonSerialization['browserName'] as String?,
      requestPath: jsonSerialization['requestPath'] as String,
      requestQuery: jsonSerialization['requestQuery'] as String?,
      ipAddress: jsonSerialization['ipAddress'] as String?,
    );
  }

  int clickId;

  DateTime clickedAt;

  int? matchId;

  String? countryCode;

  String? countryName;

  String? city;

  _i2.WebAnalyticsDeviceType deviceType;

  String? osName;

  String? browserName;

  String requestPath;

  String? requestQuery;

  String? ipAddress;

  /// Returns a shallow copy of this [WebAnalyticsClickItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  WebAnalyticsClickItem copyWith({
    int? clickId,
    DateTime? clickedAt,
    int? matchId,
    String? countryCode,
    String? countryName,
    String? city,
    _i2.WebAnalyticsDeviceType? deviceType,
    String? osName,
    String? browserName,
    String? requestPath,
    String? requestQuery,
    String? ipAddress,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'WebAnalyticsClickItem',
      'clickId': clickId,
      'clickedAt': clickedAt.toJson(),
      if (matchId != null) 'matchId': matchId,
      if (countryCode != null) 'countryCode': countryCode,
      if (countryName != null) 'countryName': countryName,
      if (city != null) 'city': city,
      'deviceType': deviceType.toJson(),
      if (osName != null) 'osName': osName,
      if (browserName != null) 'browserName': browserName,
      'requestPath': requestPath,
      if (requestQuery != null) 'requestQuery': requestQuery,
      if (ipAddress != null) 'ipAddress': ipAddress,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'WebAnalyticsClickItem',
      'clickId': clickId,
      'clickedAt': clickedAt.toJson(),
      if (matchId != null) 'matchId': matchId,
      if (countryCode != null) 'countryCode': countryCode,
      if (countryName != null) 'countryName': countryName,
      if (city != null) 'city': city,
      'deviceType': deviceType.toJson(),
      if (osName != null) 'osName': osName,
      if (browserName != null) 'browserName': browserName,
      'requestPath': requestPath,
      if (requestQuery != null) 'requestQuery': requestQuery,
      if (ipAddress != null) 'ipAddress': ipAddress,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _WebAnalyticsClickItemImpl extends WebAnalyticsClickItem {
  _WebAnalyticsClickItemImpl({
    required int clickId,
    required DateTime clickedAt,
    int? matchId,
    String? countryCode,
    String? countryName,
    String? city,
    required _i2.WebAnalyticsDeviceType deviceType,
    String? osName,
    String? browserName,
    required String requestPath,
    String? requestQuery,
    String? ipAddress,
  }) : super._(
         clickId: clickId,
         clickedAt: clickedAt,
         matchId: matchId,
         countryCode: countryCode,
         countryName: countryName,
         city: city,
         deviceType: deviceType,
         osName: osName,
         browserName: browserName,
         requestPath: requestPath,
         requestQuery: requestQuery,
         ipAddress: ipAddress,
       );

  /// Returns a shallow copy of this [WebAnalyticsClickItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  WebAnalyticsClickItem copyWith({
    int? clickId,
    DateTime? clickedAt,
    Object? matchId = _Undefined,
    Object? countryCode = _Undefined,
    Object? countryName = _Undefined,
    Object? city = _Undefined,
    _i2.WebAnalyticsDeviceType? deviceType,
    Object? osName = _Undefined,
    Object? browserName = _Undefined,
    String? requestPath,
    Object? requestQuery = _Undefined,
    Object? ipAddress = _Undefined,
  }) {
    return WebAnalyticsClickItem(
      clickId: clickId ?? this.clickId,
      clickedAt: clickedAt ?? this.clickedAt,
      matchId: matchId is int? ? matchId : this.matchId,
      countryCode: countryCode is String? ? countryCode : this.countryCode,
      countryName: countryName is String? ? countryName : this.countryName,
      city: city is String? ? city : this.city,
      deviceType: deviceType ?? this.deviceType,
      osName: osName is String? ? osName : this.osName,
      browserName: browserName is String? ? browserName : this.browserName,
      requestPath: requestPath ?? this.requestPath,
      requestQuery: requestQuery is String? ? requestQuery : this.requestQuery,
      ipAddress: ipAddress is String? ? ipAddress : this.ipAddress,
    );
  }
}
