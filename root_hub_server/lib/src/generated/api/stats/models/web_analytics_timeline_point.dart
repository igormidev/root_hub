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

abstract class WebAnalyticsTimelinePoint
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  WebAnalyticsTimelinePoint._({
    required this.bucketStart,
    required this.count,
  });

  factory WebAnalyticsTimelinePoint({
    required DateTime bucketStart,
    required int count,
  }) = _WebAnalyticsTimelinePointImpl;

  factory WebAnalyticsTimelinePoint.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return WebAnalyticsTimelinePoint(
      bucketStart: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['bucketStart'],
      ),
      count: jsonSerialization['count'] as int,
    );
  }

  DateTime bucketStart;

  int count;

  /// Returns a shallow copy of this [WebAnalyticsTimelinePoint]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  WebAnalyticsTimelinePoint copyWith({
    DateTime? bucketStart,
    int? count,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'WebAnalyticsTimelinePoint',
      'bucketStart': bucketStart.toJson(),
      'count': count,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'WebAnalyticsTimelinePoint',
      'bucketStart': bucketStart.toJson(),
      'count': count,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _WebAnalyticsTimelinePointImpl extends WebAnalyticsTimelinePoint {
  _WebAnalyticsTimelinePointImpl({
    required DateTime bucketStart,
    required int count,
  }) : super._(
         bucketStart: bucketStart,
         count: count,
       );

  /// Returns a shallow copy of this [WebAnalyticsTimelinePoint]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  WebAnalyticsTimelinePoint copyWith({
    DateTime? bucketStart,
    int? count,
  }) {
    return WebAnalyticsTimelinePoint(
      bucketStart: bucketStart ?? this.bucketStart,
      count: count ?? this.count,
    );
  }
}
