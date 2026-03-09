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
import '../../../entities/core/player_data.dart' as _i2;
import '../../../entities/match_making/chat/match_chat_history.dart' as _i3;
import 'package:root_hub_server/src/generated/protocol.dart' as _i4;

abstract class MatchChatParticipantState
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  MatchChatParticipantState._({
    this.id,
    required this.playerDataId,
    this.playerData,
    required this.matchChatHistoryId,
    this.matchChatHistory,
    required this.firstSeenAt,
    required this.lastOpenedAt,
    this.lastReadMessageAt,
    this.lastTypingAt,
    int? unreadMessagesCount,
  }) : unreadMessagesCount = unreadMessagesCount ?? 0;

  factory MatchChatParticipantState({
    int? id,
    required int playerDataId,
    _i2.PlayerData? playerData,
    required int matchChatHistoryId,
    _i3.MatchChatHistory? matchChatHistory,
    required DateTime firstSeenAt,
    required DateTime lastOpenedAt,
    DateTime? lastReadMessageAt,
    DateTime? lastTypingAt,
    int? unreadMessagesCount,
  }) = _MatchChatParticipantStateImpl;

  factory MatchChatParticipantState.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return MatchChatParticipantState(
      id: jsonSerialization['id'] as int?,
      playerDataId: jsonSerialization['playerDataId'] as int,
      playerData: jsonSerialization['playerData'] == null
          ? null
          : _i4.Protocol().deserialize<_i2.PlayerData>(
              jsonSerialization['playerData'],
            ),
      matchChatHistoryId: jsonSerialization['matchChatHistoryId'] as int,
      matchChatHistory: jsonSerialization['matchChatHistory'] == null
          ? null
          : _i4.Protocol().deserialize<_i3.MatchChatHistory>(
              jsonSerialization['matchChatHistory'],
            ),
      firstSeenAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['firstSeenAt'],
      ),
      lastOpenedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['lastOpenedAt'],
      ),
      lastReadMessageAt: jsonSerialization['lastReadMessageAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastReadMessageAt'],
            ),
      lastTypingAt: jsonSerialization['lastTypingAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastTypingAt'],
            ),
      unreadMessagesCount: jsonSerialization['unreadMessagesCount'] as int?,
    );
  }

  static final t = MatchChatParticipantStateTable();

  static const db = MatchChatParticipantStateRepository._();

  @override
  int? id;

  int playerDataId;

  _i2.PlayerData? playerData;

  int matchChatHistoryId;

  _i3.MatchChatHistory? matchChatHistory;

  DateTime firstSeenAt;

  DateTime lastOpenedAt;

  DateTime? lastReadMessageAt;

  DateTime? lastTypingAt;

  int unreadMessagesCount;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [MatchChatParticipantState]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  MatchChatParticipantState copyWith({
    int? id,
    int? playerDataId,
    _i2.PlayerData? playerData,
    int? matchChatHistoryId,
    _i3.MatchChatHistory? matchChatHistory,
    DateTime? firstSeenAt,
    DateTime? lastOpenedAt,
    DateTime? lastReadMessageAt,
    DateTime? lastTypingAt,
    int? unreadMessagesCount,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'MatchChatParticipantState',
      if (id != null) 'id': id,
      'playerDataId': playerDataId,
      if (playerData != null) 'playerData': playerData?.toJson(),
      'matchChatHistoryId': matchChatHistoryId,
      if (matchChatHistory != null)
        'matchChatHistory': matchChatHistory?.toJson(),
      'firstSeenAt': firstSeenAt.toJson(),
      'lastOpenedAt': lastOpenedAt.toJson(),
      if (lastReadMessageAt != null)
        'lastReadMessageAt': lastReadMessageAt?.toJson(),
      if (lastTypingAt != null) 'lastTypingAt': lastTypingAt?.toJson(),
      'unreadMessagesCount': unreadMessagesCount,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'MatchChatParticipantState',
      if (id != null) 'id': id,
      'playerDataId': playerDataId,
      if (playerData != null) 'playerData': playerData?.toJsonForProtocol(),
      'matchChatHistoryId': matchChatHistoryId,
      if (matchChatHistory != null)
        'matchChatHistory': matchChatHistory?.toJsonForProtocol(),
      'firstSeenAt': firstSeenAt.toJson(),
      'lastOpenedAt': lastOpenedAt.toJson(),
      if (lastReadMessageAt != null)
        'lastReadMessageAt': lastReadMessageAt?.toJson(),
      if (lastTypingAt != null) 'lastTypingAt': lastTypingAt?.toJson(),
      'unreadMessagesCount': unreadMessagesCount,
    };
  }

  static MatchChatParticipantStateInclude include({
    _i2.PlayerDataInclude? playerData,
    _i3.MatchChatHistoryInclude? matchChatHistory,
  }) {
    return MatchChatParticipantStateInclude._(
      playerData: playerData,
      matchChatHistory: matchChatHistory,
    );
  }

  static MatchChatParticipantStateIncludeList includeList({
    _i1.WhereExpressionBuilder<MatchChatParticipantStateTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MatchChatParticipantStateTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MatchChatParticipantStateTable>? orderByList,
    MatchChatParticipantStateInclude? include,
  }) {
    return MatchChatParticipantStateIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(MatchChatParticipantState.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(MatchChatParticipantState.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MatchChatParticipantStateImpl extends MatchChatParticipantState {
  _MatchChatParticipantStateImpl({
    int? id,
    required int playerDataId,
    _i2.PlayerData? playerData,
    required int matchChatHistoryId,
    _i3.MatchChatHistory? matchChatHistory,
    required DateTime firstSeenAt,
    required DateTime lastOpenedAt,
    DateTime? lastReadMessageAt,
    DateTime? lastTypingAt,
    int? unreadMessagesCount,
  }) : super._(
         id: id,
         playerDataId: playerDataId,
         playerData: playerData,
         matchChatHistoryId: matchChatHistoryId,
         matchChatHistory: matchChatHistory,
         firstSeenAt: firstSeenAt,
         lastOpenedAt: lastOpenedAt,
         lastReadMessageAt: lastReadMessageAt,
         lastTypingAt: lastTypingAt,
         unreadMessagesCount: unreadMessagesCount,
       );

  /// Returns a shallow copy of this [MatchChatParticipantState]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  MatchChatParticipantState copyWith({
    Object? id = _Undefined,
    int? playerDataId,
    Object? playerData = _Undefined,
    int? matchChatHistoryId,
    Object? matchChatHistory = _Undefined,
    DateTime? firstSeenAt,
    DateTime? lastOpenedAt,
    Object? lastReadMessageAt = _Undefined,
    Object? lastTypingAt = _Undefined,
    int? unreadMessagesCount,
  }) {
    return MatchChatParticipantState(
      id: id is int? ? id : this.id,
      playerDataId: playerDataId ?? this.playerDataId,
      playerData: playerData is _i2.PlayerData?
          ? playerData
          : this.playerData?.copyWith(),
      matchChatHistoryId: matchChatHistoryId ?? this.matchChatHistoryId,
      matchChatHistory: matchChatHistory is _i3.MatchChatHistory?
          ? matchChatHistory
          : this.matchChatHistory?.copyWith(),
      firstSeenAt: firstSeenAt ?? this.firstSeenAt,
      lastOpenedAt: lastOpenedAt ?? this.lastOpenedAt,
      lastReadMessageAt: lastReadMessageAt is DateTime?
          ? lastReadMessageAt
          : this.lastReadMessageAt,
      lastTypingAt: lastTypingAt is DateTime?
          ? lastTypingAt
          : this.lastTypingAt,
      unreadMessagesCount: unreadMessagesCount ?? this.unreadMessagesCount,
    );
  }
}

class MatchChatParticipantStateUpdateTable
    extends _i1.UpdateTable<MatchChatParticipantStateTable> {
  MatchChatParticipantStateUpdateTable(super.table);

  _i1.ColumnValue<int, int> playerDataId(int value) => _i1.ColumnValue(
    table.playerDataId,
    value,
  );

  _i1.ColumnValue<int, int> matchChatHistoryId(int value) => _i1.ColumnValue(
    table.matchChatHistoryId,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> firstSeenAt(DateTime value) =>
      _i1.ColumnValue(
        table.firstSeenAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> lastOpenedAt(DateTime value) =>
      _i1.ColumnValue(
        table.lastOpenedAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> lastReadMessageAt(DateTime? value) =>
      _i1.ColumnValue(
        table.lastReadMessageAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> lastTypingAt(DateTime? value) =>
      _i1.ColumnValue(
        table.lastTypingAt,
        value,
      );

  _i1.ColumnValue<int, int> unreadMessagesCount(int value) => _i1.ColumnValue(
    table.unreadMessagesCount,
    value,
  );
}

class MatchChatParticipantStateTable extends _i1.Table<int?> {
  MatchChatParticipantStateTable({super.tableRelation})
    : super(tableName: 'match_chat_participant_state') {
    updateTable = MatchChatParticipantStateUpdateTable(this);
    playerDataId = _i1.ColumnInt(
      'playerDataId',
      this,
    );
    matchChatHistoryId = _i1.ColumnInt(
      'matchChatHistoryId',
      this,
    );
    firstSeenAt = _i1.ColumnDateTime(
      'firstSeenAt',
      this,
    );
    lastOpenedAt = _i1.ColumnDateTime(
      'lastOpenedAt',
      this,
    );
    lastReadMessageAt = _i1.ColumnDateTime(
      'lastReadMessageAt',
      this,
    );
    lastTypingAt = _i1.ColumnDateTime(
      'lastTypingAt',
      this,
    );
    unreadMessagesCount = _i1.ColumnInt(
      'unreadMessagesCount',
      this,
      hasDefault: true,
    );
  }

  late final MatchChatParticipantStateUpdateTable updateTable;

  late final _i1.ColumnInt playerDataId;

  _i2.PlayerDataTable? _playerData;

  late final _i1.ColumnInt matchChatHistoryId;

  _i3.MatchChatHistoryTable? _matchChatHistory;

  late final _i1.ColumnDateTime firstSeenAt;

  late final _i1.ColumnDateTime lastOpenedAt;

  late final _i1.ColumnDateTime lastReadMessageAt;

  late final _i1.ColumnDateTime lastTypingAt;

  late final _i1.ColumnInt unreadMessagesCount;

  _i2.PlayerDataTable get playerData {
    if (_playerData != null) return _playerData!;
    _playerData = _i1.createRelationTable(
      relationFieldName: 'playerData',
      field: MatchChatParticipantState.t.playerDataId,
      foreignField: _i2.PlayerData.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.PlayerDataTable(tableRelation: foreignTableRelation),
    );
    return _playerData!;
  }

  _i3.MatchChatHistoryTable get matchChatHistory {
    if (_matchChatHistory != null) return _matchChatHistory!;
    _matchChatHistory = _i1.createRelationTable(
      relationFieldName: 'matchChatHistory',
      field: MatchChatParticipantState.t.matchChatHistoryId,
      foreignField: _i3.MatchChatHistory.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.MatchChatHistoryTable(tableRelation: foreignTableRelation),
    );
    return _matchChatHistory!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    playerDataId,
    matchChatHistoryId,
    firstSeenAt,
    lastOpenedAt,
    lastReadMessageAt,
    lastTypingAt,
    unreadMessagesCount,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'playerData') {
      return playerData;
    }
    if (relationField == 'matchChatHistory') {
      return matchChatHistory;
    }
    return null;
  }
}

class MatchChatParticipantStateInclude extends _i1.IncludeObject {
  MatchChatParticipantStateInclude._({
    _i2.PlayerDataInclude? playerData,
    _i3.MatchChatHistoryInclude? matchChatHistory,
  }) {
    _playerData = playerData;
    _matchChatHistory = matchChatHistory;
  }

  _i2.PlayerDataInclude? _playerData;

  _i3.MatchChatHistoryInclude? _matchChatHistory;

  @override
  Map<String, _i1.Include?> get includes => {
    'playerData': _playerData,
    'matchChatHistory': _matchChatHistory,
  };

  @override
  _i1.Table<int?> get table => MatchChatParticipantState.t;
}

class MatchChatParticipantStateIncludeList extends _i1.IncludeList {
  MatchChatParticipantStateIncludeList._({
    _i1.WhereExpressionBuilder<MatchChatParticipantStateTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(MatchChatParticipantState.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => MatchChatParticipantState.t;
}

class MatchChatParticipantStateRepository {
  const MatchChatParticipantStateRepository._();

  final attachRow = const MatchChatParticipantStateAttachRowRepository._();

  /// Returns a list of [MatchChatParticipantState]s matching the given query parameters.
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
  Future<List<MatchChatParticipantState>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MatchChatParticipantStateTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MatchChatParticipantStateTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MatchChatParticipantStateTable>? orderByList,
    _i1.Transaction? transaction,
    MatchChatParticipantStateInclude? include,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<MatchChatParticipantState>(
      where: where?.call(MatchChatParticipantState.t),
      orderBy: orderBy?.call(MatchChatParticipantState.t),
      orderByList: orderByList?.call(MatchChatParticipantState.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [MatchChatParticipantState] matching the given query parameters.
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
  Future<MatchChatParticipantState?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MatchChatParticipantStateTable>? where,
    int? offset,
    _i1.OrderByBuilder<MatchChatParticipantStateTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MatchChatParticipantStateTable>? orderByList,
    _i1.Transaction? transaction,
    MatchChatParticipantStateInclude? include,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<MatchChatParticipantState>(
      where: where?.call(MatchChatParticipantState.t),
      orderBy: orderBy?.call(MatchChatParticipantState.t),
      orderByList: orderByList?.call(MatchChatParticipantState.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [MatchChatParticipantState] by its [id] or null if no such row exists.
  Future<MatchChatParticipantState?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    MatchChatParticipantStateInclude? include,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<MatchChatParticipantState>(
      id,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [MatchChatParticipantState]s in the list and returns the inserted rows.
  ///
  /// The returned [MatchChatParticipantState]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<MatchChatParticipantState>> insert(
    _i1.Session session,
    List<MatchChatParticipantState> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<MatchChatParticipantState>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [MatchChatParticipantState] and returns the inserted row.
  ///
  /// The returned [MatchChatParticipantState] will have its `id` field set.
  Future<MatchChatParticipantState> insertRow(
    _i1.Session session,
    MatchChatParticipantState row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<MatchChatParticipantState>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [MatchChatParticipantState]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<MatchChatParticipantState>> update(
    _i1.Session session,
    List<MatchChatParticipantState> rows, {
    _i1.ColumnSelections<MatchChatParticipantStateTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<MatchChatParticipantState>(
      rows,
      columns: columns?.call(MatchChatParticipantState.t),
      transaction: transaction,
    );
  }

  /// Updates a single [MatchChatParticipantState]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<MatchChatParticipantState> updateRow(
    _i1.Session session,
    MatchChatParticipantState row, {
    _i1.ColumnSelections<MatchChatParticipantStateTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<MatchChatParticipantState>(
      row,
      columns: columns?.call(MatchChatParticipantState.t),
      transaction: transaction,
    );
  }

  /// Updates a single [MatchChatParticipantState] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<MatchChatParticipantState?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<MatchChatParticipantStateUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<MatchChatParticipantState>(
      id,
      columnValues: columnValues(MatchChatParticipantState.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [MatchChatParticipantState]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<MatchChatParticipantState>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<MatchChatParticipantStateUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<MatchChatParticipantStateTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MatchChatParticipantStateTable>? orderBy,
    _i1.OrderByListBuilder<MatchChatParticipantStateTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<MatchChatParticipantState>(
      columnValues: columnValues(MatchChatParticipantState.t.updateTable),
      where: where(MatchChatParticipantState.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(MatchChatParticipantState.t),
      orderByList: orderByList?.call(MatchChatParticipantState.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [MatchChatParticipantState]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<MatchChatParticipantState>> delete(
    _i1.Session session,
    List<MatchChatParticipantState> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<MatchChatParticipantState>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [MatchChatParticipantState].
  Future<MatchChatParticipantState> deleteRow(
    _i1.Session session,
    MatchChatParticipantState row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<MatchChatParticipantState>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<MatchChatParticipantState>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<MatchChatParticipantStateTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<MatchChatParticipantState>(
      where: where(MatchChatParticipantState.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MatchChatParticipantStateTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<MatchChatParticipantState>(
      where: where?.call(MatchChatParticipantState.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [MatchChatParticipantState] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<MatchChatParticipantStateTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<MatchChatParticipantState>(
      where: where(MatchChatParticipantState.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}

class MatchChatParticipantStateAttachRowRepository {
  const MatchChatParticipantStateAttachRowRepository._();

  /// Creates a relation between the given [MatchChatParticipantState] and [PlayerData]
  /// by setting the [MatchChatParticipantState]'s foreign key `playerDataId` to refer to the [PlayerData].
  Future<void> playerData(
    _i1.Session session,
    MatchChatParticipantState matchChatParticipantState,
    _i2.PlayerData playerData, {
    _i1.Transaction? transaction,
  }) async {
    if (matchChatParticipantState.id == null) {
      throw ArgumentError.notNull('matchChatParticipantState.id');
    }
    if (playerData.id == null) {
      throw ArgumentError.notNull('playerData.id');
    }

    var $matchChatParticipantState = matchChatParticipantState.copyWith(
      playerDataId: playerData.id,
    );
    await session.db.updateRow<MatchChatParticipantState>(
      $matchChatParticipantState,
      columns: [MatchChatParticipantState.t.playerDataId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [MatchChatParticipantState] and [MatchChatHistory]
  /// by setting the [MatchChatParticipantState]'s foreign key `matchChatHistoryId` to refer to the [MatchChatHistory].
  Future<void> matchChatHistory(
    _i1.Session session,
    MatchChatParticipantState matchChatParticipantState,
    _i3.MatchChatHistory matchChatHistory, {
    _i1.Transaction? transaction,
  }) async {
    if (matchChatParticipantState.id == null) {
      throw ArgumentError.notNull('matchChatParticipantState.id');
    }
    if (matchChatHistory.id == null) {
      throw ArgumentError.notNull('matchChatHistory.id');
    }

    var $matchChatParticipantState = matchChatParticipantState.copyWith(
      matchChatHistoryId: matchChatHistory.id,
    );
    await session.db.updateRow<MatchChatParticipantState>(
      $matchChatParticipantState,
      columns: [MatchChatParticipantState.t.matchChatHistoryId],
      transaction: transaction,
    );
  }
}
