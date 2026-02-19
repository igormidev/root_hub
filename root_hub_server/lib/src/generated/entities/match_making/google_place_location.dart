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
import '../../entities/match_making/location.dart' as _i2;
import 'package:root_hub_server/src/generated/protocol.dart' as _i3;

abstract class GooglePlaceLocation
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  GooglePlaceLocation._({
    this.id,
    required this.providerPlaceId,
    required this.name,
    this.formattedAddress,
    this.shortFormattedAddress,
    required this.lat,
    required this.lng,
    this.url,
    this.websiteUri,
    this.phoneNumber,
    this.types,
    this.primaryType,
    this.rating,
    this.userRatingCount,
    this.priceLevel,
    this.primaryPhotoName,
    this.timezone,
    bool? isPublicPlace,
    this.notes,
    this.location,
    required this.createdAt,
    required this.updatedAt,
  }) : isPublicPlace = isPublicPlace ?? true;

  factory GooglePlaceLocation({
    int? id,
    required String providerPlaceId,
    required String name,
    String? formattedAddress,
    String? shortFormattedAddress,
    required double lat,
    required double lng,
    String? url,
    String? websiteUri,
    String? phoneNumber,
    List<String>? types,
    String? primaryType,
    double? rating,
    int? userRatingCount,
    String? priceLevel,
    String? primaryPhotoName,
    String? timezone,
    bool? isPublicPlace,
    String? notes,
    _i2.Location? location,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _GooglePlaceLocationImpl;

  factory GooglePlaceLocation.fromJson(Map<String, dynamic> jsonSerialization) {
    return GooglePlaceLocation(
      id: jsonSerialization['id'] as int?,
      providerPlaceId: jsonSerialization['providerPlaceId'] as String,
      name: jsonSerialization['name'] as String,
      formattedAddress: jsonSerialization['formattedAddress'] as String?,
      shortFormattedAddress:
          jsonSerialization['shortFormattedAddress'] as String?,
      lat: (jsonSerialization['lat'] as num).toDouble(),
      lng: (jsonSerialization['lng'] as num).toDouble(),
      url: jsonSerialization['url'] as String?,
      websiteUri: jsonSerialization['websiteUri'] as String?,
      phoneNumber: jsonSerialization['phoneNumber'] as String?,
      types: jsonSerialization['types'] == null
          ? null
          : _i3.Protocol().deserialize<List<String>>(
              jsonSerialization['types'],
            ),
      primaryType: jsonSerialization['primaryType'] as String?,
      rating: (jsonSerialization['rating'] as num?)?.toDouble(),
      userRatingCount: jsonSerialization['userRatingCount'] as int?,
      priceLevel: jsonSerialization['priceLevel'] as String?,
      primaryPhotoName: jsonSerialization['primaryPhotoName'] as String?,
      timezone: jsonSerialization['timezone'] as String?,
      isPublicPlace: jsonSerialization['isPublicPlace'] as bool?,
      notes: jsonSerialization['notes'] as String?,
      location: jsonSerialization['location'] == null
          ? null
          : _i3.Protocol().deserialize<_i2.Location>(
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

  static final t = GooglePlaceLocationTable();

  static const db = GooglePlaceLocationRepository._();

  @override
  int? id;

  String providerPlaceId;

  String name;

  String? formattedAddress;

  String? shortFormattedAddress;

  double lat;

  double lng;

  String? url;

  String? websiteUri;

  String? phoneNumber;

  List<String>? types;

  String? primaryType;

  double? rating;

  int? userRatingCount;

  String? priceLevel;

  String? primaryPhotoName;

  String? timezone;

  bool isPublicPlace;

  String? notes;

  _i2.Location? location;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [GooglePlaceLocation]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  GooglePlaceLocation copyWith({
    int? id,
    String? providerPlaceId,
    String? name,
    String? formattedAddress,
    String? shortFormattedAddress,
    double? lat,
    double? lng,
    String? url,
    String? websiteUri,
    String? phoneNumber,
    List<String>? types,
    String? primaryType,
    double? rating,
    int? userRatingCount,
    String? priceLevel,
    String? primaryPhotoName,
    String? timezone,
    bool? isPublicPlace,
    String? notes,
    _i2.Location? location,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'GooglePlaceLocation',
      if (id != null) 'id': id,
      'providerPlaceId': providerPlaceId,
      'name': name,
      if (formattedAddress != null) 'formattedAddress': formattedAddress,
      if (shortFormattedAddress != null)
        'shortFormattedAddress': shortFormattedAddress,
      'lat': lat,
      'lng': lng,
      if (url != null) 'url': url,
      if (websiteUri != null) 'websiteUri': websiteUri,
      if (phoneNumber != null) 'phoneNumber': phoneNumber,
      if (types != null) 'types': types?.toJson(),
      if (primaryType != null) 'primaryType': primaryType,
      if (rating != null) 'rating': rating,
      if (userRatingCount != null) 'userRatingCount': userRatingCount,
      if (priceLevel != null) 'priceLevel': priceLevel,
      if (primaryPhotoName != null) 'primaryPhotoName': primaryPhotoName,
      if (timezone != null) 'timezone': timezone,
      'isPublicPlace': isPublicPlace,
      if (notes != null) 'notes': notes,
      if (location != null) 'location': location?.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'GooglePlaceLocation',
      if (id != null) 'id': id,
      'providerPlaceId': providerPlaceId,
      'name': name,
      if (formattedAddress != null) 'formattedAddress': formattedAddress,
      if (shortFormattedAddress != null)
        'shortFormattedAddress': shortFormattedAddress,
      'lat': lat,
      'lng': lng,
      if (url != null) 'url': url,
      if (websiteUri != null) 'websiteUri': websiteUri,
      if (phoneNumber != null) 'phoneNumber': phoneNumber,
      if (types != null) 'types': types?.toJson(),
      if (primaryType != null) 'primaryType': primaryType,
      if (rating != null) 'rating': rating,
      if (userRatingCount != null) 'userRatingCount': userRatingCount,
      if (priceLevel != null) 'priceLevel': priceLevel,
      if (primaryPhotoName != null) 'primaryPhotoName': primaryPhotoName,
      if (timezone != null) 'timezone': timezone,
      'isPublicPlace': isPublicPlace,
      if (notes != null) 'notes': notes,
      if (location != null) 'location': location?.toJsonForProtocol(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static GooglePlaceLocationInclude include({_i2.LocationInclude? location}) {
    return GooglePlaceLocationInclude._(location: location);
  }

  static GooglePlaceLocationIncludeList includeList({
    _i1.WhereExpressionBuilder<GooglePlaceLocationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GooglePlaceLocationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GooglePlaceLocationTable>? orderByList,
    GooglePlaceLocationInclude? include,
  }) {
    return GooglePlaceLocationIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(GooglePlaceLocation.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(GooglePlaceLocation.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _GooglePlaceLocationImpl extends GooglePlaceLocation {
  _GooglePlaceLocationImpl({
    int? id,
    required String providerPlaceId,
    required String name,
    String? formattedAddress,
    String? shortFormattedAddress,
    required double lat,
    required double lng,
    String? url,
    String? websiteUri,
    String? phoneNumber,
    List<String>? types,
    String? primaryType,
    double? rating,
    int? userRatingCount,
    String? priceLevel,
    String? primaryPhotoName,
    String? timezone,
    bool? isPublicPlace,
    String? notes,
    _i2.Location? location,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
         id: id,
         providerPlaceId: providerPlaceId,
         name: name,
         formattedAddress: formattedAddress,
         shortFormattedAddress: shortFormattedAddress,
         lat: lat,
         lng: lng,
         url: url,
         websiteUri: websiteUri,
         phoneNumber: phoneNumber,
         types: types,
         primaryType: primaryType,
         rating: rating,
         userRatingCount: userRatingCount,
         priceLevel: priceLevel,
         primaryPhotoName: primaryPhotoName,
         timezone: timezone,
         isPublicPlace: isPublicPlace,
         notes: notes,
         location: location,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [GooglePlaceLocation]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  GooglePlaceLocation copyWith({
    Object? id = _Undefined,
    String? providerPlaceId,
    String? name,
    Object? formattedAddress = _Undefined,
    Object? shortFormattedAddress = _Undefined,
    double? lat,
    double? lng,
    Object? url = _Undefined,
    Object? websiteUri = _Undefined,
    Object? phoneNumber = _Undefined,
    Object? types = _Undefined,
    Object? primaryType = _Undefined,
    Object? rating = _Undefined,
    Object? userRatingCount = _Undefined,
    Object? priceLevel = _Undefined,
    Object? primaryPhotoName = _Undefined,
    Object? timezone = _Undefined,
    bool? isPublicPlace,
    Object? notes = _Undefined,
    Object? location = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return GooglePlaceLocation(
      id: id is int? ? id : this.id,
      providerPlaceId: providerPlaceId ?? this.providerPlaceId,
      name: name ?? this.name,
      formattedAddress: formattedAddress is String?
          ? formattedAddress
          : this.formattedAddress,
      shortFormattedAddress: shortFormattedAddress is String?
          ? shortFormattedAddress
          : this.shortFormattedAddress,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      url: url is String? ? url : this.url,
      websiteUri: websiteUri is String? ? websiteUri : this.websiteUri,
      phoneNumber: phoneNumber is String? ? phoneNumber : this.phoneNumber,
      types: types is List<String>?
          ? types
          : this.types?.map((e0) => e0).toList(),
      primaryType: primaryType is String? ? primaryType : this.primaryType,
      rating: rating is double? ? rating : this.rating,
      userRatingCount: userRatingCount is int?
          ? userRatingCount
          : this.userRatingCount,
      priceLevel: priceLevel is String? ? priceLevel : this.priceLevel,
      primaryPhotoName: primaryPhotoName is String?
          ? primaryPhotoName
          : this.primaryPhotoName,
      timezone: timezone is String? ? timezone : this.timezone,
      isPublicPlace: isPublicPlace ?? this.isPublicPlace,
      notes: notes is String? ? notes : this.notes,
      location: location is _i2.Location?
          ? location
          : this.location?.copyWith(),
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class GooglePlaceLocationUpdateTable
    extends _i1.UpdateTable<GooglePlaceLocationTable> {
  GooglePlaceLocationUpdateTable(super.table);

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

  _i1.ColumnValue<String, String> shortFormattedAddress(String? value) =>
      _i1.ColumnValue(
        table.shortFormattedAddress,
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

  _i1.ColumnValue<String, String> websiteUri(String? value) => _i1.ColumnValue(
    table.websiteUri,
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

  _i1.ColumnValue<String, String> primaryType(String? value) => _i1.ColumnValue(
    table.primaryType,
    value,
  );

  _i1.ColumnValue<double, double> rating(double? value) => _i1.ColumnValue(
    table.rating,
    value,
  );

  _i1.ColumnValue<int, int> userRatingCount(int? value) => _i1.ColumnValue(
    table.userRatingCount,
    value,
  );

  _i1.ColumnValue<String, String> priceLevel(String? value) => _i1.ColumnValue(
    table.priceLevel,
    value,
  );

  _i1.ColumnValue<String, String> primaryPhotoName(String? value) =>
      _i1.ColumnValue(
        table.primaryPhotoName,
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

class GooglePlaceLocationTable extends _i1.Table<int?> {
  GooglePlaceLocationTable({super.tableRelation})
    : super(tableName: 'google_place_locations') {
    updateTable = GooglePlaceLocationUpdateTable(this);
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
    shortFormattedAddress = _i1.ColumnString(
      'shortFormattedAddress',
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
    websiteUri = _i1.ColumnString(
      'websiteUri',
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
    primaryType = _i1.ColumnString(
      'primaryType',
      this,
    );
    rating = _i1.ColumnDouble(
      'rating',
      this,
    );
    userRatingCount = _i1.ColumnInt(
      'userRatingCount',
      this,
    );
    priceLevel = _i1.ColumnString(
      'priceLevel',
      this,
    );
    primaryPhotoName = _i1.ColumnString(
      'primaryPhotoName',
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

  late final GooglePlaceLocationUpdateTable updateTable;

  late final _i1.ColumnString providerPlaceId;

  late final _i1.ColumnString name;

  late final _i1.ColumnString formattedAddress;

  late final _i1.ColumnString shortFormattedAddress;

  late final _i1.ColumnDouble lat;

  late final _i1.ColumnDouble lng;

  late final _i1.ColumnString url;

  late final _i1.ColumnString websiteUri;

  late final _i1.ColumnString phoneNumber;

  late final _i1.ColumnSerializable<List<String>> types;

  late final _i1.ColumnString primaryType;

  late final _i1.ColumnDouble rating;

  late final _i1.ColumnInt userRatingCount;

  late final _i1.ColumnString priceLevel;

  late final _i1.ColumnString primaryPhotoName;

  late final _i1.ColumnString timezone;

  late final _i1.ColumnBool isPublicPlace;

  late final _i1.ColumnString notes;

  _i2.LocationTable? _location;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  _i2.LocationTable get location {
    if (_location != null) return _location!;
    _location = _i1.createRelationTable(
      relationFieldName: 'location',
      field: GooglePlaceLocation.t.id,
      foreignField: _i2.Location.t.googlePlaceLocationId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.LocationTable(tableRelation: foreignTableRelation),
    );
    return _location!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    providerPlaceId,
    name,
    formattedAddress,
    shortFormattedAddress,
    lat,
    lng,
    url,
    websiteUri,
    phoneNumber,
    types,
    primaryType,
    rating,
    userRatingCount,
    priceLevel,
    primaryPhotoName,
    timezone,
    isPublicPlace,
    notes,
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

class GooglePlaceLocationInclude extends _i1.IncludeObject {
  GooglePlaceLocationInclude._({_i2.LocationInclude? location}) {
    _location = location;
  }

  _i2.LocationInclude? _location;

  @override
  Map<String, _i1.Include?> get includes => {'location': _location};

  @override
  _i1.Table<int?> get table => GooglePlaceLocation.t;
}

class GooglePlaceLocationIncludeList extends _i1.IncludeList {
  GooglePlaceLocationIncludeList._({
    _i1.WhereExpressionBuilder<GooglePlaceLocationTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(GooglePlaceLocation.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => GooglePlaceLocation.t;
}

class GooglePlaceLocationRepository {
  const GooglePlaceLocationRepository._();

  final attachRow = const GooglePlaceLocationAttachRowRepository._();

  final detachRow = const GooglePlaceLocationDetachRowRepository._();

  /// Returns a list of [GooglePlaceLocation]s matching the given query parameters.
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
  Future<List<GooglePlaceLocation>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GooglePlaceLocationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GooglePlaceLocationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GooglePlaceLocationTable>? orderByList,
    _i1.Transaction? transaction,
    GooglePlaceLocationInclude? include,
  }) async {
    return session.db.find<GooglePlaceLocation>(
      where: where?.call(GooglePlaceLocation.t),
      orderBy: orderBy?.call(GooglePlaceLocation.t),
      orderByList: orderByList?.call(GooglePlaceLocation.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [GooglePlaceLocation] matching the given query parameters.
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
  Future<GooglePlaceLocation?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GooglePlaceLocationTable>? where,
    int? offset,
    _i1.OrderByBuilder<GooglePlaceLocationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GooglePlaceLocationTable>? orderByList,
    _i1.Transaction? transaction,
    GooglePlaceLocationInclude? include,
  }) async {
    return session.db.findFirstRow<GooglePlaceLocation>(
      where: where?.call(GooglePlaceLocation.t),
      orderBy: orderBy?.call(GooglePlaceLocation.t),
      orderByList: orderByList?.call(GooglePlaceLocation.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [GooglePlaceLocation] by its [id] or null if no such row exists.
  Future<GooglePlaceLocation?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    GooglePlaceLocationInclude? include,
  }) async {
    return session.db.findById<GooglePlaceLocation>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [GooglePlaceLocation]s in the list and returns the inserted rows.
  ///
  /// The returned [GooglePlaceLocation]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<GooglePlaceLocation>> insert(
    _i1.Session session,
    List<GooglePlaceLocation> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<GooglePlaceLocation>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [GooglePlaceLocation] and returns the inserted row.
  ///
  /// The returned [GooglePlaceLocation] will have its `id` field set.
  Future<GooglePlaceLocation> insertRow(
    _i1.Session session,
    GooglePlaceLocation row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<GooglePlaceLocation>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [GooglePlaceLocation]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<GooglePlaceLocation>> update(
    _i1.Session session,
    List<GooglePlaceLocation> rows, {
    _i1.ColumnSelections<GooglePlaceLocationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<GooglePlaceLocation>(
      rows,
      columns: columns?.call(GooglePlaceLocation.t),
      transaction: transaction,
    );
  }

  /// Updates a single [GooglePlaceLocation]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<GooglePlaceLocation> updateRow(
    _i1.Session session,
    GooglePlaceLocation row, {
    _i1.ColumnSelections<GooglePlaceLocationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<GooglePlaceLocation>(
      row,
      columns: columns?.call(GooglePlaceLocation.t),
      transaction: transaction,
    );
  }

  /// Updates a single [GooglePlaceLocation] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<GooglePlaceLocation?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<GooglePlaceLocationUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<GooglePlaceLocation>(
      id,
      columnValues: columnValues(GooglePlaceLocation.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [GooglePlaceLocation]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<GooglePlaceLocation>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<GooglePlaceLocationUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<GooglePlaceLocationTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GooglePlaceLocationTable>? orderBy,
    _i1.OrderByListBuilder<GooglePlaceLocationTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<GooglePlaceLocation>(
      columnValues: columnValues(GooglePlaceLocation.t.updateTable),
      where: where(GooglePlaceLocation.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(GooglePlaceLocation.t),
      orderByList: orderByList?.call(GooglePlaceLocation.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [GooglePlaceLocation]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<GooglePlaceLocation>> delete(
    _i1.Session session,
    List<GooglePlaceLocation> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<GooglePlaceLocation>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [GooglePlaceLocation].
  Future<GooglePlaceLocation> deleteRow(
    _i1.Session session,
    GooglePlaceLocation row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<GooglePlaceLocation>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<GooglePlaceLocation>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<GooglePlaceLocationTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<GooglePlaceLocation>(
      where: where(GooglePlaceLocation.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GooglePlaceLocationTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<GooglePlaceLocation>(
      where: where?.call(GooglePlaceLocation.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class GooglePlaceLocationAttachRowRepository {
  const GooglePlaceLocationAttachRowRepository._();

  /// Creates a relation between the given [GooglePlaceLocation] and [Location]
  /// by setting the [GooglePlaceLocation]'s foreign key `id` to refer to the [Location].
  Future<void> location(
    _i1.Session session,
    GooglePlaceLocation googlePlaceLocation,
    _i2.Location location, {
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
    await session.db.updateRow<_i2.Location>(
      $location,
      columns: [_i2.Location.t.googlePlaceLocationId],
      transaction: transaction,
    );
  }
}

class GooglePlaceLocationDetachRowRepository {
  const GooglePlaceLocationDetachRowRepository._();

  /// Detaches the relation between this [GooglePlaceLocation] and the [Location] set in `location`
  /// by setting the [GooglePlaceLocation]'s foreign key `id` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> location(
    _i1.Session session,
    GooglePlaceLocation googlePlaceLocation, {
    _i1.Transaction? transaction,
  }) async {
    var $location = googlePlaceLocation.location;

    if ($location == null) {
      throw ArgumentError.notNull('googlePlaceLocation.location');
    }
    if ($location.id == null) {
      throw ArgumentError.notNull('googlePlaceLocation.location.id');
    }
    if (googlePlaceLocation.id == null) {
      throw ArgumentError.notNull('googlePlaceLocation.id');
    }

    var $$location = $location.copyWith(googlePlaceLocationId: null);
    await session.db.updateRow<_i2.Location>(
      $$location,
      columns: [_i2.Location.t.googlePlaceLocationId],
      transaction: transaction,
    );
  }
}
