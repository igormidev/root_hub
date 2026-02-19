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
import '../../entities/core/country.dart' as _i2;
import '../../entities/match_making/location.dart' as _i3;
import 'package:root_hub_server/src/generated/protocol.dart' as _i4;

abstract class ManualInputLocation
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  ManualInputLocation._({
    this.id,
    required this.title,
    this.description,
    required this.cityName,
    required this.country,
    this.location,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ManualInputLocation({
    int? id,
    required String title,
    String? description,
    required String cityName,
    required _i2.Country country,
    _i3.Location? location,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ManualInputLocationImpl;

  factory ManualInputLocation.fromJson(Map<String, dynamic> jsonSerialization) {
    return ManualInputLocation(
      id: jsonSerialization['id'] as int?,
      title: jsonSerialization['title'] as String,
      description: jsonSerialization['description'] as String?,
      cityName: jsonSerialization['cityName'] as String,
      country: _i2.Country.fromJson((jsonSerialization['country'] as String)),
      location: jsonSerialization['location'] == null
          ? null
          : _i4.Protocol().deserialize<_i3.Location>(
              jsonSerialization['location'],
            ),
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
    );
  }

  static final t = ManualInputLocationTable();

  static const db = ManualInputLocationRepository._();

  @override
  int? id;

  String title;

  String? description;

  String cityName;

  _i2.Country country;

  _i3.Location? location;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [ManualInputLocation]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ManualInputLocation copyWith({
    int? id,
    String? title,
    String? description,
    String? cityName,
    _i2.Country? country,
    _i3.Location? location,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ManualInputLocation',
      if (id != null) 'id': id,
      'title': title,
      if (description != null) 'description': description,
      'cityName': cityName,
      'country': country.toJson(),
      if (location != null) 'location': location?.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ManualInputLocation',
      if (id != null) 'id': id,
      'title': title,
      if (description != null) 'description': description,
      'cityName': cityName,
      'country': country.toJson(),
      if (location != null) 'location': location?.toJsonForProtocol(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static ManualInputLocationInclude include({_i3.LocationInclude? location}) {
    return ManualInputLocationInclude._(location: location);
  }

  static ManualInputLocationIncludeList includeList({
    _i1.WhereExpressionBuilder<ManualInputLocationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ManualInputLocationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ManualInputLocationTable>? orderByList,
    ManualInputLocationInclude? include,
  }) {
    return ManualInputLocationIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ManualInputLocation.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ManualInputLocation.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ManualInputLocationImpl extends ManualInputLocation {
  _ManualInputLocationImpl({
    int? id,
    required String title,
    String? description,
    required String cityName,
    required _i2.Country country,
    _i3.Location? location,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
         id: id,
         title: title,
         description: description,
         cityName: cityName,
         country: country,
         location: location,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [ManualInputLocation]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ManualInputLocation copyWith({
    Object? id = _Undefined,
    String? title,
    Object? description = _Undefined,
    String? cityName,
    _i2.Country? country,
    Object? location = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ManualInputLocation(
      id: id is int? ? id : this.id,
      title: title ?? this.title,
      description: description is String? ? description : this.description,
      cityName: cityName ?? this.cityName,
      country: country ?? this.country,
      location: location is _i3.Location?
          ? location
          : this.location?.copyWith(),
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class ManualInputLocationUpdateTable
    extends _i1.UpdateTable<ManualInputLocationTable> {
  ManualInputLocationUpdateTable(super.table);

  _i1.ColumnValue<String, String> title(String value) => _i1.ColumnValue(
    table.title,
    value,
  );

  _i1.ColumnValue<String, String> description(String? value) => _i1.ColumnValue(
    table.description,
    value,
  );

  _i1.ColumnValue<String, String> cityName(String value) => _i1.ColumnValue(
    table.cityName,
    value,
  );

  _i1.ColumnValue<_i2.Country, _i2.Country> country(_i2.Country value) =>
      _i1.ColumnValue(
        table.country,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> updatedAt(DateTime value) =>
      _i1.ColumnValue(
        table.updatedAt,
        value,
      );
}

class ManualInputLocationTable extends _i1.Table<int?> {
  ManualInputLocationTable({super.tableRelation})
    : super(tableName: 'manual_input_locations') {
    updateTable = ManualInputLocationUpdateTable(this);
    title = _i1.ColumnString(
      'title',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
    cityName = _i1.ColumnString(
      'cityName',
      this,
    );
    country = _i1.ColumnEnum(
      'country',
      this,
      _i1.EnumSerialization.byName,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
    updatedAt = _i1.ColumnDateTime(
      'updatedAt',
      this,
    );
  }

  late final ManualInputLocationUpdateTable updateTable;

  late final _i1.ColumnString title;

  late final _i1.ColumnString description;

  late final _i1.ColumnString cityName;

  late final _i1.ColumnEnum<_i2.Country> country;

  _i3.LocationTable? _location;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  _i3.LocationTable get location {
    if (_location != null) return _location!;
    _location = _i1.createRelationTable(
      relationFieldName: 'location',
      field: ManualInputLocation.t.id,
      foreignField: _i3.Location.t.manualInputLocationId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.LocationTable(tableRelation: foreignTableRelation),
    );
    return _location!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    title,
    description,
    cityName,
    country,
    createdAt,
    updatedAt,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'location') {
      return location;
    }
    return null;
  }
}

class ManualInputLocationInclude extends _i1.IncludeObject {
  ManualInputLocationInclude._({_i3.LocationInclude? location}) {
    _location = location;
  }

  _i3.LocationInclude? _location;

  @override
  Map<String, _i1.Include?> get includes => {'location': _location};

  @override
  _i1.Table<int?> get table => ManualInputLocation.t;
}

class ManualInputLocationIncludeList extends _i1.IncludeList {
  ManualInputLocationIncludeList._({
    _i1.WhereExpressionBuilder<ManualInputLocationTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ManualInputLocation.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => ManualInputLocation.t;
}

class ManualInputLocationRepository {
  const ManualInputLocationRepository._();

  final attachRow = const ManualInputLocationAttachRowRepository._();

  final detachRow = const ManualInputLocationDetachRowRepository._();

  /// Returns a list of [ManualInputLocation]s matching the given query parameters.
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
  Future<List<ManualInputLocation>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ManualInputLocationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ManualInputLocationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ManualInputLocationTable>? orderByList,
    _i1.Transaction? transaction,
    ManualInputLocationInclude? include,
  }) async {
    return session.db.find<ManualInputLocation>(
      where: where?.call(ManualInputLocation.t),
      orderBy: orderBy?.call(ManualInputLocation.t),
      orderByList: orderByList?.call(ManualInputLocation.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [ManualInputLocation] matching the given query parameters.
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
  Future<ManualInputLocation?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ManualInputLocationTable>? where,
    int? offset,
    _i1.OrderByBuilder<ManualInputLocationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ManualInputLocationTable>? orderByList,
    _i1.Transaction? transaction,
    ManualInputLocationInclude? include,
  }) async {
    return session.db.findFirstRow<ManualInputLocation>(
      where: where?.call(ManualInputLocation.t),
      orderBy: orderBy?.call(ManualInputLocation.t),
      orderByList: orderByList?.call(ManualInputLocation.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [ManualInputLocation] by its [id] or null if no such row exists.
  Future<ManualInputLocation?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    ManualInputLocationInclude? include,
  }) async {
    return session.db.findById<ManualInputLocation>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [ManualInputLocation]s in the list and returns the inserted rows.
  ///
  /// The returned [ManualInputLocation]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<ManualInputLocation>> insert(
    _i1.Session session,
    List<ManualInputLocation> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<ManualInputLocation>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [ManualInputLocation] and returns the inserted row.
  ///
  /// The returned [ManualInputLocation] will have its `id` field set.
  Future<ManualInputLocation> insertRow(
    _i1.Session session,
    ManualInputLocation row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ManualInputLocation>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [ManualInputLocation]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<ManualInputLocation>> update(
    _i1.Session session,
    List<ManualInputLocation> rows, {
    _i1.ColumnSelections<ManualInputLocationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ManualInputLocation>(
      rows,
      columns: columns?.call(ManualInputLocation.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ManualInputLocation]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ManualInputLocation> updateRow(
    _i1.Session session,
    ManualInputLocation row, {
    _i1.ColumnSelections<ManualInputLocationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ManualInputLocation>(
      row,
      columns: columns?.call(ManualInputLocation.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ManualInputLocation] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<ManualInputLocation?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<ManualInputLocationUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<ManualInputLocation>(
      id,
      columnValues: columnValues(ManualInputLocation.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [ManualInputLocation]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<ManualInputLocation>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<ManualInputLocationUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<ManualInputLocationTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ManualInputLocationTable>? orderBy,
    _i1.OrderByListBuilder<ManualInputLocationTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<ManualInputLocation>(
      columnValues: columnValues(ManualInputLocation.t.updateTable),
      where: where(ManualInputLocation.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ManualInputLocation.t),
      orderByList: orderByList?.call(ManualInputLocation.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [ManualInputLocation]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<ManualInputLocation>> delete(
    _i1.Session session,
    List<ManualInputLocation> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ManualInputLocation>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [ManualInputLocation].
  Future<ManualInputLocation> deleteRow(
    _i1.Session session,
    ManualInputLocation row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ManualInputLocation>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<ManualInputLocation>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ManualInputLocationTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ManualInputLocation>(
      where: where(ManualInputLocation.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ManualInputLocationTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ManualInputLocation>(
      where: where?.call(ManualInputLocation.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class ManualInputLocationAttachRowRepository {
  const ManualInputLocationAttachRowRepository._();

  /// Creates a relation between the given [ManualInputLocation] and [Location]
  /// by setting the [ManualInputLocation]'s foreign key `id` to refer to the [Location].
  Future<void> location(
    _i1.Session session,
    ManualInputLocation manualInputLocation,
    _i3.Location location, {
    _i1.Transaction? transaction,
  }) async {
    if (location.id == null) {
      throw ArgumentError.notNull('location.id');
    }
    if (manualInputLocation.id == null) {
      throw ArgumentError.notNull('manualInputLocation.id');
    }

    var $location = location.copyWith(
      manualInputLocationId: manualInputLocation.id,
    );
    await session.db.updateRow<_i3.Location>(
      $location,
      columns: [_i3.Location.t.manualInputLocationId],
      transaction: transaction,
    );
  }
}

class ManualInputLocationDetachRowRepository {
  const ManualInputLocationDetachRowRepository._();

  /// Detaches the relation between this [ManualInputLocation] and the [Location] set in `location`
  /// by setting the [ManualInputLocation]'s foreign key `id` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> location(
    _i1.Session session,
    ManualInputLocation manualInputLocation, {
    _i1.Transaction? transaction,
  }) async {
    var $location = manualInputLocation.location;

    if ($location == null) {
      throw ArgumentError.notNull('manualInputLocation.location');
    }
    if ($location.id == null) {
      throw ArgumentError.notNull('manualInputLocation.location.id');
    }
    if (manualInputLocation.id == null) {
      throw ArgumentError.notNull('manualInputLocation.id');
    }

    var $$location = $location.copyWith(manualInputLocationId: null);
    await session.db.updateRow<_i3.Location>(
      $$location,
      columns: [_i3.Location.t.manualInputLocationId],
      transaction: transaction,
    );
  }
}
