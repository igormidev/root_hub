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
import 'package:root_hub_server/src/generated/protocol.dart' as _i3;

abstract class Location
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Location._({
    this.id,
    required this.providerPlaceId,
    required this.name,
    this.formattedAddress,
    required this.lat,
    required this.lng,
    this.url,
    this.phoneNumber,
    this.types,
    this.timezone,
    bool? isPublicPlace,
    this.notes,
    this.pairingAttempts,
    required this.createdAt,
    required this.updatedAt,
  }) : isPublicPlace = isPublicPlace ?? true;

  factory Location({
    int? id,
    required String providerPlaceId,
    required String name,
    String? formattedAddress,
    required double lat,
    required double lng,
    String? url,
    String? phoneNumber,
    List<String>? types,
    String? timezone,
    bool? isPublicPlace,
    String? notes,
    List<_i2.MatchSchedulePairingAttempt>? pairingAttempts,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _LocationImpl;

  factory Location.fromJson(Map<String, dynamic> jsonSerialization) {
    return Location(
      id: jsonSerialization['id'] as int?,
      providerPlaceId: jsonSerialization['providerPlaceId'] as String,
      name: jsonSerialization['name'] as String,
      formattedAddress: jsonSerialization['formattedAddress'] as String?,
      lat: (jsonSerialization['lat'] as num).toDouble(),
      lng: (jsonSerialization['lng'] as num).toDouble(),
      url: jsonSerialization['url'] as String?,
      phoneNumber: jsonSerialization['phoneNumber'] as String?,
      types: jsonSerialization['types'] == null
          ? null
          : _i3.Protocol().deserialize<List<String>>(
              jsonSerialization['types'],
            ),
      timezone: jsonSerialization['timezone'] as String?,
      isPublicPlace: jsonSerialization['isPublicPlace'] as bool?,
      notes: jsonSerialization['notes'] as String?,
      pairingAttempts: jsonSerialization['pairingAttempts'] == null
          ? null
          : _i3.Protocol().deserialize<List<_i2.MatchSchedulePairingAttempt>>(
              jsonSerialization['pairingAttempts'],
            ),
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
    );
  }

  static final t = LocationTable();

  static const db = LocationRepository._();

  @override
  int? id;

  String providerPlaceId;

  String name;

  String? formattedAddress;

  double lat;

  double lng;

  String? url;

  String? phoneNumber;

  List<String>? types;

  String? timezone;

  bool isPublicPlace;

  String? notes;

  List<_i2.MatchSchedulePairingAttempt>? pairingAttempts;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Location]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Location copyWith({
    int? id,
    String? providerPlaceId,
    String? name,
    String? formattedAddress,
    double? lat,
    double? lng,
    String? url,
    String? phoneNumber,
    List<String>? types,
    String? timezone,
    bool? isPublicPlace,
    String? notes,
    List<_i2.MatchSchedulePairingAttempt>? pairingAttempts,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Location',
      if (id != null) 'id': id,
      'providerPlaceId': providerPlaceId,
      'name': name,
      if (formattedAddress != null) 'formattedAddress': formattedAddress,
      'lat': lat,
      'lng': lng,
      if (url != null) 'url': url,
      if (phoneNumber != null) 'phoneNumber': phoneNumber,
      if (types != null) 'types': types?.toJson(),
      if (timezone != null) 'timezone': timezone,
      'isPublicPlace': isPublicPlace,
      if (notes != null) 'notes': notes,
      if (pairingAttempts != null)
        'pairingAttempts': pairingAttempts?.toJson(
          valueToJson: (v) => v.toJson(),
        ),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Location',
      if (id != null) 'id': id,
      'providerPlaceId': providerPlaceId,
      'name': name,
      if (formattedAddress != null) 'formattedAddress': formattedAddress,
      'lat': lat,
      'lng': lng,
      if (url != null) 'url': url,
      if (phoneNumber != null) 'phoneNumber': phoneNumber,
      if (types != null) 'types': types?.toJson(),
      if (timezone != null) 'timezone': timezone,
      'isPublicPlace': isPublicPlace,
      if (notes != null) 'notes': notes,
      if (pairingAttempts != null)
        'pairingAttempts': pairingAttempts?.toJson(
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static LocationInclude include({
    _i2.MatchSchedulePairingAttemptIncludeList? pairingAttempts,
  }) {
    return LocationInclude._(pairingAttempts: pairingAttempts);
  }

  static LocationIncludeList includeList({
    _i1.WhereExpressionBuilder<LocationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<LocationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<LocationTable>? orderByList,
    LocationInclude? include,
  }) {
    return LocationIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Location.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Location.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _LocationImpl extends Location {
  _LocationImpl({
    int? id,
    required String providerPlaceId,
    required String name,
    String? formattedAddress,
    required double lat,
    required double lng,
    String? url,
    String? phoneNumber,
    List<String>? types,
    String? timezone,
    bool? isPublicPlace,
    String? notes,
    List<_i2.MatchSchedulePairingAttempt>? pairingAttempts,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
         id: id,
         providerPlaceId: providerPlaceId,
         name: name,
         formattedAddress: formattedAddress,
         lat: lat,
         lng: lng,
         url: url,
         phoneNumber: phoneNumber,
         types: types,
         timezone: timezone,
         isPublicPlace: isPublicPlace,
         notes: notes,
         pairingAttempts: pairingAttempts,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [Location]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Location copyWith({
    Object? id = _Undefined,
    String? providerPlaceId,
    String? name,
    Object? formattedAddress = _Undefined,
    double? lat,
    double? lng,
    Object? url = _Undefined,
    Object? phoneNumber = _Undefined,
    Object? types = _Undefined,
    Object? timezone = _Undefined,
    bool? isPublicPlace,
    Object? notes = _Undefined,
    Object? pairingAttempts = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Location(
      id: id is int? ? id : this.id,
      providerPlaceId: providerPlaceId ?? this.providerPlaceId,
      name: name ?? this.name,
      formattedAddress: formattedAddress is String?
          ? formattedAddress
          : this.formattedAddress,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      url: url is String? ? url : this.url,
      phoneNumber: phoneNumber is String? ? phoneNumber : this.phoneNumber,
      types: types is List<String>?
          ? types
          : this.types?.map((e0) => e0).toList(),
      timezone: timezone is String? ? timezone : this.timezone,
      isPublicPlace: isPublicPlace ?? this.isPublicPlace,
      notes: notes is String? ? notes : this.notes,
      pairingAttempts: pairingAttempts is List<_i2.MatchSchedulePairingAttempt>?
          ? pairingAttempts
          : this.pairingAttempts?.map((e0) => e0.copyWith()).toList(),
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class LocationUpdateTable extends _i1.UpdateTable<LocationTable> {
  LocationUpdateTable(super.table);

  _i1.ColumnValue<String, String> providerPlaceId(String value) =>
      _i1.ColumnValue(
        table.providerPlaceId,
        value,
      );

  _i1.ColumnValue<String, String> name(String value) => _i1.ColumnValue(
    table.name,
    value,
  );

  _i1.ColumnValue<String, String> formattedAddress(String? value) =>
      _i1.ColumnValue(
        table.formattedAddress,
        value,
      );

  _i1.ColumnValue<double, double> lat(double value) => _i1.ColumnValue(
    table.lat,
    value,
  );

  _i1.ColumnValue<double, double> lng(double value) => _i1.ColumnValue(
    table.lng,
    value,
  );

  _i1.ColumnValue<String, String> url(String? value) => _i1.ColumnValue(
    table.url,
    value,
  );

  _i1.ColumnValue<String, String> phoneNumber(String? value) => _i1.ColumnValue(
    table.phoneNumber,
    value,
  );

  _i1.ColumnValue<List<String>, List<String>> types(List<String>? value) =>
      _i1.ColumnValue(
        table.types,
        value,
      );

  _i1.ColumnValue<String, String> timezone(String? value) => _i1.ColumnValue(
    table.timezone,
    value,
  );

  _i1.ColumnValue<bool, bool> isPublicPlace(bool value) => _i1.ColumnValue(
    table.isPublicPlace,
    value,
  );

  _i1.ColumnValue<String, String> notes(String? value) => _i1.ColumnValue(
    table.notes,
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

class LocationTable extends _i1.Table<int?> {
  LocationTable({super.tableRelation}) : super(tableName: 'locations') {
    updateTable = LocationUpdateTable(this);
    providerPlaceId = _i1.ColumnString(
      'providerPlaceId',
      this,
    );
    name = _i1.ColumnString(
      'name',
      this,
    );
    formattedAddress = _i1.ColumnString(
      'formattedAddress',
      this,
    );
    lat = _i1.ColumnDouble(
      'lat',
      this,
    );
    lng = _i1.ColumnDouble(
      'lng',
      this,
    );
    url = _i1.ColumnString(
      'url',
      this,
    );
    phoneNumber = _i1.ColumnString(
      'phoneNumber',
      this,
    );
    types = _i1.ColumnSerializable<List<String>>(
      'types',
      this,
    );
    timezone = _i1.ColumnString(
      'timezone',
      this,
    );
    isPublicPlace = _i1.ColumnBool(
      'isPublicPlace',
      this,
      hasDefault: true,
    );
    notes = _i1.ColumnString(
      'notes',
      this,
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

  late final LocationUpdateTable updateTable;

  late final _i1.ColumnString providerPlaceId;

  late final _i1.ColumnString name;

  late final _i1.ColumnString formattedAddress;

  late final _i1.ColumnDouble lat;

  late final _i1.ColumnDouble lng;

  late final _i1.ColumnString url;

  late final _i1.ColumnString phoneNumber;

  late final _i1.ColumnSerializable<List<String>> types;

  late final _i1.ColumnString timezone;

  late final _i1.ColumnBool isPublicPlace;

  late final _i1.ColumnString notes;

  _i2.MatchSchedulePairingAttemptTable? ___pairingAttempts;

  _i1.ManyRelation<_i2.MatchSchedulePairingAttemptTable>? _pairingAttempts;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  _i2.MatchSchedulePairingAttemptTable get __pairingAttempts {
    if (___pairingAttempts != null) return ___pairingAttempts!;
    ___pairingAttempts = _i1.createRelationTable(
      relationFieldName: '__pairingAttempts',
      field: Location.t.id,
      foreignField: _i2.MatchSchedulePairingAttempt.t.locationId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.MatchSchedulePairingAttemptTable(
            tableRelation: foreignTableRelation,
          ),
    );
    return ___pairingAttempts!;
  }

  _i1.ManyRelation<_i2.MatchSchedulePairingAttemptTable> get pairingAttempts {
    if (_pairingAttempts != null) return _pairingAttempts!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'pairingAttempts',
      field: Location.t.id,
      foreignField: _i2.MatchSchedulePairingAttempt.t.locationId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.MatchSchedulePairingAttemptTable(
            tableRelation: foreignTableRelation,
          ),
    );
    _pairingAttempts = _i1.ManyRelation<_i2.MatchSchedulePairingAttemptTable>(
      tableWithRelations: relationTable,
      table: _i2.MatchSchedulePairingAttemptTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _pairingAttempts!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    providerPlaceId,
    name,
    formattedAddress,
    lat,
    lng,
    url,
    phoneNumber,
    types,
    timezone,
    isPublicPlace,
    notes,
    createdAt,
    updatedAt,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'pairingAttempts') {
      return __pairingAttempts;
    }
    return null;
  }
}

class LocationInclude extends _i1.IncludeObject {
  LocationInclude._({
    _i2.MatchSchedulePairingAttemptIncludeList? pairingAttempts,
  }) {
    _pairingAttempts = pairingAttempts;
  }

  _i2.MatchSchedulePairingAttemptIncludeList? _pairingAttempts;

  @override
  Map<String, _i1.Include?> get includes => {
    'pairingAttempts': _pairingAttempts,
  };

  @override
  _i1.Table<int?> get table => Location.t;
}

class LocationIncludeList extends _i1.IncludeList {
  LocationIncludeList._({
    _i1.WhereExpressionBuilder<LocationTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Location.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Location.t;
}

class LocationRepository {
  const LocationRepository._();

  final attach = const LocationAttachRepository._();

  final attachRow = const LocationAttachRowRepository._();

  final detach = const LocationDetachRepository._();

  final detachRow = const LocationDetachRowRepository._();

  /// Returns a list of [Location]s matching the given query parameters.
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
  Future<List<Location>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<LocationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<LocationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<LocationTable>? orderByList,
    _i1.Transaction? transaction,
    LocationInclude? include,
  }) async {
    return session.db.find<Location>(
      where: where?.call(Location.t),
      orderBy: orderBy?.call(Location.t),
      orderByList: orderByList?.call(Location.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Location] matching the given query parameters.
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
  Future<Location?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<LocationTable>? where,
    int? offset,
    _i1.OrderByBuilder<LocationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<LocationTable>? orderByList,
    _i1.Transaction? transaction,
    LocationInclude? include,
  }) async {
    return session.db.findFirstRow<Location>(
      where: where?.call(Location.t),
      orderBy: orderBy?.call(Location.t),
      orderByList: orderByList?.call(Location.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Location] by its [id] or null if no such row exists.
  Future<Location?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    LocationInclude? include,
  }) async {
    return session.db.findById<Location>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Location]s in the list and returns the inserted rows.
  ///
  /// The returned [Location]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Location>> insert(
    _i1.Session session,
    List<Location> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Location>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Location] and returns the inserted row.
  ///
  /// The returned [Location] will have its `id` field set.
  Future<Location> insertRow(
    _i1.Session session,
    Location row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Location>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Location]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Location>> update(
    _i1.Session session,
    List<Location> rows, {
    _i1.ColumnSelections<LocationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Location>(
      rows,
      columns: columns?.call(Location.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Location]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Location> updateRow(
    _i1.Session session,
    Location row, {
    _i1.ColumnSelections<LocationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Location>(
      row,
      columns: columns?.call(Location.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Location] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Location?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<LocationUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Location>(
      id,
      columnValues: columnValues(Location.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Location]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Location>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<LocationUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<LocationTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<LocationTable>? orderBy,
    _i1.OrderByListBuilder<LocationTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Location>(
      columnValues: columnValues(Location.t.updateTable),
      where: where(Location.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Location.t),
      orderByList: orderByList?.call(Location.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Location]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Location>> delete(
    _i1.Session session,
    List<Location> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Location>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Location].
  Future<Location> deleteRow(
    _i1.Session session,
    Location row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Location>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Location>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<LocationTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Location>(
      where: where(Location.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<LocationTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Location>(
      where: where?.call(Location.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class LocationAttachRepository {
  const LocationAttachRepository._();

  /// Creates a relation between this [Location] and the given [MatchSchedulePairingAttempt]s
  /// by setting each [MatchSchedulePairingAttempt]'s foreign key `locationId` to refer to this [Location].
  Future<void> pairingAttempts(
    _i1.Session session,
    Location location,
    List<_i2.MatchSchedulePairingAttempt> matchSchedulePairingAttempt, {
    _i1.Transaction? transaction,
  }) async {
    if (matchSchedulePairingAttempt.any((e) => e.id == null)) {
      throw ArgumentError.notNull('matchSchedulePairingAttempt.id');
    }
    if (location.id == null) {
      throw ArgumentError.notNull('location.id');
    }

    var $matchSchedulePairingAttempt = matchSchedulePairingAttempt
        .map((e) => e.copyWith(locationId: location.id))
        .toList();
    await session.db.update<_i2.MatchSchedulePairingAttempt>(
      $matchSchedulePairingAttempt,
      columns: [_i2.MatchSchedulePairingAttempt.t.locationId],
      transaction: transaction,
    );
  }
}

class LocationAttachRowRepository {
  const LocationAttachRowRepository._();

  /// Creates a relation between this [Location] and the given [MatchSchedulePairingAttempt]
  /// by setting the [MatchSchedulePairingAttempt]'s foreign key `locationId` to refer to this [Location].
  Future<void> pairingAttempts(
    _i1.Session session,
    Location location,
    _i2.MatchSchedulePairingAttempt matchSchedulePairingAttempt, {
    _i1.Transaction? transaction,
  }) async {
    if (matchSchedulePairingAttempt.id == null) {
      throw ArgumentError.notNull('matchSchedulePairingAttempt.id');
    }
    if (location.id == null) {
      throw ArgumentError.notNull('location.id');
    }

    var $matchSchedulePairingAttempt = matchSchedulePairingAttempt.copyWith(
      locationId: location.id,
    );
    await session.db.updateRow<_i2.MatchSchedulePairingAttempt>(
      $matchSchedulePairingAttempt,
      columns: [_i2.MatchSchedulePairingAttempt.t.locationId],
      transaction: transaction,
    );
  }
}

class LocationDetachRepository {
  const LocationDetachRepository._();

  /// Detaches the relation between this [Location] and the given [MatchSchedulePairingAttempt]
  /// by setting the [MatchSchedulePairingAttempt]'s foreign key `locationId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> pairingAttempts(
    _i1.Session session,
    List<_i2.MatchSchedulePairingAttempt> matchSchedulePairingAttempt, {
    _i1.Transaction? transaction,
  }) async {
    if (matchSchedulePairingAttempt.any((e) => e.id == null)) {
      throw ArgumentError.notNull('matchSchedulePairingAttempt.id');
    }

    var $matchSchedulePairingAttempt = matchSchedulePairingAttempt
        .map((e) => e.copyWith(locationId: null))
        .toList();
    await session.db.update<_i2.MatchSchedulePairingAttempt>(
      $matchSchedulePairingAttempt,
      columns: [_i2.MatchSchedulePairingAttempt.t.locationId],
      transaction: transaction,
    );
  }
}

class LocationDetachRowRepository {
  const LocationDetachRowRepository._();

  /// Detaches the relation between this [Location] and the given [MatchSchedulePairingAttempt]
  /// by setting the [MatchSchedulePairingAttempt]'s foreign key `locationId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> pairingAttempts(
    _i1.Session session,
    _i2.MatchSchedulePairingAttempt matchSchedulePairingAttempt, {
    _i1.Transaction? transaction,
  }) async {
    if (matchSchedulePairingAttempt.id == null) {
      throw ArgumentError.notNull('matchSchedulePairingAttempt.id');
    }

    var $matchSchedulePairingAttempt = matchSchedulePairingAttempt.copyWith(
      locationId: null,
    );
    await session.db.updateRow<_i2.MatchSchedulePairingAttempt>(
      $matchSchedulePairingAttempt,
      columns: [_i2.MatchSchedulePairingAttempt.t.locationId],
      transaction: transaction,
    );
  }
}
