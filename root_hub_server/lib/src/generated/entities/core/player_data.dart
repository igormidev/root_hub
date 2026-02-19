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
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _i2;
import '../../entities/core/country.dart' as _i3;
import '../../entities/core/faction.dart' as _i4;
import '../../entities/match/player_in_match.dart' as _i5;
import '../../entities/community/post.dart' as _i6;
import '../../entities/community/post_comment.dart' as _i7;
import '../../entities/match_making/match_schedule.dart' as _i8;
import '../../entities/match_making/match_subscription.dart' as _i9;
import 'package:root_hub_server/src/generated/protocol.dart' as _i10;

abstract class PlayerData
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  PlayerData._({
    this.id,
    required this.authUserId,
    this.authUser,
    this.currentCountry,
    this.nationality,
    required this.favoriteFaction,
    this.matchEntries,
    this.posts,
    this.comments,
    this.pairingAttempts,
    this.subscriptions,
  });

  factory PlayerData({
    int? id,
    required _i1.UuidValue authUserId,
    _i2.AuthUser? authUser,
    _i3.Country? currentCountry,
    _i3.Country? nationality,
    required _i4.Faction favoriteFaction,
    List<_i5.PlayerInMatch>? matchEntries,
    List<_i6.Post>? posts,
    List<_i7.PostComment>? comments,
    List<_i8.MatchSchedulePairingAttempt>? pairingAttempts,
    List<_i9.MatchSubscription>? subscriptions,
  }) = _PlayerDataImpl;

  factory PlayerData.fromJson(Map<String, dynamic> jsonSerialization) {
    return PlayerData(
      id: jsonSerialization['id'] as int?,
      authUserId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['authUserId'],
      ),
      authUser: jsonSerialization['authUser'] == null
          ? null
          : _i10.Protocol().deserialize<_i2.AuthUser>(
              jsonSerialization['authUser'],
            ),
      currentCountry: jsonSerialization['currentCountry'] == null
          ? null
          : _i3.Country.fromJson(
              (jsonSerialization['currentCountry'] as String),
            ),
      nationality: jsonSerialization['nationality'] == null
          ? null
          : _i3.Country.fromJson((jsonSerialization['nationality'] as String)),
      favoriteFaction: _i4.Faction.fromJson(
        (jsonSerialization['favoriteFaction'] as String),
      ),
      matchEntries: jsonSerialization['matchEntries'] == null
          ? null
          : _i10.Protocol().deserialize<List<_i5.PlayerInMatch>>(
              jsonSerialization['matchEntries'],
            ),
      posts: jsonSerialization['posts'] == null
          ? null
          : _i10.Protocol().deserialize<List<_i6.Post>>(
              jsonSerialization['posts'],
            ),
      comments: jsonSerialization['comments'] == null
          ? null
          : _i10.Protocol().deserialize<List<_i7.PostComment>>(
              jsonSerialization['comments'],
            ),
      pairingAttempts: jsonSerialization['pairingAttempts'] == null
          ? null
          : _i10.Protocol().deserialize<List<_i8.MatchSchedulePairingAttempt>>(
              jsonSerialization['pairingAttempts'],
            ),
      subscriptions: jsonSerialization['subscriptions'] == null
          ? null
          : _i10.Protocol().deserialize<List<_i9.MatchSubscription>>(
              jsonSerialization['subscriptions'],
            ),
    );
  }

  static final t = PlayerDataTable();

  static const db = PlayerDataRepository._();

  @override
  int? id;

  _i1.UuidValue authUserId;

  /// The [AuthUser] this profile belongs to
  _i2.AuthUser? authUser;

  _i3.Country? currentCountry;

  _i3.Country? nationality;

  _i4.Faction favoriteFaction;

  List<_i5.PlayerInMatch>? matchEntries;

  List<_i6.Post>? posts;

  List<_i7.PostComment>? comments;

  List<_i8.MatchSchedulePairingAttempt>? pairingAttempts;

  List<_i9.MatchSubscription>? subscriptions;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [PlayerData]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PlayerData copyWith({
    int? id,
    _i1.UuidValue? authUserId,
    _i2.AuthUser? authUser,
    _i3.Country? currentCountry,
    _i3.Country? nationality,
    _i4.Faction? favoriteFaction,
    List<_i5.PlayerInMatch>? matchEntries,
    List<_i6.Post>? posts,
    List<_i7.PostComment>? comments,
    List<_i8.MatchSchedulePairingAttempt>? pairingAttempts,
    List<_i9.MatchSubscription>? subscriptions,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'PlayerData',
      if (id != null) 'id': id,
      'authUserId': authUserId.toJson(),
      if (authUser != null) 'authUser': authUser?.toJson(),
      if (currentCountry != null) 'currentCountry': currentCountry?.toJson(),
      if (nationality != null) 'nationality': nationality?.toJson(),
      'favoriteFaction': favoriteFaction.toJson(),
      if (matchEntries != null)
        'matchEntries': matchEntries?.toJson(valueToJson: (v) => v.toJson()),
      if (posts != null) 'posts': posts?.toJson(valueToJson: (v) => v.toJson()),
      if (comments != null)
        'comments': comments?.toJson(valueToJson: (v) => v.toJson()),
      if (pairingAttempts != null)
        'pairingAttempts': pairingAttempts?.toJson(
          valueToJson: (v) => v.toJson(),
        ),
      if (subscriptions != null)
        'subscriptions': subscriptions?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'PlayerData',
      if (id != null) 'id': id,
      'authUserId': authUserId.toJson(),
      if (authUser != null) 'authUser': authUser?.toJsonForProtocol(),
      if (currentCountry != null) 'currentCountry': currentCountry?.toJson(),
      if (nationality != null) 'nationality': nationality?.toJson(),
      'favoriteFaction': favoriteFaction.toJson(),
      if (matchEntries != null)
        'matchEntries': matchEntries?.toJson(
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
      if (posts != null)
        'posts': posts?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (comments != null)
        'comments': comments?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (pairingAttempts != null)
        'pairingAttempts': pairingAttempts?.toJson(
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
      if (subscriptions != null)
        'subscriptions': subscriptions?.toJson(
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
    };
  }

  static PlayerDataInclude include({
    _i2.AuthUserInclude? authUser,
    _i5.PlayerInMatchIncludeList? matchEntries,
    _i6.PostIncludeList? posts,
    _i7.PostCommentIncludeList? comments,
    _i8.MatchSchedulePairingAttemptIncludeList? pairingAttempts,
    _i9.MatchSubscriptionIncludeList? subscriptions,
  }) {
    return PlayerDataInclude._(
      authUser: authUser,
      matchEntries: matchEntries,
      posts: posts,
      comments: comments,
      pairingAttempts: pairingAttempts,
      subscriptions: subscriptions,
    );
  }

  static PlayerDataIncludeList includeList({
    _i1.WhereExpressionBuilder<PlayerDataTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PlayerDataTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PlayerDataTable>? orderByList,
    PlayerDataInclude? include,
  }) {
    return PlayerDataIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PlayerData.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(PlayerData.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PlayerDataImpl extends PlayerData {
  _PlayerDataImpl({
    int? id,
    required _i1.UuidValue authUserId,
    _i2.AuthUser? authUser,
    _i3.Country? currentCountry,
    _i3.Country? nationality,
    required _i4.Faction favoriteFaction,
    List<_i5.PlayerInMatch>? matchEntries,
    List<_i6.Post>? posts,
    List<_i7.PostComment>? comments,
    List<_i8.MatchSchedulePairingAttempt>? pairingAttempts,
    List<_i9.MatchSubscription>? subscriptions,
  }) : super._(
         id: id,
         authUserId: authUserId,
         authUser: authUser,
         currentCountry: currentCountry,
         nationality: nationality,
         favoriteFaction: favoriteFaction,
         matchEntries: matchEntries,
         posts: posts,
         comments: comments,
         pairingAttempts: pairingAttempts,
         subscriptions: subscriptions,
       );

  /// Returns a shallow copy of this [PlayerData]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PlayerData copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? authUserId,
    Object? authUser = _Undefined,
    Object? currentCountry = _Undefined,
    Object? nationality = _Undefined,
    _i4.Faction? favoriteFaction,
    Object? matchEntries = _Undefined,
    Object? posts = _Undefined,
    Object? comments = _Undefined,
    Object? pairingAttempts = _Undefined,
    Object? subscriptions = _Undefined,
  }) {
    return PlayerData(
      id: id is int? ? id : this.id,
      authUserId: authUserId ?? this.authUserId,
      authUser: authUser is _i2.AuthUser?
          ? authUser
          : this.authUser?.copyWith(),
      currentCountry: currentCountry is _i3.Country?
          ? currentCountry
          : this.currentCountry,
      nationality: nationality is _i3.Country? ? nationality : this.nationality,
      favoriteFaction: favoriteFaction ?? this.favoriteFaction,
      matchEntries: matchEntries is List<_i5.PlayerInMatch>?
          ? matchEntries
          : this.matchEntries?.map((e0) => e0.copyWith()).toList(),
      posts: posts is List<_i6.Post>?
          ? posts
          : this.posts?.map((e0) => e0.copyWith()).toList(),
      comments: comments is List<_i7.PostComment>?
          ? comments
          : this.comments?.map((e0) => e0.copyWith()).toList(),
      pairingAttempts: pairingAttempts is List<_i8.MatchSchedulePairingAttempt>?
          ? pairingAttempts
          : this.pairingAttempts?.map((e0) => e0.copyWith()).toList(),
      subscriptions: subscriptions is List<_i9.MatchSubscription>?
          ? subscriptions
          : this.subscriptions?.map((e0) => e0.copyWith()).toList(),
    );
  }
}

class PlayerDataUpdateTable extends _i1.UpdateTable<PlayerDataTable> {
  PlayerDataUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> authUserId(
    _i1.UuidValue value,
  ) => _i1.ColumnValue(
    table.authUserId,
    value,
  );

  _i1.ColumnValue<_i3.Country, _i3.Country> currentCountry(
    _i3.Country? value,
  ) => _i1.ColumnValue(
    table.currentCountry,
    value,
  );

  _i1.ColumnValue<_i3.Country, _i3.Country> nationality(_i3.Country? value) =>
      _i1.ColumnValue(
        table.nationality,
        value,
      );

  _i1.ColumnValue<_i4.Faction, _i4.Faction> favoriteFaction(
    _i4.Faction value,
  ) => _i1.ColumnValue(
    table.favoriteFaction,
    value,
  );
}

class PlayerDataTable extends _i1.Table<int?> {
  PlayerDataTable({super.tableRelation}) : super(tableName: 'player_data') {
    updateTable = PlayerDataUpdateTable(this);
    authUserId = _i1.ColumnUuid(
      'authUserId',
      this,
    );
    currentCountry = _i1.ColumnEnum(
      'currentCountry',
      this,
      _i1.EnumSerialization.byName,
    );
    nationality = _i1.ColumnEnum(
      'nationality',
      this,
      _i1.EnumSerialization.byName,
    );
    favoriteFaction = _i1.ColumnEnum(
      'favoriteFaction',
      this,
      _i1.EnumSerialization.byName,
    );
  }

  late final PlayerDataUpdateTable updateTable;

  late final _i1.ColumnUuid authUserId;

  /// The [AuthUser] this profile belongs to
  _i2.AuthUserTable? _authUser;

  late final _i1.ColumnEnum<_i3.Country> currentCountry;

  late final _i1.ColumnEnum<_i3.Country> nationality;

  late final _i1.ColumnEnum<_i4.Faction> favoriteFaction;

  _i5.PlayerInMatchTable? ___matchEntries;

  _i1.ManyRelation<_i5.PlayerInMatchTable>? _matchEntries;

  _i6.PostTable? ___posts;

  _i1.ManyRelation<_i6.PostTable>? _posts;

  _i7.PostCommentTable? ___comments;

  _i1.ManyRelation<_i7.PostCommentTable>? _comments;

  _i8.MatchSchedulePairingAttemptTable? ___pairingAttempts;

  _i1.ManyRelation<_i8.MatchSchedulePairingAttemptTable>? _pairingAttempts;

  _i9.MatchSubscriptionTable? ___subscriptions;

  _i1.ManyRelation<_i9.MatchSubscriptionTable>? _subscriptions;

  _i2.AuthUserTable get authUser {
    if (_authUser != null) return _authUser!;
    _authUser = _i1.createRelationTable(
      relationFieldName: 'authUser',
      field: PlayerData.t.authUserId,
      foreignField: _i2.AuthUser.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.AuthUserTable(tableRelation: foreignTableRelation),
    );
    return _authUser!;
  }

  _i5.PlayerInMatchTable get __matchEntries {
    if (___matchEntries != null) return ___matchEntries!;
    ___matchEntries = _i1.createRelationTable(
      relationFieldName: '__matchEntries',
      field: PlayerData.t.id,
      foreignField: _i5.PlayerInMatch.t.playerId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.PlayerInMatchTable(tableRelation: foreignTableRelation),
    );
    return ___matchEntries!;
  }

  _i6.PostTable get __posts {
    if (___posts != null) return ___posts!;
    ___posts = _i1.createRelationTable(
      relationFieldName: '__posts',
      field: PlayerData.t.id,
      foreignField: _i6.Post.t.authorId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i6.PostTable(tableRelation: foreignTableRelation),
    );
    return ___posts!;
  }

  _i7.PostCommentTable get __comments {
    if (___comments != null) return ___comments!;
    ___comments = _i1.createRelationTable(
      relationFieldName: '__comments',
      field: PlayerData.t.id,
      foreignField: _i7.PostComment.t.ownerId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i7.PostCommentTable(tableRelation: foreignTableRelation),
    );
    return ___comments!;
  }

  _i8.MatchSchedulePairingAttemptTable get __pairingAttempts {
    if (___pairingAttempts != null) return ___pairingAttempts!;
    ___pairingAttempts = _i1.createRelationTable(
      relationFieldName: '__pairingAttempts',
      field: PlayerData.t.id,
      foreignField: _i8.MatchSchedulePairingAttempt.t.playerDataId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i8.MatchSchedulePairingAttemptTable(
            tableRelation: foreignTableRelation,
          ),
    );
    return ___pairingAttempts!;
  }

  _i9.MatchSubscriptionTable get __subscriptions {
    if (___subscriptions != null) return ___subscriptions!;
    ___subscriptions = _i1.createRelationTable(
      relationFieldName: '__subscriptions',
      field: PlayerData.t.id,
      foreignField: _i9.MatchSubscription.t.playerDataId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i9.MatchSubscriptionTable(tableRelation: foreignTableRelation),
    );
    return ___subscriptions!;
  }

  _i1.ManyRelation<_i5.PlayerInMatchTable> get matchEntries {
    if (_matchEntries != null) return _matchEntries!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'matchEntries',
      field: PlayerData.t.id,
      foreignField: _i5.PlayerInMatch.t.playerId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.PlayerInMatchTable(tableRelation: foreignTableRelation),
    );
    _matchEntries = _i1.ManyRelation<_i5.PlayerInMatchTable>(
      tableWithRelations: relationTable,
      table: _i5.PlayerInMatchTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _matchEntries!;
  }

  _i1.ManyRelation<_i6.PostTable> get posts {
    if (_posts != null) return _posts!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'posts',
      field: PlayerData.t.id,
      foreignField: _i6.Post.t.authorId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i6.PostTable(tableRelation: foreignTableRelation),
    );
    _posts = _i1.ManyRelation<_i6.PostTable>(
      tableWithRelations: relationTable,
      table: _i6.PostTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _posts!;
  }

  _i1.ManyRelation<_i7.PostCommentTable> get comments {
    if (_comments != null) return _comments!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'comments',
      field: PlayerData.t.id,
      foreignField: _i7.PostComment.t.ownerId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i7.PostCommentTable(tableRelation: foreignTableRelation),
    );
    _comments = _i1.ManyRelation<_i7.PostCommentTable>(
      tableWithRelations: relationTable,
      table: _i7.PostCommentTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _comments!;
  }

  _i1.ManyRelation<_i8.MatchSchedulePairingAttemptTable> get pairingAttempts {
    if (_pairingAttempts != null) return _pairingAttempts!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'pairingAttempts',
      field: PlayerData.t.id,
      foreignField: _i8.MatchSchedulePairingAttempt.t.playerDataId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i8.MatchSchedulePairingAttemptTable(
            tableRelation: foreignTableRelation,
          ),
    );
    _pairingAttempts = _i1.ManyRelation<_i8.MatchSchedulePairingAttemptTable>(
      tableWithRelations: relationTable,
      table: _i8.MatchSchedulePairingAttemptTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _pairingAttempts!;
  }

  _i1.ManyRelation<_i9.MatchSubscriptionTable> get subscriptions {
    if (_subscriptions != null) return _subscriptions!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'subscriptions',
      field: PlayerData.t.id,
      foreignField: _i9.MatchSubscription.t.playerDataId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i9.MatchSubscriptionTable(tableRelation: foreignTableRelation),
    );
    _subscriptions = _i1.ManyRelation<_i9.MatchSubscriptionTable>(
      tableWithRelations: relationTable,
      table: _i9.MatchSubscriptionTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _subscriptions!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    authUserId,
    currentCountry,
    nationality,
    favoriteFaction,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'authUser') {
      return authUser;
    }
    if (relationField == 'matchEntries') {
      return __matchEntries;
    }
    if (relationField == 'posts') {
      return __posts;
    }
    if (relationField == 'comments') {
      return __comments;
    }
    if (relationField == 'pairingAttempts') {
      return __pairingAttempts;
    }
    if (relationField == 'subscriptions') {
      return __subscriptions;
    }
    return null;
  }
}

class PlayerDataInclude extends _i1.IncludeObject {
  PlayerDataInclude._({
    _i2.AuthUserInclude? authUser,
    _i5.PlayerInMatchIncludeList? matchEntries,
    _i6.PostIncludeList? posts,
    _i7.PostCommentIncludeList? comments,
    _i8.MatchSchedulePairingAttemptIncludeList? pairingAttempts,
    _i9.MatchSubscriptionIncludeList? subscriptions,
  }) {
    _authUser = authUser;
    _matchEntries = matchEntries;
    _posts = posts;
    _comments = comments;
    _pairingAttempts = pairingAttempts;
    _subscriptions = subscriptions;
  }

  _i2.AuthUserInclude? _authUser;

  _i5.PlayerInMatchIncludeList? _matchEntries;

  _i6.PostIncludeList? _posts;

  _i7.PostCommentIncludeList? _comments;

  _i8.MatchSchedulePairingAttemptIncludeList? _pairingAttempts;

  _i9.MatchSubscriptionIncludeList? _subscriptions;

  @override
  Map<String, _i1.Include?> get includes => {
    'authUser': _authUser,
    'matchEntries': _matchEntries,
    'posts': _posts,
    'comments': _comments,
    'pairingAttempts': _pairingAttempts,
    'subscriptions': _subscriptions,
  };

  @override
  _i1.Table<int?> get table => PlayerData.t;
}

class PlayerDataIncludeList extends _i1.IncludeList {
  PlayerDataIncludeList._({
    _i1.WhereExpressionBuilder<PlayerDataTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(PlayerData.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => PlayerData.t;
}

class PlayerDataRepository {
  const PlayerDataRepository._();

  final attach = const PlayerDataAttachRepository._();

  final attachRow = const PlayerDataAttachRowRepository._();

  final detach = const PlayerDataDetachRepository._();

  final detachRow = const PlayerDataDetachRowRepository._();

  /// Returns a list of [PlayerData]s matching the given query parameters.
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
  Future<List<PlayerData>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PlayerDataTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PlayerDataTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PlayerDataTable>? orderByList,
    _i1.Transaction? transaction,
    PlayerDataInclude? include,
  }) async {
    return session.db.find<PlayerData>(
      where: where?.call(PlayerData.t),
      orderBy: orderBy?.call(PlayerData.t),
      orderByList: orderByList?.call(PlayerData.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [PlayerData] matching the given query parameters.
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
  Future<PlayerData?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PlayerDataTable>? where,
    int? offset,
    _i1.OrderByBuilder<PlayerDataTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PlayerDataTable>? orderByList,
    _i1.Transaction? transaction,
    PlayerDataInclude? include,
  }) async {
    return session.db.findFirstRow<PlayerData>(
      where: where?.call(PlayerData.t),
      orderBy: orderBy?.call(PlayerData.t),
      orderByList: orderByList?.call(PlayerData.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [PlayerData] by its [id] or null if no such row exists.
  Future<PlayerData?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    PlayerDataInclude? include,
  }) async {
    return session.db.findById<PlayerData>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [PlayerData]s in the list and returns the inserted rows.
  ///
  /// The returned [PlayerData]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<PlayerData>> insert(
    _i1.Session session,
    List<PlayerData> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<PlayerData>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [PlayerData] and returns the inserted row.
  ///
  /// The returned [PlayerData] will have its `id` field set.
  Future<PlayerData> insertRow(
    _i1.Session session,
    PlayerData row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<PlayerData>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [PlayerData]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<PlayerData>> update(
    _i1.Session session,
    List<PlayerData> rows, {
    _i1.ColumnSelections<PlayerDataTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<PlayerData>(
      rows,
      columns: columns?.call(PlayerData.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PlayerData]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<PlayerData> updateRow(
    _i1.Session session,
    PlayerData row, {
    _i1.ColumnSelections<PlayerDataTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<PlayerData>(
      row,
      columns: columns?.call(PlayerData.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PlayerData] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<PlayerData?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<PlayerDataUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<PlayerData>(
      id,
      columnValues: columnValues(PlayerData.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [PlayerData]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<PlayerData>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<PlayerDataUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<PlayerDataTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PlayerDataTable>? orderBy,
    _i1.OrderByListBuilder<PlayerDataTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<PlayerData>(
      columnValues: columnValues(PlayerData.t.updateTable),
      where: where(PlayerData.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PlayerData.t),
      orderByList: orderByList?.call(PlayerData.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [PlayerData]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<PlayerData>> delete(
    _i1.Session session,
    List<PlayerData> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<PlayerData>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [PlayerData].
  Future<PlayerData> deleteRow(
    _i1.Session session,
    PlayerData row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<PlayerData>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<PlayerData>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PlayerDataTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<PlayerData>(
      where: where(PlayerData.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PlayerDataTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<PlayerData>(
      where: where?.call(PlayerData.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class PlayerDataAttachRepository {
  const PlayerDataAttachRepository._();

  /// Creates a relation between this [PlayerData] and the given [PlayerInMatch]s
  /// by setting each [PlayerInMatch]'s foreign key `playerId` to refer to this [PlayerData].
  Future<void> matchEntries(
    _i1.Session session,
    PlayerData playerData,
    List<_i5.PlayerInMatch> playerInMatch, {
    _i1.Transaction? transaction,
  }) async {
    if (playerInMatch.any((e) => e.id == null)) {
      throw ArgumentError.notNull('playerInMatch.id');
    }
    if (playerData.id == null) {
      throw ArgumentError.notNull('playerData.id');
    }

    var $playerInMatch = playerInMatch
        .map((e) => e.copyWith(playerId: playerData.id))
        .toList();
    await session.db.update<_i5.PlayerInMatch>(
      $playerInMatch,
      columns: [_i5.PlayerInMatch.t.playerId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [PlayerData] and the given [Post]s
  /// by setting each [Post]'s foreign key `authorId` to refer to this [PlayerData].
  Future<void> posts(
    _i1.Session session,
    PlayerData playerData,
    List<_i6.Post> post, {
    _i1.Transaction? transaction,
  }) async {
    if (post.any((e) => e.id == null)) {
      throw ArgumentError.notNull('post.id');
    }
    if (playerData.id == null) {
      throw ArgumentError.notNull('playerData.id');
    }

    var $post = post.map((e) => e.copyWith(authorId: playerData.id)).toList();
    await session.db.update<_i6.Post>(
      $post,
      columns: [_i6.Post.t.authorId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [PlayerData] and the given [PostComment]s
  /// by setting each [PostComment]'s foreign key `ownerId` to refer to this [PlayerData].
  Future<void> comments(
    _i1.Session session,
    PlayerData playerData,
    List<_i7.PostComment> postComment, {
    _i1.Transaction? transaction,
  }) async {
    if (postComment.any((e) => e.id == null)) {
      throw ArgumentError.notNull('postComment.id');
    }
    if (playerData.id == null) {
      throw ArgumentError.notNull('playerData.id');
    }

    var $postComment = postComment
        .map((e) => e.copyWith(ownerId: playerData.id))
        .toList();
    await session.db.update<_i7.PostComment>(
      $postComment,
      columns: [_i7.PostComment.t.ownerId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [PlayerData] and the given [MatchSchedulePairingAttempt]s
  /// by setting each [MatchSchedulePairingAttempt]'s foreign key `playerDataId` to refer to this [PlayerData].
  Future<void> pairingAttempts(
    _i1.Session session,
    PlayerData playerData,
    List<_i8.MatchSchedulePairingAttempt> matchSchedulePairingAttempt, {
    _i1.Transaction? transaction,
  }) async {
    if (matchSchedulePairingAttempt.any((e) => e.id == null)) {
      throw ArgumentError.notNull('matchSchedulePairingAttempt.id');
    }
    if (playerData.id == null) {
      throw ArgumentError.notNull('playerData.id');
    }

    var $matchSchedulePairingAttempt = matchSchedulePairingAttempt
        .map((e) => e.copyWith(playerDataId: playerData.id))
        .toList();
    await session.db.update<_i8.MatchSchedulePairingAttempt>(
      $matchSchedulePairingAttempt,
      columns: [_i8.MatchSchedulePairingAttempt.t.playerDataId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [PlayerData] and the given [MatchSubscription]s
  /// by setting each [MatchSubscription]'s foreign key `playerDataId` to refer to this [PlayerData].
  Future<void> subscriptions(
    _i1.Session session,
    PlayerData playerData,
    List<_i9.MatchSubscription> matchSubscription, {
    _i1.Transaction? transaction,
  }) async {
    if (matchSubscription.any((e) => e.id == null)) {
      throw ArgumentError.notNull('matchSubscription.id');
    }
    if (playerData.id == null) {
      throw ArgumentError.notNull('playerData.id');
    }

    var $matchSubscription = matchSubscription
        .map((e) => e.copyWith(playerDataId: playerData.id))
        .toList();
    await session.db.update<_i9.MatchSubscription>(
      $matchSubscription,
      columns: [_i9.MatchSubscription.t.playerDataId],
      transaction: transaction,
    );
  }
}

class PlayerDataAttachRowRepository {
  const PlayerDataAttachRowRepository._();

  /// Creates a relation between the given [PlayerData] and [AuthUser]
  /// by setting the [PlayerData]'s foreign key `authUserId` to refer to the [AuthUser].
  Future<void> authUser(
    _i1.Session session,
    PlayerData playerData,
    _i2.AuthUser authUser, {
    _i1.Transaction? transaction,
  }) async {
    if (playerData.id == null) {
      throw ArgumentError.notNull('playerData.id');
    }
    if (authUser.id == null) {
      throw ArgumentError.notNull('authUser.id');
    }

    var $playerData = playerData.copyWith(authUserId: authUser.id);
    await session.db.updateRow<PlayerData>(
      $playerData,
      columns: [PlayerData.t.authUserId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [PlayerData] and the given [PlayerInMatch]
  /// by setting the [PlayerInMatch]'s foreign key `playerId` to refer to this [PlayerData].
  Future<void> matchEntries(
    _i1.Session session,
    PlayerData playerData,
    _i5.PlayerInMatch playerInMatch, {
    _i1.Transaction? transaction,
  }) async {
    if (playerInMatch.id == null) {
      throw ArgumentError.notNull('playerInMatch.id');
    }
    if (playerData.id == null) {
      throw ArgumentError.notNull('playerData.id');
    }

    var $playerInMatch = playerInMatch.copyWith(playerId: playerData.id);
    await session.db.updateRow<_i5.PlayerInMatch>(
      $playerInMatch,
      columns: [_i5.PlayerInMatch.t.playerId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [PlayerData] and the given [Post]
  /// by setting the [Post]'s foreign key `authorId` to refer to this [PlayerData].
  Future<void> posts(
    _i1.Session session,
    PlayerData playerData,
    _i6.Post post, {
    _i1.Transaction? transaction,
  }) async {
    if (post.id == null) {
      throw ArgumentError.notNull('post.id');
    }
    if (playerData.id == null) {
      throw ArgumentError.notNull('playerData.id');
    }

    var $post = post.copyWith(authorId: playerData.id);
    await session.db.updateRow<_i6.Post>(
      $post,
      columns: [_i6.Post.t.authorId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [PlayerData] and the given [PostComment]
  /// by setting the [PostComment]'s foreign key `ownerId` to refer to this [PlayerData].
  Future<void> comments(
    _i1.Session session,
    PlayerData playerData,
    _i7.PostComment postComment, {
    _i1.Transaction? transaction,
  }) async {
    if (postComment.id == null) {
      throw ArgumentError.notNull('postComment.id');
    }
    if (playerData.id == null) {
      throw ArgumentError.notNull('playerData.id');
    }

    var $postComment = postComment.copyWith(ownerId: playerData.id);
    await session.db.updateRow<_i7.PostComment>(
      $postComment,
      columns: [_i7.PostComment.t.ownerId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [PlayerData] and the given [MatchSchedulePairingAttempt]
  /// by setting the [MatchSchedulePairingAttempt]'s foreign key `playerDataId` to refer to this [PlayerData].
  Future<void> pairingAttempts(
    _i1.Session session,
    PlayerData playerData,
    _i8.MatchSchedulePairingAttempt matchSchedulePairingAttempt, {
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
    await session.db.updateRow<_i8.MatchSchedulePairingAttempt>(
      $matchSchedulePairingAttempt,
      columns: [_i8.MatchSchedulePairingAttempt.t.playerDataId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [PlayerData] and the given [MatchSubscription]
  /// by setting the [MatchSubscription]'s foreign key `playerDataId` to refer to this [PlayerData].
  Future<void> subscriptions(
    _i1.Session session,
    PlayerData playerData,
    _i9.MatchSubscription matchSubscription, {
    _i1.Transaction? transaction,
  }) async {
    if (matchSubscription.id == null) {
      throw ArgumentError.notNull('matchSubscription.id');
    }
    if (playerData.id == null) {
      throw ArgumentError.notNull('playerData.id');
    }

    var $matchSubscription = matchSubscription.copyWith(
      playerDataId: playerData.id,
    );
    await session.db.updateRow<_i9.MatchSubscription>(
      $matchSubscription,
      columns: [_i9.MatchSubscription.t.playerDataId],
      transaction: transaction,
    );
  }
}

class PlayerDataDetachRepository {
  const PlayerDataDetachRepository._();

  /// Detaches the relation between this [PlayerData] and the given [PlayerInMatch]
  /// by setting the [PlayerInMatch]'s foreign key `playerId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> matchEntries(
    _i1.Session session,
    List<_i5.PlayerInMatch> playerInMatch, {
    _i1.Transaction? transaction,
  }) async {
    if (playerInMatch.any((e) => e.id == null)) {
      throw ArgumentError.notNull('playerInMatch.id');
    }

    var $playerInMatch = playerInMatch
        .map((e) => e.copyWith(playerId: null))
        .toList();
    await session.db.update<_i5.PlayerInMatch>(
      $playerInMatch,
      columns: [_i5.PlayerInMatch.t.playerId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [PlayerData] and the given [Post]
  /// by setting the [Post]'s foreign key `authorId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> posts(
    _i1.Session session,
    List<_i6.Post> post, {
    _i1.Transaction? transaction,
  }) async {
    if (post.any((e) => e.id == null)) {
      throw ArgumentError.notNull('post.id');
    }

    var $post = post.map((e) => e.copyWith(authorId: null)).toList();
    await session.db.update<_i6.Post>(
      $post,
      columns: [_i6.Post.t.authorId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [PlayerData] and the given [MatchSchedulePairingAttempt]
  /// by setting the [MatchSchedulePairingAttempt]'s foreign key `playerDataId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> pairingAttempts(
    _i1.Session session,
    List<_i8.MatchSchedulePairingAttempt> matchSchedulePairingAttempt, {
    _i1.Transaction? transaction,
  }) async {
    if (matchSchedulePairingAttempt.any((e) => e.id == null)) {
      throw ArgumentError.notNull('matchSchedulePairingAttempt.id');
    }

    var $matchSchedulePairingAttempt = matchSchedulePairingAttempt
        .map((e) => e.copyWith(playerDataId: null))
        .toList();
    await session.db.update<_i8.MatchSchedulePairingAttempt>(
      $matchSchedulePairingAttempt,
      columns: [_i8.MatchSchedulePairingAttempt.t.playerDataId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [PlayerData] and the given [MatchSubscription]
  /// by setting the [MatchSubscription]'s foreign key `playerDataId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> subscriptions(
    _i1.Session session,
    List<_i9.MatchSubscription> matchSubscription, {
    _i1.Transaction? transaction,
  }) async {
    if (matchSubscription.any((e) => e.id == null)) {
      throw ArgumentError.notNull('matchSubscription.id');
    }

    var $matchSubscription = matchSubscription
        .map((e) => e.copyWith(playerDataId: null))
        .toList();
    await session.db.update<_i9.MatchSubscription>(
      $matchSubscription,
      columns: [_i9.MatchSubscription.t.playerDataId],
      transaction: transaction,
    );
  }
}

class PlayerDataDetachRowRepository {
  const PlayerDataDetachRowRepository._();

  /// Detaches the relation between this [PlayerData] and the given [PlayerInMatch]
  /// by setting the [PlayerInMatch]'s foreign key `playerId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> matchEntries(
    _i1.Session session,
    _i5.PlayerInMatch playerInMatch, {
    _i1.Transaction? transaction,
  }) async {
    if (playerInMatch.id == null) {
      throw ArgumentError.notNull('playerInMatch.id');
    }

    var $playerInMatch = playerInMatch.copyWith(playerId: null);
    await session.db.updateRow<_i5.PlayerInMatch>(
      $playerInMatch,
      columns: [_i5.PlayerInMatch.t.playerId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [PlayerData] and the given [Post]
  /// by setting the [Post]'s foreign key `authorId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> posts(
    _i1.Session session,
    _i6.Post post, {
    _i1.Transaction? transaction,
  }) async {
    if (post.id == null) {
      throw ArgumentError.notNull('post.id');
    }

    var $post = post.copyWith(authorId: null);
    await session.db.updateRow<_i6.Post>(
      $post,
      columns: [_i6.Post.t.authorId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [PlayerData] and the given [MatchSchedulePairingAttempt]
  /// by setting the [MatchSchedulePairingAttempt]'s foreign key `playerDataId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> pairingAttempts(
    _i1.Session session,
    _i8.MatchSchedulePairingAttempt matchSchedulePairingAttempt, {
    _i1.Transaction? transaction,
  }) async {
    if (matchSchedulePairingAttempt.id == null) {
      throw ArgumentError.notNull('matchSchedulePairingAttempt.id');
    }

    var $matchSchedulePairingAttempt = matchSchedulePairingAttempt.copyWith(
      playerDataId: null,
    );
    await session.db.updateRow<_i8.MatchSchedulePairingAttempt>(
      $matchSchedulePairingAttempt,
      columns: [_i8.MatchSchedulePairingAttempt.t.playerDataId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [PlayerData] and the given [MatchSubscription]
  /// by setting the [MatchSubscription]'s foreign key `playerDataId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> subscriptions(
    _i1.Session session,
    _i9.MatchSubscription matchSubscription, {
    _i1.Transaction? transaction,
  }) async {
    if (matchSubscription.id == null) {
      throw ArgumentError.notNull('matchSubscription.id');
    }

    var $matchSubscription = matchSubscription.copyWith(playerDataId: null);
    await session.db.updateRow<_i9.MatchSubscription>(
      $matchSubscription,
      columns: [_i9.MatchSubscription.t.playerDataId],
      transaction: transaction,
    );
  }
}
