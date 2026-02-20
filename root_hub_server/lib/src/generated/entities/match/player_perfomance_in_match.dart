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
import '../../entities/match/played_match.dart' as _i4;
import '../../entities/core/faction.dart' as _i5;
import 'package:root_hub_server/src/generated/protocol.dart' as _i6;

abstract class PlayerPerfomanceInMatch
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  PlayerPerfomanceInMatch._({
    this.id,
    this.anonymousPlayerId,
    this.anonymousPlayer,
    this.playerDataId,
    this.playerData,
    required this.playedMatchId,
    this.playedMatch,
    required this.factionUsedInMatch,
    required this.didWin,
    this.scoreInMatch,
  });

  factory PlayerPerfomanceInMatch({
    int? id,
    int? anonymousPlayerId,
    _i2.AnonymousPlayer? anonymousPlayer,
    int? playerDataId,
    _i3.PlayerData? playerData,
    required int playedMatchId,
    _i4.PlayedMatch? playedMatch,
    required _i5.Faction factionUsedInMatch,
    required bool didWin,
    int? scoreInMatch,
  }) = _PlayerPerfomanceInMatchImpl;

  factory PlayerPerfomanceInMatch.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return PlayerPerfomanceInMatch(
      id: jsonSerialization['id'] as int?,
      anonymousPlayerId: jsonSerialization['anonymousPlayerId'] as int?,
      anonymousPlayer: jsonSerialization['anonymousPlayer'] == null
          ? null
          : _i6.Protocol().deserialize<_i2.AnonymousPlayer>(
              jsonSerialization['anonymousPlayer'],
            ),
      playerDataId: jsonSerialization['playerDataId'] as int?,
      playerData: jsonSerialization['playerData'] == null
          ? null
          : _i6.Protocol().deserialize<_i3.PlayerData>(
              jsonSerialization['playerData'],
            ),
      playedMatchId: jsonSerialization['playedMatchId'] as int,
      playedMatch: jsonSerialization['playedMatch'] == null
          ? null
          : _i6.Protocol().deserialize<_i4.PlayedMatch>(
              jsonSerialization['playedMatch'],
            ),
      factionUsedInMatch: _i5.Faction.fromJson(
        (jsonSerialization['factionUsedInMatch'] as String),
      ),
      didWin: jsonSerialization['didWin'] as bool,
      scoreInMatch: jsonSerialization['scoreInMatch'] as int?,
    );
  }

  static final t = PlayerPerfomanceInMatchTable();

  static const db = PlayerPerfomanceInMatchRepository._();

  @override
  int? id;

  int? anonymousPlayerId;

  _i2.AnonymousPlayer? anonymousPlayer;

  int? playerDataId;

  _i3.PlayerData? playerData;

  int playedMatchId;

  _i4.PlayedMatch? playedMatch;

  _i5.Faction factionUsedInMatch;

  bool didWin;

  int? scoreInMatch;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [PlayerPerfomanceInMatch]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PlayerPerfomanceInMatch copyWith({
    int? id,
    int? anonymousPlayerId,
    _i2.AnonymousPlayer? anonymousPlayer,
    int? playerDataId,
    _i3.PlayerData? playerData,
    int? playedMatchId,
    _i4.PlayedMatch? playedMatch,
    _i5.Faction? factionUsedInMatch,
    bool? didWin,
    int? scoreInMatch,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'PlayerPerfomanceInMatch',
      if (id != null) 'id': id,
      if (anonymousPlayerId != null) 'anonymousPlayerId': anonymousPlayerId,
      if (anonymousPlayer != null) 'anonymousPlayer': anonymousPlayer?.toJson(),
      if (playerDataId != null) 'playerDataId': playerDataId,
      if (playerData != null) 'playerData': playerData?.toJson(),
      'playedMatchId': playedMatchId,
      if (playedMatch != null) 'playedMatch': playedMatch?.toJson(),
      'factionUsedInMatch': factionUsedInMatch.toJson(),
      'didWin': didWin,
      if (scoreInMatch != null) 'scoreInMatch': scoreInMatch,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'PlayerPerfomanceInMatch',
      if (id != null) 'id': id,
      if (anonymousPlayerId != null) 'anonymousPlayerId': anonymousPlayerId,
      if (anonymousPlayer != null)
        'anonymousPlayer': anonymousPlayer?.toJsonForProtocol(),
      if (playerDataId != null) 'playerDataId': playerDataId,
      if (playerData != null) 'playerData': playerData?.toJsonForProtocol(),
      'playedMatchId': playedMatchId,
      if (playedMatch != null) 'playedMatch': playedMatch?.toJsonForProtocol(),
      'factionUsedInMatch': factionUsedInMatch.toJson(),
      'didWin': didWin,
      if (scoreInMatch != null) 'scoreInMatch': scoreInMatch,
    };
  }

  static PlayerPerfomanceInMatchInclude include({
    _i2.AnonymousPlayerInclude? anonymousPlayer,
    _i3.PlayerDataInclude? playerData,
    _i4.PlayedMatchInclude? playedMatch,
  }) {
    return PlayerPerfomanceInMatchInclude._(
      anonymousPlayer: anonymousPlayer,
      playerData: playerData,
      playedMatch: playedMatch,
    );
  }

  static PlayerPerfomanceInMatchIncludeList includeList({
    _i1.WhereExpressionBuilder<PlayerPerfomanceInMatchTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PlayerPerfomanceInMatchTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PlayerPerfomanceInMatchTable>? orderByList,
    PlayerPerfomanceInMatchInclude? include,
  }) {
    return PlayerPerfomanceInMatchIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PlayerPerfomanceInMatch.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(PlayerPerfomanceInMatch.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PlayerPerfomanceInMatchImpl extends PlayerPerfomanceInMatch {
  _PlayerPerfomanceInMatchImpl({
    int? id,
    int? anonymousPlayerId,
    _i2.AnonymousPlayer? anonymousPlayer,
    int? playerDataId,
    _i3.PlayerData? playerData,
    required int playedMatchId,
    _i4.PlayedMatch? playedMatch,
    required _i5.Faction factionUsedInMatch,
    required bool didWin,
    int? scoreInMatch,
  }) : super._(
         id: id,
         anonymousPlayerId: anonymousPlayerId,
         anonymousPlayer: anonymousPlayer,
         playerDataId: playerDataId,
         playerData: playerData,
         playedMatchId: playedMatchId,
         playedMatch: playedMatch,
         factionUsedInMatch: factionUsedInMatch,
         didWin: didWin,
         scoreInMatch: scoreInMatch,
       );

  /// Returns a shallow copy of this [PlayerPerfomanceInMatch]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PlayerPerfomanceInMatch copyWith({
    Object? id = _Undefined,
    Object? anonymousPlayerId = _Undefined,
    Object? anonymousPlayer = _Undefined,
    Object? playerDataId = _Undefined,
    Object? playerData = _Undefined,
    int? playedMatchId,
    Object? playedMatch = _Undefined,
    _i5.Faction? factionUsedInMatch,
    bool? didWin,
    Object? scoreInMatch = _Undefined,
  }) {
    return PlayerPerfomanceInMatch(
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
      playedMatchId: playedMatchId ?? this.playedMatchId,
      playedMatch: playedMatch is _i4.PlayedMatch?
          ? playedMatch
          : this.playedMatch?.copyWith(),
      factionUsedInMatch: factionUsedInMatch ?? this.factionUsedInMatch,
      didWin: didWin ?? this.didWin,
      scoreInMatch: scoreInMatch is int? ? scoreInMatch : this.scoreInMatch,
    );
  }
}

