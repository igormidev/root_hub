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
import '../../entities/core/anonymous_player.dart' as _i2;
import '../../entities/core/player_data.dart' as _i3;
import 'package:root_hub_server/src/generated/protocol.dart' as _i4;

abstract class Player implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Player._({
    this.id,
    this.anonymousPlayerId,
    this.anonymousPlayer,
    this.playerDataId,
    this.playerData,
  });

  factory Player({
    int? id,
    int? anonymousPlayerId,
    _i2.AnonymousPlayer? anonymousPlayer,
    int? playerDataId,
    _i3.PlayerData? playerData,
  }) = _PlayerImpl;

  factory Player.fromJson(Map<String, dynamic> jsonSerialization) {
    return Player(
      id: jsonSerialization['id'] as int?,
      anonymousPlayerId: jsonSerialization['anonymousPlayerId'] as int?,
      anonymousPlayer: jsonSerialization['anonymousPlayer'] == null
          ? null
          : _i4.Protocol().deserialize<_i2.AnonymousPlayer>(
              jsonSerialization['anonymousPlayer'],
            ),
      playerDataId: jsonSerialization['playerDataId'] as int?,
      playerData: jsonSerialization['playerData'] == null
          ? null
          : _i4.Protocol().deserialize<_i3.PlayerData>(
              jsonSerialization['playerData'],
            ),
    );
  }

  static final t = PlayerTable();

  static const db = PlayerRepository._();

  @override
  int? id;

  int? anonymousPlayerId;

  _i2.AnonymousPlayer? anonymousPlayer;

  int? playerDataId;

  _i3.PlayerData? playerData;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Player]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Player copyWith({
    int? id,
    int? anonymousPlayerId,
    _i2.AnonymousPlayer? anonymousPlayer,
    int? playerDataId,
    _i3.PlayerData? playerData,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Player',
      if (id != null) 'id': id,
      if (anonymousPlayerId != null) 'anonymousPlayerId': anonymousPlayerId,
      if (anonymousPlayer != null) 'anonymousPlayer': anonymousPlayer?.toJson(),
      if (playerDataId != null) 'playerDataId': playerDataId,
      if (playerData != null) 'playerData': playerData?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Player',
      if (id != null) 'id': id,
      if (anonymousPlayerId != null) 'anonymousPlayerId': anonymousPlayerId,
      if (anonymousPlayer != null)
        'anonymousPlayer': anonymousPlayer?.toJsonForProtocol(),
      if (playerDataId != null) 'playerDataId': playerDataId,
      if (playerData != null) 'playerData': playerData?.toJsonForProtocol(),
    };
  }

  static PlayerInclude include({
    _i2.AnonymousPlayerInclude? anonymousPlayer,
    _i3.PlayerDataInclude? playerData,
  }) {
    return PlayerInclude._(
      anonymousPlayer: anonymousPlayer,
      playerData: playerData,
    );
  }

  static PlayerIncludeList includeList({
    _i1.WhereExpressionBuilder<PlayerTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PlayerTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PlayerTable>? orderByList,
    PlayerInclude? include,
  }) {
    return PlayerIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Player.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Player.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PlayerImpl extends Player {
  _PlayerImpl({
    int? id,
    int? anonymousPlayerId,
    _i2.AnonymousPlayer? anonymousPlayer,
    int? playerDataId,
    _i3.PlayerData? playerData,
  }) : super._(
         id: id,
         anonymousPlayerId: anonymousPlayerId,
         anonymousPlayer: anonymousPlayer,
         playerDataId: playerDataId,
         playerData: playerData,
       );

  /// Returns a shallow copy of this [Player]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Player copyWith({
    Object? id = _Undefined,
    Object? anonymousPlayerId = _Undefined,
    Object? anonymousPlayer = _Undefined,
    Object? playerDataId = _Undefined,
    Object? playerData = _Undefined,
  }) {
    return Player(
      id: id is int? ? id : this.id,
      anonymousPlayerId: anonymousPlayerId is int?
          ? anonymousPlayerId
          : this.anonymousPlayerId,
      anonymousPlayer: anonymousPlayer is _i2.AnonymousPlayer?
          ? anonymousPlayer
          : this.anonymousPlayer?.copyWith(),
      playerDataId: playerDataId is int? ? playerDataId : this.playerDataId,
      playerData: playerData is _i3.PlayerData?
          ? playerData
          : this.playerData?.copyWith(),
    );
  }
}

