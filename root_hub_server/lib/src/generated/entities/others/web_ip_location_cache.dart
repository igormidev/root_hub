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

abstract class WebIpLocationCache
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  WebIpLocationCache._({
    this.id,
    required this.ipAddress,
    required this.updatedAt,
    this.countryCode,
    this.countryName,
    this.city,
  });

  factory WebIpLocationCache({
    int? id,
    required String ipAddress,
    required DateTime updatedAt,
    String? countryCode,
    String? countryName,
    String? city,
  }) = _WebIpLocationCacheImpl;

  factory WebIpLocationCache.fromJson(Map<String, dynamic> jsonSerialization) {
    return WebIpLocationCache(
      id: jsonSerialization['id'] as int?,
      ipAddress: jsonSerialization['ipAddress'] as String,
      updatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
      countryCode: jsonSerialization['countryCode'] as String?,
      countryName: jsonSerialization['countryName'] as String?,
      city: jsonSerialization['city'] as String?,
    );
  }

  static final t = WebIpLocationCacheTable();

  static const db = WebIpLocationCacheRepository._();

  @override
  int? id;

  String ipAddress;

  DateTime updatedAt;

  String? countryCode;

  String? countryName;

  String? city;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [WebIpLocationCache]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  WebIpLocationCache copyWith({
    int? id,
    String? ipAddress,
    DateTime? updatedAt,
    String? countryCode,
    String? countryName,
    String? city,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'WebIpLocationCache',
      if (id != null) 'id': id,
      'ipAddress': ipAddress,
      'updatedAt': updatedAt.toJson(),
      if (countryCode != null) 'countryCode': countryCode,
      if (countryName != null) 'countryName': countryName,
      if (city != null) 'city': city,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'WebIpLocationCache',
      if (id != null) 'id': id,
      'ipAddress': ipAddress,
      'updatedAt': updatedAt.toJson(),
      if (countryCode != null) 'countryCode': countryCode,
      if (countryName != null) 'countryName': countryName,
      if (city != null) 'city': city,
    };
  }

  static WebIpLocationCacheInclude include() {
    return WebIpLocationCacheInclude._();
  }

  static WebIpLocationCacheIncludeList includeList({
    _i1.WhereExpressionBuilder<WebIpLocationCacheTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<WebIpLocationCacheTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<WebIpLocationCacheTable>? orderByList,
    WebIpLocationCacheInclude? include,
  }) {
    return WebIpLocationCacheIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(WebIpLocationCache.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(WebIpLocationCache.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _WebIpLocationCacheImpl extends WebIpLocationCache {
  _WebIpLocationCacheImpl({
    int? id,
    required String ipAddress,
    required DateTime updatedAt,
    String? countryCode,
    String? countryName,
    String? city,
  }) : super._(
         id: id,
         ipAddress: ipAddress,
         updatedAt: updatedAt,
         countryCode: countryCode,
         countryName: countryName,
         city: city,
       );

  /// Returns a shallow copy of this [WebIpLocationCache]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  WebIpLocationCache copyWith({
    Object? id = _Undefined,
    String? ipAddress,
    DateTime? updatedAt,
    Object? countryCode = _Undefined,
    Object? countryName = _Undefined,
    Object? city = _Undefined,
  }) {
    return WebIpLocationCache(
      id: id is int? ? id : this.id,
      ipAddress: ipAddress ?? this.ipAddress,
      updatedAt: updatedAt ?? this.updatedAt,
      countryCode: countryCode is String? ? countryCode : this.countryCode,
      countryName: countryName is String? ? countryName : this.countryName,
      city: city is String? ? city : this.city,
    );
  }
}

class WebIpLocationCacheUpdateTable
    extends _i1.UpdateTable<WebIpLocationCacheTable> {
  WebIpLocationCacheUpdateTable(super.table);

  _i1.ColumnValue<String, String> ipAddress(String value) => _i1.ColumnValue(
    table.ipAddress,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> updatedAt(DateTime value) =>
      _i1.ColumnValue(
        table.updatedAt,
        value,
      );

  _i1.ColumnValue<String, String> countryCode(String? value) => _i1.ColumnValue(
    table.countryCode,
    value,
  );

  _i1.ColumnValue<String, String> countryName(String? value) => _i1.ColumnValue(
    table.countryName,
    value,
  );

  _i1.ColumnValue<String, String> city(String? value) => _i1.ColumnValue(
    table.city,
    value,
  );
}

class WebIpLocationCacheTable extends _i1.Table<int?> {
  WebIpLocationCacheTable({super.tableRelation})
    : super(tableName: 'web_ip_location_cache') {
    updateTable = WebIpLocationCacheUpdateTable(this);
    ipAddress = _i1.ColumnString(
      'ipAddress',
      this,
    );
    updatedAt = _i1.ColumnDateTime(
      'updatedAt',
      this,
    );
    countryCode = _i1.ColumnString(
      'countryCode',
      this,
    );
    countryName = _i1.ColumnString(
      'countryName',
      this,
    );
    city = _i1.ColumnString(
      'city',
      this,
    );
  }

  late final WebIpLocationCacheUpdateTable updateTable;

  late final _i1.ColumnString ipAddress;

  late final _i1.ColumnDateTime updatedAt;

  late final _i1.ColumnString countryCode;

  late final _i1.ColumnString countryName;

  late final _i1.ColumnString city;

  @override
  List<_i1.Column> get columns => [
    id,
    ipAddress,
    updatedAt,
    countryCode,
    countryName,
    city,
  ];
}

class WebIpLocationCacheInclude extends _i1.IncludeObject {
  WebIpLocationCacheInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => WebIpLocationCache.t;
}

class WebIpLocationCacheIncludeList extends _i1.IncludeList {
  WebIpLocationCacheIncludeList._({
    _i1.WhereExpressionBuilder<WebIpLocationCacheTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(WebIpLocationCache.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => WebIpLocationCache.t;
}

class WebIpLocationCacheRepository {
  const WebIpLocationCacheRepository._();

  /// Returns a list of [WebIpLocationCache]s matching the given query parameters.
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
  Future<List<WebIpLocationCache>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<WebIpLocationCacheTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<WebIpLocationCacheTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<WebIpLocationCacheTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<WebIpLocationCache>(
      where: where?.call(WebIpLocationCache.t),
      orderBy: orderBy?.call(WebIpLocationCache.t),
      orderByList: orderByList?.call(WebIpLocationCache.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [WebIpLocationCache] matching the given query parameters.
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
  Future<WebIpLocationCache?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<WebIpLocationCacheTable>? where,
    int? offset,
    _i1.OrderByBuilder<WebIpLocationCacheTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<WebIpLocationCacheTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<WebIpLocationCache>(
      where: where?.call(WebIpLocationCache.t),
      orderBy: orderBy?.call(WebIpLocationCache.t),
      orderByList: orderByList?.call(WebIpLocationCache.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [WebIpLocationCache] by its [id] or null if no such row exists.
  Future<WebIpLocationCache?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<WebIpLocationCache>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [WebIpLocationCache]s in the list and returns the inserted rows.
  ///
  /// The returned [WebIpLocationCache]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<WebIpLocationCache>> insert(
    _i1.Session session,
    List<WebIpLocationCache> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<WebIpLocationCache>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [WebIpLocationCache] and returns the inserted row.
  ///
  /// The returned [WebIpLocationCache] will have its `id` field set.
  Future<WebIpLocationCache> insertRow(
    _i1.Session session,
    WebIpLocationCache row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<WebIpLocationCache>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [WebIpLocationCache]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<WebIpLocationCache>> update(
    _i1.Session session,
    List<WebIpLocationCache> rows, {
    _i1.ColumnSelections<WebIpLocationCacheTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<WebIpLocationCache>(
      rows,
      columns: columns?.call(WebIpLocationCache.t),
      transaction: transaction,
    );
  }

  /// Updates a single [WebIpLocationCache]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<WebIpLocationCache> updateRow(
    _i1.Session session,
    WebIpLocationCache row, {
    _i1.ColumnSelections<WebIpLocationCacheTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<WebIpLocationCache>(
      row,
      columns: columns?.call(WebIpLocationCache.t),
      transaction: transaction,
    );
  }

  /// Updates a single [WebIpLocationCache] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<WebIpLocationCache?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<WebIpLocationCacheUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<WebIpLocationCache>(
      id,
      columnValues: columnValues(WebIpLocationCache.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [WebIpLocationCache]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<WebIpLocationCache>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<WebIpLocationCacheUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<WebIpLocationCacheTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<WebIpLocationCacheTable>? orderBy,
    _i1.OrderByListBuilder<WebIpLocationCacheTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<WebIpLocationCache>(
      columnValues: columnValues(WebIpLocationCache.t.updateTable),
      where: where(WebIpLocationCache.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(WebIpLocationCache.t),
      orderByList: orderByList?.call(WebIpLocationCache.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [WebIpLocationCache]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<WebIpLocationCache>> delete(
    _i1.Session session,
    List<WebIpLocationCache> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<WebIpLocationCache>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [WebIpLocationCache].
  Future<WebIpLocationCache> deleteRow(
    _i1.Session session,
    WebIpLocationCache row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<WebIpLocationCache>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<WebIpLocationCache>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<WebIpLocationCacheTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<WebIpLocationCache>(
      where: where(WebIpLocationCache.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<WebIpLocationCacheTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<WebIpLocationCache>(
      where: where?.call(WebIpLocationCache.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [WebIpLocationCache] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<WebIpLocationCacheTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<WebIpLocationCache>(
      where: where(WebIpLocationCache.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
