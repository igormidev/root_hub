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
import 'package:root_hub_server/src/generated/protocol.dart' as _i3;

abstract class MatchInPersonProof
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  MatchInPersonProof._({
    this.id,
    required this.matchId,
    this.match,
    required this.groupPhotoUrl,
    required this.boardPhotoUrl,
  });

  factory MatchInPersonProof({
    int? id,
    required int matchId,
    _i2.PlayedMatch? match,
    required String groupPhotoUrl,
    required String boardPhotoUrl,
  }) = _MatchInPersonProofImpl;

  factory MatchInPersonProof.fromJson(Map<String, dynamic> jsonSerialization) {
    return MatchInPersonProof(
      id: jsonSerialization['id'] as int?,
      matchId: jsonSerialization['matchId'] as int,
      match: jsonSerialization['match'] == null
          ? null
          : _i3.Protocol().deserialize<_i2.PlayedMatch>(
              jsonSerialization['match'],
            ),
      groupPhotoUrl: jsonSerialization['groupPhotoUrl'] as String,
      boardPhotoUrl: jsonSerialization['boardPhotoUrl'] as String,
    );
  }

  static final t = MatchInPersonProofTable();

  static const db = MatchInPersonProofRepository._();

  @override
  int? id;

  int matchId;

  _i2.PlayedMatch? match;

  String groupPhotoUrl;

  String boardPhotoUrl;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [MatchInPersonProof]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  MatchInPersonProof copyWith({
    int? id,
    int? matchId,
    _i2.PlayedMatch? match,
    String? groupPhotoUrl,
    String? boardPhotoUrl,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'MatchInPersonProof',
      if (id != null) 'id': id,
      'matchId': matchId,
      if (match != null) 'match': match?.toJson(),
      'groupPhotoUrl': groupPhotoUrl,
      'boardPhotoUrl': boardPhotoUrl,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'MatchInPersonProof',
      if (id != null) 'id': id,
      'matchId': matchId,
      if (match != null) 'match': match?.toJsonForProtocol(),
      'groupPhotoUrl': groupPhotoUrl,
      'boardPhotoUrl': boardPhotoUrl,
    };
  }

  static MatchInPersonProofInclude include({_i2.PlayedMatchInclude? match}) {
    return MatchInPersonProofInclude._(match: match);
  }

  static MatchInPersonProofIncludeList includeList({
    _i1.WhereExpressionBuilder<MatchInPersonProofTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MatchInPersonProofTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MatchInPersonProofTable>? orderByList,
    MatchInPersonProofInclude? include,
  }) {
    return MatchInPersonProofIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(MatchInPersonProof.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(MatchInPersonProof.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MatchInPersonProofImpl extends MatchInPersonProof {
  _MatchInPersonProofImpl({
    int? id,
    required int matchId,
    _i2.PlayedMatch? match,
    required String groupPhotoUrl,
    required String boardPhotoUrl,
  }) : super._(
         id: id,
         matchId: matchId,
         match: match,
         groupPhotoUrl: groupPhotoUrl,
         boardPhotoUrl: boardPhotoUrl,
       );

  /// Returns a shallow copy of this [MatchInPersonProof]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  MatchInPersonProof copyWith({
    Object? id = _Undefined,
    int? matchId,
    Object? match = _Undefined,
    String? groupPhotoUrl,
    String? boardPhotoUrl,
  }) {
    return MatchInPersonProof(
      id: id is int? ? id : this.id,
      matchId: matchId ?? this.matchId,
      match: match is _i2.PlayedMatch? ? match : this.match?.copyWith(),
      groupPhotoUrl: groupPhotoUrl ?? this.groupPhotoUrl,
      boardPhotoUrl: boardPhotoUrl ?? this.boardPhotoUrl,
    );
  }
}

class MatchInPersonProofUpdateTable
    extends _i1.UpdateTable<MatchInPersonProofTable> {
  MatchInPersonProofUpdateTable(super.table);

  _i1.ColumnValue<int, int> matchId(int value) => _i1.ColumnValue(
    table.matchId,
    value,
  );

  _i1.ColumnValue<String, String> groupPhotoUrl(String value) =>
      _i1.ColumnValue(
        table.groupPhotoUrl,
        value,
      );

  _i1.ColumnValue<String, String> boardPhotoUrl(String value) =>
      _i1.ColumnValue(
        table.boardPhotoUrl,
        value,
      );
}

class MatchInPersonProofTable extends _i1.Table<int?> {
  MatchInPersonProofTable({super.tableRelation})
    : super(tableName: 'match_in_person_proof') {
    updateTable = MatchInPersonProofUpdateTable(this);
    matchId = _i1.ColumnInt(
      'matchId',
      this,
    );
    groupPhotoUrl = _i1.ColumnString(
      'groupPhotoUrl',
      this,
    );
    boardPhotoUrl = _i1.ColumnString(
      'boardPhotoUrl',
      this,
    );
  }

  late final MatchInPersonProofUpdateTable updateTable;

  late final _i1.ColumnInt matchId;

  _i2.PlayedMatchTable? _match;

  late final _i1.ColumnString groupPhotoUrl;

  late final _i1.ColumnString boardPhotoUrl;

  _i2.PlayedMatchTable get match {
    if (_match != null) return _match!;
    _match = _i1.createRelationTable(
      relationFieldName: 'match',
      field: MatchInPersonProof.t.matchId,
      foreignField: _i2.PlayedMatch.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.PlayedMatchTable(tableRelation: foreignTableRelation),
    );
    return _match!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    matchId,
    groupPhotoUrl,
    boardPhotoUrl,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'match') {
      return match;
    }
    return null;
  }
}

