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
import '../../entities/others/web_analytics_device_type.dart' as _i2;

abstract class WebAnalyticsClick
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  WebAnalyticsClick._({
    this.id,
    required this.createdAt,
    required this.requestPath,
    this.requestQuery,
    this.matchId,
    this.ipAddress,
    this.countryCode,
    this.countryName,
    this.city,
    required this.deviceType,
    this.osName,
    this.browserName,
    this.userAgent,
  });

  factory WebAnalyticsClick({
    int? id,
    required DateTime createdAt,
    required String requestPath,
    String? requestQuery,
    int? matchId,
    String? ipAddress,
    String? countryCode,
    String? countryName,
    String? city,
    required _i2.WebAnalyticsDeviceType deviceType,
    String? osName,
    String? browserName,
    String? userAgent,
  }) = _WebAnalyticsClickImpl;

  factory WebAnalyticsClick.fromJson(Map<String, dynamic> jsonSerialization) {
    return WebAnalyticsClick(
      id: jsonSerialization['id'] as int?,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      requestPath: jsonSerialization['requestPath'] as String,
      requestQuery: jsonSerialization['requestQuery'] as String?,
      matchId: jsonSerialization['matchId'] as int?,
      ipAddress: jsonSerialization['ipAddress'] as String?,
      countryCode: jsonSerialization['countryCode'] as String?,
      countryName: jsonSerialization['countryName'] as String?,
      city: jsonSerialization['city'] as String?,
      deviceType: _i2.WebAnalyticsDeviceType.fromJson(
        (jsonSerialization['deviceType'] as String),
      ),
      osName: jsonSerialization['osName'] as String?,
      browserName: jsonSerialization['browserName'] as String?,
      userAgent: jsonSerialization['userAgent'] as String?,
    );
  }

  static final t = WebAnalyticsClickTable();

  static const db = WebAnalyticsClickRepository._();

  @override
  int? id;

  DateTime createdAt;

  String requestPath;

  String? requestQuery;

  int? matchId;

  String? ipAddress;

  String? countryCode;

  String? countryName;

  String? city;

  _i2.WebAnalyticsDeviceType deviceType;

  String? osName;

  String? browserName;

  String? userAgent;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [WebAnalyticsClick]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  WebAnalyticsClick copyWith({
    int? id,
    DateTime? createdAt,
    String? requestPath,
    String? requestQuery,
    int? matchId,
    String? ipAddress,
    String? countryCode,
    String? countryName,
    String? city,
    _i2.WebAnalyticsDeviceType? deviceType,
    String? osName,
    String? browserName,
    String? userAgent,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'WebAnalyticsClick',
      if (id != null) 'id': id,
      'createdAt': createdAt.toJson(),
      'requestPath': requestPath,
      if (requestQuery != null) 'requestQuery': requestQuery,
      if (matchId != null) 'matchId': matchId,
      if (ipAddress != null) 'ipAddress': ipAddress,
      if (countryCode != null) 'countryCode': countryCode,
      if (countryName != null) 'countryName': countryName,
      if (city != null) 'city': city,
      'deviceType': deviceType.toJson(),
      if (osName != null) 'osName': osName,
      if (browserName != null) 'browserName': browserName,
      if (userAgent != null) 'userAgent': userAgent,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'WebAnalyticsClick',
      if (id != null) 'id': id,
      'createdAt': createdAt.toJson(),
      'requestPath': requestPath,
      if (requestQuery != null) 'requestQuery': requestQuery,
      if (matchId != null) 'matchId': matchId,
      if (ipAddress != null) 'ipAddress': ipAddress,
      if (countryCode != null) 'countryCode': countryCode,
      if (countryName != null) 'countryName': countryName,
      if (city != null) 'city': city,
      'deviceType': deviceType.toJson(),
      if (osName != null) 'osName': osName,
      if (browserName != null) 'browserName': browserName,
      if (userAgent != null) 'userAgent': userAgent,
    };
  }

  static WebAnalyticsClickInclude include() {
    return WebAnalyticsClickInclude._();
  }

  static WebAnalyticsClickIncludeList includeList({
    _i1.WhereExpressionBuilder<WebAnalyticsClickTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<WebAnalyticsClickTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<WebAnalyticsClickTable>? orderByList,
    WebAnalyticsClickInclude? include,
  }) {
    return WebAnalyticsClickIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(WebAnalyticsClick.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(WebAnalyticsClick.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _WebAnalyticsClickImpl extends WebAnalyticsClick {
  _WebAnalyticsClickImpl({
    int? id,
    required DateTime createdAt,
    required String requestPath,
    String? requestQuery,
    int? matchId,
    String? ipAddress,
    String? countryCode,
    String? countryName,
    String? city,
    required _i2.WebAnalyticsDeviceType deviceType,
    String? osName,
    String? browserName,
    String? userAgent,
  }) : super._(
         id: id,
         createdAt: createdAt,
         requestPath: requestPath,
         requestQuery: requestQuery,
         matchId: matchId,
         ipAddress: ipAddress,
         countryCode: countryCode,
         countryName: countryName,
         city: city,
         deviceType: deviceType,
         osName: osName,
         browserName: browserName,
         userAgent: userAgent,
       );

  /// Returns a shallow copy of this [WebAnalyticsClick]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  WebAnalyticsClick copyWith({
    Object? id = _Undefined,
    DateTime? createdAt,
    String? requestPath,
    Object? requestQuery = _Undefined,
    Object? matchId = _Undefined,
    Object? ipAddress = _Undefined,
    Object? countryCode = _Undefined,
    Object? countryName = _Undefined,
    Object? city = _Undefined,
    _i2.WebAnalyticsDeviceType? deviceType,
    Object? osName = _Undefined,
    Object? browserName = _Undefined,
    Object? userAgent = _Undefined,
  }) {
    return WebAnalyticsClick(
      id: id is int? ? id : this.id,
      createdAt: createdAt ?? this.createdAt,
      requestPath: requestPath ?? this.requestPath,
      requestQuery: requestQuery is String? ? requestQuery : this.requestQuery,
      matchId: matchId is int? ? matchId : this.matchId,
      ipAddress: ipAddress is String? ? ipAddress : this.ipAddress,
      countryCode: countryCode is String? ? countryCode : this.countryCode,
      countryName: countryName is String? ? countryName : this.countryName,
      city: city is String? ? city : this.city,
      deviceType: deviceType ?? this.deviceType,
      osName: osName is String? ? osName : this.osName,
      browserName: browserName is String? ? browserName : this.browserName,
      userAgent: userAgent is String? ? userAgent : this.userAgent,
    );
  }
}

class WebAnalyticsClickUpdateTable
    extends _i1.UpdateTable<WebAnalyticsClickTable> {
  WebAnalyticsClickUpdateTable(super.table);

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );

  _i1.ColumnValue<String, String> requestPath(String value) => _i1.ColumnValue(
    table.requestPath,
    value,
  );

  _i1.ColumnValue<String, String> requestQuery(String? value) =>
      _i1.ColumnValue(
        table.requestQuery,
        value,
      );

  _i1.ColumnValue<int, int> matchId(int? value) => _i1.ColumnValue(
    table.matchId,
    value,
  );

  _i1.ColumnValue<String, String> ipAddress(String? value) => _i1.ColumnValue(
    table.ipAddress,
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

  _i1.ColumnValue<_i2.WebAnalyticsDeviceType, _i2.WebAnalyticsDeviceType>
  deviceType(_i2.WebAnalyticsDeviceType value) => _i1.ColumnValue(
    table.deviceType,
    value,
  );

  _i1.ColumnValue<String, String> osName(String? value) => _i1.ColumnValue(
    table.osName,
    value,
  );

  _i1.ColumnValue<String, String> browserName(String? value) => _i1.ColumnValue(
    table.browserName,
    value,
  );

  _i1.ColumnValue<String, String> userAgent(String? value) => _i1.ColumnValue(
    table.userAgent,
    value,
  );
}

class WebAnalyticsClickTable extends _i1.Table<int?> {
  WebAnalyticsClickTable({super.tableRelation})
    : super(tableName: 'web_analytics_click') {
    updateTable = WebAnalyticsClickUpdateTable(this);
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
    requestPath = _i1.ColumnString(
      'requestPath',
      this,
    );
    requestQuery = _i1.ColumnString(
      'requestQuery',
      this,
    );
    matchId = _i1.ColumnInt(
      'matchId',
      this,
    );
    ipAddress = _i1.ColumnString(
      'ipAddress',
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
    deviceType = _i1.ColumnEnum(
      'deviceType',
      this,
      _i1.EnumSerialization.byName,
    );
    osName = _i1.ColumnString(
      'osName',
      this,
    );
    browserName = _i1.ColumnString(
      'browserName',
      this,
    );
    userAgent = _i1.ColumnString(
      'userAgent',
      this,
    );
  }

  late final WebAnalyticsClickUpdateTable updateTable;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnString requestPath;

  late final _i1.ColumnString requestQuery;

  late final _i1.ColumnInt matchId;

  late final _i1.ColumnString ipAddress;

  late final _i1.ColumnString countryCode;

  late final _i1.ColumnString countryName;

  late final _i1.ColumnString city;

  late final _i1.ColumnEnum<_i2.WebAnalyticsDeviceType> deviceType;

  late final _i1.ColumnString osName;

  late final _i1.ColumnString browserName;

  late final _i1.ColumnString userAgent;

  @override
  List<_i1.Column> get columns => [
    id,
    createdAt,
    requestPath,
    requestQuery,
    matchId,
    ipAddress,
    countryCode,
    countryName,
    city,
    deviceType,
    osName,
    browserName,
    userAgent,
  ];
}

class WebAnalyticsClickInclude extends _i1.IncludeObject {
  WebAnalyticsClickInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => WebAnalyticsClick.t;
}

class WebAnalyticsClickIncludeList extends _i1.IncludeList {
  WebAnalyticsClickIncludeList._({
    _i1.WhereExpressionBuilder<WebAnalyticsClickTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(WebAnalyticsClick.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => WebAnalyticsClick.t;
}

class WebAnalyticsClickRepository {
  const WebAnalyticsClickRepository._();

  /// Returns a list of [WebAnalyticsClick]s matching the given query parameters.
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
  Future<List<WebAnalyticsClick>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<WebAnalyticsClickTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<WebAnalyticsClickTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<WebAnalyticsClickTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<WebAnalyticsClick>(
      where: where?.call(WebAnalyticsClick.t),
      orderBy: orderBy?.call(WebAnalyticsClick.t),
      orderByList: orderByList?.call(WebAnalyticsClick.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [WebAnalyticsClick] matching the given query parameters.
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
  Future<WebAnalyticsClick?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<WebAnalyticsClickTable>? where,
    int? offset,
    _i1.OrderByBuilder<WebAnalyticsClickTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<WebAnalyticsClickTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<WebAnalyticsClick>(
      where: where?.call(WebAnalyticsClick.t),
      orderBy: orderBy?.call(WebAnalyticsClick.t),
      orderByList: orderByList?.call(WebAnalyticsClick.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [WebAnalyticsClick] by its [id] or null if no such row exists.
  Future<WebAnalyticsClick?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<WebAnalyticsClick>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [WebAnalyticsClick]s in the list and returns the inserted rows.
  ///
  /// The returned [WebAnalyticsClick]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<WebAnalyticsClick>> insert(
    _i1.Session session,
    List<WebAnalyticsClick> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<WebAnalyticsClick>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [WebAnalyticsClick] and returns the inserted row.
  ///
  /// The returned [WebAnalyticsClick] will have its `id` field set.
  Future<WebAnalyticsClick> insertRow(
    _i1.Session session,
    WebAnalyticsClick row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<WebAnalyticsClick>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [WebAnalyticsClick]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<WebAnalyticsClick>> update(
    _i1.Session session,
    List<WebAnalyticsClick> rows, {
    _i1.ColumnSelections<WebAnalyticsClickTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<WebAnalyticsClick>(
      rows,
      columns: columns?.call(WebAnalyticsClick.t),
      transaction: transaction,
    );
  }

  /// Updates a single [WebAnalyticsClick]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<WebAnalyticsClick> updateRow(
    _i1.Session session,
    WebAnalyticsClick row, {
    _i1.ColumnSelections<WebAnalyticsClickTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<WebAnalyticsClick>(
      row,
      columns: columns?.call(WebAnalyticsClick.t),
      transaction: transaction,
    );
  }

  /// Updates a single [WebAnalyticsClick] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<WebAnalyticsClick?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<WebAnalyticsClickUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<WebAnalyticsClick>(
      id,
      columnValues: columnValues(WebAnalyticsClick.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [WebAnalyticsClick]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<WebAnalyticsClick>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<WebAnalyticsClickUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<WebAnalyticsClickTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<WebAnalyticsClickTable>? orderBy,
    _i1.OrderByListBuilder<WebAnalyticsClickTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<WebAnalyticsClick>(
      columnValues: columnValues(WebAnalyticsClick.t.updateTable),
      where: where(WebAnalyticsClick.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(WebAnalyticsClick.t),
      orderByList: orderByList?.call(WebAnalyticsClick.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [WebAnalyticsClick]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<WebAnalyticsClick>> delete(
    _i1.Session session,
    List<WebAnalyticsClick> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<WebAnalyticsClick>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [WebAnalyticsClick].
  Future<WebAnalyticsClick> deleteRow(
    _i1.Session session,
    WebAnalyticsClick row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<WebAnalyticsClick>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<WebAnalyticsClick>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<WebAnalyticsClickTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<WebAnalyticsClick>(
      where: where(WebAnalyticsClick.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<WebAnalyticsClickTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<WebAnalyticsClick>(
      where: where?.call(WebAnalyticsClick.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