class PlayerUpdateTable extends _i1.UpdateTable<PlayerTable> {
  PlayerUpdateTable(super.table);

  _i1.ColumnValue<int, int> anonymousPlayerId(int? value) => _i1.ColumnValue(
    table.anonymousPlayerId,
    value,
  );

  _i1.ColumnValue<int, int> playerDataId(int? value) => _i1.ColumnValue(
    table.playerDataId,
    value,
  );
}

class PlayerTable extends _i1.Table<int?> {
  PlayerTable({super.tableRelation}) : super(tableName: 'player') {
    updateTable = PlayerUpdateTable(this);
    anonymousPlayerId = _i1.ColumnInt(
      'anonymousPlayerId',
      this,
    );
    playerDataId = _i1.ColumnInt(
      'playerDataId',
      this,
    );
  }

  late final PlayerUpdateTable updateTable;

  late final _i1.ColumnInt anonymousPlayerId;

  _i2.AnonymousPlayerTable? _anonymousPlayer;

  late final _i1.ColumnInt playerDataId;

  _i3.PlayerDataTable? _playerData;

  _i2.AnonymousPlayerTable get anonymousPlayer {
    if (_anonymousPlayer != null) return _anonymousPlayer!;
    _anonymousPlayer = _i1.createRelationTable(
      relationFieldName: 'anonymousPlayer',
      field: Player.t.anonymousPlayerId,
      foreignField: _i2.AnonymousPlayer.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.AnonymousPlayerTable(tableRelation: foreignTableRelation),
    );
    return _anonymousPlayer!;
  }

  _i3.PlayerDataTable get playerData {
    if (_playerData != null) return _playerData!;
    _playerData = _i1.createRelationTable(
      relationFieldName: 'playerData',
      field: Player.t.playerDataId,
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
    anonymousPlayerId,
    playerDataId,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'anonymousPlayer') {
      return anonymousPlayer;
    }
    if (relationField == 'playerData') {
      return playerData;
    }
    return null;
  }
}

class PlayerInclude extends _i1.IncludeObject {
  PlayerInclude._({
    _i2.AnonymousPlayerInclude? anonymousPlayer,
    _i3.PlayerDataInclude? playerData,
  }) {
    _anonymousPlayer = anonymousPlayer;
    _playerData = playerData;
  }

  _i2.AnonymousPlayerInclude? _anonymousPlayer;

  _i3.PlayerDataInclude? _playerData;

  @override
  Map<String, _i1.Include?> get includes => {
    'anonymousPlayer': _anonymousPlayer,
    'playerData': _playerData,
  };

  @override
  _i1.Table<int?> get table => Player.t;
}

