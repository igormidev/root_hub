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
import '../../entities/core/match_podium.dart' as _i2;
import '../../entities/match_making/location.dart' as _i3;
import '../../entities/core/player_data.dart' as _i4;
import '../../entities/match_making/match_subscription.dart' as _i5;
import 'package:root_hub_server/src/generated/protocol.dart' as _i6;

abstract class MatchSchedulePairingAttempt
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  MatchSchedulePairingAttempt._({
    this.id,
    required this.createdAt,
    this.aditionalInfo,
    this.guidelinesDescription,
    required this.minAmountOfPlayers,
    required this.maxAmountOfPlayers,
    required this.attemptedAt,
    required this.locationId,
    this.location,
    required this.playerDataId,
    this.playerData,
    this.subscriptions,
  });

  factory MatchSchedulePairingAttempt({
    int? id,
    required DateTime createdAt,
    String? aditionalInfo,
    String? guidelinesDescription,
    required _i2.MatchPodium minAmountOfPlayers,
    required _i2.MatchPodium maxAmountOfPlayers,
    required DateTime attemptedAt,
    required int locationId,
    _i3.Location? location,
    required int playerDataId,
    _i4.PlayerData? playerData,
    List<_i5.MatchSubscription>? subscriptions,
  }) = _MatchSchedulePairingAttemptImpl;

  factory MatchSchedulePairingAttempt.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return MatchSchedulePairingAttempt(
      id: jsonSerialization['id'] as int?,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      aditionalInfo: jsonSerialization['aditionalInfo'] as String?,
      guidelinesDescription:
          jsonSerialization['guidelinesDescription'] as String?,
      minAmountOfPlayers: _i2.MatchPodium.fromJson(
        (jsonSerialization['minAmountOfPlayers'] as String),
      ),
      maxAmountOfPlayers: _i2.MatchPodium.fromJson(
        (jsonSerialization['maxAmountOfPlayers'] as String),
      ),
      attemptedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['attemptedAt'],
      ),
      locationId: jsonSerialization['locationId'] as int,
      location: jsonSerialization['location'] == null
          ? null
          : _i6.Protocol().deserialize<_i3.Location>(
              jsonSerialization['location'],
            ),
      playerDataId: jsonSerialization['playerDataId'] as int,
      playerData: jsonSerialization['playerData'] == null
          ? null
          : _i6.Protocol().deserialize<_i4.PlayerData>(
              jsonSerialization['playerData'],
            ),
      subscriptions: jsonSerialization['subscriptions'] == null
          ? null
          : _i6.Protocol().deserialize<List<_i5.MatchSubscription>>(
              jsonSerialization['subscriptions'],
            ),
    );
  }

  static final t = MatchSchedulePairingAttemptTable();

  static const db = MatchSchedulePairingAttemptRepository._();

  @override
  int? id;

  DateTime createdAt;

  String? aditionalInfo;

  String? guidelinesDescription;

  _i2.MatchPodium minAmountOfPlayers;

  _i2.MatchPodium maxAmountOfPlayers;

  DateTime attemptedAt;

  int locationId;

  _i3.Location? location;

  int playerDataId;

  _i4.PlayerData? playerData;

  List<_i5.MatchSubscription>? subscriptions;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [MatchSchedulePairingAttempt]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  MatchSchedulePairingAttempt copyWith({
    int? id,
    DateTime? createdAt,
    String? aditionalInfo,
    String? guidelinesDescription,
    _i2.MatchPodium? minAmountOfPlayers,
    _i2.MatchPodium? maxAmountOfPlayers,
    DateTime? attemptedAt,
    int? locationId,
    _i3.Location? location,
    int? playerDataId,
    _i4.PlayerData? playerData,
    List<_i5.MatchSubscription>? subscriptions,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'MatchSchedulePairingAttempt',
      if (id != null) 'id': id,
      'createdAt': createdAt.toJson(),
      if (aditionalInfo != null) 'aditionalInfo': aditionalInfo,
      if (guidelinesDescription != null)
        'guidelinesDescription': guidelinesDescription,
      'minAmountOfPlayers': minAmountOfPlayers.toJson(),
      'maxAmountOfPlayers': maxAmountOfPlayers.toJson(),
      'attemptedAt': attemptedAt.toJson(),
      'locationId': locationId,
      if (location != null) 'location': location?.toJson(),
      'playerDataId': playerDataId,
      if (playerData != null) 'playerData': playerData?.toJson(),
      if (subscriptions != null)
        'subscriptions': subscriptions?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'MatchSchedulePairingAttempt',
      if (id != null) 'id': id,
      'createdAt': createdAt.toJson(),
      if (aditionalInfo != null) 'aditionalInfo': aditionalInfo,
      if (guidelinesDescription != null)
        'guidelinesDescription': guidelinesDescription,
      'minAmountOfPlayers': minAmountOfPlayers.toJson(),
      'maxAmountOfPlayers': maxAmountOfPlayers.toJson(),
      'attemptedAt': attemptedAt.toJson(),
      'locationId': locationId,
      if (location != null) 'location': location?.toJsonForProtocol(),
      'playerDataId': playerDataId,
      if (playerData != null) 'playerData': playerData?.toJsonForProtocol(),
      if (subscriptions != null)
        'subscriptions': subscriptions?.toJson(
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
    };
  }

  static MatchSchedulePairingAttemptInclude include({
    _i3.LocationInclude? location,
    _i4.PlayerDataInclude? playerData,
    _i5.MatchSubscriptionIncludeList? subscriptions,
  }) {
    return MatchSchedulePairingAttemptInclude._(
      location: location,
      playerData: playerData,
      subscriptions: subscriptions,
    );
  }

  static MatchSchedulePairingAttemptIncludeList includeList({
    _i1.WhereExpressionBuilder<MatchSchedulePairingAttemptTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MatchSchedulePairingAttemptTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MatchSchedulePairingAttemptTable>? orderByList,
    MatchSchedulePairingAttemptInclude? include,
  }) {
    return MatchSchedulePairingAttemptIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(MatchSchedulePairingAttempt.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(MatchSchedulePairingAttempt.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MatchSchedulePairingAttemptImpl extends MatchSchedulePairingAttempt {
  _MatchSchedulePairingAttemptImpl({
    int? id,
    required DateTime createdAt,
    String? aditionalInfo,
    String? guidelinesDescription,
    required _i2.MatchPodium minAmountOfPlayers,
    required _i2.MatchPodium maxAmountOfPlayers,
    required DateTime attemptedAt,
    required int locationId,
    _i3.Location? location,
    required int playerDataId,
    _i4.PlayerData? playerData,
    List<_i5.MatchSubscription>? subscriptions,
  }) : super._(
         id: id,
         createdAt: createdAt,
         aditionalInfo: aditionalInfo,
         guidelinesDescription: guidelinesDescription,
         minAmountOfPlayers: minAmountOfPlayers,
         maxAmountOfPlayers: maxAmountOfPlayers,
         attemptedAt: attemptedAt,
         locationId: locationId,
         location: location,
         playerDataId: playerDataId,
         playerData: playerData,
         subscriptions: subscriptions,
       );

  /// Returns a shallow copy of this [MatchSchedulePairingAttempt]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  MatchSchedulePairingAttempt copyWith({
    Object? id = _Undefined,
    DateTime? createdAt,
    Object? aditionalInfo = _Undefined,
    Object? guidelinesDescription = _Undefined,
    _i2.MatchPodium? minAmountOfPlayers,
    _i2.MatchPodium? maxAmountOfPlayers,
    DateTime? attemptedAt,
    int? locationId,
    Object? location = _Undefined,
    int? playerDataId,
    Object? playerData = _Undefined,
    Object? subscriptions = _Undefined,
  }) {
    return MatchSchedulePairingAttempt(
      id: id is int? ? id : this.id,
      createdAt: createdAt ?? this.createdAt,
      aditionalInfo: aditionalInfo is String?
          ? aditionalInfo
          : this.aditionalInfo,
      guidelinesDescription: guidelinesDescription is String?
          ? guidelinesDescription
          : this.guidelinesDescription,
      minAmountOfPlayers: minAmountOfPlayers ?? this.minAmountOfPlayers,
      maxAmountOfPlayers: maxAmountOfPlayers ?? this.maxAmountOfPlayers,
      attemptedAt: attemptedAt ?? this.attemptedAt,
      locationId: locationId ?? this.locationId,
      location: location is _i3.Location?
          ? location
          : this.location?.copyWith(),
      playerDataId: playerDataId ?? this.playerDataId,
      playerData: playerData is _i4.PlayerData?
          ? playerData
          : this.playerData?.copyWith(),
      subscriptions: subscriptions is List<_i5.MatchSubscription>?
          ? subscriptions
          : this.subscriptions?.map((e0) => e0.copyWith()).toList(),
    );
  }
}

class MatchSchedulePairingAttemptUpdateTable
    extends _i1.UpdateTable<MatchSchedulePairingAttemptTable> {
  MatchSchedulePairingAttemptUpdateTable(super.table);

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );

  _i1.ColumnValue<String, String> aditionalInfo(String? value) =>
      _i1.ColumnValue(
        table.aditionalInfo,
        value,
      );

  _i1.ColumnValue<String, String> guidelinesDescription(String? value) =>
      _i1.ColumnValue(
        table.guidelinesDescription,
        value,
      );

  _i1.ColumnValue<_i2.MatchPodium, _i2.MatchPodium> minAmountOfPlayers(
    _i2.MatchPodium value,
  ) => _i1.ColumnValue(
    table.minAmountOfPlayers,
    value,
  );

  _i1.ColumnValue<_i2.MatchPodium, _i2.MatchPodium> maxAmountOfPlayers(
    _i2.MatchPodium value,
  ) => _i1.ColumnValue(
    table.maxAmountOfPlayers,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> attemptedAt(DateTime value) =>
      _i1.ColumnValue(
        table.attemptedAt,
        value,
      );

  _i1.ColumnValue<int, int> locationId(int value) => _i1.ColumnValue(
    table.locationId,
    value,
  );

  _i1.ColumnValue<int, int> playerDataId(int value) => _i1.ColumnValue(
    table.playerDataId,
    value,
  );
}

class MatchSchedulePairingAttemptTable extends _i1.Table<int?> {
  MatchSchedulePairingAttemptTable({super.tableRelation})
    : super(tableName: 'match_schedule_pairing_attempt') {
    updateTable = MatchSchedulePairingAttemptUpdateTable(this);
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
    aditionalInfo = _i1.ColumnString(
      'aditionalInfo',
      this,
    );
    guidelinesDescription = _i1.ColumnString(
      'guidelinesDescription',
      this,
    );
    minAmountOfPlayers = _i1.ColumnEnum(
      'minAmountOfPlayers',
      this,
      _i1.EnumSerialization.byName,
    );
    maxAmountOfPlayers = _i1.ColumnEnum(
      'maxAmountOfPlayers',
      this,
      _i1.EnumSerialization.byName,
    );
    attemptedAt = _i1.ColumnDateTime(
      'attemptedAt',
      this,
    );
    locationId = _i1.ColumnInt(
      'locationId',
      this,
    );
    playerDataId = _i1.ColumnInt(
      'playerDataId',
      this,
    );
  }

  late final MatchSchedulePairingAttemptUpdateTable updateTable;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnString aditionalInfo;

  late final _i1.ColumnString guidelinesDescription;

  late final _i1.ColumnEnum<_i2.MatchPodium> minAmountOfPlayers;

  late final _i1.ColumnEnum<_i2.MatchPodium> maxAmountOfPlayers;

  late final _i1.ColumnDateTime attemptedAt;

  late final _i1.ColumnInt locationId;

  _i3.LocationTable? _location;

  late final _i1.ColumnInt playerDataId;

  _i4.PlayerDataTable? _playerData;

  _i5.MatchSubscriptionTable? ___subscriptions;

  _i1.ManyRelation<_i5.MatchSubscriptionTable>? _subscriptions;

  _i3.LocationTable get location {
    if (_location != null) return _location!;
    _location = _i1.createRelationTable(
      relationFieldName: 'location',
      field: MatchSchedulePairingAttempt.t.locationId,
      foreignField: _i3.Location.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.LocationTable(tableRelation: foreignTableRelation),
    );
    return _location!;
  }

  _i4.PlayerDataTable get playerData {
    if (_playerData != null) return _playerData!;
    _playerData = _i1.createRelationTable(
      relationFieldName: 'playerData',
      field: MatchSchedulePairingAttempt.t.playerDataId,
      foreignField: _i4.PlayerData.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.PlayerDataTable(tableRelation: foreignTableRelation),
    );
    return _playerData!;
  }

  _i5.MatchSubscriptionTable get __subscriptions {
    if (___subscriptions != null) return ___subscriptions!;
    ___subscriptions = _i1.createRelationTable(
      relationFieldName: '__subscriptions',
      field: MatchSchedulePairingAttempt.t.id,
      foreignField: _i5.MatchSubscription.t.matchSchedulePairingAttemptId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.MatchSubscriptionTable(tableRelation: foreignTableRelation),
    );
    return ___subscriptions!;
  }

  _i1.ManyRelation<_i5.MatchSubscriptionTable> get subscriptions {
    if (_subscriptions != null) return _subscriptions!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'subscriptions',
      field: MatchSchedulePairingAttempt.t.id,
      foreignField: _i5.MatchSubscription.t.matchSchedulePairingAttemptId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.MatchSubscriptionTable(tableRelation: foreignTableRelation),
    );
    _subscriptions = _i1.ManyRelation<_i5.MatchSubscriptionTable>(
      tableWithRelations: relationTable,
      table: _i5.MatchSubscriptionTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _subscriptions!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    createdAt,
    aditionalInfo,
    guidelinesDescription,
    minAmountOfPlayers,
    maxAmountOfPlayers,
    attemptedAt,
    locationId,
    playerDataId,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'location') {
      return location;
    }
    if (relationField == 'playerData') {
      return playerData;
    }
    if (relationField == 'subscriptions') {
      return __subscriptions;
    }
    return null;
  }
}

class MatchSchedulePairingAttemptInclude extends _i1.IncludeObject {
  MatchSchedulePairingAttemptInclude._({
    _i3.LocationInclude? location,
    _i4.PlayerDataInclude? playerData,
    _i5.MatchSubscriptionIncludeList? subscriptions,
  }) {
    _location = location;
    _playerData = playerData;
    _subscriptions = subscriptions;
  }

  _i3.LocationInclude? _location;

  _i4.PlayerDataInclude? _playerData;

  _i5.MatchSubscriptionIncludeList? _subscriptions;

  @override
  Map<String, _i1.Include?> get includes => {
    'location': _location,
    'playerData': _playerData,
    'subscriptions': _subscriptions,
  };

  @override
  _i1.Table<int?> get table => MatchSchedulePairingAttempt.t;
}

class MatchSchedulePairingAttemptIncludeList extends _i1.IncludeList {
  MatchSchedulePairingAttemptIncludeList._({
    _i1.WhereExpressionBuilder<MatchSchedulePairingAttemptTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(MatchSchedulePairingAttempt.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => MatchSchedulePairingAttempt.t;
}

class MatchSchedulePairingAttemptRepository {
  const MatchSchedulePairingAttemptRepository._();

  final attach = const MatchSchedulePairingAttemptAttachRepository._();

  final attachRow = const MatchSchedulePairingAttemptAttachRowRepository._();

  final detach = const MatchSchedulePairingAttemptDetachRepository._();

  final detachRow = const MatchSchedulePairingAttemptDetachRowRepository._();

  /// Returns a list of [MatchSchedulePairingAttempt]s matching the given query parameters.
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
  Future<List<MatchSchedulePairingAttempt>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MatchSchedulePairingAttemptTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MatchSchedulePairingAttemptTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MatchSchedulePairingAttemptTable>? orderByList,
    _i1.Transaction? transaction,
    MatchSchedulePairingAttemptInclude? include,
  }) async {
    return session.db.find<MatchSchedulePairingAttempt>(
      where: where?.call(MatchSchedulePairingAttempt.t),
      orderBy: orderBy?.call(MatchSchedulePairingAttempt.t),
      orderByList: orderByList?.call(MatchSchedulePairingAttempt.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [MatchSchedulePairingAttempt] matching the given query parameters.
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
  Future<MatchSchedulePairingAttempt?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MatchSchedulePairingAttemptTable>? where,
    int? offset,
    _i1.OrderByBuilder<MatchSchedulePairingAttemptTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MatchSchedulePairingAttemptTable>? orderByList,
    _i1.Transaction? transaction,
    MatchSchedulePairingAttemptInclude? include,
  }) async {
    return session.db.findFirstRow<MatchSchedulePairingAttempt>(
      where: where?.call(MatchSchedulePairingAttempt.t),
      orderBy: orderBy?.call(MatchSchedulePairingAttempt.t),
      orderByList: orderByList?.call(MatchSchedulePairingAttempt.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [MatchSchedulePairingAttempt] by its [id] or null if no such row exists.
  Future<MatchSchedulePairingAttempt?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    MatchSchedulePairingAttemptInclude? include,
  }) async {
    return session.db.findById<MatchSchedulePairingAttempt>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [MatchSchedulePairingAttempt]s in the list and returns the inserted rows.
  ///
  /// The returned [MatchSchedulePairingAttempt]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<MatchSchedulePairingAttempt>> insert(
    _i1.Session session,
    List<MatchSchedulePairingAttempt> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<MatchSchedulePairingAttempt>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [MatchSchedulePairingAttempt] and returns the inserted row.
  ///
  /// The returned [MatchSchedulePairingAttempt] will have its `id` field set.
  Future<MatchSchedulePairingAttempt> insertRow(
    _i1.Session session,
    MatchSchedulePairingAttempt row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<MatchSchedulePairingAttempt>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [MatchSchedulePairingAttempt]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<MatchSchedulePairingAttempt>> update(
    _i1.Session session,
    List<MatchSchedulePairingAttempt> rows, {
    _i1.ColumnSelections<MatchSchedulePairingAttemptTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<MatchSchedulePairingAttempt>(
      rows,
      columns: columns?.call(MatchSchedulePairingAttempt.t),
      transaction: transaction,
    );
  }

  /// Updates a single [MatchSchedulePairingAttempt]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<MatchSchedulePairingAttempt> updateRow(
    _i1.Session session,
    MatchSchedulePairingAttempt row, {
    _i1.ColumnSelections<MatchSchedulePairingAttemptTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<MatchSchedulePairingAttempt>(
      row,
      columns: columns?.call(MatchSchedulePairingAttempt.t),
      transaction: transaction,
    );
  }

  /// Updates a single [MatchSchedulePairingAttempt] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<MatchSchedulePairingAttempt?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<MatchSchedulePairingAttemptUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<MatchSchedulePairingAttempt>(
      id,
      columnValues: columnValues(MatchSchedulePairingAttempt.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [MatchSchedulePairingAttempt]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<MatchSchedulePairingAttempt>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<MatchSchedulePairingAttemptUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<MatchSchedulePairingAttemptTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MatchSchedulePairingAttemptTable>? orderBy,
    _i1.OrderByListBuilder<MatchSchedulePairingAttemptTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<MatchSchedulePairingAttempt>(
      columnValues: columnValues(MatchSchedulePairingAttempt.t.updateTable),
      where: where(MatchSchedulePairingAttempt.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(MatchSchedulePairingAttempt.t),
      orderByList: orderByList?.call(MatchSchedulePairingAttempt.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [MatchSchedulePairingAttempt]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<MatchSchedulePairingAttempt>> delete(
    _i1.Session session,
    List<MatchSchedulePairingAttempt> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<MatchSchedulePairingAttempt>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [MatchSchedulePairingAttempt].
  Future<MatchSchedulePairingAttempt> deleteRow(
    _i1.Session session,
    MatchSchedulePairingAttempt row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<MatchSchedulePairingAttempt>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<MatchSchedulePairingAttempt>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<MatchSchedulePairingAttemptTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<MatchSchedulePairingAttempt>(
      where: where(MatchSchedulePairingAttempt.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MatchSchedulePairingAttemptTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<MatchSchedulePairingAttempt>(
      where: where?.call(MatchSchedulePairingAttempt.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class MatchSchedulePairingAttemptAttachRepository {
  const MatchSchedulePairingAttemptAttachRepository._();

  /// Creates a relation between this [MatchSchedulePairingAttempt] and the given [MatchSubscription]s
  /// by setting each [MatchSubscription]'s foreign key `matchSchedulePairingAttemptId` to refer to this [MatchSchedulePairingAttempt].
  Future<void> subscriptions(
    _i1.Session session,
    MatchSchedulePairingAttempt matchSchedulePairingAttempt,
    List<_i5.MatchSubscription> matchSubscription, {
    _i1.Transaction? transaction,
  }) async {
    if (matchSubscription.any((e) => e.id == null)) {
      throw ArgumentError.notNull('matchSubscription.id');
    }
    if (matchSchedulePairingAttempt.id == null) {
      throw ArgumentError.notNull('matchSchedulePairingAttempt.id');
    }

    var $matchSubscription = matchSubscription
        .map(
          (e) => e.copyWith(
            matchSchedulePairingAttemptId: matchSchedulePairingAttempt.id,
          ),
        )
        .toList();
    await session.db.update<_i5.MatchSubscription>(
      $matchSubscription,
      columns: [_i5.MatchSubscription.t.matchSchedulePairingAttemptId],
      transaction: transaction,
    );
  }
}

class MatchSchedulePairingAttemptAttachRowRepository {
  const MatchSchedulePairingAttemptAttachRowRepository._();

  /// Creates a relation between the given [MatchSchedulePairingAttempt] and [Location]
  /// by setting the [MatchSchedulePairingAttempt]'s foreign key `locationId` to refer to the [Location].
  Future<void> location(
    _i1.Session session,
    MatchSchedulePairingAttempt matchSchedulePairingAttempt,
    _i3.Location location, {
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
    await session.db.updateRow<MatchSchedulePairingAttempt>(
      $matchSchedulePairingAttempt,
      columns: [MatchSchedulePairingAttempt.t.locationId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [MatchSchedulePairingAttempt] and [PlayerData]
  /// by setting the [MatchSchedulePairingAttempt]'s foreign key `playerDataId` to refer to the [PlayerData].
  Future<void> playerData(
    _i1.Session session,
    MatchSchedulePairingAttempt matchSchedulePairingAttempt,
    _i4.PlayerData playerData, {
    _i1.Transaction? transaction,
  }) async {
    if (matchSchedulePairingAttempt.id == null) {
      throw ArgumentError.notNull('matchSchedulePairingAttempt.id');
    }
    if (playerData.id == null) {
      throw ArgumentError.notNull('playerData.id');
    }

    var $matchSchedulePairingAttempt = matchSchedulePairingAttempt.copyWith(
      playerDataId: playerData.id,
    );
    await session.db.updateRow<MatchSchedulePairingAttempt>(
      $matchSchedulePairingAttempt,
      columns: [MatchSchedulePairingAttempt.t.playerDataId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [MatchSchedulePairingAttempt] and the given [MatchSubscription]
  /// by setting the [MatchSubscription]'s foreign key `matchSchedulePairingAttemptId` to refer to this [MatchSchedulePairingAttempt].
  Future<void> subscriptions(
    _i1.Session session,
    MatchSchedulePairingAttempt matchSchedulePairingAttempt,
    _i5.MatchSubscription matchSubscription, {
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
    await session.db.updateRow<_i5.MatchSubscription>(
      $matchSubscription,
      columns: [_i5.MatchSubscription.t.matchSchedulePairingAttemptId],
      transaction: transaction,
    );
  }
}

class MatchSchedulePairingAttemptDetachRepository {
  const MatchSchedulePairingAttemptDetachRepository._();

  /// Detaches the relation between this [MatchSchedulePairingAttempt] and the given [MatchSubscription]
  /// by setting the [MatchSubscription]'s foreign key `matchSchedulePairingAttemptId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> subscriptions(
    _i1.Session session,
    List<_i5.MatchSubscription> matchSubscription, {
    _i1.Transaction? transaction,
  }) async {
    if (matchSubscription.any((e) => e.id == null)) {
      throw ArgumentError.notNull('matchSubscription.id');
    }

    var $matchSubscription = matchSubscription
        .map((e) => e.copyWith(matchSchedulePairingAttemptId: null))
        .toList();
    await session.db.update<_i5.MatchSubscription>(
      $matchSubscription,
      columns: [_i5.MatchSubscription.t.matchSchedulePairingAttemptId],
      transaction: transaction,
    );
  }
}

class MatchSchedulePairingAttemptDetachRowRepository {
  const MatchSchedulePairingAttemptDetachRowRepository._();

  /// Detaches the relation between this [MatchSchedulePairingAttempt] and the given [MatchSubscription]
  /// by setting the [MatchSubscription]'s foreign key `matchSchedulePairingAttemptId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> subscriptions(
    _i1.Session session,
    _i5.MatchSubscription matchSubscription, {
    _i1.Transaction? transaction,
  }) async {
    if (matchSubscription.id == null) {
      throw ArgumentError.notNull('matchSubscription.id');
    }

    var $matchSubscription = matchSubscription.copyWith(
      matchSchedulePairingAttemptId: null,
    );
    await session.db.updateRow<_i5.MatchSubscription>(
      $matchSubscription,
      columns: [_i5.MatchSubscription.t.matchSchedulePairingAttemptId],
      transaction: transaction,
    );
  }
}
