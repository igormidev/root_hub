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
import '../../entities/match_making/google_place_location.dart' as _i2;
import '../../entities/match_making/manual_input_location.dart' as _i3;
import '../../entities/match_making/match_schedule.dart' as _i4;
import '../../entities/match/played_match.dart' as _i5;
import 'package:root_hub_server/src/generated/protocol.dart' as _i6;

abstract class Location
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Location._({
    this.id,
    this.googlePlaceLocationId,
    this.googlePlaceLocation,
    this.manualInputLocationId,
    this.manualInputLocation,
    this.pairingAttempts,
    this.playedMatches,
  });

  factory Location({
    int? id,
    int? googlePlaceLocationId,
    _i2.GooglePlaceLocation? googlePlaceLocation,
    int? manualInputLocationId,
    _i3.ManualInputLocation? manualInputLocation,
    List<_i4.MatchSchedulePairingAttempt>? pairingAttempts,
    List<_i5.PlayedMatch>? playedMatches,
  }) = _LocationImpl;

  factory Location.fromJson(Map<String, dynamic> jsonSerialization) {
    return Location(
      id: jsonSerialization['id'] as int?,
      googlePlaceLocationId: jsonSerialization['googlePlaceLocationId'] as int?,
      googlePlaceLocation: jsonSerialization['googlePlaceLocation'] == null
          ? null
          : _i6.Protocol().deserialize<_i2.GooglePlaceLocation>(
              jsonSerialization['googlePlaceLocation'],
            ),
      manualInputLocationId: jsonSerialization['manualInputLocationId'] as int?,
      manualInputLocation: jsonSerialization['manualInputLocation'] == null
          ? null
          : _i6.Protocol().deserialize<_i3.ManualInputLocation>(
              jsonSerialization['manualInputLocation'],
            ),
      pairingAttempts: jsonSerialization['pairingAttempts'] == null
          ? null
          : _i6.Protocol().deserialize<List<_i4.MatchSchedulePairingAttempt>>(
              jsonSerialization['pairingAttempts'],
            ),
      playedMatches: jsonSerialization['playedMatches'] == null
          ? null
          : _i6.Protocol().deserialize<List<_i5.PlayedMatch>>(
              jsonSerialization['playedMatches'],
            ),
    );
  }

  static final t = LocationTable();

  static const db = LocationRepository._();

  @override
  int? id;

  int? googlePlaceLocationId;

  _i2.GooglePlaceLocation? googlePlaceLocation;

  int? manualInputLocationId;

  _i3.ManualInputLocation? manualInputLocation;

  List<_i4.MatchSchedulePairingAttempt>? pairingAttempts;

  List<_i5.PlayedMatch>? playedMatches;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Location]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Location copyWith({
    int? id,
    int? googlePlaceLocationId,
    _i2.GooglePlaceLocation? googlePlaceLocation,
    int? manualInputLocationId,
    _i3.ManualInputLocation? manualInputLocation,
    List<_i4.MatchSchedulePairingAttempt>? pairingAttempts,
    List<_i5.PlayedMatch>? playedMatches,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Location',
      if (id != null) 'id': id,
      if (googlePlaceLocationId != null)
        'googlePlaceLocationId': googlePlaceLocationId,
      if (googlePlaceLocation != null)
        'googlePlaceLocation': googlePlaceLocation?.toJson(),
      if (manualInputLocationId != null)
        'manualInputLocationId': manualInputLocationId,
      if (manualInputLocation != null)
        'manualInputLocation': manualInputLocation?.toJson(),
      if (pairingAttempts != null)
        'pairingAttempts': pairingAttempts?.toJson(
          valueToJson: (v) => v.toJson(),
        ),
      if (playedMatches != null)
        'playedMatches': playedMatches?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Location',
      if (id != null) 'id': id,
      if (googlePlaceLocationId != null)
        'googlePlaceLocationId': googlePlaceLocationId,
      if (googlePlaceLocation != null)
        'googlePlaceLocation': googlePlaceLocation?.toJsonForProtocol(),
      if (manualInputLocationId != null)
        'manualInputLocationId': manualInputLocationId,
      if (manualInputLocation != null)
        'manualInputLocation': manualInputLocation?.toJsonForProtocol(),
      if (pairingAttempts != null)
        'pairingAttempts': pairingAttempts?.toJson(
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
      if (playedMatches != null)
        'playedMatches': playedMatches?.toJson(
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
    };
  }

  static LocationInclude include({
    _i2.GooglePlaceLocationInclude? googlePlaceLocation,
    _i3.ManualInputLocationInclude? manualInputLocation,
    _i4.MatchSchedulePairingAttemptIncludeList? pairingAttempts,
    _i5.PlayedMatchIncludeList? playedMatches,
  }) {
    return LocationInclude._(
      googlePlaceLocation: googlePlaceLocation,
      manualInputLocation: manualInputLocation,
      pairingAttempts: pairingAttempts,
      playedMatches: playedMatches,
    );
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
    int? googlePlaceLocationId,
    _i2.GooglePlaceLocation? googlePlaceLocation,
    int? manualInputLocationId,
    _i3.ManualInputLocation? manualInputLocation,
    List<_i4.MatchSchedulePairingAttempt>? pairingAttempts,
    List<_i5.PlayedMatch>? playedMatches,
  }) : super._(
         id: id,
         googlePlaceLocationId: googlePlaceLocationId,
         googlePlaceLocation: googlePlaceLocation,
         manualInputLocationId: manualInputLocationId,
         manualInputLocation: manualInputLocation,
         pairingAttempts: pairingAttempts,
         playedMatches: playedMatches,
       );

  /// Returns a shallow copy of this [Location]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Location copyWith({
    Object? id = _Undefined,
    Object? googlePlaceLocationId = _Undefined,
    Object? googlePlaceLocation = _Undefined,
    Object? manualInputLocationId = _Undefined,
    Object? manualInputLocation = _Undefined,
    Object? pairingAttempts = _Undefined,
    Object? playedMatches = _Undefined,
  }) {
    return Location(
      id: id is int? ? id : this.id,
      googlePlaceLocationId: googlePlaceLocationId is int?
          ? googlePlaceLocationId
          : this.googlePlaceLocationId,
      googlePlaceLocation: googlePlaceLocation is _i2.GooglePlaceLocation?
          ? googlePlaceLocation
          : this.googlePlaceLocation?.copyWith(),
      manualInputLocationId: manualInputLocationId is int?
          ? manualInputLocationId
          : this.manualInputLocationId,
      manualInputLocation: manualInputLocation is _i3.ManualInputLocation?
          ? manualInputLocation
          : this.manualInputLocation?.copyWith(),
      pairingAttempts: pairingAttempts is List<_i4.MatchSchedulePairingAttempt>?
          ? pairingAttempts
          : this.pairingAttempts?.map((e0) => e0.copyWith()).toList(),
      playedMatches: playedMatches is List<_i5.PlayedMatch>?
          ? playedMatches
          : this.playedMatches?.map((e0) => e0.copyWith()).toList(),
    );
  }
}

