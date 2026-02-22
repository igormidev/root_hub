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
import 'package:root_hub_server/src/generated/protocol.dart' as _i3;

abstract class GeoLocation
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  GeoLocation._({
    this.id,
    required this.x,
    required this.y,
    required this.ratio,
    this.playerData,
  });

  factory GeoLocation({
    int? id,
    required double x,
    required double y,
    required double ratio,
    _i2.PlayerData? playerData,
  }) = _GeoLocationImpl;

  factory GeoLocation.fromJson(Map<String, dynamic> jsonSerialization) {
    return GeoLocation(
      id: jsonSerialization['id'] as int?,
      x: (jsonSerialization['x'] as num).toDouble(),
      y: (jsonSerialization['y'] as num).toDouble(),
      ratio: (jsonSerialization['ratio'] as num).toDouble(),
      playerData: jsonSerialization['playerData'] == null
          ? null
          : _i3.Protocol().deserialize<_i2.PlayerData>(
              jsonSerialization['playerData'],
            ),
    );
  }

  static final t = GeoLocationTable();

  static const db = GeoLocationRepository._();

  @override
  int? id;

  double x;

  double y;

  double ratio;

  _i2.PlayerData? playerData;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [GeoLocation]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  GeoLocation copyWith({
    int? id,
    double? x,
    double? y,
    double? ratio,
    _i2.PlayerData? playerData,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'GeoLocation',
      if (id != null) 'id': id,
      'x': x,
      'y': y,
      'ratio': ratio,
      if (playerData != null) 'playerData': playerData?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'GeoLocation',
      if (id != null) 'id': id,
      'x': x,
      'y': y,
      'ratio': ratio,
      if (playerData != null) 'playerData': playerData?.toJsonForProtocol(),
    };
  }

  static GeoLocationInclude include({_i2.PlayerDataInclude? playerData}) {
    return GeoLocationInclude._(playerData: playerData);
  }

  static GeoLocationIncludeList includeList({
    _i1.WhereExpressionBuilder<GeoLocationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GeoLocationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GeoLocationTable>? orderByList,
    GeoLocationInclude? include,
  }) {
    return GeoLocationIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(GeoLocation.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(GeoLocation.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _GeoLocationImpl extends GeoLocation {
  _GeoLocationImpl({
    int? id,
    required double x,
    required double y,
    required double ratio,
    _i2.PlayerData? playerData,
  }) : super._(
         id: id,
         x: x,
         y: y,
         ratio: ratio,
         playerData: playerData,
       );

  /// Returns a shallow copy of this [GeoLocation]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  GeoLocation copyWith({
    Object? id = _Undefined,
    double? x,
    double? y,
    double? ratio,
    Object? playerData = _Undefined,
  }) {
    return GeoLocation(
      id: id is int? ? id : this.id,
      x: x ?? this.x,
      y: y ?? this.y,
      ratio: ratio ?? this.ratio,
      playerData: playerData is _i2.PlayerData?
          ? playerData
          : this.playerData?.copyWith(),
    );
  }
}

class GeoLocationUpdateTable extends _i1.UpdateTable<GeoLocationTable> {
  GeoLocationUpdateTable(super.table);

  _i1.ColumnValue<double, double> x(double value) => _i1.ColumnValue(
    table.x,
    value,
  );

  _i1.ColumnValue<double, double> y(double value) => _i1.ColumnValue(
    table.y,
    value,
  );

  _i1.ColumnValue<double, double> ratio(double value) => _i1.ColumnValue(
    table.ratio,
    value,
  );
}

class GeoLocationTable extends _i1.Table<int?> {
  GeoLocationTable({super.tableRelation}) : super(tableName: 'geo_locations') {
    updateTable = GeoLocationUpdateTable(this);
    x = _i1.ColumnDouble(
      'x',
      this,
    );
    y = _i1.ColumnDouble(
      'y',
      this,
    );
    ratio = _i1.ColumnDouble(
      'ratio',
      this,
    );
  }

  late final GeoLocationUpdateTable updateTable;

  late final _i1.ColumnDouble x;

  late final _i1.ColumnDouble y;

  late final _i1.ColumnDouble ratio;

  _i2.PlayerDataTable? _playerData;

  _i2.PlayerDataTable get playerData {
    if (_playerData != null) return _playerData!;
    _playerData = _i1.createRelationTable(
      relationFieldName: 'playerData',
      field: GeoLocation.t.id,
      foreignField: _i2.PlayerData.t.currentLocationId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.PlayerDataTable(tableRelation: foreignTableRelation),
    );
    return _playerData!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    x,
    y,
    ratio,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'playerData') {
      return playerData;
    }
    return null;
  }
}

class GeoLocationInclude extends _i1.IncludeObject {
  GeoLocationInclude._({_i2.PlayerDataInclude? playerData}) {
    _playerData = playerData;
  }

  _i2.PlayerDataInclude? _playerData;

  @override
  Map<String, _i1.Include?> get includes => {'playerData': _playerData};

  @override
  _i1.Table<int?> get table => GeoLocation.t;
}

