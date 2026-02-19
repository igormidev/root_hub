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
import '../../entities/match/played_match.dart' as _i2;
import '../../entities/core/player_data.dart' as _i3;
import '../../entities/community/post_comment.dart' as _i4;
import 'package:root_hub_server/src/generated/protocol.dart' as _i5;

abstract class Post implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Post._({
    this.id,
    required this.createdAt,
    required this.title,
    required this.content,
    required this.likesCount,
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
    int? attachedMatchId,
    _i2.PlayedMatch? attachedMatch,
    int? authorId,
    _i3.PlayerData? author,
    List<_i4.PostComment>? comments,
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
      attachedMatchId: jsonSerialization['attachedMatchId'] as int?,
      attachedMatch: jsonSerialization['attachedMatch'] == null
          ? null
          : _i5.Protocol().deserialize<_i2.PlayedMatch>(
              jsonSerialization['attachedMatch'],
            ),
      authorId: jsonSerialization['authorId'] as int?,
      author: jsonSerialization['author'] == null
          ? null
          : _i5.Protocol().deserialize<_i3.PlayerData>(
              jsonSerialization['author'],
            ),
      comments: jsonSerialization['comments'] == null
          ? null
          : _i5.Protocol().deserialize<List<_i4.PostComment>>(
              jsonSerialization['comments'],
            ),
    );
  }

  static final t = PostTable();

  static const db = PostRepository._();

  @override
  int? id;

  DateTime createdAt;

  String title;

  String content;

  int likesCount;

  int? attachedMatchId;

  _i2.PlayedMatch? attachedMatch;

  int? authorId;

  _i3.PlayerData? author;

  List<_i4.PostComment>? comments;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Post]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Post copyWith({
    int? id,
    DateTime? createdAt,
    String? title,
    String? content,
    int? likesCount,
    int? attachedMatchId,
    _i2.PlayedMatch? attachedMatch,
    int? authorId,
    _i3.PlayerData? author,
    List<_i4.PostComment>? comments,
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
      if (attachedMatchId != null) 'attachedMatchId': attachedMatchId,
      if (attachedMatch != null) 'attachedMatch': attachedMatch?.toJson(),
      if (authorId != null) 'authorId': authorId,
      if (author != null) 'author': author?.toJson(),
      if (comments != null)
        'comments': comments?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Post',
      if (id != null) 'id': id,
      'createdAt': createdAt.toJson(),
      'title': title,
      'content': content,
      'likesCount': likesCount,
      if (attachedMatchId != null) 'attachedMatchId': attachedMatchId,
      if (attachedMatch != null)
        'attachedMatch': attachedMatch?.toJsonForProtocol(),
      if (authorId != null) 'authorId': authorId,
      if (author != null) 'author': author?.toJsonForProtocol(),
      if (comments != null)
        'comments': comments?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  static PostInclude include({
    _i2.PlayedMatchInclude? attachedMatch,
    _i3.PlayerDataInclude? author,
    _i4.PostCommentIncludeList? comments,
  }) {
    return PostInclude._(
      attachedMatch: attachedMatch,
      author: author,
      comments: comments,
    );
  }

  static PostIncludeList includeList({
    _i1.WhereExpressionBuilder<PostTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PostTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PostTable>? orderByList,
    PostInclude? include,
  }) {
    return PostIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Post.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Post.t),
      include: include,
    );
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
    int? attachedMatchId,
    _i2.PlayedMatch? attachedMatch,
    int? authorId,
    _i3.PlayerData? author,
    List<_i4.PostComment>? comments,
  }) : super._(
         id: id,
         createdAt: createdAt,
         title: title,
         content: content,
         likesCount: likesCount,
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
      attachedMatchId: attachedMatchId is int?
          ? attachedMatchId
          : this.attachedMatchId,
      attachedMatch: attachedMatch is _i2.PlayedMatch?
          ? attachedMatch
          : this.attachedMatch?.copyWith(),
      authorId: authorId is int? ? authorId : this.authorId,
      author: author is _i3.PlayerData? ? author : this.author?.copyWith(),
      comments: comments is List<_i4.PostComment>?
          ? comments
          : this.comments?.map((e0) => e0.copyWith()).toList(),
    );
  }
}

