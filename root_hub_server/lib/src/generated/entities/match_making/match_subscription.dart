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
import '../../entities/match_making/match_schedule.dart' as _i2;
import '../../entities/core/player_data.dart' as _i3;
import 'package:root_hub_server/src/generated/protocol.dart' as _i4;

abstract class MatchSubscription
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  MatchSubscription._({
    this.id,
    required this.subscribedAt,
    required this.matchSchedulePairingAttemptId,
    this.matchSchedulePairingAttempt,
    required this.playerDataId,
    this.playerData,
  });

  factory MatchSubscription({
    int? id,
    required DateTime subscribedAt,
    required int matchSchedulePairingAttemptId,
    _i2.MatchSchedulePairingAttempt? matchSchedulePairingAttempt,
    required int playerDataId,
    _i3.PlayerData? playerData,
  }) = _MatchSubscriptionImpl;

  factory MatchSubscription.fromJson(Map<String, dynamic> jsonSerialization) {
    return MatchSubscription(
      id: jsonSerialization['id'] as int?,
      subscribedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['subscribedAt'],
      ),
      matchSchedulePairingAttemptId:
          jsonSerialization['matchSchedulePairingAttemptId'] as int,
      matchSchedulePairingAttempt:
          jsonSerialization['matchSchedulePairingAttempt'] == null
          ? null
          : _i4.Protocol().deserialize<_i2.MatchSchedulePairingAttempt>(
              jsonSerialization['matchSchedulePairingAttempt'],
            ),
      playerDataId: jsonSerialization['playerDataId'] as int,
      playerData: jsonSerialization['playerData'] == null
          ? null
          : _i4.Protocol().deserialize<_i3.PlayerData>(
              jsonSerialization['playerData'],
            ),
    );
  }

  static final t = MatchSubscriptionTable();

  static const db = MatchSubscriptionRepository._();

  @override
  int? id;

  DateTime subscribedAt;

  int matchSchedulePairingAttemptId;

  _i2.MatchSchedulePairingAttempt? matchSchedulePairingAttempt;

  int playerDataId;

  _i3.PlayerData? playerData;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [MatchSubscription]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  MatchSubscription copyWith({
    int? id,
    DateTime? subscribedAt,
    int? matchSchedulePairingAttemptId,
    _i2.MatchSchedulePairingAttempt? matchSchedulePairingAttempt,
    int? playerDataId,
    _i3.PlayerData? playerData,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'MatchSubscription',
      if (id != null) 'id': id,
      'subscribedAt': subscribedAt.toJson(),
      'matchSchedulePairingAttemptId': matchSchedulePairingAttemptId,
      if (matchSchedulePairingAttempt != null)
        'matchSchedulePairingAttempt': matchSchedulePairingAttempt?.toJson(),
      'playerDataId': playerDataId,
      if (playerData != null) 'playerData': playerData?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'MatchSubscription',
      if (id != null) 'id': id,
      'subscribedAt': subscribedAt.toJson(),
      'matchSchedulePairingAttemptId': matchSchedulePairingAttemptId,
      if (matchSchedulePairingAttempt != null)
        'matchSchedulePairingAttempt': matchSchedulePairingAttempt
            ?.toJsonForProtocol(),
      'playerDataId': playerDataId,
      if (playerData != null) 'playerData': playerData?.toJsonForProtocol(),
    };
  }

  static MatchSubscriptionInclude include({
    _i2.MatchSchedulePairingAttemptInclude? matchSchedulePairingAttempt,
    _i3.PlayerDataInclude? playerData,
  }) {
    return MatchSubscriptionInclude._(
      matchSchedulePairingAttempt: matchSchedulePairingAttempt,
      playerData: playerData,
    );
  }

  static MatchSubscriptionIncludeList includeList({
    _i1.WhereExpressionBuilder<MatchSubscriptionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MatchSubscriptionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MatchSubscriptionTable>? orderByList,
    MatchSubscriptionInclude? include,
  }) {
    return MatchSubscriptionIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(MatchSubscription.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(MatchSubscription.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MatchSubscriptionImpl extends MatchSubscription {
  _MatchSubscriptionImpl({
    int? id,
    required DateTime subscribedAt,
    required int matchSchedulePairingAttemptId,
    _i2.MatchSchedulePairingAttempt? matchSchedulePairingAttempt,
    required int playerDataId,
    _i3.PlayerData? playerData,
  }) : super._(
         id: id,
         subscribedAt: subscribedAt,
         matchSchedulePairingAttemptId: matchSchedulePairingAttemptId,
         matchSchedulePairingAttempt: matchSchedulePairingAttempt,
         playerDataId: playerDataId,
         playerData: playerData,
       );

  /// Returns a shallow copy of this [MatchSubscription]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  MatchSubscription copyWith({
    Object? id = _Undefined,
    DateTime? subscribedAt,
    int? matchSchedulePairingAttemptId,
    Object? matchSchedulePairingAttempt = _Undefined,
    int? playerDataId,
    Object? playerData = _Undefined,
  }) {
    return MatchSubscription(
      id: id is int? ? id : this.id,
      subscribedAt: subscribedAt ?? this.subscribedAt,
      matchSchedulePairingAttemptId:
          matchSchedulePairingAttemptId ?? this.matchSchedulePairingAttemptId,
      matchSchedulePairingAttempt:
          matchSchedulePairingAttempt is _i2.MatchSchedulePairingAttempt?
          ? matchSchedulePairingAttempt
          : this.matchSchedulePairingAttempt?.copyWith(),
      playerDataId: playerDataId ?? this.playerDataId,
      playerData: playerData is _i3.PlayerData?
          ? playerData
          : this.playerData?.copyWith(),
    );
  }
}

class MatchSubscriptionUpdateTable
    extends _i1.UpdateTable<MatchSubscriptionTable> {
  MatchSubscriptionUpdateTable(super.table);

  _i1.ColumnValue<DateTime, DateTime> subscribedAt(DateTime value) =>
      _i1.ColumnValue(
        table.subscribedAt,
        value,
      );

  _i1.ColumnValue<int, int> matchSchedulePairingAttemptId(int value) =>
      _i1.ColumnValue(
        table.matchSchedulePairingAttemptId,
        value,
      );

  _i1.ColumnValue<int, int> playerDataId(int value) => _i1.ColumnValue(
    table.playerDataId,
    value,
  );
}

class MatchSubscriptionTable extends _i1.Table<int?> {
  MatchSubscriptionTable({super.tableRelation})
    : super(tableName: 'match_subscriptions') {
    updateTable = MatchSubscriptionUpdateTable(this);
    subscribedAt = _i1.ColumnDateTime(
      'subscribedAt',
      this,
    );
    matchSchedulePairingAttemptId = _i1.ColumnInt(
      'matchSchedulePairingAttemptId',
      this,
    );
    playerDataId = _i1.ColumnInt(
      'playerDataId',
      this,
    );
  }

  late final MatchSubscriptionUpdateTable updateTable;

  late final _i1.ColumnDateTime subscribedAt;

  late final _i1.ColumnInt matchSchedulePairingAttemptId;

  _i2.MatchSchedulePairingAttemptTable? _matchSchedulePairingAttempt;

  late final _i1.ColumnInt playerDataId;

  _i3.PlayerDataTable? _playerData;

  _i2.MatchSchedulePairingAttemptTable get matchSchedulePairingAttempt {
    if (_matchSchedulePairingAttempt != null)
      return _matchSchedulePairingAttempt!;
    _matchSchedulePairingAttempt = _i1.createRelationTable(
      relationFieldName: 'matchSchedulePairingAttempt',
      field: MatchSubscription.t.matchSchedulePairingAttemptId,
      foreignField: _i2.MatchSchedulePairingAttempt.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.MatchSchedulePairingAttemptTable(
            tableRelation: foreignTableRelation,
          ),
    );
    return _matchSchedulePairingAttempt!;
  }

  _i3.PlayerDataTable get playerData {
    if (_playerData != null) return _playerData!;
    _playerData = _i1.createRelationTable(
      relationFieldName: 'playerData',
      field: MatchSubscription.t.playerDataId,
      foreignField: _i3.PlayerData.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.PlayerDataTable(tableRelation: foreignTableRelation),
    );
    return _playerData!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    subscribedAt,
    matchSchedulePairingAttemptId,
    playerDataId,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'matchSchedulePairingAttempt') {
      return matchSchedulePairingAttempt;
    }
    if (relationField == 'playerData') {
      return playerData;
    }
    return null;
  }
}

