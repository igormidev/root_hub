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
import '../../entities/match/player_perfomance_in_match.dart' as _i3;
import 'package:root_hub_server/src/generated/protocol.dart' as _i4;

abstract class AnonymousPlayer
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  AnonymousPlayer._({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.createdByPlayerId,
    this.createdByPlayer,
    this.perfomances,
  });

  factory AnonymousPlayer({
    int? id,
    required String firstName,
    required String lastName,
    required int createdByPlayerId,
    _i2.PlayerData? createdByPlayer,
    List<_i3.PlayerPerfomanceInMatch>? perfomances,
  }) = _AnonymousPlayerImpl;

  factory AnonymousPlayer.fromJson(Map<String, dynamic> jsonSerialization) {
    return AnonymousPlayer(
      id: jsonSerialization['id'] as int?,
      firstName: jsonSerialization['firstName'] as String,
      lastName: jsonSerialization['lastName'] as String,
      createdByPlayerId: jsonSerialization['createdByPlayerId'] as int,
      createdByPlayer: jsonSerialization['createdByPlayer'] == null
          ? null
          : _i4.Protocol().deserialize<_i2.PlayerData>(
              jsonSerialization['createdByPlayer'],
            ),
      perfomances: jsonSerialization['perfomances'] == null
          ? null
          : _i4.Protocol().deserialize<List<_i3.PlayerPerfomanceInMatch>>(
              jsonSerialization['perfomances'],
            ),
    );
  }

  static final t = AnonymousPlayerTable();

  static const db = AnonymousPlayerRepository._();

  @override
  int? id;

  String firstName;

  String lastName;

  int createdByPlayerId;

  _i2.PlayerData? createdByPlayer;

  List<_i3.PlayerPerfomanceInMatch>? perfomances;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [AnonymousPlayer]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  AnonymousPlayer copyWith({
    int? id,
    String? firstName,
    String? lastName,
    int? createdByPlayerId,
    _i2.PlayerData? createdByPlayer,
    List<_i3.PlayerPerfomanceInMatch>? perfomances,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AnonymousPlayer',
      if (id != null) 'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'createdByPlayerId': createdByPlayerId,
      if (createdByPlayer != null) 'createdByPlayer': createdByPlayer?.toJson(),
      if (perfomances != null)
        'perfomances': perfomances?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'AnonymousPlayer',
      if (id != null) 'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'createdByPlayerId': createdByPlayerId,
      if (createdByPlayer != null)
        'createdByPlayer': createdByPlayer?.toJsonForProtocol(),
      if (perfomances != null)
        'perfomances': perfomances?.toJson(
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
    };
  }

  static AnonymousPlayerInclude include({
    _i2.PlayerDataInclude? createdByPlayer,
    _i3.PlayerPerfomanceInMatchIncludeList? perfomances,
  }) {
    return AnonymousPlayerInclude._(
      createdByPlayer: createdByPlayer,
      perfomances: perfomances,
    );
  }

  static AnonymousPlayerIncludeList includeList({
    _i1.WhereExpressionBuilder<AnonymousPlayerTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AnonymousPlayerTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AnonymousPlayerTable>? orderByList,
    AnonymousPlayerInclude? include,
  }) {
    return AnonymousPlayerIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(AnonymousPlayer.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(AnonymousPlayer.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AnonymousPlayerImpl extends AnonymousPlayer {
  _AnonymousPlayerImpl({
    int? id,
    required String firstName,
    required String lastName,
    required int createdByPlayerId,
    _i2.PlayerData? createdByPlayer,
    List<_i3.PlayerPerfomanceInMatch>? perfomances,
  }) : super._(
         id: id,
         firstName: firstName,
         lastName: lastName,
         createdByPlayerId: createdByPlayerId,
         createdByPlayer: createdByPlayer,
         perfomances: perfomances,
       );

  /// Returns a shallow copy of this [AnonymousPlayer]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  AnonymousPlayer copyWith({
    Object? id = _Undefined,
    String? firstName,
    String? lastName,
    int? createdByPlayerId,
    Object? createdByPlayer = _Undefined,
    Object? perfomances = _Undefined,
  }) {
    return AnonymousPlayer(
      id: id is int? ? id : this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      createdByPlayerId: createdByPlayerId ?? this.createdByPlayerId,
      createdByPlayer: createdByPlayer is _i2.PlayerData?
          ? createdByPlayer
          : this.createdByPlayer?.copyWith(),
      perfomances: perfomances is List<_i3.PlayerPerfomanceInMatch>?
          ? perfomances
          : this.perfomances?.map((e0) => e0.copyWith()).toList(),
    );
  }
}

class AnonymousPlayerUpdateTable extends _i1.UpdateTable<AnonymousPlayerTable> {
  AnonymousPlayerUpdateTable(super.table);

  _i1.ColumnValue<String, String> firstName(String value) => _i1.ColumnValue(
    table.firstName,
    value,
  );

  _i1.ColumnValue<String, String> lastName(String value) => _i1.ColumnValue(
    table.lastName,
    value,
  );

  _i1.ColumnValue<int, int> createdByPlayerId(int value) => _i1.ColumnValue(
    table.createdByPlayerId,
    value,
  );
}

class AnonymousPlayerTable extends _i1.Table<int?> {
  AnonymousPlayerTable({super.tableRelation})
    : super(tableName: 'anonymous_player') {
    updateTable = AnonymousPlayerUpdateTable(this);
    firstName = _i1.ColumnString(
      'firstName',
      this,
    );
    lastName = _i1.ColumnString(
      'lastName',
      this,
    );
    createdByPlayerId = _i1.ColumnInt(
      'createdByPlayerId',
      this,
    );
  }

  late final AnonymousPlayerUpdateTable updateTable;

  late final _i1.ColumnString firstName;

  late final _i1.ColumnString lastName;

  late final _i1.ColumnInt createdByPlayerId;

  _i2.PlayerDataTable? _createdByPlayer;

  _i3.PlayerPerfomanceInMatchTable? ___perfomances;

  _i1.ManyRelation<_i3.PlayerPerfomanceInMatchTable>? _perfomances;

  _i2.PlayerDataTable get createdByPlayer {
    if (_createdByPlayer != null) return _createdByPlayer!;
    _createdByPlayer = _i1.createRelationTable(
      relationFieldName: 'createdByPlayer',
      field: AnonymousPlayer.t.createdByPlayerId,
      foreignField: _i2.PlayerData.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.PlayerDataTable(tableRelation: foreignTableRelation),
    );
    return _createdByPlayer!;
  }

  _i3.PlayerPerfomanceInMatchTable get __perfomances {
    if (___perfomances != null) return ___perfomances!;
    ___perfomances = _i1.createRelationTable(
      relationFieldName: '__perfomances',
      field: AnonymousPlayer.t.id,
      foreignField: _i3.PlayerPerfomanceInMatch.t.anonymousPlayerId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.PlayerPerfomanceInMatchTable(tableRelation: foreignTableRelation),
    );
    return ___perfomances!;
  }

  _i1.ManyRelation<_i3.PlayerPerfomanceInMatchTable> get perfomances {
    if (_perfomances != null) return _perfomances!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'perfomances',
      field: AnonymousPlayer.t.id,
      foreignField: _i3.PlayerPerfomanceInMatch.t.anonymousPlayerId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.PlayerPerfomanceInMatchTable(tableRelation: foreignTableRelation),
    );
    _perfomances = _i1.ManyRelation<_i3.PlayerPerfomanceInMatchTable>(
      tableWithRelations: relationTable,
      table: _i3.PlayerPerfomanceInMatchTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _perfomances!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    firstName,
    lastName,
    createdByPlayerId,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'createdByPlayer') {
      return createdByPlayer;
    }
    if (relationField == 'perfomances') {
      return __perfomances;
    }
    return null;
  }
}

class AnonymousPlayerInclude extends _i1.IncludeObject {
  AnonymousPlayerInclude._({
    _i2.PlayerDataInclude? createdByPlayer,
    _i3.PlayerPerfomanceInMatchIncludeList? perfomances,
  }) {
    _createdByPlayer = createdByPlayer;
    _perfomances = perfomances;
  }

  _i2.PlayerDataInclude? _createdByPlayer;

  _i3.PlayerPerfomanceInMatchIncludeList? _perfomances;

  @override
  Map<String, _i1.Include?> get includes => {
    'createdByPlayer': _createdByPlayer,
    'perfomances': _perfomances,
  };

  @override
  _i1.Table<int?> get table => AnonymousPlayer.t;
}

class AnonymousPlayerIncludeList extends _i1.IncludeList {
  AnonymousPlayerIncludeList._({
    _i1.WhereExpressionBuilder<AnonymousPlayerTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(AnonymousPlayer.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => AnonymousPlayer.t;
}

class AnonymousPlayerRepository {
  const AnonymousPlayerRepository._();

  final attach = const AnonymousPlayerAttachRepository._();

  final attachRow = const AnonymousPlayerAttachRowRepository._();

  final detach = const AnonymousPlayerDetachRepository._();

  final detachRow = const AnonymousPlayerDetachRowRepository._();

  /// Returns a list of [AnonymousPlayer]s matching the given query parameters.
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
  Future<List<AnonymousPlayer>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AnonymousPlayerTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AnonymousPlayerTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AnonymousPlayerTable>? orderByList,
    _i1.Transaction? transaction,
    AnonymousPlayerInclude? include,
  }) async {
    return session.db.find<AnonymousPlayer>(
      where: where?.call(AnonymousPlayer.t),
      orderBy: orderBy?.call(AnonymousPlayer.t),
      orderByList: orderByList?.call(AnonymousPlayer.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [AnonymousPlayer] matching the given query parameters.
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
  Future<AnonymousPlayer?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AnonymousPlayerTable>? where,
    int? offset,
    _i1.OrderByBuilder<AnonymousPlayerTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AnonymousPlayerTable>? orderByList,
    _i1.Transaction? transaction,
    AnonymousPlayerInclude? include,
  }) async {
    return session.db.findFirstRow<AnonymousPlayer>(
      where: where?.call(AnonymousPlayer.t),
      orderBy: orderBy?.call(AnonymousPlayer.t),
      orderByList: orderByList?.call(AnonymousPlayer.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [AnonymousPlayer] by its [id] or null if no such row exists.
  Future<AnonymousPlayer?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    AnonymousPlayerInclude? include,
  }) async {
    return session.db.findById<AnonymousPlayer>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [AnonymousPlayer]s in the list and returns the inserted rows.
  ///
  /// The returned [AnonymousPlayer]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<AnonymousPlayer>> insert(
    _i1.Session session,
    List<AnonymousPlayer> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<AnonymousPlayer>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [AnonymousPlayer] and returns the inserted row.
  ///
  /// The returned [AnonymousPlayer] will have its `id` field set.
  Future<AnonymousPlayer> insertRow(
    _i1.Session session,
    AnonymousPlayer row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<AnonymousPlayer>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [AnonymousPlayer]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<AnonymousPlayer>> update(
    _i1.Session session,
    List<AnonymousPlayer> rows, {
    _i1.ColumnSelections<AnonymousPlayerTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<AnonymousPlayer>(
      rows,
      columns: columns?.call(AnonymousPlayer.t),
      transaction: transaction,
    );
  }

  /// Updates a single [AnonymousPlayer]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<AnonymousPlayer> updateRow(
    _i1.Session session,
    AnonymousPlayer row, {
    _i1.ColumnSelections<AnonymousPlayerTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<AnonymousPlayer>(
      row,
      columns: columns?.call(AnonymousPlayer.t),
      transaction: transaction,
    );
  }

  /// Updates a single [AnonymousPlayer] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<AnonymousPlayer?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<AnonymousPlayerUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<AnonymousPlayer>(
      id,
      columnValues: columnValues(AnonymousPlayer.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [AnonymousPlayer]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<AnonymousPlayer>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<AnonymousPlayerUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<AnonymousPlayerTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AnonymousPlayerTable>? orderBy,
    _i1.OrderByListBuilder<AnonymousPlayerTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<AnonymousPlayer>(
      columnValues: columnValues(AnonymousPlayer.t.updateTable),
      where: where(AnonymousPlayer.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(AnonymousPlayer.t),
      orderByList: orderByList?.call(AnonymousPlayer.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [AnonymousPlayer]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<AnonymousPlayer>> delete(
    _i1.Session session,
    List<AnonymousPlayer> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<AnonymousPlayer>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [AnonymousPlayer].
  Future<AnonymousPlayer> deleteRow(
    _i1.Session session,
    AnonymousPlayer row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<AnonymousPlayer>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<AnonymousPlayer>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<AnonymousPlayerTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<AnonymousPlayer>(
      where: where(AnonymousPlayer.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AnonymousPlayerTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<AnonymousPlayer>(
      where: where?.call(AnonymousPlayer.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class AnonymousPlayerAttachRepository {
  const AnonymousPlayerAttachRepository._();

  /// Creates a relation between this [AnonymousPlayer] and the given [PlayerPerfomanceInMatch]s
  /// by setting each [PlayerPerfomanceInMatch]'s foreign key `anonymousPlayerId` to refer to this [AnonymousPlayer].
  Future<void> perfomances(
    _i1.Session session,
    AnonymousPlayer anonymousPlayer,
    List<_i3.PlayerPerfomanceInMatch> playerPerfomanceInMatch, {
    _i1.Transaction? transaction,
  }) async {
    if (playerPerfomanceInMatch.any((e) => e.id == null)) {
      throw ArgumentError.notNull('playerPerfomanceInMatch.id');
    }
    if (anonymousPlayer.id == null) {
      throw ArgumentError.notNull('anonymousPlayer.id');
    }

    var $playerPerfomanceInMatch = playerPerfomanceInMatch
        .map((e) => e.copyWith(anonymousPlayerId: anonymousPlayer.id))
        .toList();
    await session.db.update<_i3.PlayerPerfomanceInMatch>(
      $playerPerfomanceInMatch,
      columns: [_i3.PlayerPerfomanceInMatch.t.anonymousPlayerId],
      transaction: transaction,
    );
  }
}

class AnonymousPlayerAttachRowRepository {
  const AnonymousPlayerAttachRowRepository._();

  /// Creates a relation between the given [AnonymousPlayer] and [PlayerData]
  /// by setting the [AnonymousPlayer]'s foreign key `createdByPlayerId` to refer to the [PlayerData].
  Future<void> createdByPlayer(
    _i1.Session session,
    AnonymousPlayer anonymousPlayer,
    _i2.PlayerData createdByPlayer, {
    _i1.Transaction? transaction,
  }) async {
    if (anonymousPlayer.id == null) {
      throw ArgumentError.notNull('anonymousPlayer.id');
    }
    if (createdByPlayer.id == null) {
      throw ArgumentError.notNull('createdByPlayer.id');
    }

    var $anonymousPlayer = anonymousPlayer.copyWith(
      createdByPlayerId: createdByPlayer.id,
    );
    await session.db.updateRow<AnonymousPlayer>(
      $anonymousPlayer,
      columns: [AnonymousPlayer.t.createdByPlayerId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [AnonymousPlayer] and the given [PlayerPerfomanceInMatch]
  /// by setting the [PlayerPerfomanceInMatch]'s foreign key `anonymousPlayerId` to refer to this [AnonymousPlayer].
  Future<void> perfomances(
    _i1.Session session,
    AnonymousPlayer anonymousPlayer,
    _i3.PlayerPerfomanceInMatch playerPerfomanceInMatch, {
    _i1.Transaction? transaction,
  }) async {
    if (playerPerfomanceInMatch.id == null) {
      throw ArgumentError.notNull('playerPerfomanceInMatch.id');
    }
    if (anonymousPlayer.id == null) {
      throw ArgumentError.notNull('anonymousPlayer.id');
    }

    var $playerPerfomanceInMatch = playerPerfomanceInMatch.copyWith(
      anonymousPlayerId: anonymousPlayer.id,
    );
    await session.db.updateRow<_i3.PlayerPerfomanceInMatch>(
      $playerPerfomanceInMatch,
      columns: [_i3.PlayerPerfomanceInMatch.t.anonymousPlayerId],
      transaction: transaction,
    );
  }
}

class AnonymousPlayerDetachRepository {
  const AnonymousPlayerDetachRepository._();

  /// Detaches the relation between this [AnonymousPlayer] and the given [PlayerPerfomanceInMatch]
  /// by setting the [PlayerPerfomanceInMatch]'s foreign key `anonymousPlayerId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> perfomances(
    _i1.Session session,
    List<_i3.PlayerPerfomanceInMatch> playerPerfomanceInMatch, {
    _i1.Transaction? transaction,
  }) async {
    if (playerPerfomanceInMatch.any((e) => e.id == null)) {
      throw ArgumentError.notNull('playerPerfomanceInMatch.id');
    }

    var $playerPerfomanceInMatch = playerPerfomanceInMatch
        .map((e) => e.copyWith(anonymousPlayerId: null))
        .toList();
    await session.db.update<_i3.PlayerPerfomanceInMatch>(
      $playerPerfomanceInMatch,
      columns: [_i3.PlayerPerfomanceInMatch.t.anonymousPlayerId],
      transaction: transaction,
    );
  }
}

class AnonymousPlayerDetachRowRepository {
  const AnonymousPlayerDetachRowRepository._();

  /// Detaches the relation between this [AnonymousPlayer] and the given [PlayerPerfomanceInMatch]
  /// by setting the [PlayerPerfomanceInMatch]'s foreign key `anonymousPlayerId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> perfomances(
    _i1.Session session,
    _i3.PlayerPerfomanceInMatch playerPerfomanceInMatch, {
    _i1.Transaction? transaction,
  }) async {
    if (playerPerfomanceInMatch.id == null) {
      throw ArgumentError.notNull('playerPerfomanceInMatch.id');
    }

    var $playerPerfomanceInMatch = playerPerfomanceInMatch.copyWith(
      anonymousPlayerId: null,
    );
    await session.db.updateRow<_i3.PlayerPerfomanceInMatch>(
      $playerPerfomanceInMatch,
      columns: [_i3.PlayerPerfomanceInMatch.t.anonymousPlayerId],
      transaction: transaction,
    );
  }
}