class PostUpdateTable extends _i1.UpdateTable<PostTable> {
  PostUpdateTable(super.table);

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );

  _i1.ColumnValue<String, String> title(String value) => _i1.ColumnValue(
    table.title,
    value,
  );

  _i1.ColumnValue<String, String> content(String value) => _i1.ColumnValue(
    table.content,
    value,
  );

  _i1.ColumnValue<int, int> likesCount(int value) => _i1.ColumnValue(
    table.likesCount,
    value,
  );

  _i1.ColumnValue<int, int> attachedMatchId(int? value) => _i1.ColumnValue(
    table.attachedMatchId,
    value,
  );

  _i1.ColumnValue<int, int> authorId(int? value) => _i1.ColumnValue(
    table.authorId,
    value,
  );
}

class PostTable extends _i1.Table<int?> {
  PostTable({super.tableRelation}) : super(tableName: 'post') {
    updateTable = PostUpdateTable(this);
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
    title = _i1.ColumnString(
      'title',
      this,
    );
    content = _i1.ColumnString(
      'content',
      this,
    );
    likesCount = _i1.ColumnInt(
      'likesCount',
      this,
    );
    attachedMatchId = _i1.ColumnInt(
      'attachedMatchId',
      this,
    );
    authorId = _i1.ColumnInt(
      'authorId',
      this,
    );
  }

  late final PostUpdateTable updateTable;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnString title;

  late final _i1.ColumnString content;

  late final _i1.ColumnInt likesCount;

  late final _i1.ColumnInt attachedMatchId;

  _i2.PlayedMatchTable? _attachedMatch;

  late final _i1.ColumnInt authorId;

  _i3.PlayerDataTable? _author;

  _i4.PostCommentTable? ___comments;

  _i1.ManyRelation<_i4.PostCommentTable>? _comments;

  _i2.PlayedMatchTable get attachedMatch {
    if (_attachedMatch != null) return _attachedMatch!;
    _attachedMatch = _i1.createRelationTable(
      relationFieldName: 'attachedMatch',
      field: Post.t.attachedMatchId,
      foreignField: _i2.PlayedMatch.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.PlayedMatchTable(tableRelation: foreignTableRelation),
    );
    return _attachedMatch!;
  }

  _i3.PlayerDataTable get author {
    if (_author != null) return _author!;
    _author = _i1.createRelationTable(
      relationFieldName: 'author',
      field: Post.t.authorId,
      foreignField: _i3.PlayerData.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.PlayerDataTable(tableRelation: foreignTableRelation),
    );
    return _author!;
  }

  _i4.PostCommentTable get __comments {
    if (___comments != null) return ___comments!;
    ___comments = _i1.createRelationTable(
      relationFieldName: '__comments',
      field: Post.t.id,
      foreignField: _i4.PostComment.t.postId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.PostCommentTable(tableRelation: foreignTableRelation),
    );
    return ___comments!;
  }

  _i1.ManyRelation<_i4.PostCommentTable> get comments {
    if (_comments != null) return _comments!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'comments',
      field: Post.t.id,
      foreignField: _i4.PostComment.t.postId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.PostCommentTable(tableRelation: foreignTableRelation),
    );
    _comments = _i1.ManyRelation<_i4.PostCommentTable>(
      tableWithRelations: relationTable,
      table: _i4.PostCommentTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _comments!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    createdAt,
    title,
    content,
    likesCount,
    attachedMatchId,
    authorId,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'attachedMatch') {
      return attachedMatch;
    }
    if (relationField == 'author') {
      return author;
    }
    if (relationField == 'comments') {
      return __comments;
    }
    return null;
  }
}

class PostInclude extends _i1.IncludeObject {
  PostInclude._({
    _i2.PlayedMatchInclude? attachedMatch,
    _i3.PlayerDataInclude? author,
    _i4.PostCommentIncludeList? comments,
  }) {
    _attachedMatch = attachedMatch;
    _author = author;
    _comments = comments;
  }

