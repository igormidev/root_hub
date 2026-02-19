/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member
// ignore_for_file: unnecessary_null_comparison

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../../entities/core/language.dart' as _i2;
import '../../entities/community/post.dart' as _i3;
import '../../entities/core/player_data.dart' as _i4;
import 'package:root_hub_server/src/generated/protocol.dart' as _i5;

abstract class PostComment
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  PostComment._({
    this.id,
    required this.content,
    required this.language,
    required this.postId,
    this.post,
    required this.ownerId,
    this.owner,
  });

  factory PostComment({
    int? id,
    required String content,
    required _i2.Language language,
    required int postId,
    _i3.Post? post,
    required int ownerId,
    _i4.PlayerData? owner,
  }) = _PostCommentImpl;

  factory PostComment.fromJson(Map<String, dynamic> jsonSerialization) {
    return PostComment(
      id: jsonSerialization['id'] as int?,
      content: jsonSerialization['content'] as String,
      language: _i2.Language.fromJson(
        (jsonSerialization['language'] as String),
      ),
      postId: jsonSerialization['postId'] as int,
      post: jsonSerialization['post'] == null
          ? null
          : _i5.Protocol().deserialize<_i3.Post>(jsonSerialization['post']),
      ownerId: jsonSerialization['ownerId'] as int,
      owner: jsonSerialization['owner'] == null
          ? null
          : _i5.Protocol().deserialize<_i4.PlayerData>(
              jsonSerialization['owner'],
            ),
    );
  }

  static final t = PostCommentTable();

  static const db = PostCommentRepository._();

  @override
  int? id;

  String content;

  _i2.Language language;

  int postId;

  _i3.Post? post;

  int ownerId;

  _i4.PlayerData? owner;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [PostComment]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PostComment copyWith({
    int? id,
    String? content,
    _i2.Language? language,
    int? postId,
    _i3.Post? post,
    int? ownerId,
    _i4.PlayerData? owner,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'PostComment',
      if (id != null) 'id': id,
      'content': content,
      'language': language.toJson(),
      'postId': postId,
      if (post != null) 'post': post?.toJson(),
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'PostComment',
      if (id != null) 'id': id,
      'content': content,
      'language': language.toJson(),
      'postId': postId,
      if (post != null) 'post': post?.toJsonForProtocol(),
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJsonForProtocol(),
    };
  }

  static PostCommentInclude include({
    _i3.PostInclude? post,
    _i4.PlayerDataInclude? owner,
  }) {
    return PostCommentInclude._(
      post: post,
      owner: owner,
    );
  }

  static PostCommentIncludeList includeList({
    _i1.WhereExpressionBuilder<PostCommentTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PostCommentTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PostCommentTable>? orderByList,
    PostCommentInclude? include,
  }) {
    return PostCommentIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PostComment.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(PostComment.t),
      include: include,
    );
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
    required _i2.Language language,
    required int postId,
    _i3.Post? post,
    required int ownerId,
    _i4.PlayerData? owner,
  }) : super._(
         id: id,
         content: content,
         language: language,
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
    _i2.Language? language,
    int? postId,
    Object? post = _Undefined,
    int? ownerId,
    Object? owner = _Undefined,
  }) {
    return PostComment(
      id: id is int? ? id : this.id,
      content: content ?? this.content,
      language: language ?? this.language,
      postId: postId ?? this.postId,
      post: post is _i3.Post? ? post : this.post?.copyWith(),
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i4.PlayerData? ? owner : this.owner?.copyWith(),
    );
  }
}

class PostCommentUpdateTable extends _i1.UpdateTable<PostCommentTable> {
  PostCommentUpdateTable(super.table);

  _i1.ColumnValue<String, String> content(String value) => _i1.ColumnValue(
    table.content,
    value,
  );

  _i1.ColumnValue<_i2.Language, _i2.Language> language(_i2.Language value) =>
      _i1.ColumnValue(
        table.language,
        value,
      );

  _i1.ColumnValue<int, int> postId(int value) => _i1.ColumnValue(
    table.postId,
    value,
  );

  _i1.ColumnValue<int, int> ownerId(int value) => _i1.ColumnValue(
    table.ownerId,
    value,
  );
}

class PostCommentTable extends _i1.Table<int?> {
  PostCommentTable({super.tableRelation}) : super(tableName: 'post_comment') {
    updateTable = PostCommentUpdateTable(this);
    content = _i1.ColumnString(
      'content',
      this,
    );
    language = _i1.ColumnEnum(
      'language',
      this,
      _i1.EnumSerialization.byName,
    );
    postId = _i1.ColumnInt(
      'postId',
      this,
    );
    ownerId = _i1.ColumnInt(
      'ownerId',
      this,
    );
  }

  late final PostCommentUpdateTable updateTable;

  late final _i1.ColumnString content;

  late final _i1.ColumnEnum<_i2.Language> language;

  late final _i1.ColumnInt postId;

  _i3.PostTable? _post;

  late final _i1.ColumnInt ownerId;

  _i4.PlayerDataTable? _owner;

  _i3.PostTable get post {
    if (_post != null) return _post!;
    _post = _i1.createRelationTable(
      relationFieldName: 'post',
      field: PostComment.t.postId,
      foreignField: _i3.Post.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.PostTable(tableRelation: foreignTableRelation),
    );
    return _post!;
  }

