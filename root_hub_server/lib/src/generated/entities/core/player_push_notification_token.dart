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
import '../../entities/core/push_notification_platform.dart' as _i2;
import '../../entities/core/player_data.dart' as _i3;
import 'package:root_hub_server/src/generated/protocol.dart' as _i4;

abstract class PlayerPushNotificationToken
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  PlayerPushNotificationToken._({
    this.id,
    required this.token,
    required this.platform,
    bool? isActive,
    required this.lastConfirmedAt,
    required this.playerDataId,
    this.playerData,
  }) : isActive = isActive ?? true;

  factory PlayerPushNotificationToken({
    int? id,
    required String token,
    required _i2.PushNotificationPlatform platform,
    bool? isActive,
    required DateTime lastConfirmedAt,
    required int playerDataId,
    _i3.PlayerData? playerData,
  }) = _PlayerPushNotificationTokenImpl;

  factory PlayerPushNotificationToken.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return PlayerPushNotificationToken(
      id: jsonSerialization['id'] as int?,
      token: jsonSerialization['token'] as String,
      platform: _i2.PushNotificationPlatform.fromJson(
        (jsonSerialization['platform'] as String),
      ),
      isActive: jsonSerialization['isActive'] as bool?,
      lastConfirmedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['lastConfirmedAt'],
      ),
      playerDataId: jsonSerialization['playerDataId'] as int,
      playerData: jsonSerialization['playerData'] == null
          ? null
          : _i4.Protocol().deserialize<_i3.PlayerData>(
              jsonSerialization['playerData'],
            ),
    );
  }

  static final t = PlayerPushNotificationTokenTable();

  static const db = PlayerPushNotificationTokenRepository._();

  @override
  int? id;

  String token;

  _i2.PushNotificationPlatform platform;

  bool isActive;

  DateTime lastConfirmedAt;

  int playerDataId;

  _i3.PlayerData? playerData;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [PlayerPushNotificationToken]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PlayerPushNotificationToken copyWith({
    int? id,
    String? token,
    _i2.PushNotificationPlatform? platform,
    bool? isActive,
    DateTime? lastConfirmedAt,
    int? playerDataId,
    _i3.PlayerData? playerData,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'PlayerPushNotificationToken',
      if (id != null) 'id': id,
      'token': token,
      'platform': platform.toJson(),
      'isActive': isActive,
      'lastConfirmedAt': lastConfirmedAt.toJson(),
      'playerDataId': playerDataId,
      if (playerData != null) 'playerData': playerData?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'PlayerPushNotificationToken',
      if (id != null) 'id': id,
      'token': token,
      'platform': platform.toJson(),
      'isActive': isActive,
      'lastConfirmedAt': lastConfirmedAt.toJson(),
      'playerDataId': playerDataId,
      if (playerData != null) 'playerData': playerData?.toJsonForProtocol(),
    };
  }

  static PlayerPushNotificationTokenInclude include({
    _i3.PlayerDataInclude? playerData,
  }) {
    return PlayerPushNotificationTokenInclude._(playerData: playerData);
  }

  static PlayerPushNotificationTokenIncludeList includeList({
    _i1.WhereExpressionBuilder<PlayerPushNotificationTokenTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PlayerPushNotificationTokenTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PlayerPushNotificationTokenTable>? orderByList,
    PlayerPushNotificationTokenInclude? include,
  }) {
    return PlayerPushNotificationTokenIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PlayerPushNotificationToken.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(PlayerPushNotificationToken.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PlayerPushNotificationTokenImpl extends PlayerPushNotificationToken {
  _PlayerPushNotificationTokenImpl({
    int? id,
    required String token,
    required _i2.PushNotificationPlatform platform,
    bool? isActive,
    required DateTime lastConfirmedAt,
    required int playerDataId,
    _i3.PlayerData? playerData,
  }) : super._(
         id: id,
         token: token,
         platform: platform,
         isActive: isActive,
         lastConfirmedAt: lastConfirmedAt,
         playerDataId: playerDataId,
         playerData: playerData,
       );

  /// Returns a shallow copy of this [PlayerPushNotificationToken]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PlayerPushNotificationToken copyWith({
    Object? id = _Undefined,
    String? token,
    _i2.PushNotificationPlatform? platform,
    bool? isActive,
    DateTime? lastConfirmedAt,
    int? playerDataId,
    Object? playerData = _Undefined,
  }) {
    return PlayerPushNotificationToken(
      id: id is int? ? id : this.id,
      token: token ?? this.token,
      platform: platform ?? this.platform,
      isActive: isActive ?? this.isActive,
      lastConfirmedAt: lastConfirmedAt ?? this.lastConfirmedAt,
      playerDataId: playerDataId ?? this.playerDataId,
      playerData: playerData is _i3.PlayerData?
          ? playerData
          : this.playerData?.copyWith(),
    );
  }
}

