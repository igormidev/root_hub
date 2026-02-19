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
import '../../entities/core/player_data.dart' as _i2;
import '../../entities/match/played_match.dart' as _i3;
import 'package:root_hub_server/src/generated/protocol.dart' as _i4;

abstract class PlayerInMatch
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  PlayerInMatch._({
    this.id,
    required this.playerId,
    this.player,
    required this.matchId,
    this.match,
  });

  factory PlayerInMatch({
    int? id,
    required int playerId,
    _i2.PlayerData? player,
    required int matchId,
    _i3.PlayedMatch? match,
  }) = _PlayerInMatchImpl;

  factory PlayerInMatch.fromJson(Map<String, dynamic> jsonSerialization) {
    return PlayerInMatch(
      id: jsonSerialization['id'] as int?,
      playerId: jsonSerialization['playerId'] as int,
      player: jsonSerialization['player'] == null
          ? null
          : _i4.Protocol().deserialize<_i2.PlayerData>(
              jsonSerialization['player'],
            ),
      matchId: jsonSerialization['matchId'] as int,
      match: jsonSerialization['match'] == null
          ? null
          : _i4.Protocol().deserialize<_i3.PlayedMatch>(
              jsonSerialization['match'],
            ),
    );
  }

  static final t = PlayerInMatchTable();

  static const db = PlayerInMatchRepository._();

  @override
  int? id;

  int playerId;

  _i2.PlayerData? player;

  int matchId;

  _i3.PlayedMatch? match;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [PlayerInMatch]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PlayerInMatch copyWith({
    int? id,
    int? playerId,
    _i2.PlayerData? player,
    int? matchId,
    _i3.PlayedMatch? match,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'PlayerInMatch',
      if (id != null) 'id': id,
      'playerId': playerId,
      if (player != null) 'player': player?.toJson(),
      'matchId': matchId,
      if (match != null) 'match': match?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'PlayerInMatch',
      if (id != null) 'id': id,
      'playerId': playerId,
      if (player != null) 'player': player?.toJsonForProtocol(),
      'matchId': matchId,
      if (match != null) 'match': match?.toJsonForProtocol(),
    };
  }

  static PlayerInMatchInclude include({
    _i2.PlayerDataInclude? player,
    _i3.PlayedMatchInclude? match,
  }) {
    return PlayerInMatchInclude._(
      player: player,
      match: match,
    );
  }

  static PlayerInMatchIncludeList includeList({
    _i1.WhereExpressionBuilder<PlayerInMatchTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PlayerInMatchTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PlayerInMatchTable>? orderByList,
    PlayerInMatchInclude? include,
  }) {
    return PlayerInMatchIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PlayerInMatch.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(PlayerInMatch.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PlayerInMatchImpl extends PlayerInMatch {
  _PlayerInMatchImpl({
    int? id,
    required int playerId,
    _i2.PlayerData? player,
    required int matchId,
    _i3.PlayedMatch? match,
  }) : super._(
         id: id,
         playerId: playerId,
         player: player,
         matchId: matchId,
         match: match,
       );

  /// Returns a shallow copy of this [PlayerInMatch]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PlayerInMatch copyWith({
    Object? id = _Undefined,
    int? playerId,
    Object? player = _Undefined,
    int? matchId,
    Object? match = _Undefined,
  }) {
    return PlayerInMatch(
      id: id is int? ? id : this.id,
      playerId: playerId ?? this.playerId,
      player: player is _i2.PlayerData? ? player : this.player?.copyWith(),
      matchId: matchId ?? this.matchId,
      match: match is _i3.PlayedMatch? ? match : this.match?.copyWith(),
    );
  }
}

class PlayerInMatchUpdateTable extends _i1.UpdateTable<PlayerInMatchTable> {
  PlayerInMatchUpdateTable(super.table);

  _i1.ColumnValue<int, int> playerId(int value) => _i1.ColumnValue(
    table.playerId,
    value,
  );

