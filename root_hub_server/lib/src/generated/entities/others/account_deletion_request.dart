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
import 'package:serverpod/serverpod.dart' as _i1;

abstract class AccountDeletionRequest
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  AccountDeletionRequest._({
    this.id,
    required this.createdAt,
    required this.email,
    this.notificationTargetEmail,
    this.notificationAttemptedAt,
    this.notificationSentAt,
  });

  factory AccountDeletionRequest({
    int? id,
    required DateTime createdAt,
    required String email,
    String? notificationTargetEmail,
    DateTime? notificationAttemptedAt,
    DateTime? notificationSentAt,
  }) = _AccountDeletionRequestImpl;

  factory AccountDeletionRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return AccountDeletionRequest(
      id: jsonSerialization['id'] as int?,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      email: jsonSerialization['email'] as String,
      notificationTargetEmail:
          jsonSerialization['notificationTargetEmail'] as String?,
      notificationAttemptedAt:
          jsonSerialization['notificationAttemptedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['notificationAttemptedAt'],
            ),
      notificationSentAt: jsonSerialization['notificationSentAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['notificationSentAt'],
            ),
    );
  }

  static final t = AccountDeletionRequestTable();

  static const db = AccountDeletionRequestRepository._();

  @override
  int? id;

  DateTime createdAt;

  String email;

  String? notificationTargetEmail;

  DateTime? notificationAttemptedAt;

  DateTime? notificationSentAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [AccountDeletionRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  AccountDeletionRequest copyWith({
    int? id,
    DateTime? createdAt,
    String? email,
    String? notificationTargetEmail,
    DateTime? notificationAttemptedAt,
    DateTime? notificationSentAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AccountDeletionRequest',
      if (id != null) 'id': id,
      'createdAt': createdAt.toJson(),
      'email': email,
      if (notificationTargetEmail != null)
        'notificationTargetEmail': notificationTargetEmail,
      if (notificationAttemptedAt != null)
        'notificationAttemptedAt': notificationAttemptedAt?.toJson(),
      if (notificationSentAt != null)
        'notificationSentAt': notificationSentAt?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'AccountDeletionRequest',
      if (id != null) 'id': id,
      'createdAt': createdAt.toJson(),
      'email': email,
      if (notificationTargetEmail != null)
        'notificationTargetEmail': notificationTargetEmail,
      if (notificationAttemptedAt != null)
        'notificationAttemptedAt': notificationAttemptedAt?.toJson(),
      if (notificationSentAt != null)
        'notificationSentAt': notificationSentAt?.toJson(),
    };
  }

  static AccountDeletionRequestInclude include() {
    return AccountDeletionRequestInclude._();
  }

  static AccountDeletionRequestIncludeList includeList({
    _i1.WhereExpressionBuilder<AccountDeletionRequestTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AccountDeletionRequestTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AccountDeletionRequestTable>? orderByList,
    AccountDeletionRequestInclude? include,
  }) {
    return AccountDeletionRequestIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(AccountDeletionRequest.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(AccountDeletionRequest.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AccountDeletionRequestImpl extends AccountDeletionRequest {
  _AccountDeletionRequestImpl({
    int? id,
    required DateTime createdAt,
    required String email,
    String? notificationTargetEmail,
    DateTime? notificationAttemptedAt,
    DateTime? notificationSentAt,
  }) : super._(
         id: id,
         createdAt: createdAt,
         email: email,
         notificationTargetEmail: notificationTargetEmail,
         notificationAttemptedAt: notificationAttemptedAt,
         notificationSentAt: notificationSentAt,
       );

  /// Returns a shallow copy of this [AccountDeletionRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  AccountDeletionRequest copyWith({
    Object? id = _Undefined,
    DateTime? createdAt,
    String? email,
    Object? notificationTargetEmail = _Undefined,
    Object? notificationAttemptedAt = _Undefined,
    Object? notificationSentAt = _Undefined,
  }) {
    return AccountDeletionRequest(
      id: id is int? ? id : this.id,
      createdAt: createdAt ?? this.createdAt,
      email: email ?? this.email,
      notificationTargetEmail: notificationTargetEmail is String?
          ? notificationTargetEmail
          : this.notificationTargetEmail,
      notificationAttemptedAt: notificationAttemptedAt is DateTime?
          ? notificationAttemptedAt
          : this.notificationAttemptedAt,
      notificationSentAt: notificationSentAt is DateTime?
          ? notificationSentAt
          : this.notificationSentAt,
    );
  }
}

class AccountDeletionRequestUpdateTable
    extends _i1.UpdateTable<AccountDeletionRequestTable> {
  AccountDeletionRequestUpdateTable(super.table);

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );

  _i1.ColumnValue<String, String> email(String value) => _i1.ColumnValue(
    table.email,
    value,
  );

  _i1.ColumnValue<String, String> notificationTargetEmail(String? value) =>
      _i1.ColumnValue(
        table.notificationTargetEmail,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> notificationAttemptedAt(
    DateTime? value,
  ) => _i1.ColumnValue(
    table.notificationAttemptedAt,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> notificationSentAt(DateTime? value) =>
      _i1.ColumnValue(
        table.notificationSentAt,
        value,
      );
}

class AccountDeletionRequestTable extends _i1.Table<int?> {
  AccountDeletionRequestTable({super.tableRelation})
    : super(tableName: 'account_deletion_request') {
    updateTable = AccountDeletionRequestUpdateTable(this);
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
    email = _i1.ColumnString(
      'email',
      this,
    );
    notificationTargetEmail = _i1.ColumnString(
      'notificationTargetEmail',
      this,
    );
    notificationAttemptedAt = _i1.ColumnDateTime(
      'notificationAttemptedAt',
      this,
    );
    notificationSentAt = _i1.ColumnDateTime(
      'notificationSentAt',
      this,
    );
  }

  late final AccountDeletionRequestUpdateTable updateTable;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnString email;

  late final _i1.ColumnString notificationTargetEmail;

  late final _i1.ColumnDateTime notificationAttemptedAt;

  late final _i1.ColumnDateTime notificationSentAt;

  @override
  List<_i1.Column> get columns => [
    id,
    createdAt,
    email,
    notificationTargetEmail,
    notificationAttemptedAt,
    notificationSentAt,
  ];
}

class AccountDeletionRequestInclude extends _i1.IncludeObject {
  AccountDeletionRequestInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => AccountDeletionRequest.t;
}

class AccountDeletionRequestIncludeList extends _i1.IncludeList {
  AccountDeletionRequestIncludeList._({
    _i1.WhereExpressionBuilder<AccountDeletionRequestTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(AccountDeletionRequest.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => AccountDeletionRequest.t;
}

class AccountDeletionRequestRepository {
  const AccountDeletionRequestRepository._();

  /// Returns a list of [AccountDeletionRequest]s matching the given query parameters.
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
  Future<List<AccountDeletionRequest>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AccountDeletionRequestTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AccountDeletionRequestTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AccountDeletionRequestTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<AccountDeletionRequest>(
      where: where?.call(AccountDeletionRequest.t),
      orderBy: orderBy?.call(AccountDeletionRequest.t),
      orderByList: orderByList?.call(AccountDeletionRequest.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [AccountDeletionRequest] matching the given query parameters.
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
  Future<AccountDeletionRequest?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AccountDeletionRequestTable>? where,
    int? offset,
    _i1.OrderByBuilder<AccountDeletionRequestTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AccountDeletionRequestTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<AccountDeletionRequest>(
      where: where?.call(AccountDeletionRequest.t),
      orderBy: orderBy?.call(AccountDeletionRequest.t),
      orderByList: orderByList?.call(AccountDeletionRequest.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [AccountDeletionRequest] by its [id] or null if no such row exists.
  Future<AccountDeletionRequest?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<AccountDeletionRequest>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [AccountDeletionRequest]s in the list and returns the inserted rows.
  ///
  /// The returned [AccountDeletionRequest]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<AccountDeletionRequest>> insert(
    _i1.Session session,
    List<AccountDeletionRequest> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<AccountDeletionRequest>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [AccountDeletionRequest] and returns the inserted row.
  ///
  /// The returned [AccountDeletionRequest] will have its `id` field set.
  Future<AccountDeletionRequest> insertRow(
    _i1.Session session,
    AccountDeletionRequest row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<AccountDeletionRequest>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [AccountDeletionRequest]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<AccountDeletionRequest>> update(
    _i1.Session session,
    List<AccountDeletionRequest> rows, {
    _i1.ColumnSelections<AccountDeletionRequestTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<AccountDeletionRequest>(
      rows,
      columns: columns?.call(AccountDeletionRequest.t),
      transaction: transaction,
    );
  }

  /// Updates a single [AccountDeletionRequest]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<AccountDeletionRequest> updateRow(
    _i1.Session session,
    AccountDeletionRequest row, {
    _i1.ColumnSelections<AccountDeletionRequestTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<AccountDeletionRequest>(
      row,
      columns: columns?.call(AccountDeletionRequest.t),
      transaction: transaction,
    );
  }

  /// Updates a single [AccountDeletionRequest] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<AccountDeletionRequest?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<AccountDeletionRequestUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<AccountDeletionRequest>(
      id,
      columnValues: columnValues(AccountDeletionRequest.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [AccountDeletionRequest]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<AccountDeletionRequest>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<AccountDeletionRequestUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<AccountDeletionRequestTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AccountDeletionRequestTable>? orderBy,
    _i1.OrderByListBuilder<AccountDeletionRequestTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<AccountDeletionRequest>(
      columnValues: columnValues(AccountDeletionRequest.t.updateTable),
      where: where(AccountDeletionRequest.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(AccountDeletionRequest.t),
      orderByList: orderByList?.call(AccountDeletionRequest.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [AccountDeletionRequest]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<AccountDeletionRequest>> delete(
    _i1.Session session,
    List<AccountDeletionRequest> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<AccountDeletionRequest>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [AccountDeletionRequest].
  Future<AccountDeletionRequest> deleteRow(
    _i1.Session session,
    AccountDeletionRequest row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<AccountDeletionRequest>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<AccountDeletionRequest>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<AccountDeletionRequestTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<AccountDeletionRequest>(
      where: where(AccountDeletionRequest.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AccountDeletionRequestTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<AccountDeletionRequest>(
      where: where?.call(AccountDeletionRequest.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [AccountDeletionRequest] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<AccountDeletionRequestTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<AccountDeletionRequest>(
      where: where(AccountDeletionRequest.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