class PlayerIncludeList extends _i1.IncludeList {
  PlayerIncludeList._({
    _i1.WhereExpressionBuilder<PlayerTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Player.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Player.t;
}

class PlayerRepository {
  const PlayerRepository._();

  final attachRow = const PlayerAttachRowRepository._();

  final detachRow = const PlayerDetachRowRepository._();

  /// Returns a list of [Player]s matching the given query parameters.
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
  Future<List<Player>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PlayerTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PlayerTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PlayerTable>? orderByList,
    _i1.Transaction? transaction,
    PlayerInclude? include,
  }) async {
    return session.db.find<Player>(
      where: where?.call(Player.t),
      orderBy: orderBy?.call(Player.t),
      orderByList: orderByList?.call(Player.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Player] matching the given query parameters.
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
  Future<Player?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PlayerTable>? where,
    int? offset,
    _i1.OrderByBuilder<PlayerTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PlayerTable>? orderByList,
    _i1.Transaction? transaction,
    PlayerInclude? include,
  }) async {
    return session.db.findFirstRow<Player>(
      where: where?.call(Player.t),
      orderBy: orderBy?.call(Player.t),
      orderByList: orderByList?.call(Player.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Player] by its [id] or null if no such row exists.
  Future<Player?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    PlayerInclude? include,
  }) async {
    return session.db.findById<Player>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Player]s in the list and returns the inserted rows.
  ///
  /// The returned [Player]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Player>> insert(
    _i1.Session session,
    List<Player> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Player>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Player] and returns the inserted row.
  ///
  /// The returned [Player] will have its `id` field set.
  Future<Player> insertRow(
    _i1.Session session,
    Player row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Player>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Player]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Player>> update(
    _i1.Session session,
    List<Player> rows, {
    _i1.ColumnSelections<PlayerTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Player>(
      rows,
      columns: columns?.call(Player.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Player]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Player> updateRow(
    _i1.Session session,
    Player row, {
    _i1.ColumnSelections<PlayerTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Player>(
      row,
      columns: columns?.call(Player.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Player] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Player?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<PlayerUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Player>(
      id,
      columnValues: columnValues(Player.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Player]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Player>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<PlayerUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<PlayerTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PlayerTable>? orderBy,
    _i1.OrderByListBuilder<PlayerTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Player>(
      columnValues: columnValues(Player.t.updateTable),
      where: where(Player.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Player.t),
      orderByList: orderByList?.call(Player.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Player]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Player>> delete(
    _i1.Session session,
    List<Player> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Player>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Player].
  Future<Player> deleteRow(
    _i1.Session session,
    Player row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Player>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Player>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PlayerTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Player>(
      where: where(Player.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PlayerTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Player>(
      where: where?.call(Player.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class PlayerAttachRowRepository {
  const PlayerAttachRowRepository._();

  /// Creates a relation between the given [Player] and [AnonymousPlayer]
  /// by setting the [Player]'s foreign key `anonymousPlayerId` to refer to the [AnonymousPlayer].
  Future<void> anonymousPlayer(
    _i1.Session session,
    Player player,
    _i2.AnonymousPlayer anonymousPlayer, {
    _i1.Transaction? transaction,
  }) async {
    if (player.id == null) {
      throw ArgumentError.notNull('player.id');
    }
    if (anonymousPlayer.id == null) {
      throw ArgumentError.notNull('anonymousPlayer.id');
    }

    var $player = player.copyWith(anonymousPlayerId: anonymousPlayer.id);
    await session.db.updateRow<Player>(
      $player,
      columns: [Player.t.anonymousPlayerId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [Player] and [PlayerData]
  /// by setting the [Player]'s foreign key `playerDataId` to refer to the [PlayerData].
  Future<void> playerData(
    _i1.Session session,
    Player player,
    _i3.PlayerData playerData, {
    _i1.Transaction? transaction,
  }) async {
    if (player.id == null) {
      throw ArgumentError.notNull('player.id');
    }
    if (playerData.id == null) {
      throw ArgumentError.notNull('playerData.id');
    }

    var $player = player.copyWith(playerDataId: playerData.id);
    await session.db.updateRow<Player>(
      $player,
      columns: [Player.t.playerDataId],
      transaction: transaction,
    );
  }
}

class PlayerDetachRowRepository {
  const PlayerDetachRowRepository._();

  /// Detaches the relation between this [Player] and the [AnonymousPlayer] set in `anonymousPlayer`
  /// by setting the [Player]'s foreign key `anonymousPlayerId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> anonymousPlayer(
    _i1.Session session,
    Player player, {
    _i1.Transaction? transaction,
  }) async {
    if (player.id == null) {
      throw ArgumentError.notNull('player.id');
    }

    var $player = player.copyWith(anonymousPlayerId: null);
    await session.db.updateRow<Player>(
      $player,
      columns: [Player.t.anonymousPlayerId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [Player] and the [PlayerData] set in `playerData`
  /// by setting the [Player]'s foreign key `playerDataId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> playerData(
    _i1.Session session,
    Player player, {
    _i1.Transaction? transaction,
  }) async {
    if (player.id == null) {
      throw ArgumentError.notNull('player.id');
    }

    var $player = player.copyWith(playerDataId: null);
    await session.db.updateRow<Player>(
      $player,
      columns: [Player.t.playerDataId],
      transaction: transaction,
    );
  }
}