  _i2.PlayedMatchInclude? _attachedMatch;

  _i3.PlayerDataInclude? _author;

  _i4.PostCommentIncludeList? _comments;

  @override
  Map<String, _i1.Include?> get includes => {
    'attachedMatch': _attachedMatch,
    'author': _author,
    'comments': _comments,
  };

  @override
  _i1.Table<int?> get table => Post.t;
}

class PostIncludeList extends _i1.IncludeList {
  PostIncludeList._({
    _i1.WhereExpressionBuilder<PostTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Post.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Post.t;
}

class PostRepository {
  const PostRepository._();

  final attach = const PostAttachRepository._();

  final attachRow = const PostAttachRowRepository._();

  final detach = const PostDetachRepository._();

  final detachRow = const PostDetachRowRepository._();

  /// Returns a list of [Post]s matching the given query parameters.
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
  Future<List<Post>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PostTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PostTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PostTable>? orderByList,
    _i1.Transaction? transaction,
    PostInclude? include,
  }) async {
    return session.db.find<Post>(
      where: where?.call(Post.t),
      orderBy: orderBy?.call(Post.t),
      orderByList: orderByList?.call(Post.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Post] matching the given query parameters.
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
  Future<Post?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PostTable>? where,
    int? offset,
    _i1.OrderByBuilder<PostTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PostTable>? orderByList,
    _i1.Transaction? transaction,
    PostInclude? include,
  }) async {
    return session.db.findFirstRow<Post>(
      where: where?.call(Post.t),
      orderBy: orderBy?.call(Post.t),
      orderByList: orderByList?.call(Post.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Post] by its [id] or null if no such row exists.
  Future<Post?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    PostInclude? include,
  }) async {
    return session.db.findById<Post>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Post]s in the list and returns the inserted rows.
  ///
  /// The returned [Post]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Post>> insert(
    _i1.Session session,
    List<Post> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Post>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Post] and returns the inserted row.
  ///
  /// The returned [Post] will have its `id` field set.
  Future<Post> insertRow(
    _i1.Session session,
    Post row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Post>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Post]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Post>> update(
    _i1.Session session,
    List<Post> rows, {
    _i1.ColumnSelections<PostTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Post>(
      rows,
      columns: columns?.call(Post.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Post]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Post> updateRow(
    _i1.Session session,
    Post row, {
    _i1.ColumnSelections<PostTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Post>(
      row,
      columns: columns?.call(Post.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Post] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Post?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<PostUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Post>(
      id,
      columnValues: columnValues(Post.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Post]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Post>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<PostUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<PostTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PostTable>? orderBy,
    _i1.OrderByListBuilder<PostTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Post>(
      columnValues: columnValues(Post.t.updateTable),
      where: where(Post.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Post.t),
      orderByList: orderByList?.call(Post.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Post]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Post>> delete(
    _i1.Session session,
    List<Post> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Post>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Post].
  Future<Post> deleteRow(
    _i1.Session session,
    Post row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Post>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Post>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PostTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Post>(
      where: where(Post.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PostTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Post>(
      where: where?.call(Post.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class PostAttachRepository {
  const PostAttachRepository._();

  /// Creates a relation between this [Post] and the given [PostComment]s
  /// by setting each [PostComment]'s foreign key `postId` to refer to this [Post].
  Future<void> comments(
    _i1.Session session,
    Post post,
    List<_i4.PostComment> postComment, {
    _i1.Transaction? transaction,
  }) async {
    if (postComment.any((e) => e.id == null)) {
      throw ArgumentError.notNull('postComment.id');
    }
    if (post.id == null) {
      throw ArgumentError.notNull('post.id');
    }

    var $postComment = postComment
        .map((e) => e.copyWith(postId: post.id))
        .toList();
    await session.db.update<_i4.PostComment>(
      $postComment,
      columns: [_i4.PostComment.t.postId],
      transaction: transaction,
    );
  }
}

class PostAttachRowRepository {
  const PostAttachRowRepository._();

  /// Creates a relation between the given [Post] and [PlayedMatch]
  /// by setting the [Post]'s foreign key `attachedMatchId` to refer to the [PlayedMatch].
  Future<void> attachedMatch(
    _i1.Session session,
    Post post,
    _i2.PlayedMatch attachedMatch, {
    _i1.Transaction? transaction,
  }) async {
    if (post.id == null) {
      throw ArgumentError.notNull('post.id');
    }
    if (attachedMatch.id == null) {
      throw ArgumentError.notNull('attachedMatch.id');
    }

    var $post = post.copyWith(attachedMatchId: attachedMatch.id);
    await session.db.updateRow<Post>(
      $post,
      columns: [Post.t.attachedMatchId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [Post] and [PlayerData]
  /// by setting the [Post]'s foreign key `authorId` to refer to the [PlayerData].
  Future<void> author(
    _i1.Session session,
    Post post,
    _i3.PlayerData author, {
    _i1.Transaction? transaction,
  }) async {
    if (post.id == null) {
      throw ArgumentError.notNull('post.id');
    }
    if (author.id == null) {
      throw ArgumentError.notNull('author.id');
    }

    var $post = post.copyWith(authorId: author.id);
    await session.db.updateRow<Post>(
      $post,
      columns: [Post.t.authorId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Post] and the given [PostComment]
  /// by setting the [PostComment]'s foreign key `postId` to refer to this [Post].
  Future<void> comments(
    _i1.Session session,
    Post post,
    _i4.PostComment postComment, {
    _i1.Transaction? transaction,
  }) async {
    if (postComment.id == null) {
      throw ArgumentError.notNull('postComment.id');
    }
    if (post.id == null) {
      throw ArgumentError.notNull('post.id');
    }

    var $postComment = postComment.copyWith(postId: post.id);
    await session.db.updateRow<_i4.PostComment>(
      $postComment,
      columns: [_i4.PostComment.t.postId],
      transaction: transaction,
    );
  }
}

class PostDetachRepository {
  const PostDetachRepository._();

  /// Detaches the relation between this [Post] and the given [PostComment]
  /// by setting the [PostComment]'s foreign key `postId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> comments(
    _i1.Session session,
    List<_i4.PostComment> postComment, {
    _i1.Transaction? transaction,
  }) async {
    if (postComment.any((e) => e.id == null)) {
      throw ArgumentError.notNull('postComment.id');
    }

    var $postComment = postComment
        .map((e) => e.copyWith(postId: null))
        .toList();
    await session.db.update<_i4.PostComment>(
      $postComment,
      columns: [_i4.PostComment.t.postId],
      transaction: transaction,
    );
  }
}

class PostDetachRowRepository {
  const PostDetachRowRepository._();

  /// Detaches the relation between this [Post] and the [PlayedMatch] set in `attachedMatch`
  /// by setting the [Post]'s foreign key `attachedMatchId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> attachedMatch(
    _i1.Session session,
    Post post, {
    _i1.Transaction? transaction,
  }) async {
    if (post.id == null) {
      throw ArgumentError.notNull('post.id');
    }

    var $post = post.copyWith(attachedMatchId: null);
    await session.db.updateRow<Post>(
      $post,
      columns: [Post.t.attachedMatchId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [Post] and the [PlayerData] set in `author`
  /// by setting the [Post]'s foreign key `authorId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> author(
    _i1.Session session,
    Post post, {
    _i1.Transaction? transaction,
  }) async {
    if (post.id == null) {
      throw ArgumentError.notNull('post.id');
    }

    var $post = post.copyWith(authorId: null);
    await session.db.updateRow<Post>(
      $post,
      columns: [Post.t.authorId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [Post] and the given [PostComment]
  /// by setting the [PostComment]'s foreign key `postId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> comments(
    _i1.Session session,
    _i4.PostComment postComment, {
    _i1.Transaction? transaction,
  }) async {
    if (postComment.id == null) {
      throw ArgumentError.notNull('postComment.id');
    }

    var $postComment = postComment.copyWith(postId: null);
    await session.db.updateRow<_i4.PostComment>(
      $postComment,
      columns: [_i4.PostComment.t.postId],
      transaction: transaction,
    );
  }
}
