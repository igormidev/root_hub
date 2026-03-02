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

abstract class WebAnalyticsMetricItem implements _i1.SerializableModel {
  WebAnalyticsMetricItem._({
    required this.key,
    required this.label,
    required this.count,
  });

  factory WebAnalyticsMetricItem({
    required String key,
    required String label,
    required int count,
  }) = _WebAnalyticsMetricItemImpl;

  factory WebAnalyticsMetricItem.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return WebAnalyticsMetricItem(
      key: jsonSerialization['key'] as String,
      label: jsonSerialization['label'] as String,
      count: jsonSerialization['count'] as int,
    );
  }

  String key;

  String label;

  int count;

  /// Returns a shallow copy of this [WebAnalyticsMetricItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  WebAnalyticsMetricItem copyWith({
    String? key,
    String? label,
    int? count,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'WebAnalyticsMetricItem',
      'key': key,
      'label': label,
      'count': count,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _WebAnalyticsMetricItemImpl extends WebAnalyticsMetricItem {
  _WebAnalyticsMetricItemImpl({
    required String key,
    required String label,
    required int count,
  }) : super._(
         key: key,
         label: label,
         count: count,
       );

  /// Returns a shallow copy of this [WebAnalyticsMetricItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  WebAnalyticsMetricItem copyWith({
    String? key,
    String? label,
    int? count,
  }) {
    return WebAnalyticsMetricItem(
      key: key ?? this.key,
      label: label ?? this.label,
      count: count ?? this.count,
    );
  }
}