  _i1.ColumnValue<int, int> matchId(int value) => _i1.ColumnValue(
    table.matchId,
    value,
  );
}

class PlayerInMatchTable extends _i1.Table<int?> {
  PlayerInMatchTable({super.tableRelation})
    : super(tableName: 'player_in_match') {
    updateTable = PlayerInMatchUpdateTable(this);
    playerId = _i1.ColumnInt(
      'playerId',
      this,
    );
    matchId = _i1.ColumnInt(
      'matchId',
      this,
    );
  }

  late final PlayerInMatchUpdateTable updateTable;

  late final _i1.ColumnInt playerId;

  _i2.PlayerDataTable? _player;

  late final _i1.ColumnInt matchId;

  _i3.PlayedMatchTable? _match;

  _i2.PlayerDataTable get player {
    if (_player != null) return _player!;
    _player = _i1.createRelationTable(
      relationFieldName: 'player',
      field: PlayerInMatch.t.playerId,
      foreignField: _i2.PlayerData.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.PlayerDataTable(tableRelation: foreignTableRelation),
    );
    return _player!;
  }

  _i3.PlayedMatchTable get match {
    if (_match != null) return _match!;
    _match = _i1.createRelationTable(
      relationFieldName: 'match',
      field: PlayerInMatch.t.matchId,
      foreignField: _i3.PlayedMatch.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.PlayedMatchTable(tableRelation: foreignTableRelation),
    );
    return _match!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    playerId,
    matchId,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'player') {
      return player;
    }
    if (relationField == 'match') {
      return match;
    }
    return null;
  }
}

class PlayerInMatchInclude extends _i1.IncludeObject {
  PlayerInMatchInclude._({
    _i2.PlayerDataInclude? player,
    _i3.PlayedMatchInclude? match,
  }) {
    _player = player;
    _match = match;
  }

  _i2.PlayerDataInclude? _player;

  _i3.PlayedMatchInclude? _match;

  @override
  Map<String, _i1.Include?> get includes => {
    'player': _player,
    'match': _match,
  };

  @override
  _i1.Table<int?> get table => PlayerInMatch.t;
}