class LocationUpdateTable extends _i1.UpdateTable<LocationTable> {
  LocationUpdateTable(super.table);

  _i1.ColumnValue<int, int> googlePlaceLocationId(int? value) =>
      _i1.ColumnValue(
        table.googlePlaceLocationId,
        value,
      );

  _i1.ColumnValue<int, int> manualInputLocationId(int? value) =>
      _i1.ColumnValue(
        table.manualInputLocationId,
        value,
      );
}

class LocationTable extends _i1.Table<int?> {
  LocationTable({super.tableRelation}) : super(tableName: 'locations') {
    updateTable = LocationUpdateTable(this);
    googlePlaceLocationId = _i1.ColumnInt(
      'googlePlaceLocationId',
      this,
    );
    manualInputLocationId = _i1.ColumnInt(
      'manualInputLocationId',
      this,
    );
  }

  late final LocationUpdateTable updateTable;

  late final _i1.ColumnInt googlePlaceLocationId;

  _i2.GooglePlaceLocationTable? _googlePlaceLocation;

  late final _i1.ColumnInt manualInputLocationId;

  _i3.ManualInputLocationTable? _manualInputLocation;

  _i4.MatchSchedulePairingAttemptTable? ___pairingAttempts;

  _i1.ManyRelation<_i4.MatchSchedulePairingAttemptTable>? _pairingAttempts;

