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
import '../../../api/stats/models/web_analytics_click_item.dart' as _i2;
import '../../../entities/others/pagination_metadata.dart' as _i3;
import 'package:root_hub_client/src/protocol/protocol.dart' as _i4;

abstract class WebAnalyticsClicksPagination implements _i1.SerializableModel {
  WebAnalyticsClicksPagination._({
    required this.clicks,
    required this.paginationMetadata,
  });

  factory WebAnalyticsClicksPagination({
    required List<_i2.WebAnalyticsClickItem> clicks,
    required _i3.PaginationMetadata paginationMetadata,
  }) = _WebAnalyticsClicksPaginationImpl;

  factory WebAnalyticsClicksPagination.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return WebAnalyticsClicksPagination(
      clicks: _i4.Protocol().deserialize<List<_i2.WebAnalyticsClickItem>>(
        jsonSerialization['clicks'],
      ),
      paginationMetadata: _i4.Protocol().deserialize<_i3.PaginationMetadata>(
        jsonSerialization['paginationMetadata'],
      ),
    );
  }

  List<_i2.WebAnalyticsClickItem> clicks;

  _i3.PaginationMetadata paginationMetadata;

  /// Returns a shallow copy of this [WebAnalyticsClicksPagination]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  WebAnalyticsClicksPagination copyWith({
    List<_i2.WebAnalyticsClickItem>? clicks,
    _i3.PaginationMetadata? paginationMetadata,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'WebAnalyticsClicksPagination',
      'clicks': clicks.toJson(valueToJson: (v) => v.toJson()),
      'paginationMetadata': paginationMetadata.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _WebAnalyticsClicksPaginationImpl extends WebAnalyticsClicksPagination {
  _WebAnalyticsClicksPaginationImpl({
    required List<_i2.WebAnalyticsClickItem> clicks,
    required _i3.PaginationMetadata paginationMetadata,
  }) : super._(
         clicks: clicks,
         paginationMetadata: paginationMetadata,
       );

  /// Returns a shallow copy of this [WebAnalyticsClicksPagination]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  WebAnalyticsClicksPagination copyWith({
    List<_i2.WebAnalyticsClickItem>? clicks,
    _i3.PaginationMetadata? paginationMetadata,
  }) {
    return WebAnalyticsClicksPagination(
      clicks: clicks ?? this.clicks.map((e0) => e0.copyWith()).toList(),
      paginationMetadata:
          paginationMetadata ?? this.paginationMetadata.copyWith(),
    );
  }
}