class PlayerPushNotificationTokenUpdateTable
    extends _i1.UpdateTable<PlayerPushNotificationTokenTable> {
  PlayerPushNotificationTokenUpdateTable(super.table);

  _i1.ColumnValue<String, String> token(String value) => _i1.ColumnValue(
    table.token,
    value,
  );

  _i1.ColumnValue<_i2.PushNotificationPlatform, _i2.PushNotificationPlatform>
  platform(_i2.PushNotificationPlatform value) => _i1.ColumnValue(
    table.platform,
    value,
  );

  _i1.ColumnValue<bool, bool> isActive(bool value) => _i1.ColumnValue(
    table.isActive,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> lastConfirmedAt(DateTime value) =>
      _i1.ColumnValue(
        table.lastConfirmedAt,
        value,
      );

  _i1.ColumnValue<int, int> playerDataId(int value) => _i1.ColumnValue(
    table.playerDataId,
    value,
  );
}

class PlayerPushNotificationTokenTable extends _i1.Table<int?> {
  PlayerPushNotificationTokenTable({super.tableRelation})
    : super(tableName: 'player_push_notification_token') {
    updateTable = PlayerPushNotificationTokenUpdateTable(this);
    token = _i1.ColumnString(
      'token',
      this,
    );
    platform = _i1.ColumnEnum(
      'platform',
      this,
      _i1.EnumSerialization.byName,
    );
    isActive = _i1.ColumnBool(
      'isActive',
      this,
      hasDefault: true,
    );
    lastConfirmedAt = _i1.ColumnDateTime(
      'lastConfirmedAt',
      this,
    );
    playerDataId = _i1.ColumnInt(
      'playerDataId',
      this,
    );
  }

  late final PlayerPushNotificationTokenUpdateTable updateTable;

  late final _i1.ColumnString token;

  late final _i1.ColumnEnum<_i2.PushNotificationPlatform> platform;

  late final _i1.ColumnBool isActive;

  late final _i1.ColumnDateTime lastConfirmedAt;

  late final _i1.ColumnInt playerDataId;

  _i3.PlayerDataTable? _playerData;

  _i3.PlayerDataTable get playerData {
    if (_playerData != null) return _playerData!;
    _playerData = _i1.createRelationTable(
      relationFieldName: 'playerData',
      field: PlayerPushNotificationToken.t.playerDataId,
      foreignField: _i3.PlayerData.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.PlayerDataTable(tableRelation: foreignTableRelation),
    );
    return _playerData!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    token,
    platform,
    isActive,
    lastConfirmedAt,
    playerDataId,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'playerData') {
      return playerData;
    }
    return null;
  }
}

class PlayerPushNotificationTokenInclude extends _i1.IncludeObject {
  PlayerPushNotificationTokenInclude._({_i3.PlayerDataInclude? playerData}) {
    _playerData = playerData;
  }

  _i3.PlayerDataInclude? _playerData;

  @override
  Map<String, _i1.Include?> get includes => {'playerData': _playerData};

  @override
  _i1.Table<int?> get table => PlayerPushNotificationToken.t;
}