  _i4.PlayerDataTable get owner {
    if (_owner != null) return _owner!;
    _owner = _i1.createRelationTable(
      relationFieldName: 'owner',
      field: PostComment.t.ownerId,
      foreignField: _i4.PlayerData.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.PlayerDataTable(tableRelation: foreignTableRelation),
    );
    return _owner!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    content,
    language,
    postId,
    ownerId,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'post') {
      return post;
    }
    if (relationField == 'owner') {
      return owner;
    }
    return null;
  }
}

class PostCommentInclude extends _i1.IncludeObject {
  PostCommentInclude._({
    _i3.PostInclude? post,
    _i4.PlayerDataInclude? owner,
  }) {
    _post = post;
    _owner = owner;
  }

  _i3.PostInclude? _post;

  _i4.PlayerDataInclude? _owner;

  @override
  Map<String, _i1.Include?> get includes => {
    'post': _post,
    'owner': _owner,
  };

  @override
  _i1.Table<int?> get table => PostComment.t;
}

class PostCommentIncludeList extends _i1.IncludeList {
  PostCommentIncludeList._({
    _i1.WhereExpressionBuilder<PostCommentTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(PostComment.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => PostComment.t;
}

class PostCommentRepository {
  const PostCommentRepository._();

  final attachRow = const PostCommentAttachRowRepository._();

  /// Returns a list of [PostComment]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<PostComment>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PostCommentTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PostCommentTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PostCommentTable>? orderByList,
    _i1.Transaction? transaction,
    PostCommentInclude? include,
  }) async {
    return session.db.find<PostComment>(
      where: where?.call(PostComment.t),
      orderBy: orderBy?.call(PostComment.t),
      orderByList: orderByList?.call(PostComment.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [PostComment] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<PostComment?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PostCommentTable>? where,
    int? offset,
    _i1.OrderByBuilder<PostCommentTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PostCommentTable>? orderByList,
    _i1.Transaction? transaction,
    PostCommentInclude? include,
  }) async {
    return session.db.findFirstRow<PostComment>(
      where: where?.call(PostComment.t),
      orderBy: orderBy?.call(PostComment.t),
      orderByList: orderByList?.call(PostComment.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [PostComment] by its [id] or null if no such row exists.
  Future<PostComment?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    PostCommentInclude? include,
  }) async {
    return session.db.findById<PostComment>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [PostComment]s in the list and returns the inserted rows.
  ///
  /// The returned [PostComment]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<PostComment>> insert(
    _i1.Session session,
    List<PostComment> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<PostComment>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [PostComment] and returns the inserted row.
  ///
  /// The returned [PostComment] will have its `id` field set.
  Future<PostComment> insertRow(
    _i1.Session session,
    PostComment row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<PostComment>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [PostComment]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<PostComment>> update(
    _i1.Session session,
    List<PostComment> rows, {
    _i1.ColumnSelections<PostCommentTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<PostComment>(
      rows,
      columns: columns?.call(PostComment.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PostComment]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<PostComment> updateRow(
    _i1.Session session,
    PostComment row, {
    _i1.ColumnSelections<PostCommentTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<PostComment>(
      row,
      columns: columns?.call(PostComment.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PostComment] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<PostComment?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<PostCommentUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<PostComment>(
      id,
      columnValues: columnValues(PostComment.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [PostComment]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<PostComment>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<PostCommentUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<PostCommentTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PostCommentTable>? orderBy,
    _i1.OrderByListBuilder<PostCommentTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<PostComment>(
      columnValues: columnValues(PostComment.t.updateTable),
      where: where(PostComment.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PostComment.t),
      orderByList: orderByList?.call(PostComment.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [PostComment]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<PostComment>> delete(
    _i1.Session session,
    List<PostComment> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<PostComment>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [PostComment].
  Future<PostComment> deleteRow(
    _i1.Session session,
    PostComment row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<PostComment>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<PostComment>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PostCommentTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<PostComment>(
      where: where(PostComment.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PostCommentTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<PostComment>(
      where: where?.call(PostComment.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class PostCommentAttachRowRepository {
  const PostCommentAttachRowRepository._();

  /// Creates a relation between the given [PostComment] and [Post]
  /// by setting the [PostComment]'s foreign key `postId` to refer to the [Post].
  Future<void> post(
    _i1.Session session,
    PostComment postComment,
    _i3.Post post, {
    _i1.Transaction? transaction,
  }) async {
    if (postComment.id == null) {
      throw ArgumentError.notNull('postComment.id');
    }
    if (post.id == null) {
      throw ArgumentError.notNull('post.id');
    }

    var $postComment = postComment.copyWith(postId: post.id);
    await session.db.updateRow<PostComment>(
      $postComment,
      columns: [PostComment.t.postId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [PostComment] and [PlayerData]
  /// by setting the [PostComment]'s foreign key `ownerId` to refer to the [PlayerData].
  Future<void> owner(
    _i1.Session session,
    PostComment postComment,
    _i4.PlayerData owner, {
    _i1.Transaction? transaction,
  }) async {
    if (postComment.id == null) {
      throw ArgumentError.notNull('postComment.id');
    }
    if (owner.id == null) {
      throw ArgumentError.notNull('owner.id');
    }

    var $postComment = postComment.copyWith(ownerId: owner.id);
    await session.db.updateRow<PostComment>(
      $postComment,
      columns: [PostComment.t.ownerId],
      transaction: transaction,
    );
  }
}
