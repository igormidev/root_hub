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
import '../../../entities/match_making/match_schedule.dart' as _i2;
import '../../../entities/match_making/chat/match_chat_message.dart' as _i3;
import 'package:root_hub_server/src/generated/protocol.dart' as _i4;

abstract class MatchChatHistory
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  MatchChatHistory._({
    this.id,
    required this.content,
    required this.matchSchedulePairingAttemptId,
    this.matchSchedulePairingAttempt,
    this.messages,
  });

  factory MatchChatHistory({
    int? id,
    required String content,
    required int matchSchedulePairingAttemptId,
    _i2.MatchSchedulePairingAttempt? matchSchedulePairingAttempt,
    List<_i3.MatchChatMessage>? messages,
  }) = _MatchChatHistoryImpl;

  factory MatchChatHistory.fromJson(Map<String, dynamic> jsonSerialization) {
    return MatchChatHistory(
      id: jsonSerialization['id'] as int?,
      content: jsonSerialization['content'] as String,
      matchSchedulePairingAttemptId:
          jsonSerialization['matchSchedulePairingAttemptId'] as int,
      matchSchedulePairingAttempt:
          jsonSerialization['matchSchedulePairingAttempt'] == null
          ? null
          : _i4.Protocol().deserialize<_i2.MatchSchedulePairingAttempt>(
              jsonSerialization['matchSchedulePairingAttempt'],
            ),
      messages: jsonSerialization['messages'] == null
          ? null
          : _i4.Protocol().deserialize<List<_i3.MatchChatMessage>>(
              jsonSerialization['messages'],
            ),
    );
  }

  static final t = MatchChatHistoryTable();

  static const db = MatchChatHistoryRepository._();

  @override
  int? id;

  String content;

  int matchSchedulePairingAttemptId;

  _i2.MatchSchedulePairingAttempt? matchSchedulePairingAttempt;

  List<_i3.MatchChatMessage>? messages;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [MatchChatHistory]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  MatchChatHistory copyWith({
    int? id,
    String? content,
    int? matchSchedulePairingAttemptId,
    _i2.MatchSchedulePairingAttempt? matchSchedulePairingAttempt,
    List<_i3.MatchChatMessage>? messages,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'MatchChatHistory',
      if (id != null) 'id': id,
      'content': content,
      'matchSchedulePairingAttemptId': matchSchedulePairingAttemptId,
      if (matchSchedulePairingAttempt != null)
        'matchSchedulePairingAttempt': matchSchedulePairingAttempt?.toJson(),
      if (messages != null)
        'messages': messages?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'MatchChatHistory',
      if (id != null) 'id': id,
      'content': content,
      'matchSchedulePairingAttemptId': matchSchedulePairingAttemptId,
      if (matchSchedulePairingAttempt != null)
        'matchSchedulePairingAttempt': matchSchedulePairingAttempt
            ?.toJsonForProtocol(),
      if (messages != null)
        'messages': messages?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  static MatchChatHistoryInclude include({
    _i2.MatchSchedulePairingAttemptInclude? matchSchedulePairingAttempt,
    _i3.MatchChatMessageIncludeList? messages,
  }) {
    return MatchChatHistoryInclude._(
      matchSchedulePairingAttempt: matchSchedulePairingAttempt,
      messages: messages,
    );
  }

  static MatchChatHistoryIncludeList includeList({
    _i1.WhereExpressionBuilder<MatchChatHistoryTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MatchChatHistoryTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MatchChatHistoryTable>? orderByList,
    MatchChatHistoryInclude? include,
  }) {
    return MatchChatHistoryIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(MatchChatHistory.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(MatchChatHistory.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MatchChatHistoryImpl extends MatchChatHistory {
  _MatchChatHistoryImpl({
    int? id,
    required String content,
    required int matchSchedulePairingAttemptId,
    _i2.MatchSchedulePairingAttempt? matchSchedulePairingAttempt,
    List<_i3.MatchChatMessage>? messages,
  }) : super._(
         id: id,
         content: content,
         matchSchedulePairingAttemptId: matchSchedulePairingAttemptId,
         matchSchedulePairingAttempt: matchSchedulePairingAttempt,
         messages: messages,
       );

  /// Returns a shallow copy of this [MatchChatHistory]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  MatchChatHistory copyWith({
    Object? id = _Undefined,
    String? content,
    int? matchSchedulePairingAttemptId,
    Object? matchSchedulePairingAttempt = _Undefined,
    Object? messages = _Undefined,
  }) {
    return MatchChatHistory(
      id: id is int? ? id : this.id,
      content: content ?? this.content,
      matchSchedulePairingAttemptId:
          matchSchedulePairingAttemptId ?? this.matchSchedulePairingAttemptId,
      matchSchedulePairingAttempt:
          matchSchedulePairingAttempt is _i2.MatchSchedulePairingAttempt?
          ? matchSchedulePairingAttempt
          : this.matchSchedulePairingAttempt?.copyWith(),
      messages: messages is List<_i3.MatchChatMessage>?
          ? messages
          : this.messages?.map((e0) => e0.copyWith()).toList(),
    );
  }
}

class MatchChatHistoryUpdateTable
    extends _i1.UpdateTable<MatchChatHistoryTable> {
  MatchChatHistoryUpdateTable(super.table);

  _i1.ColumnValue<String, String> content(String value) => _i1.ColumnValue(
    table.content,
    value,
  );

  _i1.ColumnValue<int, int> matchSchedulePairingAttemptId(int value) =>
      _i1.ColumnValue(
        table.matchSchedulePairingAttemptId,
        value,
      );
}

class MatchChatHistoryTable extends _i1.Table<int?> {
  MatchChatHistoryTable({super.tableRelation})
    : super(tableName: 'match_chat_history') {
    updateTable = MatchChatHistoryUpdateTable(this);
    content = _i1.ColumnString(
      'content',
      this,
    );
    matchSchedulePairingAttemptId = _i1.ColumnInt(
      'matchSchedulePairingAttemptId',
      this,
    );
  }

  late final MatchChatHistoryUpdateTable updateTable;

  late final _i1.ColumnString content;

  late final _i1.ColumnInt matchSchedulePairingAttemptId;

  _i2.MatchSchedulePairingAttemptTable? _matchSchedulePairingAttempt;

  _i3.MatchChatMessageTable? ___messages;

  _i1.ManyRelation<_i3.MatchChatMessageTable>? _messages;

  _i2.MatchSchedulePairingAttemptTable get matchSchedulePairingAttempt {
    if (_matchSchedulePairingAttempt != null)
      return _matchSchedulePairingAttempt!;
    _matchSchedulePairingAttempt = _i1.createRelationTable(
      relationFieldName: 'matchSchedulePairingAttempt',
      field: MatchChatHistory.t.matchSchedulePairingAttemptId,
      foreignField: _i2.MatchSchedulePairingAttempt.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.MatchSchedulePairingAttemptTable(
            tableRelation: foreignTableRelation,
          ),
    );
    return _matchSchedulePairingAttempt!;
  }

  _i3.MatchChatMessageTable get __messages {
    if (___messages != null) return ___messages!;
    ___messages = _i1.createRelationTable(
      relationFieldName: '__messages',
      field: MatchChatHistory.t.id,
      foreignField: _i3.MatchChatMessage.t.matchChatHistoryId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.MatchChatMessageTable(tableRelation: foreignTableRelation),
    );
    return ___messages!;
  }

  _i1.ManyRelation<_i3.MatchChatMessageTable> get messages {
    if (_messages != null) return _messages!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'messages',
      field: MatchChatHistory.t.id,
      foreignField: _i3.MatchChatMessage.t.matchChatHistoryId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.MatchChatMessageTable(tableRelation: foreignTableRelation),
    );
    _messages = _i1.ManyRelation<_i3.MatchChatMessageTable>(
      tableWithRelations: relationTable,
      table: _i3.MatchChatMessageTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _messages!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    content,
    matchSchedulePairingAttemptId,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'matchSchedulePairingAttempt') {
      return matchSchedulePairingAttempt;
    }
    if (relationField == 'messages') {
      return __messages;
    }
    return null;
  }
}

class MatchChatHistoryInclude extends _i1.IncludeObject {
  MatchChatHistoryInclude._({
    _i2.MatchSchedulePairingAttemptInclude? matchSchedulePairingAttempt,
    _i3.MatchChatMessageIncludeList? messages,
  }) {
    _matchSchedulePairingAttempt = matchSchedulePairingAttempt;
    _messages = messages;
  }

  _i2.MatchSchedulePairingAttemptInclude? _matchSchedulePairingAttempt;

  _i3.MatchChatMessageIncludeList? _messages;

  @override
  Map<String, _i1.Include?> get includes => {
    'matchSchedulePairingAttempt': _matchSchedulePairingAttempt,
    'messages': _messages,
  };

  @override
  _i1.Table<int?> get table => MatchChatHistory.t;
}

class MatchChatHistoryIncludeList extends _i1.IncludeList {
  MatchChatHistoryIncludeList._({
    _i1.WhereExpressionBuilder<MatchChatHistoryTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(MatchChatHistory.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => MatchChatHistory.t;
}

class MatchChatHistoryRepository {
  const MatchChatHistoryRepository._();

  final attach = const MatchChatHistoryAttachRepository._();

  final attachRow = const MatchChatHistoryAttachRowRepository._();

  final detach = const MatchChatHistoryDetachRepository._();

  final detachRow = const MatchChatHistoryDetachRowRepository._();

  /// Returns a list of [MatchChatHistory]s matching the given query parameters.
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
  Future<List<MatchChatHistory>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MatchChatHistoryTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MatchChatHistoryTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MatchChatHistoryTable>? orderByList,
    _i1.Transaction? transaction,
    MatchChatHistoryInclude? include,
  }) async {
    return session.db.find<MatchChatHistory>(
      where: where?.call(MatchChatHistory.t),
      orderBy: orderBy?.call(MatchChatHistory.t),
      orderByList: orderByList?.call(MatchChatHistory.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [MatchChatHistory] matching the given query parameters.
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
  Future<MatchChatHistory?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MatchChatHistoryTable>? where,
    int? offset,
    _i1.OrderByBuilder<MatchChatHistoryTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MatchChatHistoryTable>? orderByList,
    _i1.Transaction? transaction,
    MatchChatHistoryInclude? include,
  }) async {
    return session.db.findFirstRow<MatchChatHistory>(
      where: where?.call(MatchChatHistory.t),
      orderBy: orderBy?.call(MatchChatHistory.t),
      orderByList: orderByList?.call(MatchChatHistory.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [MatchChatHistory] by its [id] or null if no such row exists.
  Future<MatchChatHistory?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    MatchChatHistoryInclude? include,
  }) async {
    return session.db.findById<MatchChatHistory>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [MatchChatHistory]s in the list and returns the inserted rows.
  ///
  /// The returned [MatchChatHistory]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<MatchChatHistory>> insert(
    _i1.Session session,
    List<MatchChatHistory> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<MatchChatHistory>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [MatchChatHistory] and returns the inserted row.
  ///
  /// The returned [MatchChatHistory] will have its `id` field set.
  Future<MatchChatHistory> insertRow(
    _i1.Session session,
    MatchChatHistory row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<MatchChatHistory>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [MatchChatHistory]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<MatchChatHistory>> update(
    _i1.Session session,
    List<MatchChatHistory> rows, {
    _i1.ColumnSelections<MatchChatHistoryTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<MatchChatHistory>(
      rows,
      columns: columns?.call(MatchChatHistory.t),
      transaction: transaction,
    );
  }

  /// Updates a single [MatchChatHistory]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<MatchChatHistory> updateRow(
    _i1.Session session,
    MatchChatHistory row, {
    _i1.ColumnSelections<MatchChatHistoryTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<MatchChatHistory>(
      row,
      columns: columns?.call(MatchChatHistory.t),
      transaction: transaction,
    );
  }

  /// Updates a single [MatchChatHistory] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<MatchChatHistory?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<MatchChatHistoryUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<MatchChatHistory>(
      id,
      columnValues: columnValues(MatchChatHistory.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [MatchChatHistory]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<MatchChatHistory>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<MatchChatHistoryUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<MatchChatHistoryTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MatchChatHistoryTable>? orderBy,
    _i1.OrderByListBuilder<MatchChatHistoryTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<MatchChatHistory>(
      columnValues: columnValues(MatchChatHistory.t.updateTable),
      where: where(MatchChatHistory.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(MatchChatHistory.t),
      orderByList: orderByList?.call(MatchChatHistory.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [MatchChatHistory]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<MatchChatHistory>> delete(
    _i1.Session session,
    List<MatchChatHistory> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<MatchChatHistory>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [MatchChatHistory].
  Future<MatchChatHistory> deleteRow(
    _i1.Session session,
    MatchChatHistory row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<MatchChatHistory>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<MatchChatHistory>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<MatchChatHistoryTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<MatchChatHistory>(
      where: where(MatchChatHistory.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MatchChatHistoryTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<MatchChatHistory>(
      where: where?.call(MatchChatHistory.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class MatchChatHistoryAttachRepository {
  const MatchChatHistoryAttachRepository._();

  /// Creates a relation between this [MatchChatHistory] and the given [MatchChatMessage]s
  /// by setting each [MatchChatMessage]'s foreign key `matchChatHistoryId` to refer to this [MatchChatHistory].
  Future<void> messages(
    _i1.Session session,
    MatchChatHistory matchChatHistory,
    List<_i3.MatchChatMessage> matchChatMessage, {
    _i1.Transaction? transaction,
  }) async {
    if (matchChatMessage.any((e) => e.id == null)) {
      throw ArgumentError.notNull('matchChatMessage.id');
    }
    if (matchChatHistory.id == null) {
      throw ArgumentError.notNull('matchChatHistory.id');
    }

    var $matchChatMessage = matchChatMessage
        .map((e) => e.copyWith(matchChatHistoryId: matchChatHistory.id))
        .toList();
    await session.db.update<_i3.MatchChatMessage>(
      $matchChatMessage,
      columns: [_i3.MatchChatMessage.t.matchChatHistoryId],
      transaction: transaction,
    );
  }
}

class MatchChatHistoryAttachRowRepository {
  const MatchChatHistoryAttachRowRepository._();

  /// Creates a relation between the given [MatchChatHistory] and [MatchSchedulePairingAttempt]
  /// by setting the [MatchChatHistory]'s foreign key `matchSchedulePairingAttemptId` to refer to the [MatchSchedulePairingAttempt].
  Future<void> matchSchedulePairingAttempt(
    _i1.Session session,
    MatchChatHistory matchChatHistory,
    _i2.MatchSchedulePairingAttempt matchSchedulePairingAttempt, {
    _i1.Transaction? transaction,
  }) async {
    if (matchChatHistory.id == null) {
      throw ArgumentError.notNull('matchChatHistory.id');
    }
    if (matchSchedulePairingAttempt.id == null) {
      throw ArgumentError.notNull('matchSchedulePairingAttempt.id');
    }

    var $matchChatHistory = matchChatHistory.copyWith(
      matchSchedulePairingAttemptId: matchSchedulePairingAttempt.id,
    );
    await session.db.updateRow<MatchChatHistory>(
      $matchChatHistory,
      columns: [MatchChatHistory.t.matchSchedulePairingAttemptId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [MatchChatHistory] and the given [MatchChatMessage]
  /// by setting the [MatchChatMessage]'s foreign key `matchChatHistoryId` to refer to this [MatchChatHistory].
  Future<void> messages(
    _i1.Session session,
    MatchChatHistory matchChatHistory,
    _i3.MatchChatMessage matchChatMessage, {
    _i1.Transaction? transaction,
  }) async {
    if (matchChatMessage.id == null) {
      throw ArgumentError.notNull('matchChatMessage.id');
    }
    if (matchChatHistory.id == null) {
      throw ArgumentError.notNull('matchChatHistory.id');
    }

    var $matchChatMessage = matchChatMessage.copyWith(
      matchChatHistoryId: matchChatHistory.id,
    );
    await session.db.updateRow<_i3.MatchChatMessage>(
      $matchChatMessage,
      columns: [_i3.MatchChatMessage.t.matchChatHistoryId],
      transaction: transaction,
    );
  }
}

class MatchChatHistoryDetachRepository {
  const MatchChatHistoryDetachRepository._();

  /// Detaches the relation between this [MatchChatHistory] and the given [MatchChatMessage]
  /// by setting the [MatchChatMessage]'s foreign key `matchChatHistoryId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> messages(
    _i1.Session session,
    List<_i3.MatchChatMessage> matchChatMessage, {
    _i1.Transaction? transaction,
  }) async {
    if (matchChatMessage.any((e) => e.id == null)) {
      throw ArgumentError.notNull('matchChatMessage.id');
    }

    var $matchChatMessage = matchChatMessage
        .map((e) => e.copyWith(matchChatHistoryId: null))
        .toList();
    await session.db.update<_i3.MatchChatMessage>(
      $matchChatMessage,
      columns: [_i3.MatchChatMessage.t.matchChatHistoryId],
      transaction: transaction,
    );
  }
}

class MatchChatHistoryDetachRowRepository {
  const MatchChatHistoryDetachRowRepository._();

  /// Detaches the relation between this [MatchChatHistory] and the given [MatchChatMessage]
  /// by setting the [MatchChatMessage]'s foreign key `matchChatHistoryId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> messages(
    _i1.Session session,
    _i3.MatchChatMessage matchChatMessage, {
    _i1.Transaction? transaction,
  }) async {
    if (matchChatMessage.id == null) {
      throw ArgumentError.notNull('matchChatMessage.id');
    }

    var $matchChatMessage = matchChatMessage.copyWith(matchChatHistoryId: null);
    await session.db.updateRow<_i3.MatchChatMessage>(
      $matchChatMessage,
      columns: [_i3.MatchChatMessage.t.matchChatHistoryId],
      transaction: transaction,
    );
  }
}