class MatchInPersonProofInclude extends _i1.IncludeObject {
  MatchInPersonProofInclude._({_i2.PlayedMatchInclude? match}) {
    _match = match;
  }

  _i2.PlayedMatchInclude? _match;

  @override
  Map<String, _i1.Include?> get includes => {'match': _match};

  @override
  _i1.Table<int?> get table => MatchInPersonProof.t;
}

class MatchInPersonProofIncludeList extends _i1.IncludeList {
  MatchInPersonProofIncludeList._({
    _i1.WhereExpressionBuilder<MatchInPersonProofTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(MatchInPersonProof.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => MatchInPersonProof.t;
}

class MatchInPersonProofRepository {
  const MatchInPersonProofRepository._();

  final attachRow = const MatchInPersonProofAttachRowRepository._();

  /// Returns a list of [MatchInPersonProof]s matching the given query parameters.
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
  Future<List<MatchInPersonProof>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MatchInPersonProofTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MatchInPersonProofTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MatchInPersonProofTable>? orderByList,
    _i1.Transaction? transaction,
    MatchInPersonProofInclude? include,
  }) async {
    return session.db.find<MatchInPersonProof>(
      where: where?.call(MatchInPersonProof.t),
      orderBy: orderBy?.call(MatchInPersonProof.t),
      orderByList: orderByList?.call(MatchInPersonProof.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [MatchInPersonProof] matching the given query parameters.
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
  Future<MatchInPersonProof?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MatchInPersonProofTable>? where,
    int? offset,
    _i1.OrderByBuilder<MatchInPersonProofTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MatchInPersonProofTable>? orderByList,
    _i1.Transaction? transaction,
    MatchInPersonProofInclude? include,
  }) async {
    return session.db.findFirstRow<MatchInPersonProof>(
      where: where?.call(MatchInPersonProof.t),
      orderBy: orderBy?.call(MatchInPersonProof.t),
      orderByList: orderByList?.call(MatchInPersonProof.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [MatchInPersonProof] by its [id] or null if no such row exists.
  Future<MatchInPersonProof?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    MatchInPersonProofInclude? include,
  }) async {
    return session.db.findById<MatchInPersonProof>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [MatchInPersonProof]s in the list and returns the inserted rows.
  ///
  /// The returned [MatchInPersonProof]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<MatchInPersonProof>> insert(
    _i1.Session session,
    List<MatchInPersonProof> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<MatchInPersonProof>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [MatchInPersonProof] and returns the inserted row.
  ///
  /// The returned [MatchInPersonProof] will have its `id` field set.
  Future<MatchInPersonProof> insertRow(
    _i1.Session session,
    MatchInPersonProof row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<MatchInPersonProof>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [MatchInPersonProof]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<MatchInPersonProof>> update(
    _i1.Session session,
    List<MatchInPersonProof> rows, {
    _i1.ColumnSelections<MatchInPersonProofTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<MatchInPersonProof>(
      rows,
      columns: columns?.call(MatchInPersonProof.t),
      transaction: transaction,
    );
  }

  /// Updates a single [MatchInPersonProof]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<MatchInPersonProof> updateRow(
    _i1.Session session,
    MatchInPersonProof row, {
    _i1.ColumnSelections<MatchInPersonProofTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<MatchInPersonProof>(
      row,
      columns: columns?.call(MatchInPersonProof.t),
      transaction: transaction,
    );
  }

  /// Updates a single [MatchInPersonProof] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<MatchInPersonProof?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<MatchInPersonProofUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<MatchInPersonProof>(
      id,
      columnValues: columnValues(MatchInPersonProof.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [MatchInPersonProof]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<MatchInPersonProof>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<MatchInPersonProofUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<MatchInPersonProofTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MatchInPersonProofTable>? orderBy,
    _i1.OrderByListBuilder<MatchInPersonProofTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<MatchInPersonProof>(
      columnValues: columnValues(MatchInPersonProof.t.updateTable),
      where: where(MatchInPersonProof.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(MatchInPersonProof.t),
      orderByList: orderByList?.call(MatchInPersonProof.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [MatchInPersonProof]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<MatchInPersonProof>> delete(
    _i1.Session session,
    List<MatchInPersonProof> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<MatchInPersonProof>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [MatchInPersonProof].
  Future<MatchInPersonProof> deleteRow(
    _i1.Session session,
    MatchInPersonProof row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<MatchInPersonProof>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<MatchInPersonProof>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<MatchInPersonProofTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<MatchInPersonProof>(
      where: where(MatchInPersonProof.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MatchInPersonProofTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<MatchInPersonProof>(
      where: where?.call(MatchInPersonProof.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class MatchInPersonProofAttachRowRepository {
  const MatchInPersonProofAttachRowRepository._();

  /// Creates a relation between the given [MatchInPersonProof] and [PlayedMatch]
  /// by setting the [MatchInPersonProof]'s foreign key `matchId` to refer to the [PlayedMatch].
  Future<void> match(
    _i1.Session session,
    MatchInPersonProof matchInPersonProof,
    _i2.PlayedMatch match, {
    _i1.Transaction? transaction,
  }) async {
    if (matchInPersonProof.id == null) {
      throw ArgumentError.notNull('matchInPersonProof.id');
    }
    if (match.id == null) {
      throw ArgumentError.notNull('match.id');
    }

    var $matchInPersonProof = matchInPersonProof.copyWith(matchId: match.id);
    await session.db.updateRow<MatchInPersonProof>(
      $matchInPersonProof,
      columns: [MatchInPersonProof.t.matchId],
      transaction: transaction,
    );
  }
}