class GeoLocationIncludeList extends _i1.IncludeList {
  GeoLocationIncludeList._({
    _i1.WhereExpressionBuilder<GeoLocationTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(GeoLocation.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => GeoLocation.t;
}

class GeoLocationRepository {
  const GeoLocationRepository._();

  final attachRow = const GeoLocationAttachRowRepository._();

  final detachRow = const GeoLocationDetachRowRepository._();

  /// Returns a list of [GeoLocation]s matching the given query parameters.
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
  Future<List<GeoLocation>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GeoLocationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GeoLocationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GeoLocationTable>? orderByList,
    _i1.Transaction? transaction,
    GeoLocationInclude? include,
  }) async {
    return session.db.find<GeoLocation>(
      where: where?.call(GeoLocation.t),
      orderBy: orderBy?.call(GeoLocation.t),
      orderByList: orderByList?.call(GeoLocation.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [GeoLocation] matching the given query parameters.
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
  Future<GeoLocation?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GeoLocationTable>? where,
    int? offset,
    _i1.OrderByBuilder<GeoLocationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GeoLocationTable>? orderByList,
    _i1.Transaction? transaction,
    GeoLocationInclude? include,
  }) async {
    return session.db.findFirstRow<GeoLocation>(
      where: where?.call(GeoLocation.t),
      orderBy: orderBy?.call(GeoLocation.t),
      orderByList: orderByList?.call(GeoLocation.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [GeoLocation] by its [id] or null if no such row exists.
  Future<GeoLocation?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    GeoLocationInclude? include,
  }) async {
    return session.db.findById<GeoLocation>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [GeoLocation]s in the list and returns the inserted rows.
  ///
  /// The returned [GeoLocation]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<GeoLocation>> insert(
    _i1.Session session,
    List<GeoLocation> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<GeoLocation>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [GeoLocation] and returns the inserted row.
  ///
  /// The returned [GeoLocation] will have its `id` field set.
  Future<GeoLocation> insertRow(
    _i1.Session session,
    GeoLocation row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<GeoLocation>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [GeoLocation]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<GeoLocation>> update(
    _i1.Session session,
    List<GeoLocation> rows, {
    _i1.ColumnSelections<GeoLocationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<GeoLocation>(
      rows,
      columns: columns?.call(GeoLocation.t),
      transaction: transaction,
    );
  }

  /// Updates a single [GeoLocation]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<GeoLocation> updateRow(
    _i1.Session session,
    GeoLocation row, {
    _i1.ColumnSelections<GeoLocationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<GeoLocation>(
      row,
      columns: columns?.call(GeoLocation.t),
      transaction: transaction,
    );
  }

  /// Updates a single [GeoLocation] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<GeoLocation?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<GeoLocationUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<GeoLocation>(
      id,
      columnValues: columnValues(GeoLocation.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [GeoLocation]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<GeoLocation>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<GeoLocationUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<GeoLocationTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GeoLocationTable>? orderBy,
    _i1.OrderByListBuilder<GeoLocationTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<GeoLocation>(
      columnValues: columnValues(GeoLocation.t.updateTable),
      where: where(GeoLocation.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(GeoLocation.t),
      orderByList: orderByList?.call(GeoLocation.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [GeoLocation]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<GeoLocation>> delete(
    _i1.Session session,
    List<GeoLocation> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<GeoLocation>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [GeoLocation].
  Future<GeoLocation> deleteRow(
    _i1.Session session,
    GeoLocation row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<GeoLocation>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<GeoLocation>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<GeoLocationTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<GeoLocation>(
      where: where(GeoLocation.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GeoLocationTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<GeoLocation>(
      where: where?.call(GeoLocation.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class GeoLocationAttachRowRepository {
  const GeoLocationAttachRowRepository._();

  /// Creates a relation between the given [GeoLocation] and [PlayerData]
  /// by setting the [GeoLocation]'s foreign key `id` to refer to the [PlayerData].
  Future<void> playerData(
    _i1.Session session,
    GeoLocation geoLocation,
    _i2.PlayerData playerData, {
    _i1.Transaction? transaction,
  }) async {
    if (playerData.id == null) {
      throw ArgumentError.notNull('playerData.id');
    }
    if (geoLocation.id == null) {
      throw ArgumentError.notNull('geoLocation.id');
    }

    var $playerData = playerData.copyWith(currentLocationId: geoLocation.id);
    await session.db.updateRow<_i2.PlayerData>(
      $playerData,
      columns: [_i2.PlayerData.t.currentLocationId],
      transaction: transaction,
    );
  }
}

class GeoLocationDetachRowRepository {
  const GeoLocationDetachRowRepository._();

  /// Detaches the relation between this [GeoLocation] and the [PlayerData] set in `playerData`
  /// by setting the [GeoLocation]'s foreign key `id` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> playerData(
    _i1.Session session,
    GeoLocation geoLocation, {
    _i1.Transaction? transaction,
  }) async {
    var $playerData = geoLocation.playerData;

    if ($playerData == null) {
      throw ArgumentError.notNull('geoLocation.playerData');
    }
    if ($playerData.id == null) {
      throw ArgumentError.notNull('geoLocation.playerData.id');
    }
    if (geoLocation.id == null) {
      throw ArgumentError.notNull('geoLocation.id');
    }

    var $$playerData = $playerData.copyWith(currentLocationId: null);
    await session.db.updateRow<_i2.PlayerData>(
      $$playerData,
      columns: [_i2.PlayerData.t.currentLocationId],
      transaction: transaction,
    );
  }
}