  _i5.PlayedMatchTable? ___playedMatches;

  _i1.ManyRelation<_i5.PlayedMatchTable>? _playedMatches;

  _i2.GooglePlaceLocationTable get googlePlaceLocation {
    if (_googlePlaceLocation != null) return _googlePlaceLocation!;
    _googlePlaceLocation = _i1.createRelationTable(
      relationFieldName: 'googlePlaceLocation',
      field: Location.t.googlePlaceLocationId,
      foreignField: _i2.GooglePlaceLocation.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.GooglePlaceLocationTable(tableRelation: foreignTableRelation),
    );
    return _googlePlaceLocation!;
  }

  _i3.ManualInputLocationTable get manualInputLocation {
    if (_manualInputLocation != null) return _manualInputLocation!;
    _manualInputLocation = _i1.createRelationTable(
      relationFieldName: 'manualInputLocation',
      field: Location.t.manualInputLocationId,
      foreignField: _i3.ManualInputLocation.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.ManualInputLocationTable(tableRelation: foreignTableRelation),
    );
    return _manualInputLocation!;
  }

  _i4.MatchSchedulePairingAttemptTable get __pairingAttempts {
    if (___pairingAttempts != null) return ___pairingAttempts!;
    ___pairingAttempts = _i1.createRelationTable(
      relationFieldName: '__pairingAttempts',
      field: Location.t.id,
      foreignField: _i4.MatchSchedulePairingAttempt.t.locationId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.MatchSchedulePairingAttemptTable(
            tableRelation: foreignTableRelation,
          ),
    );
    return ___pairingAttempts!;
  }

  _i5.PlayedMatchTable get __playedMatches {
    if (___playedMatches != null) return ___playedMatches!;
    ___playedMatches = _i1.createRelationTable(
      relationFieldName: '__playedMatches',
      field: Location.t.id,
      foreignField: _i5.PlayedMatch.t.locationId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.PlayedMatchTable(tableRelation: foreignTableRelation),
    );
    return ___playedMatches!;
  }

  _i1.ManyRelation<_i4.MatchSchedulePairingAttemptTable> get pairingAttempts {
    if (_pairingAttempts != null) return _pairingAttempts!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'pairingAttempts',
      field: Location.t.id,
      foreignField: _i4.MatchSchedulePairingAttempt.t.locationId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.MatchSchedulePairingAttemptTable(
            tableRelation: foreignTableRelation,
          ),
    );
    _pairingAttempts = _i1.ManyRelation<_i4.MatchSchedulePairingAttemptTable>(
      tableWithRelations: relationTable,
      table: _i4.MatchSchedulePairingAttemptTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _pairingAttempts!;
  }

  _i1.ManyRelation<_i5.PlayedMatchTable> get playedMatches {
    if (_playedMatches != null) return _playedMatches!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'playedMatches',
      field: Location.t.id,
      foreignField: _i5.PlayedMatch.t.locationId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.PlayedMatchTable(tableRelation: foreignTableRelation),
    );
    _playedMatches = _i1.ManyRelation<_i5.PlayedMatchTable>(
      tableWithRelations: relationTable,
      table: _i5.PlayedMatchTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _playedMatches!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    googlePlaceLocationId,
    manualInputLocationId,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'googlePlaceLocation') {
      return googlePlaceLocation;
    }
    if (relationField == 'manualInputLocation') {
      return manualInputLocation;
    }
    if (relationField == 'pairingAttempts') {
      return __pairingAttempts;
    }
    if (relationField == 'playedMatches') {
      return __playedMatches;
    }
    return null;
  }
}