class PlayerPerfomanceInMatchUpdateTable
    extends _i1.UpdateTable<PlayerPerfomanceInMatchTable> {
  PlayerPerfomanceInMatchUpdateTable(super.table);

  _i1.ColumnValue<int, int> anonymousPlayerId(int? value) => _i1.ColumnValue(
    table.anonymousPlayerId,
    value,
  );

  _i1.ColumnValue<int, int> playerDataId(int? value) => _i1.ColumnValue(
    table.playerDataId,
    value,
  );

  _i1.ColumnValue<int, int> playedMatchId(int value) => _i1.ColumnValue(
    table.playedMatchId,
    value,
  );

  _i1.ColumnValue<_i5.Faction, _i5.Faction> factionUsedInMatch(
    _i5.Faction value,
  ) => _i1.ColumnValue(
    table.factionUsedInMatch,
    value,
  );

  _i1.ColumnValue<bool, bool> didWin(bool value) => _i1.ColumnValue(
    table.didWin,
    value,
  );

  _i1.ColumnValue<int, int> scoreInMatch(int? value) => _i1.ColumnValue(
    table.scoreInMatch,
    value,
  );
}

class PlayerPerfomanceInMatchTable extends _i1.Table<int?> {
  PlayerPerfomanceInMatchTable({super.tableRelation})
    : super(tableName: 'player_perfomance_in_match') {
    updateTable = PlayerPerfomanceInMatchUpdateTable(this);
    anonymousPlayerId = _i1.ColumnInt(
      'anonymousPlayerId',
      this,
    );
    playerDataId = _i1.ColumnInt(
      'playerDataId',
      this,
    );
    playedMatchId = _i1.ColumnInt(
      'playedMatchId',
      this,
    );
    factionUsedInMatch = _i1.ColumnEnum(
      'factionUsedInMatch',
      this,
      _i1.EnumSerialization.byName,
    );
    didWin = _i1.ColumnBool(
      'didWin',
      this,
    );
    scoreInMatch = _i1.ColumnInt(
      'scoreInMatch',
      this,
    );
  }

