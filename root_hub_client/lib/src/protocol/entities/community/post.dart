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
import '../../entities/core/language.dart' as _i2;
import '../../entities/match/played_match.dart' as _i3;
import '../../entities/core/player_data.dart' as _i4;
import '../../entities/community/post_comment.dart' as _i5;
import 'package:root_hub_client/src/protocol/protocol.dart' as _i6;

abstract class Post implements _i1.SerializableModel {
  Post._({
    this.id,
    required this.createdAt,
    required this.title,
    required this.content,
    required this.likesCount,
    required this.language,
    this.attachedMatchId,
    this.attachedMatch,
    this.authorId,
    this.author,
    this.comments,
  });

  factory Post({
    int? id,
    required DateTime createdAt,
    required String title,
    required String content,
    required int likesCount,
    required _i2.Language language,
    int? attachedMatchId,
    _i3.PlayedMatch? attachedMatch,
    int? authorId,
    _i4.PlayerData? author,
    List<_i5.PostComment>? comments,
  }) = _PostImpl;

  factory Post.fromJson(Map<String, dynamic> jsonSerialization) {
    return Post(
      id: jsonSerialization['id'] as int?,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      title: jsonSerialization['title'] as String,
      content: jsonSerialization['content'] as String,
      likesCount: jsonSerialization['likesCount'] as int,
      language: _i2.Language.fromJson(
        (jsonSerialization['language'] as String),
      ),
      attachedMatchId: jsonSerialization['attachedMatchId'] as int?,
      attachedMatch: jsonSerialization['attachedMatch'] == null
          ? null
          : _i6.Protocol().deserialize<_i3.PlayedMatch>(
              jsonSerialization['attachedMatch'],
            ),
      authorId: jsonSerialization['authorId'] as int?,
      author: jsonSerialization['author'] == null
          ? null
          : _i6.Protocol().deserialize<_i4.PlayerData>(
              jsonSerialization['author'],
            ),
      comments: jsonSerialization['comments'] == null
          ? null
          : _i6.Protocol().deserialize<List<_i5.PostComment>>(
              jsonSerialization['comments'],
            ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  DateTime createdAt;

  String title;

  String content;

  int likesCount;

  _i2.Language language;

  int? attachedMatchId;

  _i3.PlayedMatch? attachedMatch;

  int? authorId;

  _i4.PlayerData? author;

  List<_i5.PostComment>? comments;

  /// Returns a shallow copy of this [Post]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Post copyWith({
    int? id,
    DateTime? createdAt,
    String? title,
    String? content,
    int? likesCount,
    _i2.Language? language,
    int? attachedMatchId,
    _i3.PlayedMatch? attachedMatch,
    int? authorId,
    _i4.PlayerData? author,
    List<_i5.PostComment>? comments,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Post',
      if (id != null) 'id': id,
      'createdAt': createdAt.toJson(),
      'title': title,
      'content': content,
      'likesCount': likesCount,
      'language': language.toJson(),
      if (attachedMatchId != null) 'attachedMatchId': attachedMatchId,
      if (attachedMatch != null) 'attachedMatch': attachedMatch?.toJson(),
      if (authorId != null) 'authorId': authorId,
      if (author != null) 'author': author?.toJson(),
      if (comments != null)
        'comments': comments?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PostImpl extends Post {
  _PostImpl({
    int? id,
    required DateTime createdAt,
    required String title,
    required String content,
    required int likesCount,
    required _i2.Language language,
    int? attachedMatchId,
    _i3.PlayedMatch? attachedMatch,
    int? authorId,
    _i4.PlayerData? author,
    List<_i5.PostComment>? comments,
  }) : super._(
         id: id,
         createdAt: createdAt,
         title: title,
         content: content,
         likesCount: likesCount,
         language: language,
         attachedMatchId: attachedMatchId,
         attachedMatch: attachedMatch,
         authorId: authorId,
         author: author,
         comments: comments,
       );

  /// Returns a shallow copy of this [Post]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Post copyWith({
    Object? id = _Undefined,
    DateTime? createdAt,
    String? title,
    String? content,
    int? likesCount,
    _i2.Language? language,
    Object? attachedMatchId = _Undefined,
    Object? attachedMatch = _Undefined,
    Object? authorId = _Undefined,
    Object? author = _Undefined,
    Object? comments = _Undefined,
  }) {
    return Post(
      id: id is int? ? id : this.id,
      createdAt: createdAt ?? this.createdAt,
      title: title ?? this.title,
      content: content ?? this.content,
      likesCount: likesCount ?? this.likesCount,
      language: language ?? this.language,
      attachedMatchId: attachedMatchId is int?
          ? attachedMatchId
          : this.attachedMatchId,
      attachedMatch: attachedMatch is _i3.PlayedMatch?
          ? attachedMatch
          : this.attachedMatch?.copyWith(),
      authorId: authorId is int? ? authorId : this.authorId,
      author: author is _i4.PlayerData? ? author : this.author?.copyWith(),
      comments: comments is List<_i5.PostComment>?
          ? comments
          : this.comments?.map((e0) => e0.copyWith()).toList(),
    );
  }
}