class PlayerInMatchIncludeList extends _i1.IncludeList {
  PlayerInMatchIncludeList._({
    _i1.WhereExpressionBuilder<PlayerInMatchTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(PlayerInMatch.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => PlayerInMatch.t;
}

class PlayerInMatchRepository {
  const PlayerInMatchRepository._();

  final attachRow = const PlayerInMatchAttachRowRepository._();

  /// Returns a list of [PlayerInMatch]s matching the given query parameters.
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
  Future<List<PlayerInMatch>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PlayerInMatchTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PlayerInMatchTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PlayerInMatchTable>? orderByList,
    _i1.Transaction? transaction,
    PlayerInMatchInclude? include,
  }) async {
    return session.db.find<PlayerInMatch>(
      where: where?.call(PlayerInMatch.t),
      orderBy: orderBy?.call(PlayerInMatch.t),
      orderByList: orderByList?.call(PlayerInMatch.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [PlayerInMatch] matching the given query parameters.
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
  Future<PlayerInMatch?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PlayerInMatchTable>? where,
    int? offset,
    _i1.OrderByBuilder<PlayerInMatchTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PlayerInMatchTable>? orderByList,
    _i1.Transaction? transaction,
    PlayerInMatchInclude? include,
  }) async {
    return session.db.findFirstRow<PlayerInMatch>(
      where: where?.call(PlayerInMatch.t),
      orderBy: orderBy?.call(PlayerInMatch.t),
      orderByList: orderByList?.call(PlayerInMatch.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [PlayerInMatch] by its [id] or null if no such row exists.
  Future<PlayerInMatch?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    PlayerInMatchInclude? include,
  }) async {
    return session.db.findById<PlayerInMatch>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [PlayerInMatch]s in the list and returns the inserted rows.
  ///
  /// The returned [PlayerInMatch]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<PlayerInMatch>> insert(
    _i1.Session session,
    List<PlayerInMatch> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<PlayerInMatch>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [PlayerInMatch] and returns the inserted row.
  ///
  /// The returned [PlayerInMatch] will have its `id` field set.
  Future<PlayerInMatch> insertRow(
    _i1.Session session,
    PlayerInMatch row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<PlayerInMatch>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [PlayerInMatch]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<PlayerInMatch>> update(
    _i1.Session session,
    List<PlayerInMatch> rows, {
    _i1.ColumnSelections<PlayerInMatchTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<PlayerInMatch>(
      rows,
      columns: columns?.call(PlayerInMatch.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PlayerInMatch]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<PlayerInMatch> updateRow(
    _i1.Session session,
    PlayerInMatch row, {
    _i1.ColumnSelections<PlayerInMatchTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<PlayerInMatch>(
      row,
      columns: columns?.call(PlayerInMatch.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PlayerInMatch] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<PlayerInMatch?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<PlayerInMatchUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<PlayerInMatch>(
      id,
      columnValues: columnValues(PlayerInMatch.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [PlayerInMatch]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<PlayerInMatch>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<PlayerInMatchUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<PlayerInMatchTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PlayerInMatchTable>? orderBy,
    _i1.OrderByListBuilder<PlayerInMatchTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<PlayerInMatch>(
      columnValues: columnValues(PlayerInMatch.t.updateTable),
      where: where(PlayerInMatch.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PlayerInMatch.t),
      orderByList: orderByList?.call(PlayerInMatch.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [PlayerInMatch]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<PlayerInMatch>> delete(
    _i1.Session session,
    List<PlayerInMatch> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<PlayerInMatch>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [PlayerInMatch].
  Future<PlayerInMatch> deleteRow(
    _i1.Session session,
    PlayerInMatch row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<PlayerInMatch>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<PlayerInMatch>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PlayerInMatchTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<PlayerInMatch>(
      where: where(PlayerInMatch.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PlayerInMatchTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<PlayerInMatch>(
      where: where?.call(PlayerInMatch.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class PlayerInMatchAttachRowRepository {
  const PlayerInMatchAttachRowRepository._();

  /// Creates a relation between the given [PlayerInMatch] and [PlayerData]
  /// by setting the [PlayerInMatch]'s foreign key `playerId` to refer to the [PlayerData].
  Future<void> player(
    _i1.Session session,
    PlayerInMatch playerInMatch,
    _i2.PlayerData player, {
    _i1.Transaction? transaction,
  }) async {
    if (playerInMatch.id == null) {
      throw ArgumentError.notNull('playerInMatch.id');
    }
    if (player.id == null) {
      throw ArgumentError.notNull('player.id');
    }

    var $playerInMatch = playerInMatch.copyWith(playerId: player.id);
    await session.db.updateRow<PlayerInMatch>(
      $playerInMatch,
      columns: [PlayerInMatch.t.playerId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [PlayerInMatch] and [PlayedMatch]
  /// by setting the [PlayerInMatch]'s foreign key `matchId` to refer to the [PlayedMatch].
  Future<void> match(
    _i1.Session session,
    PlayerInMatch playerInMatch,
    _i3.PlayedMatch match, {
    _i1.Transaction? transaction,
  }) async {
    if (playerInMatch.id == null) {
      throw ArgumentError.notNull('playerInMatch.id');
    }
    if (match.id == null) {
      throw ArgumentError.notNull('match.id');
    }

    var $playerInMatch = playerInMatch.copyWith(matchId: match.id);
    await session.db.updateRow<PlayerInMatch>(
      $playerInMatch,
      columns: [PlayerInMatch.t.matchId],
      transaction: transaction,
    );
  }
}
