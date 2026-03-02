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
import '../../../api/stats/models/web_analytics_metric_item.dart' as _i2;
import '../../../api/stats/models/web_analytics_timeline_point.dart' as _i3;
import '../../../api/stats/models/web_analytics_clicks_pagination.dart' as _i4;
import 'package:root_hub_client/src/protocol/protocol.dart' as _i5;

abstract class WebAnalyticsDashboard implements _i1.SerializableModel {
  WebAnalyticsDashboard._({
    required this.isAuthorized,
    required this.totalClicks,
    required this.uniqueCountries,
    required this.uniqueDevices,
    required this.countryMetrics,
    required this.deviceMetrics,
    required this.timeline,
    required this.clicksPagination,
  });

  factory WebAnalyticsDashboard({
    required bool isAuthorized,
    required int totalClicks,
    required int uniqueCountries,
    required int uniqueDevices,
    required List<_i2.WebAnalyticsMetricItem> countryMetrics,
    required List<_i2.WebAnalyticsMetricItem> deviceMetrics,
    required List<_i3.WebAnalyticsTimelinePoint> timeline,
    required _i4.WebAnalyticsClicksPagination clicksPagination,
  }) = _WebAnalyticsDashboardImpl;

  factory WebAnalyticsDashboard.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return WebAnalyticsDashboard(
      isAuthorized: jsonSerialization['isAuthorized'] as bool,
      totalClicks: jsonSerialization['totalClicks'] as int,
      uniqueCountries: jsonSerialization['uniqueCountries'] as int,
      uniqueDevices: jsonSerialization['uniqueDevices'] as int,
      countryMetrics: _i5.Protocol()
          .deserialize<List<_i2.WebAnalyticsMetricItem>>(
            jsonSerialization['countryMetrics'],
          ),
      deviceMetrics: _i5.Protocol()
          .deserialize<List<_i2.WebAnalyticsMetricItem>>(
            jsonSerialization['deviceMetrics'],
          ),
      timeline: _i5.Protocol().deserialize<List<_i3.WebAnalyticsTimelinePoint>>(
        jsonSerialization['timeline'],
      ),
      clicksPagination: _i5.Protocol()
          .deserialize<_i4.WebAnalyticsClicksPagination>(
            jsonSerialization['clicksPagination'],
          ),
    );
  }

  bool isAuthorized;

  int totalClicks;

  int uniqueCountries;

  int uniqueDevices;

  List<_i2.WebAnalyticsMetricItem> countryMetrics;

  List<_i2.WebAnalyticsMetricItem> deviceMetrics;

  List<_i3.WebAnalyticsTimelinePoint> timeline;

  _i4.WebAnalyticsClicksPagination clicksPagination;

  /// Returns a shallow copy of this [WebAnalyticsDashboard]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  WebAnalyticsDashboard copyWith({
    bool? isAuthorized,
    int? totalClicks,
    int? uniqueCountries,
    int? uniqueDevices,
    List<_i2.WebAnalyticsMetricItem>? countryMetrics,
    List<_i2.WebAnalyticsMetricItem>? deviceMetrics,
    List<_i3.WebAnalyticsTimelinePoint>? timeline,
    _i4.WebAnalyticsClicksPagination? clicksPagination,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'WebAnalyticsDashboard',
      'isAuthorized': isAuthorized,
      'totalClicks': totalClicks,
      'uniqueCountries': uniqueCountries,
      'uniqueDevices': uniqueDevices,
      'countryMetrics': countryMetrics.toJson(valueToJson: (v) => v.toJson()),
      'deviceMetrics': deviceMetrics.toJson(valueToJson: (v) => v.toJson()),
      'timeline': timeline.toJson(valueToJson: (v) => v.toJson()),
      'clicksPagination': clicksPagination.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _WebAnalyticsDashboardImpl extends WebAnalyticsDashboard {
  _WebAnalyticsDashboardImpl({
    required bool isAuthorized,
    required int totalClicks,
    required int uniqueCountries,
    required int uniqueDevices,
    required List<_i2.WebAnalyticsMetricItem> countryMetrics,
    required List<_i2.WebAnalyticsMetricItem> deviceMetrics,
    required List<_i3.WebAnalyticsTimelinePoint> timeline,
    required _i4.WebAnalyticsClicksPagination clicksPagination,
  }) : super._(
         isAuthorized: isAuthorized,
         totalClicks: totalClicks,
         uniqueCountries: uniqueCountries,
         uniqueDevices: uniqueDevices,
         countryMetrics: countryMetrics,
         deviceMetrics: deviceMetrics,
         timeline: timeline,
         clicksPagination: clicksPagination,
       );

  /// Returns a shallow copy of this [WebAnalyticsDashboard]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  WebAnalyticsDashboard copyWith({
    bool? isAuthorized,
    int? totalClicks,
    int? uniqueCountries,
    int? uniqueDevices,
    List<_i2.WebAnalyticsMetricItem>? countryMetrics,
    List<_i2.WebAnalyticsMetricItem>? deviceMetrics,
    List<_i3.WebAnalyticsTimelinePoint>? timeline,
    _i4.WebAnalyticsClicksPagination? clicksPagination,
  }) {
    return WebAnalyticsDashboard(
      isAuthorized: isAuthorized ?? this.isAuthorized,
      totalClicks: totalClicks ?? this.totalClicks,
      uniqueCountries: uniqueCountries ?? this.uniqueCountries,
      uniqueDevices: uniqueDevices ?? this.uniqueDevices,
      countryMetrics:
          countryMetrics ??
          this.countryMetrics.map((e0) => e0.copyWith()).toList(),
      deviceMetrics:
          deviceMetrics ??
          this.deviceMetrics.map((e0) => e0.copyWith()).toList(),
      timeline: timeline ?? this.timeline.map((e0) => e0.copyWith()).toList(),
      clicksPagination: clicksPagination ?? this.clicksPagination.copyWith(),
    );
  }
}