  late final PlayerPerfomanceInMatchUpdateTable updateTable;

  late final _i1.ColumnInt anonymousPlayerId;

  _i2.AnonymousPlayerTable? _anonymousPlayer;

  late final _i1.ColumnInt playerDataId;

  _i3.PlayerDataTable? _playerData;

  late final _i1.ColumnInt playedMatchId;

  _i4.PlayedMatchTable? _playedMatch;

  late final _i1.ColumnEnum<_i5.Faction> factionUsedInMatch;

  late final _i1.ColumnBool didWin;

  late final _i1.ColumnInt scoreInMatch;

  _i2.AnonymousPlayerTable get anonymousPlayer {
    if (_anonymousPlayer != null) return _anonymousPlayer!;
    _anonymousPlayer = _i1.createRelationTable(
      relationFieldName: 'anonymousPlayer',
      field: PlayerPerfomanceInMatch.t.anonymousPlayerId,
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
      field: PlayerPerfomanceInMatch.t.playerDataId,
      foreignField: _i3.PlayerData.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.PlayerDataTable(tableRelation: foreignTableRelation),
    );
    return _playerData!;
  }

  _i4.PlayedMatchTable get playedMatch {
    if (_playedMatch != null) return _playedMatch!;
    _playedMatch = _i1.createRelationTable(
      relationFieldName: 'playedMatch',
      field: PlayerPerfomanceInMatch.t.playedMatchId,
      foreignField: _i4.PlayedMatch.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.PlayedMatchTable(tableRelation: foreignTableRelation),
    );
    return _playedMatch!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    anonymousPlayerId,
    playerDataId,
    playedMatchId,
    factionUsedInMatch,
    didWin,
    scoreInMatch,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'anonymousPlayer') {
      return anonymousPlayer;
    }
    if (relationField == 'playerData') {
      return playerData;
    }
    if (relationField == 'playedMatch') {
      return playedMatch;
    }
    return null;
  }
}

class PlayerPerfomanceInMatchInclude extends _i1.IncludeObject {
  PlayerPerfomanceInMatchInclude._({
    _i2.AnonymousPlayerInclude? anonymousPlayer,
    _i3.PlayerDataInclude? playerData,
    _i4.PlayedMatchInclude? playedMatch,
  }) {
    _anonymousPlayer = anonymousPlayer;
    _playerData = playerData;
    _playedMatch = playedMatch;
  }

  _i2.AnonymousPlayerInclude? _anonymousPlayer;

  _i3.PlayerDataInclude? _playerData;

  _i4.PlayedMatchInclude? _playedMatch;

  @override
  Map<String, _i1.Include?> get includes => {
    'anonymousPlayer': _anonymousPlayer,
    'playerData': _playerData,
    'playedMatch': _playedMatch,
  };

  @override
  _i1.Table<int?> get table => PlayerPerfomanceInMatch.t;
}