class PlayerPushNotificationTokenIncludeList extends _i1.IncludeList {
  PlayerPushNotificationTokenIncludeList._({
    _i1.WhereExpressionBuilder<PlayerPushNotificationTokenTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(PlayerPushNotificationToken.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => PlayerPushNotificationToken.t;
}

class PlayerPushNotificationTokenRepository {
  const PlayerPushNotificationTokenRepository._();

  final attachRow = const PlayerPushNotificationTokenAttachRowRepository._();

  /// Returns a list of [PlayerPushNotificationToken]s matching the given query parameters.
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
  Future<List<PlayerPushNotificationToken>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PlayerPushNotificationTokenTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PlayerPushNotificationTokenTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PlayerPushNotificationTokenTable>? orderByList,
    _i1.Transaction? transaction,
    PlayerPushNotificationTokenInclude? include,
  }) async {
    return session.db.find<PlayerPushNotificationToken>(
      where: where?.call(PlayerPushNotificationToken.t),
      orderBy: orderBy?.call(PlayerPushNotificationToken.t),
      orderByList: orderByList?.call(PlayerPushNotificationToken.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [PlayerPushNotificationToken] matching the given query parameters.
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
  Future<PlayerPushNotificationToken?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PlayerPushNotificationTokenTable>? where,
    int? offset,
    _i1.OrderByBuilder<PlayerPushNotificationTokenTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PlayerPushNotificationTokenTable>? orderByList,
    _i1.Transaction? transaction,
    PlayerPushNotificationTokenInclude? include,
  }) async {
    return session.db.findFirstRow<PlayerPushNotificationToken>(
      where: where?.call(PlayerPushNotificationToken.t),
      orderBy: orderBy?.call(PlayerPushNotificationToken.t),
      orderByList: orderByList?.call(PlayerPushNotificationToken.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [PlayerPushNotificationToken] by its [id] or null if no such row exists.
  Future<PlayerPushNotificationToken?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    PlayerPushNotificationTokenInclude? include,
  }) async {
    return session.db.findById<PlayerPushNotificationToken>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [PlayerPushNotificationToken]s in the list and returns the inserted rows.
  ///
  /// The returned [PlayerPushNotificationToken]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<PlayerPushNotificationToken>> insert(
    _i1.Session session,
    List<PlayerPushNotificationToken> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<PlayerPushNotificationToken>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [PlayerPushNotificationToken] and returns the inserted row.
  ///
  /// The returned [PlayerPushNotificationToken] will have its `id` field set.
  Future<PlayerPushNotificationToken> insertRow(
    _i1.Session session,
    PlayerPushNotificationToken row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<PlayerPushNotificationToken>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [PlayerPushNotificationToken]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<PlayerPushNotificationToken>> update(
    _i1.Session session,
    List<PlayerPushNotificationToken> rows, {
    _i1.ColumnSelections<PlayerPushNotificationTokenTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<PlayerPushNotificationToken>(
      rows,
      columns: columns?.call(PlayerPushNotificationToken.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PlayerPushNotificationToken]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<PlayerPushNotificationToken> updateRow(
    _i1.Session session,
    PlayerPushNotificationToken row, {
    _i1.ColumnSelections<PlayerPushNotificationTokenTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<PlayerPushNotificationToken>(
      row,
      columns: columns?.call(PlayerPushNotificationToken.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PlayerPushNotificationToken] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<PlayerPushNotificationToken?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<PlayerPushNotificationTokenUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<PlayerPushNotificationToken>(
      id,
      columnValues: columnValues(PlayerPushNotificationToken.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [PlayerPushNotificationToken]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<PlayerPushNotificationToken>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<PlayerPushNotificationTokenUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<PlayerPushNotificationTokenTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PlayerPushNotificationTokenTable>? orderBy,
    _i1.OrderByListBuilder<PlayerPushNotificationTokenTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<PlayerPushNotificationToken>(
      columnValues: columnValues(PlayerPushNotificationToken.t.updateTable),
      where: where(PlayerPushNotificationToken.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PlayerPushNotificationToken.t),
      orderByList: orderByList?.call(PlayerPushNotificationToken.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [PlayerPushNotificationToken]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<PlayerPushNotificationToken>> delete(
    _i1.Session session,
    List<PlayerPushNotificationToken> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<PlayerPushNotificationToken>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [PlayerPushNotificationToken].
  Future<PlayerPushNotificationToken> deleteRow(
    _i1.Session session,
    PlayerPushNotificationToken row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<PlayerPushNotificationToken>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<PlayerPushNotificationToken>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PlayerPushNotificationTokenTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<PlayerPushNotificationToken>(
      where: where(PlayerPushNotificationToken.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PlayerPushNotificationTokenTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<PlayerPushNotificationToken>(
      where: where?.call(PlayerPushNotificationToken.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class PlayerPushNotificationTokenAttachRowRepository {
  const PlayerPushNotificationTokenAttachRowRepository._();

  /// Creates a relation between the given [PlayerPushNotificationToken] and [PlayerData]
  /// by setting the [PlayerPushNotificationToken]'s foreign key `playerDataId` to refer to the [PlayerData].
  Future<void> playerData(
    _i1.Session session,
    PlayerPushNotificationToken playerPushNotificationToken,
    _i3.PlayerData playerData, {
    _i1.Transaction? transaction,
  }) async {
    if (playerPushNotificationToken.id == null) {
      throw ArgumentError.notNull('playerPushNotificationToken.id');
    }
    if (playerData.id == null) {
      throw ArgumentError.notNull('playerData.id');
    }

    var $playerPushNotificationToken = playerPushNotificationToken.copyWith(
      playerDataId: playerData.id,
    );
    await session.db.updateRow<PlayerPushNotificationToken>(
      $playerPushNotificationToken,
      columns: [PlayerPushNotificationToken.t.playerDataId],
      transaction: transaction,
    );
  }
}
