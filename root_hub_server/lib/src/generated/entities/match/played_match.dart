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
import '../../entities/match_making/location.dart' as _i2;
import '../../entities/match/player_in_match.dart' as _i3;
import '../../entities/match/match_in_person_proof.dart' as _i4;
import '../../entities/community/post.dart' as _i5;
import 'package:root_hub_server/src/generated/protocol.dart' as _i6;

abstract class PlayedMatch
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  PlayedMatch._({
    this.id,
    required this.matchStartedAt,
    this.matchEstimatedDuration,
    required this.locationId,
    this.location,
    this.players,
    this.inPersonProof,
    this.posts,
  });

  factory PlayedMatch({
    int? id,
    required DateTime matchStartedAt,
    Duration? matchEstimatedDuration,
    required int locationId,
    _i2.Location? location,
    List<_i3.PlayerInMatch>? players,
    _i4.MatchInPersonProof? inPersonProof,
    List<_i5.Post>? posts,
  }) = _PlayedMatchImpl;

  factory PlayedMatch.fromJson(Map<String, dynamic> jsonSerialization) {
    return PlayedMatch(
      id: jsonSerialization['id'] as int?,
      matchStartedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['matchStartedAt'],
      ),
      matchEstimatedDuration:
          jsonSerialization['matchEstimatedDuration'] == null
          ? null
          : _i1.DurationJsonExtension.fromJson(
              jsonSerialization['matchEstimatedDuration'],
            ),
      locationId: jsonSerialization['locationId'] as int,
      location: jsonSerialization['location'] == null
          ? null
          : _i6.Protocol().deserialize<_i2.Location>(
              jsonSerialization['location'],
            ),
      players: jsonSerialization['players'] == null
          ? null
          : _i6.Protocol().deserialize<List<_i3.PlayerInMatch>>(
              jsonSerialization['players'],
            ),
      inPersonProof: jsonSerialization['inPersonProof'] == null
          ? null
          : _i6.Protocol().deserialize<_i4.MatchInPersonProof>(
              jsonSerialization['inPersonProof'],
            ),
      posts: jsonSerialization['posts'] == null
          ? null
          : _i6.Protocol().deserialize<List<_i5.Post>>(
              jsonSerialization['posts'],
            ),
    );
  }

  static final t = PlayedMatchTable();

  static const db = PlayedMatchRepository._();

  @override
  int? id;

  DateTime matchStartedAt;

  Duration? matchEstimatedDuration;

  int locationId;

  _i2.Location? location;

  List<_i3.PlayerInMatch>? players;

  _i4.MatchInPersonProof? inPersonProof;

  List<_i5.Post>? posts;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [PlayedMatch]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PlayedMatch copyWith({
    int? id,
    DateTime? matchStartedAt,
    Duration? matchEstimatedDuration,
    int? locationId,
    _i2.Location? location,
    List<_i3.PlayerInMatch>? players,
    _i4.MatchInPersonProof? inPersonProof,
    List<_i5.Post>? posts,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'PlayedMatch',
      if (id != null) 'id': id,
      'matchStartedAt': matchStartedAt.toJson(),
      if (matchEstimatedDuration != null)
        'matchEstimatedDuration': matchEstimatedDuration?.toJson(),
      'locationId': locationId,
      if (location != null) 'location': location?.toJson(),
      if (players != null)
        'players': players?.toJson(valueToJson: (v) => v.toJson()),
      if (inPersonProof != null) 'inPersonProof': inPersonProof?.toJson(),
      if (posts != null) 'posts': posts?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'PlayedMatch',
      if (id != null) 'id': id,
      'matchStartedAt': matchStartedAt.toJson(),
      if (matchEstimatedDuration != null)
        'matchEstimatedDuration': matchEstimatedDuration?.toJson(),
      'locationId': locationId,
      if (location != null) 'location': location?.toJsonForProtocol(),
      if (players != null)
        'players': players?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (inPersonProof != null)
        'inPersonProof': inPersonProof?.toJsonForProtocol(),
      if (posts != null)
        'posts': posts?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  static PlayedMatchInclude include({
    _i2.LocationInclude? location,
    _i3.PlayerInMatchIncludeList? players,
    _i4.MatchInPersonProofInclude? inPersonProof,
    _i5.PostIncludeList? posts,
  }) {
    return PlayedMatchInclude._(
      location: location,
      players: players,
      inPersonProof: inPersonProof,
      posts: posts,
    );
  }

  static PlayedMatchIncludeList includeList({
    _i1.WhereExpressionBuilder<PlayedMatchTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PlayedMatchTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PlayedMatchTable>? orderByList,
    PlayedMatchInclude? include,
  }) {
    return PlayedMatchIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PlayedMatch.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(PlayedMatch.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PlayedMatchImpl extends PlayedMatch {
  _PlayedMatchImpl({
    int? id,
    required DateTime matchStartedAt,
    Duration? matchEstimatedDuration,
    required int locationId,
    _i2.Location? location,
    List<_i3.PlayerInMatch>? players,
    _i4.MatchInPersonProof? inPersonProof,
    List<_i5.Post>? posts,
  }) : super._(
         id: id,
         matchStartedAt: matchStartedAt,
         matchEstimatedDuration: matchEstimatedDuration,
         locationId: locationId,
         location: location,
         players: players,
         inPersonProof: inPersonProof,
         posts: posts,
       );

  /// Returns a shallow copy of this [PlayedMatch]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PlayedMatch copyWith({
    Object? id = _Undefined,
    DateTime? matchStartedAt,
    Object? matchEstimatedDuration = _Undefined,
    int? locationId,
    Object? location = _Undefined,
    Object? players = _Undefined,
    Object? inPersonProof = _Undefined,
    Object? posts = _Undefined,
  }) {
    return PlayedMatch(
      id: id is int? ? id : this.id,
      matchStartedAt: matchStartedAt ?? this.matchStartedAt,
      matchEstimatedDuration: matchEstimatedDuration is Duration?
          ? matchEstimatedDuration
          : this.matchEstimatedDuration,
      locationId: locationId ?? this.locationId,
      location: location is _i2.Location?
          ? location
          : this.location?.copyWith(),
      players: players is List<_i3.PlayerInMatch>?
          ? players
          : this.players?.map((e0) => e0.copyWith()).toList(),
      inPersonProof: inPersonProof is _i4.MatchInPersonProof?
          ? inPersonProof
          : this.inPersonProof?.copyWith(),
      posts: posts is List<_i5.Post>?
          ? posts
          : this.posts?.map((e0) => e0.copyWith()).toList(),
    );
  }
}

class PlayedMatchUpdateTable extends _i1.UpdateTable<PlayedMatchTable> {
  PlayedMatchUpdateTable(super.table);

  _i1.ColumnValue<DateTime, DateTime> matchStartedAt(DateTime value) =>
      _i1.ColumnValue(
        table.matchStartedAt,
        value,
      );

  _i1.ColumnValue<Duration, Duration> matchEstimatedDuration(Duration? value) =>
      _i1.ColumnValue(
        table.matchEstimatedDuration,
        value,
      );

  _i1.ColumnValue<int, int> locationId(int value) => _i1.ColumnValue(
    table.locationId,
    value,
  );
}

class PlayedMatchTable extends _i1.Table<int?> {
  PlayedMatchTable({super.tableRelation}) : super(tableName: 'played_match') {
    updateTable = PlayedMatchUpdateTable(this);
    matchStartedAt = _i1.ColumnDateTime(
      'matchStartedAt',
      this,
    );
    matchEstimatedDuration = _i1.ColumnDuration(
      'matchEstimatedDuration',
      this,
    );
    locationId = _i1.ColumnInt(
      'locationId',
      this,
    );
  }

  late final PlayedMatchUpdateTable updateTable;

  late final _i1.ColumnDateTime matchStartedAt;

  late final _i1.ColumnDuration matchEstimatedDuration;

  late final _i1.ColumnInt locationId;

  _i2.LocationTable? _location;

  _i3.PlayerInMatchTable? ___players;

  _i1.ManyRelation<_i3.PlayerInMatchTable>? _players;

  _i4.MatchInPersonProofTable? _inPersonProof;

  _i5.PostTable? ___posts;

  _i1.ManyRelation<_i5.PostTable>? _posts;

  _i2.LocationTable get location {
    if (_location != null) return _location!;
    _location = _i1.createRelationTable(
      relationFieldName: 'location',
      field: PlayedMatch.t.locationId,
      foreignField: _i2.Location.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.LocationTable(tableRelation: foreignTableRelation),
    );
    return _location!;
  }

  _i3.PlayerInMatchTable get __players {
    if (___players != null) return ___players!;
    ___players = _i1.createRelationTable(
      relationFieldName: '__players',
      field: PlayedMatch.t.id,
      foreignField: _i3.PlayerInMatch.t.matchId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.PlayerInMatchTable(tableRelation: foreignTableRelation),
    );
    return ___players!;
  }

  _i4.MatchInPersonProofTable get inPersonProof {
    if (_inPersonProof != null) return _inPersonProof!;
    _inPersonProof = _i1.createRelationTable(
      relationFieldName: 'inPersonProof',
      field: PlayedMatch.t.id,
      foreignField: _i4.MatchInPersonProof.t.matchId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.MatchInPersonProofTable(tableRelation: foreignTableRelation),
    );
    return _inPersonProof!;
  }

  _i5.PostTable get __posts {
    if (___posts != null) return ___posts!;
    ___posts = _i1.createRelationTable(
      relationFieldName: '__posts',
      field: PlayedMatch.t.id,
      foreignField: _i5.Post.t.attachedMatchId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.PostTable(tableRelation: foreignTableRelation),
    );
    return ___posts!;
  }

  _i1.ManyRelation<_i3.PlayerInMatchTable> get players {
    if (_players != null) return _players!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'players',
      field: PlayedMatch.t.id,
      foreignField: _i3.PlayerInMatch.t.matchId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.PlayerInMatchTable(tableRelation: foreignTableRelation),
    );
    _players = _i1.ManyRelation<_i3.PlayerInMatchTable>(
      tableWithRelations: relationTable,
      table: _i3.PlayerInMatchTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _players!;
  }

  _i1.ManyRelation<_i5.PostTable> get posts {
    if (_posts != null) return _posts!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'posts',
      field: PlayedMatch.t.id,
      foreignField: _i5.Post.t.attachedMatchId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.PostTable(tableRelation: foreignTableRelation),
    );
    _posts = _i1.ManyRelation<_i5.PostTable>(
      tableWithRelations: relationTable,
      table: _i5.PostTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _posts!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    matchStartedAt,
    matchEstimatedDuration,
    locationId,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'location') {
      return location;
    }
    if (relationField == 'players') {
      return __players;
    }
    if (relationField == 'inPersonProof') {
      return inPersonProof;
    }
    if (relationField == 'posts') {
      return __posts;
    }
    return null;
  }
}

class PlayedMatchInclude extends _i1.IncludeObject {
  PlayedMatchInclude._({
    _i2.LocationInclude? location,
    _i3.PlayerInMatchIncludeList? players,
    _i4.MatchInPersonProofInclude? inPersonProof,
    _i5.PostIncludeList? posts,
  }) {
    _location = location;
    _players = players;
    _inPersonProof = inPersonProof;
    _posts = posts;
  }

  _i2.LocationInclude? _location;

  _i3.PlayerInMatchIncludeList? _players;

  _i4.MatchInPersonProofInclude? _inPersonProof;

  _i5.PostIncludeList? _posts;

  @override
  Map<String, _i1.Include?> get includes => {
    'location': _location,
    'players': _players,
    'inPersonProof': _inPersonProof,
    'posts': _posts,
  };

  @override
  _i1.Table<int?> get table => PlayedMatch.t;
}

class PlayedMatchIncludeList extends _i1.IncludeList {
  PlayedMatchIncludeList._({
    _i1.WhereExpressionBuilder<PlayedMatchTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(PlayedMatch.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => PlayedMatch.t;
}

class PlayedMatchRepository {
  const PlayedMatchRepository._();

  final attach = const PlayedMatchAttachRepository._();

  final attachRow = const PlayedMatchAttachRowRepository._();

  final detach = const PlayedMatchDetachRepository._();

  final detachRow = const PlayedMatchDetachRowRepository._();

  /// Returns a list of [PlayedMatch]s matching the given query parameters.
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
  Future<List<PlayedMatch>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PlayedMatchTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PlayedMatchTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PlayedMatchTable>? orderByList,
    _i1.Transaction? transaction,
    PlayedMatchInclude? include,
  }) async {
    return session.db.find<PlayedMatch>(
      where: where?.call(PlayedMatch.t),
      orderBy: orderBy?.call(PlayedMatch.t),
      orderByList: orderByList?.call(PlayedMatch.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [PlayedMatch] matching the given query parameters.
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
  Future<PlayedMatch?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PlayedMatchTable>? where,
    int? offset,
    _i1.OrderByBuilder<PlayedMatchTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PlayedMatchTable>? orderByList,
    _i1.Transaction? transaction,
    PlayedMatchInclude? include,
  }) async {
    return session.db.findFirstRow<PlayedMatch>(
      where: where?.call(PlayedMatch.t),
      orderBy: orderBy?.call(PlayedMatch.t),
      orderByList: orderByList?.call(PlayedMatch.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [PlayedMatch] by its [id] or null if no such row exists.
  Future<PlayedMatch?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    PlayedMatchInclude? include,
  }) async {
    return session.db.findById<PlayedMatch>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [PlayedMatch]s in the list and returns the inserted rows.
  ///
  /// The returned [PlayedMatch]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<PlayedMatch>> insert(
    _i1.Session session,
    List<PlayedMatch> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<PlayedMatch>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [PlayedMatch] and returns the inserted row.
  ///
  /// The returned [PlayedMatch] will have its `id` field set.
  Future<PlayedMatch> insertRow(
    _i1.Session session,
    PlayedMatch row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<PlayedMatch>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [PlayedMatch]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<PlayedMatch>> update(
    _i1.Session session,
    List<PlayedMatch> rows, {
    _i1.ColumnSelections<PlayedMatchTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<PlayedMatch>(
      rows,
      columns: columns?.call(PlayedMatch.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PlayedMatch]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<PlayedMatch> updateRow(
    _i1.Session session,
    PlayedMatch row, {
    _i1.ColumnSelections<PlayedMatchTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<PlayedMatch>(
      row,
      columns: columns?.call(PlayedMatch.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PlayedMatch] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<PlayedMatch?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<PlayedMatchUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<PlayedMatch>(
      id,
      columnValues: columnValues(PlayedMatch.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [PlayedMatch]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<PlayedMatch>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<PlayedMatchUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<PlayedMatchTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PlayedMatchTable>? orderBy,
    _i1.OrderByListBuilder<PlayedMatchTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<PlayedMatch>(
      columnValues: columnValues(PlayedMatch.t.updateTable),
      where: where(PlayedMatch.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PlayedMatch.t),
      orderByList: orderByList?.call(PlayedMatch.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [PlayedMatch]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<PlayedMatch>> delete(
    _i1.Session session,
    List<PlayedMatch> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<PlayedMatch>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [PlayedMatch].
  Future<PlayedMatch> deleteRow(
    _i1.Session session,
    PlayedMatch row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<PlayedMatch>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<PlayedMatch>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PlayedMatchTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<PlayedMatch>(
      where: where(PlayedMatch.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PlayedMatchTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<PlayedMatch>(
      where: where?.call(PlayedMatch.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class PlayedMatchAttachRepository {
  const PlayedMatchAttachRepository._();

  /// Creates a relation between this [PlayedMatch] and the given [PlayerInMatch]s
  /// by setting each [PlayerInMatch]'s foreign key `matchId` to refer to this [PlayedMatch].
  Future<void> players(
    _i1.Session session,
    PlayedMatch playedMatch,
    List<_i3.PlayerInMatch> playerInMatch, {
    _i1.Transaction? transaction,
  }) async {
    if (playerInMatch.any((e) => e.id == null)) {
      throw ArgumentError.notNull('playerInMatch.id');
    }
    if (playedMatch.id == null) {
      throw ArgumentError.notNull('playedMatch.id');
    }

    var $playerInMatch = playerInMatch
        .map((e) => e.copyWith(matchId: playedMatch.id))
        .toList();
    await session.db.update<_i3.PlayerInMatch>(
      $playerInMatch,
      columns: [_i3.PlayerInMatch.t.matchId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [PlayedMatch] and the given [Post]s
  /// by setting each [Post]'s foreign key `attachedMatchId` to refer to this [PlayedMatch].
  Future<void> posts(
    _i1.Session session,
    PlayedMatch playedMatch,
    List<_i5.Post> post, {
    _i1.Transaction? transaction,
  }) async {
    if (post.any((e) => e.id == null)) {
      throw ArgumentError.notNull('post.id');
    }
    if (playedMatch.id == null) {
      throw ArgumentError.notNull('playedMatch.id');
    }

    var $post = post
        .map((e) => e.copyWith(attachedMatchId: playedMatch.id))
        .toList();
    await session.db.update<_i5.Post>(
      $post,
      columns: [_i5.Post.t.attachedMatchId],
      transaction: transaction,
    );
  }
}

class PlayedMatchAttachRowRepository {
  const PlayedMatchAttachRowRepository._();

  /// Creates a relation between the given [PlayedMatch] and [Location]
  /// by setting the [PlayedMatch]'s foreign key `locationId` to refer to the [Location].
  Future<void> location(
    _i1.Session session,
    PlayedMatch playedMatch,
    _i2.Location location, {
    _i1.Transaction? transaction,
  }) async {
    if (playedMatch.id == null) {
      throw ArgumentError.notNull('playedMatch.id');
    }
    if (location.id == null) {
      throw ArgumentError.notNull('location.id');
    }

    var $playedMatch = playedMatch.copyWith(locationId: location.id);
    await session.db.updateRow<PlayedMatch>(
      $playedMatch,
      columns: [PlayedMatch.t.locationId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [PlayedMatch] and [MatchInPersonProof]
  /// by setting the [PlayedMatch]'s foreign key `id` to refer to the [MatchInPersonProof].
  Future<void> inPersonProof(
    _i1.Session session,
    PlayedMatch playedMatch,
    _i4.MatchInPersonProof inPersonProof, {
    _i1.Transaction? transaction,
  }) async {
    if (inPersonProof.id == null) {
      throw ArgumentError.notNull('inPersonProof.id');
    }
    if (playedMatch.id == null) {
      throw ArgumentError.notNull('playedMatch.id');
    }

    var $inPersonProof = inPersonProof.copyWith(matchId: playedMatch.id);
    await session.db.updateRow<_i4.MatchInPersonProof>(
      $inPersonProof,
      columns: [_i4.MatchInPersonProof.t.matchId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [PlayedMatch] and the given [PlayerInMatch]
  /// by setting the [PlayerInMatch]'s foreign key `matchId` to refer to this [PlayedMatch].
  Future<void> players(
    _i1.Session session,
    PlayedMatch playedMatch,
    _i3.PlayerInMatch playerInMatch, {
    _i1.Transaction? transaction,
  }) async {
    if (playerInMatch.id == null) {
      throw ArgumentError.notNull('playerInMatch.id');
    }
    if (playedMatch.id == null) {
      throw ArgumentError.notNull('playedMatch.id');
    }

    var $playerInMatch = playerInMatch.copyWith(matchId: playedMatch.id);
    await session.db.updateRow<_i3.PlayerInMatch>(
      $playerInMatch,
      columns: [_i3.PlayerInMatch.t.matchId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [PlayedMatch] and the given [Post]
  /// by setting the [Post]'s foreign key `attachedMatchId` to refer to this [PlayedMatch].
  Future<void> posts(
    _i1.Session session,
    PlayedMatch playedMatch,
    _i5.Post post, {
    _i1.Transaction? transaction,
  }) async {
    if (post.id == null) {
      throw ArgumentError.notNull('post.id');
    }
    if (playedMatch.id == null) {
      throw ArgumentError.notNull('playedMatch.id');
    }

    var $post = post.copyWith(attachedMatchId: playedMatch.id);
    await session.db.updateRow<_i5.Post>(
      $post,
      columns: [_i5.Post.t.attachedMatchId],
      transaction: transaction,
    );
  }
}

class PlayedMatchDetachRepository {
  const PlayedMatchDetachRepository._();

  /// Detaches the relation between this [PlayedMatch] and the given [PlayerInMatch]
  /// by setting the [PlayerInMatch]'s foreign key `matchId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> players(
    _i1.Session session,
    List<_i3.PlayerInMatch> playerInMatch, {
    _i1.Transaction? transaction,
  }) async {
    if (playerInMatch.any((e) => e.id == null)) {
      throw ArgumentError.notNull('playerInMatch.id');
    }

    var $playerInMatch = playerInMatch
        .map((e) => e.copyWith(matchId: null))
        .toList();
    await session.db.update<_i3.PlayerInMatch>(
      $playerInMatch,
      columns: [_i3.PlayerInMatch.t.matchId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [PlayedMatch] and the given [Post]
  /// by setting the [Post]'s foreign key `attachedMatchId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> posts(
    _i1.Session session,
    List<_i5.Post> post, {
    _i1.Transaction? transaction,
  }) async {
    if (post.any((e) => e.id == null)) {
      throw ArgumentError.notNull('post.id');
    }

    var $post = post.map((e) => e.copyWith(attachedMatchId: null)).toList();
    await session.db.update<_i5.Post>(
      $post,
      columns: [_i5.Post.t.attachedMatchId],
      transaction: transaction,
    );
  }
}

class PlayedMatchDetachRowRepository {
  const PlayedMatchDetachRowRepository._();

  /// Detaches the relation between this [PlayedMatch] and the given [PlayerInMatch]
  /// by setting the [PlayerInMatch]'s foreign key `matchId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> players(
    _i1.Session session,
    _i3.PlayerInMatch playerInMatch, {
    _i1.Transaction? transaction,
  }) async {
    if (playerInMatch.id == null) {
      throw ArgumentError.notNull('playerInMatch.id');
    }

    var $playerInMatch = playerInMatch.copyWith(matchId: null);
    await session.db.updateRow<_i3.PlayerInMatch>(
      $playerInMatch,
      columns: [_i3.PlayerInMatch.t.matchId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [PlayedMatch] and the given [Post]
  /// by setting the [Post]'s foreign key `attachedMatchId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> posts(
    _i1.Session session,
    _i5.Post post, {
    _i1.Transaction? transaction,
  }) async {
    if (post.id == null) {
      throw ArgumentError.notNull('post.id');
    }

    var $post = post.copyWith(attachedMatchId: null);
    await session.db.updateRow<_i5.Post>(
      $post,
      columns: [_i5.Post.t.attachedMatchId],
      transaction: transaction,
    );
  }
}
