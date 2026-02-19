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

abstract class PaginationMetadata
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  PaginationMetadata._({
    required this.currentPage,
    required this.itemsInCurrentPageCount,
    required this.totalItemsCount,
    required this.totalPagesCount,
    required this.hasNextPage,
    required this.hasPreviousPage,
  });

  factory PaginationMetadata({
    required int currentPage,
    required int itemsInCurrentPageCount,
    required int totalItemsCount,
    required int totalPagesCount,
    required bool hasNextPage,
    required bool hasPreviousPage,
  }) = _PaginationMetadataImpl;

  factory PaginationMetadata.fromJson(Map<String, dynamic> jsonSerialization) {
    return PaginationMetadata(
      currentPage: jsonSerialization['currentPage'] as int,
      itemsInCurrentPageCount:
          jsonSerialization['itemsInCurrentPageCount'] as int,
      totalItemsCount: jsonSerialization['totalItemsCount'] as int,
      totalPagesCount: jsonSerialization['totalPagesCount'] as int,
      hasNextPage: jsonSerialization['hasNextPage'] as bool,
      hasPreviousPage: jsonSerialization['hasPreviousPage'] as bool,
    );
  }

  int currentPage;

  int itemsInCurrentPageCount;

  int totalItemsCount;

  int totalPagesCount;

  bool hasNextPage;

  bool hasPreviousPage;

  /// Returns a shallow copy of this [PaginationMetadata]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PaginationMetadata copyWith({
    int? currentPage,
    int? itemsInCurrentPageCount,
    int? totalItemsCount,
    int? totalPagesCount,
    bool? hasNextPage,
    bool? hasPreviousPage,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'PaginationMetadata',
      'currentPage': currentPage,
      'itemsInCurrentPageCount': itemsInCurrentPageCount,
      'totalItemsCount': totalItemsCount,
      'totalPagesCount': totalPagesCount,
      'hasNextPage': hasNextPage,
      'hasPreviousPage': hasPreviousPage,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'PaginationMetadata',
      'currentPage': currentPage,
      'itemsInCurrentPageCount': itemsInCurrentPageCount,
      'totalItemsCount': totalItemsCount,
      'totalPagesCount': totalPagesCount,
      'hasNextPage': hasNextPage,
      'hasPreviousPage': hasPreviousPage,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _PaginationMetadataImpl extends PaginationMetadata {
  _PaginationMetadataImpl({
    required int currentPage,
    required int itemsInCurrentPageCount,
    required int totalItemsCount,
    required int totalPagesCount,
    required bool hasNextPage,
    required bool hasPreviousPage,
  }) : super._(
         currentPage: currentPage,
         itemsInCurrentPageCount: itemsInCurrentPageCount,
         totalItemsCount: totalItemsCount,
         totalPagesCount: totalPagesCount,
         hasNextPage: hasNextPage,
         hasPreviousPage: hasPreviousPage,
       );

  /// Returns a shallow copy of this [PaginationMetadata]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PaginationMetadata copyWith({
    int? currentPage,
    int? itemsInCurrentPageCount,
    int? totalItemsCount,
    int? totalPagesCount,
    bool? hasNextPage,
    bool? hasPreviousPage,
  }) {
    return PaginationMetadata(
      currentPage: currentPage ?? this.currentPage,
      itemsInCurrentPageCount:
          itemsInCurrentPageCount ?? this.itemsInCurrentPageCount,
      totalItemsCount: totalItemsCount ?? this.totalItemsCount,
      totalPagesCount: totalPagesCount ?? this.totalPagesCount,
      hasNextPage: hasNextPage ?? this.hasNextPage,
      hasPreviousPage: hasPreviousPage ?? this.hasPreviousPage,
    );
  }
}