class MatchSubscriptionInclude extends _i1.IncludeObject {
  MatchSubscriptionInclude._({
    _i2.MatchSchedulePairingAttemptInclude? matchSchedulePairingAttempt,
    _i3.PlayerDataInclude? playerData,
  }) {
    _matchSchedulePairingAttempt = matchSchedulePairingAttempt;
    _playerData = playerData;
  }

  _i2.MatchSchedulePairingAttemptInclude? _matchSchedulePairingAttempt;

  _i3.PlayerDataInclude? _playerData;

  @override
  Map<String, _i1.Include?> get includes => {
    'matchSchedulePairingAttempt': _matchSchedulePairingAttempt,
    'playerData': _playerData,
  };

  @override
  _i1.Table<int?> get table => MatchSubscription.t;
}

class MatchSubscriptionIncludeList extends _i1.IncludeList {
  MatchSubscriptionIncludeList._({
    _i1.WhereExpressionBuilder<MatchSubscriptionTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(MatchSubscription.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => MatchSubscription.t;
}

class MatchSubscriptionRepository {
  const MatchSubscriptionRepository._();

  final attachRow = const MatchSubscriptionAttachRowRepository._();

  /// Returns a list of [MatchSubscription]s matching the given query parameters.
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
  Future<List<MatchSubscription>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MatchSubscriptionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MatchSubscriptionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MatchSubscriptionTable>? orderByList,
    _i1.Transaction? transaction,
    MatchSubscriptionInclude? include,
  }) async {
    return session.db.find<MatchSubscription>(
      where: where?.call(MatchSubscription.t),
      orderBy: orderBy?.call(MatchSubscription.t),
      orderByList: orderByList?.call(MatchSubscription.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [MatchSubscription] matching the given query parameters.
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
  Future<MatchSubscription?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MatchSubscriptionTable>? where,
    int? offset,
    _i1.OrderByBuilder<MatchSubscriptionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MatchSubscriptionTable>? orderByList,
    _i1.Transaction? transaction,
    MatchSubscriptionInclude? include,
  }) async {
    return session.db.findFirstRow<MatchSubscription>(
      where: where?.call(MatchSubscription.t),
      orderBy: orderBy?.call(MatchSubscription.t),
      orderByList: orderByList?.call(MatchSubscription.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [MatchSubscription] by its [id] or null if no such row exists.
  Future<MatchSubscription?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    MatchSubscriptionInclude? include,
  }) async {
    return session.db.findById<MatchSubscription>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [MatchSubscription]s in the list and returns the inserted rows.
  ///
  /// The returned [MatchSubscription]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<MatchSubscription>> insert(
    _i1.Session session,
    List<MatchSubscription> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<MatchSubscription>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [MatchSubscription] and returns the inserted row.
  ///
  /// The returned [MatchSubscription] will have its `id` field set.
  Future<MatchSubscription> insertRow(
    _i1.Session session,
    MatchSubscription row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<MatchSubscription>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [MatchSubscription]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<MatchSubscription>> update(
    _i1.Session session,
    List<MatchSubscription> rows, {
    _i1.ColumnSelections<MatchSubscriptionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<MatchSubscription>(
      rows,
      columns: columns?.call(MatchSubscription.t),
      transaction: transaction,
    );
  }

  /// Updates a single [MatchSubscription]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<MatchSubscription> updateRow(
    _i1.Session session,
    MatchSubscription row, {
    _i1.ColumnSelections<MatchSubscriptionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<MatchSubscription>(
      row,
      columns: columns?.call(MatchSubscription.t),
      transaction: transaction,
    );
  }

  /// Updates a single [MatchSubscription] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<MatchSubscription?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<MatchSubscriptionUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<MatchSubscription>(
      id,
      columnValues: columnValues(MatchSubscription.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [MatchSubscription]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<MatchSubscription>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<MatchSubscriptionUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<MatchSubscriptionTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MatchSubscriptionTable>? orderBy,
    _i1.OrderByListBuilder<MatchSubscriptionTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<MatchSubscription>(
      columnValues: columnValues(MatchSubscription.t.updateTable),
      where: where(MatchSubscription.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(MatchSubscription.t),
      orderByList: orderByList?.call(MatchSubscription.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [MatchSubscription]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<MatchSubscription>> delete(
    _i1.Session session,
    List<MatchSubscription> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<MatchSubscription>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [MatchSubscription].
  Future<MatchSubscription> deleteRow(
    _i1.Session session,
    MatchSubscription row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<MatchSubscription>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<MatchSubscription>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<MatchSubscriptionTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<MatchSubscription>(
      where: where(MatchSubscription.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MatchSubscriptionTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<MatchSubscription>(
      where: where?.call(MatchSubscription.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class MatchSubscriptionAttachRowRepository {
  const MatchSubscriptionAttachRowRepository._();

  /// Creates a relation between the given [MatchSubscription] and [MatchSchedulePairingAttempt]
  /// by setting the [MatchSubscription]'s foreign key `matchSchedulePairingAttemptId` to refer to the [MatchSchedulePairingAttempt].
  Future<void> matchSchedulePairingAttempt(
    _i1.Session session,
    MatchSubscription matchSubscription,
    _i2.MatchSchedulePairingAttempt matchSchedulePairingAttempt, {
    _i1.Transaction? transaction,
  }) async {
    if (matchSubscription.id == null) {
      throw ArgumentError.notNull('matchSubscription.id');
    }
    if (matchSchedulePairingAttempt.id == null) {
      throw ArgumentError.notNull('matchSchedulePairingAttempt.id');
    }

    var $matchSubscription = matchSubscription.copyWith(
      matchSchedulePairingAttemptId: matchSchedulePairingAttempt.id,
    );
    await session.db.updateRow<MatchSubscription>(
      $matchSubscription,
      columns: [MatchSubscription.t.matchSchedulePairingAttemptId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [MatchSubscription] and [PlayerData]
  /// by setting the [MatchSubscription]'s foreign key `playerDataId` to refer to the [PlayerData].
  Future<void> playerData(
    _i1.Session session,
    MatchSubscription matchSubscription,
    _i3.PlayerData playerData, {
    _i1.Transaction? transaction,
  }) async {
    if (matchSubscription.id == null) {
      throw ArgumentError.notNull('matchSubscription.id');
    }
    if (playerData.id == null) {
      throw ArgumentError.notNull('playerData.id');
    }

    var $matchSubscription = matchSubscription.copyWith(
      playerDataId: playerData.id,
    );
    await session.db.updateRow<MatchSubscription>(
      $matchSubscription,
      columns: [MatchSubscription.t.playerDataId],
      transaction: transaction,
    );
  }
}
