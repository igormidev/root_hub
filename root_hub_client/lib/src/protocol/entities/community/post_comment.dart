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
import '../../entities/community/post.dart' as _i2;
import '../../entities/core/player_data.dart' as _i3;
import 'package:root_hub_client/src/protocol/protocol.dart' as _i4;

abstract class PostComment implements _i1.SerializableModel {
  PostComment._({
    this.id,
    required this.content,
    required this.postId,
    this.post,
    required this.ownerId,
    this.owner,
  });

  factory PostComment({
    int? id,
    required String content,
    required int postId,
    _i2.Post? post,
    required int ownerId,
    _i3.PlayerData? owner,
  }) = _PostCommentImpl;

  factory PostComment.fromJson(Map<String, dynamic> jsonSerialization) {
    return PostComment(
      id: jsonSerialization['id'] as int?,
      content: jsonSerialization['content'] as String,
      postId: jsonSerialization['postId'] as int,
      post: jsonSerialization['post'] == null
          ? null
          : _i4.Protocol().deserialize<_i2.Post>(jsonSerialization['post']),
      ownerId: jsonSerialization['ownerId'] as int,
      owner: jsonSerialization['owner'] == null
          ? null
          : _i4.Protocol().deserialize<_i3.PlayerData>(
              jsonSerialization['owner'],
            ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String content;

  int postId;

  _i2.Post? post;

  int ownerId;

  _i3.PlayerData? owner;

  /// Returns a shallow copy of this [PostComment]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PostComment copyWith({
    int? id,
    String? content,
    int? postId,
    _i2.Post? post,
    int? ownerId,
    _i3.PlayerData? owner,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'PostComment',
      if (id != null) 'id': id,
      'content': content,
      'postId': postId,
      if (post != null) 'post': post?.toJson(),
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PostCommentImpl extends PostComment {
  _PostCommentImpl({
    int? id,
    required String content,
    required int postId,
    _i2.Post? post,
    required int ownerId,
    _i3.PlayerData? owner,
  }) : super._(
         id: id,
         content: content,
         postId: postId,
         post: post,
         ownerId: ownerId,
         owner: owner,
       );

  /// Returns a shallow copy of this [PostComment]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PostComment copyWith({
    Object? id = _Undefined,
    String? content,
    int? postId,
    Object? post = _Undefined,
    int? ownerId,
    Object? owner = _Undefined,
  }) {
    return PostComment(
      id: id is int? ? id : this.id,
      content: content ?? this.content,
      postId: postId ?? this.postId,
      post: post is _i2.Post? ? post : this.post?.copyWith(),
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i3.PlayerData? ? owner : this.owner?.copyWith(),
    );
  }
}
