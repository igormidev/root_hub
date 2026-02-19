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
import '../../../entities/community/post_comment.dart' as _i2;
import '../../../entities/others/pagination_metadata.dart' as _i3;
import 'package:root_hub_client/src/protocol/protocol.dart' as _i4;

abstract class CommentsPagination implements _i1.SerializableModel {
  CommentsPagination._({
    required this.comments,
    required this.paginationMetadata,
  });

  factory CommentsPagination({
    required List<_i2.PostComment> comments,
    required _i3.PaginationMetadata paginationMetadata,
  }) = _CommentsPaginationImpl;

  factory CommentsPagination.fromJson(Map<String, dynamic> jsonSerialization) {
    return CommentsPagination(
      comments: _i4.Protocol().deserialize<List<_i2.PostComment>>(
        jsonSerialization['comments'],
      ),
      paginationMetadata: _i4.Protocol().deserialize<_i3.PaginationMetadata>(
        jsonSerialization['paginationMetadata'],
      ),
    );
  }

  List<_i2.PostComment> comments;

  _i3.PaginationMetadata paginationMetadata;

  /// Returns a shallow copy of this [CommentsPagination]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CommentsPagination copyWith({
    List<_i2.PostComment>? comments,
    _i3.PaginationMetadata? paginationMetadata,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CommentsPagination',
      'comments': comments.toJson(valueToJson: (v) => v.toJson()),
      'paginationMetadata': paginationMetadata.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _CommentsPaginationImpl extends CommentsPagination {
  _CommentsPaginationImpl({
    required List<_i2.PostComment> comments,
    required _i3.PaginationMetadata paginationMetadata,
  }) : super._(
         comments: comments,
         paginationMetadata: paginationMetadata,
       );

  /// Returns a shallow copy of this [CommentsPagination]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CommentsPagination copyWith({
    List<_i2.PostComment>? comments,
    _i3.PaginationMetadata? paginationMetadata,
  }) {
    return CommentsPagination(
      comments: comments ?? this.comments.map((e0) => e0.copyWith()).toList(),
      paginationMetadata:
          paginationMetadata ?? this.paginationMetadata.copyWith(),
    );
  }
}