class PlayerPerfomanceInMatchIncludeList extends _i1.IncludeList {
  PlayerPerfomanceInMatchIncludeList._({
    _i1.WhereExpressionBuilder<PlayerPerfomanceInMatchTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(PlayerPerfomanceInMatch.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => PlayerPerfomanceInMatch.t;
}

class PlayerPerfomanceInMatchRepository {
  const PlayerPerfomanceInMatchRepository._();

  final attachRow = const PlayerPerfomanceInMatchAttachRowRepository._();

  final detachRow = const PlayerPerfomanceInMatchDetachRowRepository._();

  /// Returns a list of [PlayerPerfomanceInMatch]s matching the given query parameters.
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
  Future<List<PlayerPerfomanceInMatch>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PlayerPerfomanceInMatchTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PlayerPerfomanceInMatchTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PlayerPerfomanceInMatchTable>? orderByList,
    _i1.Transaction? transaction,
    PlayerPerfomanceInMatchInclude? include,
  }) async {
    return session.db.find<PlayerPerfomanceInMatch>(
      where: where?.call(PlayerPerfomanceInMatch.t),
      orderBy: orderBy?.call(PlayerPerfomanceInMatch.t),
      orderByList: orderByList?.call(PlayerPerfomanceInMatch.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [PlayerPerfomanceInMatch] matching the given query parameters.
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
  Future<PlayerPerfomanceInMatch?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PlayerPerfomanceInMatchTable>? where,
    int? offset,
    _i1.OrderByBuilder<PlayerPerfomanceInMatchTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PlayerPerfomanceInMatchTable>? orderByList,
    _i1.Transaction? transaction,
    PlayerPerfomanceInMatchInclude? include,
  }) async {
    return session.db.findFirstRow<PlayerPerfomanceInMatch>(
      where: where?.call(PlayerPerfomanceInMatch.t),
      orderBy: orderBy?.call(PlayerPerfomanceInMatch.t),
      orderByList: orderByList?.call(PlayerPerfomanceInMatch.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [PlayerPerfomanceInMatch] by its [id] or null if no such row exists.
  Future<PlayerPerfomanceInMatch?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    PlayerPerfomanceInMatchInclude? include,
  }) async {
    return session.db.findById<PlayerPerfomanceInMatch>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [PlayerPerfomanceInMatch]s in the list and returns the inserted rows.
  ///
  /// The returned [PlayerPerfomanceInMatch]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<PlayerPerfomanceInMatch>> insert(
    _i1.Session session,
    List<PlayerPerfomanceInMatch> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<PlayerPerfomanceInMatch>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [PlayerPerfomanceInMatch] and returns the inserted row.
  ///
  /// The returned [PlayerPerfomanceInMatch] will have its `id` field set.
  Future<PlayerPerfomanceInMatch> insertRow(
    _i1.Session session,
    PlayerPerfomanceInMatch row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<PlayerPerfomanceInMatch>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [PlayerPerfomanceInMatch]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<PlayerPerfomanceInMatch>> update(
    _i1.Session session,
    List<PlayerPerfomanceInMatch> rows, {
    _i1.ColumnSelections<PlayerPerfomanceInMatchTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<PlayerPerfomanceInMatch>(
      rows,
      columns: columns?.call(PlayerPerfomanceInMatch.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PlayerPerfomanceInMatch]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<PlayerPerfomanceInMatch> updateRow(
    _i1.Session session,
    PlayerPerfomanceInMatch row, {
    _i1.ColumnSelections<PlayerPerfomanceInMatchTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<PlayerPerfomanceInMatch>(
      row,
      columns: columns?.call(PlayerPerfomanceInMatch.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PlayerPerfomanceInMatch] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<PlayerPerfomanceInMatch?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<PlayerPerfomanceInMatchUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<PlayerPerfomanceInMatch>(
      id,
      columnValues: columnValues(PlayerPerfomanceInMatch.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [PlayerPerfomanceInMatch]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<PlayerPerfomanceInMatch>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<PlayerPerfomanceInMatchUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<PlayerPerfomanceInMatchTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PlayerPerfomanceInMatchTable>? orderBy,
    _i1.OrderByListBuilder<PlayerPerfomanceInMatchTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<PlayerPerfomanceInMatch>(
      columnValues: columnValues(PlayerPerfomanceInMatch.t.updateTable),
      where: where(PlayerPerfomanceInMatch.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PlayerPerfomanceInMatch.t),
      orderByList: orderByList?.call(PlayerPerfomanceInMatch.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [PlayerPerfomanceInMatch]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<PlayerPerfomanceInMatch>> delete(
    _i1.Session session,
    List<PlayerPerfomanceInMatch> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<PlayerPerfomanceInMatch>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [PlayerPerfomanceInMatch].
  Future<PlayerPerfomanceInMatch> deleteRow(
    _i1.Session session,
    PlayerPerfomanceInMatch row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<PlayerPerfomanceInMatch>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<PlayerPerfomanceInMatch>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PlayerPerfomanceInMatchTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<PlayerPerfomanceInMatch>(
      where: where(PlayerPerfomanceInMatch.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PlayerPerfomanceInMatchTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<PlayerPerfomanceInMatch>(
      where: where?.call(PlayerPerfomanceInMatch.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class PlayerPerfomanceInMatchAttachRowRepository {
  const PlayerPerfomanceInMatchAttachRowRepository._();

  /// Creates a relation between the given [PlayerPerfomanceInMatch] and [AnonymousPlayer]
  /// by setting the [PlayerPerfomanceInMatch]'s foreign key `anonymousPlayerId` to refer to the [AnonymousPlayer].
  Future<void> anonymousPlayer(
    _i1.Session session,
    PlayerPerfomanceInMatch playerPerfomanceInMatch,
    _i2.AnonymousPlayer anonymousPlayer, {
    _i1.Transaction? transaction,
  }) async {
    if (playerPerfomanceInMatch.id == null) {
      throw ArgumentError.notNull('playerPerfomanceInMatch.id');
    }
    if (anonymousPlayer.id == null) {
      throw ArgumentError.notNull('anonymousPlayer.id');
    }

    var $playerPerfomanceInMatch = playerPerfomanceInMatch.copyWith(
      anonymousPlayerId: anonymousPlayer.id,
    );
    await session.db.updateRow<PlayerPerfomanceInMatch>(
      $playerPerfomanceInMatch,
      columns: [PlayerPerfomanceInMatch.t.anonymousPlayerId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [PlayerPerfomanceInMatch] and [PlayerData]
  /// by setting the [PlayerPerfomanceInMatch]'s foreign key `playerDataId` to refer to the [PlayerData].
  Future<void> playerData(
    _i1.Session session,
    PlayerPerfomanceInMatch playerPerfomanceInMatch,
    _i3.PlayerData playerData, {
    _i1.Transaction? transaction,
  }) async {
    if (playerPerfomanceInMatch.id == null) {
      throw ArgumentError.notNull('playerPerfomanceInMatch.id');
    }
    if (playerData.id == null) {
      throw ArgumentError.notNull('playerData.id');
    }

    var $playerPerfomanceInMatch = playerPerfomanceInMatch.copyWith(
      playerDataId: playerData.id,
    );
    await session.db.updateRow<PlayerPerfomanceInMatch>(
      $playerPerfomanceInMatch,
      columns: [PlayerPerfomanceInMatch.t.playerDataId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [PlayerPerfomanceInMatch] and [PlayedMatch]
  /// by setting the [PlayerPerfomanceInMatch]'s foreign key `playedMatchId` to refer to the [PlayedMatch].
  Future<void> playedMatch(
    _i1.Session session,
    PlayerPerfomanceInMatch playerPerfomanceInMatch,
    _i4.PlayedMatch playedMatch, {
    _i1.Transaction? transaction,
  }) async {
    if (playerPerfomanceInMatch.id == null) {
      throw ArgumentError.notNull('playerPerfomanceInMatch.id');
    }
    if (playedMatch.id == null) {
      throw ArgumentError.notNull('playedMatch.id');
    }

    var $playerPerfomanceInMatch = playerPerfomanceInMatch.copyWith(
      playedMatchId: playedMatch.id,
    );
    await session.db.updateRow<PlayerPerfomanceInMatch>(
      $playerPerfomanceInMatch,
      columns: [PlayerPerfomanceInMatch.t.playedMatchId],
      transaction: transaction,
    );
  }
}

class PlayerPerfomanceInMatchDetachRowRepository {
  const PlayerPerfomanceInMatchDetachRowRepository._();

  /// Detaches the relation between this [PlayerPerfomanceInMatch] and the [AnonymousPlayer] set in `anonymousPlayer`
  /// by setting the [PlayerPerfomanceInMatch]'s foreign key `anonymousPlayerId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> anonymousPlayer(
    _i1.Session session,
    PlayerPerfomanceInMatch playerPerfomanceInMatch, {
    _i1.Transaction? transaction,
  }) async {
    if (playerPerfomanceInMatch.id == null) {
      throw ArgumentError.notNull('playerPerfomanceInMatch.id');
    }

    var $playerPerfomanceInMatch = playerPerfomanceInMatch.copyWith(
      anonymousPlayerId: null,
    );
    await session.db.updateRow<PlayerPerfomanceInMatch>(
      $playerPerfomanceInMatch,
      columns: [PlayerPerfomanceInMatch.t.anonymousPlayerId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [PlayerPerfomanceInMatch] and the [PlayerData] set in `playerData`
  /// by setting the [PlayerPerfomanceInMatch]'s foreign key `playerDataId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> playerData(
    _i1.Session session,
    PlayerPerfomanceInMatch playerPerfomanceInMatch, {
    _i1.Transaction? transaction,
  }) async {
    if (playerPerfomanceInMatch.id == null) {
      throw ArgumentError.notNull('playerPerfomanceInMatch.id');
    }

    var $playerPerfomanceInMatch = playerPerfomanceInMatch.copyWith(
      playerDataId: null,
    );
    await session.db.updateRow<PlayerPerfomanceInMatch>(
      $playerPerfomanceInMatch,
      columns: [PlayerPerfomanceInMatch.t.playerDataId],
      transaction: transaction,
    );
  }
}