class LocationInclude extends _i1.IncludeObject {
  LocationInclude._({
    _i2.GooglePlaceLocationInclude? googlePlaceLocation,
    _i3.ManualInputLocationInclude? manualInputLocation,
    _i4.MatchSchedulePairingAttemptIncludeList? pairingAttempts,
    _i5.PlayedMatchIncludeList? playedMatches,
  }) {
    _googlePlaceLocation = googlePlaceLocation;
    _manualInputLocation = manualInputLocation;
    _pairingAttempts = pairingAttempts;
    _playedMatches = playedMatches;
  }

  _i2.GooglePlaceLocationInclude? _googlePlaceLocation;

  _i3.ManualInputLocationInclude? _manualInputLocation;

  _i4.MatchSchedulePairingAttemptIncludeList? _pairingAttempts;

  _i5.PlayedMatchIncludeList? _playedMatches;

  @override
  Map<String, _i1.Include?> get includes => {
    'googlePlaceLocation': _googlePlaceLocation,
    'manualInputLocation': _manualInputLocation,
    'pairingAttempts': _pairingAttempts,
    'playedMatches': _playedMatches,
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
    List<_i4.MatchSchedulePairingAttempt> matchSchedulePairingAttempt, {
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
    await session.db.update<_i4.MatchSchedulePairingAttempt>(
      $matchSchedulePairingAttempt,
      columns: [_i4.MatchSchedulePairingAttempt.t.locationId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Location] and the given [PlayedMatch]s
  /// by setting each [PlayedMatch]'s foreign key `locationId` to refer to this [Location].
  Future<void> playedMatches(
    _i1.Session session,
    Location location,
    List<_i5.PlayedMatch> playedMatch, {
    _i1.Transaction? transaction,
  }) async {
    if (playedMatch.any((e) => e.id == null)) {
      throw ArgumentError.notNull('playedMatch.id');
    }
    if (location.id == null) {
      throw ArgumentError.notNull('location.id');
    }

    var $playedMatch = playedMatch
        .map((e) => e.copyWith(locationId: location.id))
        .toList();
    await session.db.update<_i5.PlayedMatch>(
      $playedMatch,
      columns: [_i5.PlayedMatch.t.locationId],
      transaction: transaction,
    );
  }
}

class LocationAttachRowRepository {
  const LocationAttachRowRepository._();

  /// Creates a relation between the given [Location] and [GooglePlaceLocation]
  /// by setting the [Location]'s foreign key `googlePlaceLocationId` to refer to the [GooglePlaceLocation].
  Future<void> googlePlaceLocation(
    _i1.Session session,
    Location location,
    _i2.GooglePlaceLocation googlePlaceLocation, {
    _i1.Transaction? transaction,
  }) async {
    if (location.id == null) {
      throw ArgumentError.notNull('location.id');
    }
    if (googlePlaceLocation.id == null) {
      throw ArgumentError.notNull('googlePlaceLocation.id');
    }

    var $location = location.copyWith(
      googlePlaceLocationId: googlePlaceLocation.id,
    );
    await session.db.updateRow<Location>(
      $location,
      columns: [Location.t.googlePlaceLocationId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [Location] and [ManualInputLocation]
  /// by setting the [Location]'s foreign key `manualInputLocationId` to refer to the [ManualInputLocation].
  Future<void> manualInputLocation(
    _i1.Session session,
    Location location,
    _i3.ManualInputLocation manualInputLocation, {
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
    await session.db.updateRow<Location>(
      $location,
      columns: [Location.t.manualInputLocationId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Location] and the given [MatchSchedulePairingAttempt]
  /// by setting the [MatchSchedulePairingAttempt]'s foreign key `locationId` to refer to this [Location].
  Future<void> pairingAttempts(
    _i1.Session session,
    Location location,
    _i4.MatchSchedulePairingAttempt matchSchedulePairingAttempt, {
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
    await session.db.updateRow<_i4.MatchSchedulePairingAttempt>(
      $matchSchedulePairingAttempt,
      columns: [_i4.MatchSchedulePairingAttempt.t.locationId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Location] and the given [PlayedMatch]
  /// by setting the [PlayedMatch]'s foreign key `locationId` to refer to this [Location].
  Future<void> playedMatches(
    _i1.Session session,
    Location location,
    _i5.PlayedMatch playedMatch, {
    _i1.Transaction? transaction,
  }) async {
    if (playedMatch.id == null) {
      throw ArgumentError.notNull('playedMatch.id');
    }
    if (location.id == null) {
      throw ArgumentError.notNull('location.id');
    }

    var $playedMatch = playedMatch.copyWith(locationId: location.id);
    await session.db.updateRow<_i5.PlayedMatch>(
      $playedMatch,
      columns: [_i5.PlayedMatch.t.locationId],
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
    List<_i4.MatchSchedulePairingAttempt> matchSchedulePairingAttempt, {
    _i1.Transaction? transaction,
  }) async {
    if (matchSchedulePairingAttempt.any((e) => e.id == null)) {
      throw ArgumentError.notNull('matchSchedulePairingAttempt.id');
    }

    var $matchSchedulePairingAttempt = matchSchedulePairingAttempt
        .map((e) => e.copyWith(locationId: null))
        .toList();
    await session.db.update<_i4.MatchSchedulePairingAttempt>(
      $matchSchedulePairingAttempt,
      columns: [_i4.MatchSchedulePairingAttempt.t.locationId],
      transaction: transaction,
    );
  }
}

class LocationDetachRowRepository {
  const LocationDetachRowRepository._();

  /// Detaches the relation between this [Location] and the [GooglePlaceLocation] set in `googlePlaceLocation`
  /// by setting the [Location]'s foreign key `googlePlaceLocationId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> googlePlaceLocation(
    _i1.Session session,
    Location location, {
    _i1.Transaction? transaction,
  }) async {
    if (location.id == null) {
      throw ArgumentError.notNull('location.id');
    }

    var $location = location.copyWith(googlePlaceLocationId: null);
    await session.db.updateRow<Location>(
      $location,
      columns: [Location.t.googlePlaceLocationId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [Location] and the [ManualInputLocation] set in `manualInputLocation`
  /// by setting the [Location]'s foreign key `manualInputLocationId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> manualInputLocation(
    _i1.Session session,
    Location location, {
    _i1.Transaction? transaction,
  }) async {
    if (location.id == null) {
      throw ArgumentError.notNull('location.id');
    }

    var $location = location.copyWith(manualInputLocationId: null);
    await session.db.updateRow<Location>(
      $location,
      columns: [Location.t.manualInputLocationId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [Location] and the given [MatchSchedulePairingAttempt]
  /// by setting the [MatchSchedulePairingAttempt]'s foreign key `locationId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> pairingAttempts(
    _i1.Session session,
    _i4.MatchSchedulePairingAttempt matchSchedulePairingAttempt, {
    _i1.Transaction? transaction,
  }) async {
    if (matchSchedulePairingAttempt.id == null) {
      throw ArgumentError.notNull('matchSchedulePairingAttempt.id');
    }

    var $matchSchedulePairingAttempt = matchSchedulePairingAttempt.copyWith(
      locationId: null,
    );
    await session.db.updateRow<_i4.MatchSchedulePairingAttempt>(
      $matchSchedulePairingAttempt,
      columns: [_i4.MatchSchedulePairingAttempt.t.locationId],
      transaction: transaction,
    );
  }
}
