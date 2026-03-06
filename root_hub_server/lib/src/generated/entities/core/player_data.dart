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
import '../../entities/core/language.dart' as _i2;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _i3;
import '../../entities/core/geo_location.dart' as _i4;
import '../../entities/core/faction.dart' as _i5;
import '../../entities/match/player_in_match.dart' as _i6;
import '../../entities/community/post.dart' as _i7;
import '../../entities/community/post_comment.dart' as _i8;
import '../../entities/match_making/match_schedule.dart' as _i9;
import '../../entities/match_making/match_subscription.dart' as _i10;
import '../../entities/match_making/chat/match_chat_message.dart' as _i11;
import '../../entities/match_making/chat/match_chat_participant_state.dart'
    as _i12;
import '../../entities/core/player_push_notification_token.dart' as _i13;
import '../../entities/match_making/manual_input_location.dart' as _i14;
import '../../entities/core/anonymous_player.dart' as _i15;
import '../../entities/match/player_perfomance_in_match.dart' as _i16;
import 'package:root_hub_server/src/generated/protocol.dart' as _i17;

abstract class PlayerData
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  PlayerData._({
    this.id,
    required this.authUserId,
    this.authUser,
    required this.displayName,
    _i2.Language? preferredLanguage,
    this.currentLocationId,
    this.currentLocation,
    required this.favoriteFaction,
    this.matchEntries,
    this.posts,
    this.comments,
    this.currentHosting,
    this.subscriptions,
    this.notPlayedMarkedSchedules,
    this.chatMessages,
    this.chatParticipantStates,
    this.pushNotificationTokens,
    this.manualInputLocations,
    this.createdAnonymousPlayers,
    this.perfomances,
  }) : preferredLanguage = preferredLanguage ?? _i2.Language.english;

  factory PlayerData({
    int? id,
    required _i1.UuidValue authUserId,
    _i3.AuthUser? authUser,
    required String displayName,
    _i2.Language? preferredLanguage,
    int? currentLocationId,
    _i4.GeoLocation? currentLocation,
    required _i5.Faction favoriteFaction,
    List<_i6.PlayerInMatch>? matchEntries,
    List<_i7.Post>? posts,
    List<_i8.PostComment>? comments,
    List<_i9.MatchSchedulePairingAttempt>? currentHosting,
    List<_i10.MatchSubscription>? subscriptions,
    List<_i9.MatchSchedulePairingAttempt>? notPlayedMarkedSchedules,
    List<_i11.MatchChatMessage>? chatMessages,
    List<_i12.MatchChatParticipantState>? chatParticipantStates,
    List<_i13.PlayerPushNotificationToken>? pushNotificationTokens,
    List<_i14.ManualInputLocation>? manualInputLocations,
    List<_i15.AnonymousPlayer>? createdAnonymousPlayers,
    List<_i16.PlayerPerfomanceInMatch>? perfomances,
  }) = _PlayerDataImpl;

  factory PlayerData.fromJson(Map<String, dynamic> jsonSerialization) {
    return PlayerData(
      id: jsonSerialization['id'] as int?,
      authUserId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['authUserId'],
      ),
      authUser: jsonSerialization['authUser'] == null
          ? null
          : _i17.Protocol().deserialize<_i3.AuthUser>(
              jsonSerialization['authUser'],
            ),
      displayName: jsonSerialization['displayName'] as String,
      preferredLanguage: jsonSerialization['preferredLanguage'] == null
          ? null
          : _i2.Language.fromJson(
              (jsonSerialization['preferredLanguage'] as String),
            ),
      currentLocationId: jsonSerialization['currentLocationId'] as int?,
      currentLocation: jsonSerialization['currentLocation'] == null
          ? null
          : _i17.Protocol().deserialize<_i4.GeoLocation>(
              jsonSerialization['currentLocation'],
            ),
      favoriteFaction: _i5.Faction.fromJson(
        (jsonSerialization['favoriteFaction'] as String),
      ),
      matchEntries: jsonSerialization['matchEntries'] == null
          ? null
          : _i17.Protocol().deserialize<List<_i6.PlayerInMatch>>(
              jsonSerialization['matchEntries'],
            ),
      posts: jsonSerialization['posts'] == null
          ? null
          : _i17.Protocol().deserialize<List<_i7.Post>>(
              jsonSerialization['posts'],
            ),
      comments: jsonSerialization['comments'] == null
          ? null
          : _i17.Protocol().deserialize<List<_i8.PostComment>>(
              jsonSerialization['comments'],
            ),
      currentHosting: jsonSerialization['currentHosting'] == null
          ? null
          : _i17.Protocol().deserialize<List<_i9.MatchSchedulePairingAttempt>>(
              jsonSerialization['currentHosting'],
            ),
      subscriptions: jsonSerialization['subscriptions'] == null
          ? null
          : _i17.Protocol().deserialize<List<_i10.MatchSubscription>>(
              jsonSerialization['subscriptions'],
            ),
      notPlayedMarkedSchedules:
          jsonSerialization['notPlayedMarkedSchedules'] == null
          ? null
          : _i17.Protocol().deserialize<List<_i9.MatchSchedulePairingAttempt>>(
              jsonSerialization['notPlayedMarkedSchedules'],
            ),
      chatMessages: jsonSerialization['chatMessages'] == null
          ? null
          : _i17.Protocol().deserialize<List<_i11.MatchChatMessage>>(
              jsonSerialization['chatMessages'],
            ),
      chatParticipantStates: jsonSerialization['chatParticipantStates'] == null
          ? null
          : _i17.Protocol().deserialize<List<_i12.MatchChatParticipantState>>(
              jsonSerialization['chatParticipantStates'],
            ),
      pushNotificationTokens:
          jsonSerialization['pushNotificationTokens'] == null
          ? null
          : _i17.Protocol().deserialize<List<_i13.PlayerPushNotificationToken>>(
              jsonSerialization['pushNotificationTokens'],
            ),
      manualInputLocations: jsonSerialization['manualInputLocations'] == null
          ? null
          : _i17.Protocol().deserialize<List<_i14.ManualInputLocation>>(
              jsonSerialization['manualInputLocations'],
            ),
      createdAnonymousPlayers:
          jsonSerialization['createdAnonymousPlayers'] == null
          ? null
          : _i17.Protocol().deserialize<List<_i15.AnonymousPlayer>>(
              jsonSerialization['createdAnonymousPlayers'],
            ),
      perfomances: jsonSerialization['perfomances'] == null
          ? null
          : _i17.Protocol().deserialize<List<_i16.PlayerPerfomanceInMatch>>(
              jsonSerialization['perfomances'],
            ),
    );
  }

  static final t = PlayerDataTable();

  static const db = PlayerDataRepository._();

  @override
  int? id;

  _i1.UuidValue authUserId;

  /// The [AuthUser] this profile belongs to
  _i3.AuthUser? authUser;

  String displayName;

  _i2.Language preferredLanguage;

  int? currentLocationId;

  _i4.GeoLocation? currentLocation;

  _i5.Faction favoriteFaction;

  List<_i6.PlayerInMatch>? matchEntries;

  List<_i7.Post>? posts;

  List<_i8.PostComment>? comments;

  List<_i9.MatchSchedulePairingAttempt>? currentHosting;

  List<_i10.MatchSubscription>? subscriptions;

  List<_i9.MatchSchedulePairingAttempt>? notPlayedMarkedSchedules;

  List<_i11.MatchChatMessage>? chatMessages;

  List<_i12.MatchChatParticipantState>? chatParticipantStates;

  List<_i13.PlayerPushNotificationToken>? pushNotificationTokens;

  List<_i14.ManualInputLocation>? manualInputLocations;

  List<_i15.AnonymousPlayer>? createdAnonymousPlayers;

  List<_i16.PlayerPerfomanceInMatch>? perfomances;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [PlayerData]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PlayerData copyWith({
    int? id,
    _i1.UuidValue? authUserId,
    _i3.AuthUser? authUser,
    String? displayName,
    _i2.Language? preferredLanguage,
    int? currentLocationId,
    _i4.GeoLocation? currentLocation,
    _i5.Faction? favoriteFaction,
    List<_i6.PlayerInMatch>? matchEntries,
    List<_i7.Post>? posts,
    List<_i8.PostComment>? comments,
    List<_i9.MatchSchedulePairingAttempt>? currentHosting,
    List<_i10.MatchSubscription>? subscriptions,
    List<_i9.MatchSchedulePairingAttempt>? notPlayedMarkedSchedules,
    List<_i11.MatchChatMessage>? chatMessages,
    List<_i12.MatchChatParticipantState>? chatParticipantStates,
    List<_i13.PlayerPushNotificationToken>? pushNotificationTokens,
    List<_i14.ManualInputLocation>? manualInputLocations,
    List<_i15.AnonymousPlayer>? createdAnonymousPlayers,
    List<_i16.PlayerPerfomanceInMatch>? perfomances,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'PlayerData',
      if (id != null) 'id': id,
      'authUserId': authUserId.toJson(),
      if (authUser != null) 'authUser': authUser?.toJson(),
      'displayName': displayName,
      'preferredLanguage': preferredLanguage.toJson(),
      if (currentLocationId != null) 'currentLocationId': currentLocationId,
      if (currentLocation != null) 'currentLocation': currentLocation?.toJson(),
      'favoriteFaction': favoriteFaction.toJson(),
      if (matchEntries != null)
        'matchEntries': matchEntries?.toJson(valueToJson: (v) => v.toJson()),
      if (posts != null) 'posts': posts?.toJson(valueToJson: (v) => v.toJson()),
      if (comments != null)
        'comments': comments?.toJson(valueToJson: (v) => v.toJson()),
      if (currentHosting != null)
        'currentHosting': currentHosting?.toJson(
          valueToJson: (v) => v.toJson(),
        ),
      if (subscriptions != null)
        'subscriptions': subscriptions?.toJson(valueToJson: (v) => v.toJson()),
      if (notPlayedMarkedSchedules != null)
        'notPlayedMarkedSchedules': notPlayedMarkedSchedules?.toJson(
          valueToJson: (v) => v.toJson(),
        ),
      if (chatMessages != null)
        'chatMessages': chatMessages?.toJson(valueToJson: (v) => v.toJson()),
      if (chatParticipantStates != null)
        'chatParticipantStates': chatParticipantStates?.toJson(
          valueToJson: (v) => v.toJson(),
        ),
      if (pushNotificationTokens != null)
        'pushNotificationTokens': pushNotificationTokens?.toJson(
          valueToJson: (v) => v.toJson(),
        ),
      if (manualInputLocations != null)
        'manualInputLocations': manualInputLocations?.toJson(
          valueToJson: (v) => v.toJson(),
        ),
      if (createdAnonymousPlayers != null)
        'createdAnonymousPlayers': createdAnonymousPlayers?.toJson(
          valueToJson: (v) => v.toJson(),
        ),
      if (perfomances != null)
        'perfomances': perfomances?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'PlayerData',
      if (id != null) 'id': id,
      'authUserId': authUserId.toJson(),
      if (authUser != null) 'authUser': authUser?.toJsonForProtocol(),
      'displayName': displayName,
      'preferredLanguage': preferredLanguage.toJson(),
      if (currentLocationId != null) 'currentLocationId': currentLocationId,
      if (currentLocation != null)
        'currentLocation': currentLocation?.toJsonForProtocol(),
      'favoriteFaction': favoriteFaction.toJson(),
      if (matchEntries != null)
        'matchEntries': matchEntries?.toJson(
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
      if (posts != null)
        'posts': posts?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (comments != null)
        'comments': comments?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (currentHosting != null)
        'currentHosting': currentHosting?.toJson(
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
      if (subscriptions != null)
        'subscriptions': subscriptions?.toJson(
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
      if (notPlayedMarkedSchedules != null)
        'notPlayedMarkedSchedules': notPlayedMarkedSchedules?.toJson(
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
      if (chatMessages != null)
        'chatMessages': chatMessages?.toJson(
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
      if (chatParticipantStates != null)
        'chatParticipantStates': chatParticipantStates?.toJson(
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
      if (pushNotificationTokens != null)
        'pushNotificationTokens': pushNotificationTokens?.toJson(
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
      if (manualInputLocations != null)
        'manualInputLocations': manualInputLocations?.toJson(
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
      if (createdAnonymousPlayers != null)
        'createdAnonymousPlayers': createdAnonymousPlayers?.toJson(
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
      if (perfomances != null)
        'perfomances': perfomances?.toJson(
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
    };
  }

  static PlayerDataInclude include({
    _i3.AuthUserInclude? authUser,
    _i4.GeoLocationInclude? currentLocation,
    _i6.PlayerInMatchIncludeList? matchEntries,
    _i7.PostIncludeList? posts,
    _i8.PostCommentIncludeList? comments,
    _i9.MatchSchedulePairingAttemptIncludeList? currentHosting,
    _i10.MatchSubscriptionIncludeList? subscriptions,
    _i9.MatchSchedulePairingAttemptIncludeList? notPlayedMarkedSchedules,
    _i11.MatchChatMessageIncludeList? chatMessages,
    _i12.MatchChatParticipantStateIncludeList? chatParticipantStates,
    _i13.PlayerPushNotificationTokenIncludeList? pushNotificationTokens,
    _i14.ManualInputLocationIncludeList? manualInputLocations,
    _i15.AnonymousPlayerIncludeList? createdAnonymousPlayers,
    _i16.PlayerPerfomanceInMatchIncludeList? perfomances,
  }) {
    return PlayerDataInclude._(
      authUser: authUser,
      currentLocation: currentLocation,
      matchEntries: matchEntries,
      posts: posts,
      comments: comments,
      currentHosting: currentHosting,
      subscriptions: subscriptions,
      notPlayedMarkedSchedules: notPlayedMarkedSchedules,
      chatMessages: chatMessages,
      chatParticipantStates: chatParticipantStates,
      pushNotificationTokens: pushNotificationTokens,
      manualInputLocations: manualInputLocations,
      createdAnonymousPlayers: createdAnonymousPlayers,
      perfomances: perfomances,
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
    _i3.AuthUser? authUser,
    required String displayName,
    _i2.Language? preferredLanguage,
    int? currentLocationId,
    _i4.GeoLocation? currentLocation,
    required _i5.Faction favoriteFaction,
    List<_i6.PlayerInMatch>? matchEntries,
    List<_i7.Post>? posts,
    List<_i8.PostComment>? comments,
    List<_i9.MatchSchedulePairingAttempt>? currentHosting,
    List<_i10.MatchSubscription>? subscriptions,
    List<_i9.MatchSchedulePairingAttempt>? notPlayedMarkedSchedules,
    List<_i11.MatchChatMessage>? chatMessages,
    List<_i12.MatchChatParticipantState>? chatParticipantStates,
    List<_i13.PlayerPushNotificationToken>? pushNotificationTokens,
    List<_i14.ManualInputLocation>? manualInputLocations,
    List<_i15.AnonymousPlayer>? createdAnonymousPlayers,
    List<_i16.PlayerPerfomanceInMatch>? perfomances,
  }) : super._(
         id: id,
         authUserId: authUserId,
         authUser: authUser,
         displayName: displayName,
         preferredLanguage: preferredLanguage,
         currentLocationId: currentLocationId,
         currentLocation: currentLocation,
         favoriteFaction: favoriteFaction,
         matchEntries: matchEntries,
         posts: posts,
         comments: comments,
         currentHosting: currentHosting,
         subscriptions: subscriptions,
         notPlayedMarkedSchedules: notPlayedMarkedSchedules,
         chatMessages: chatMessages,
         chatParticipantStates: chatParticipantStates,
         pushNotificationTokens: pushNotificationTokens,
         manualInputLocations: manualInputLocations,
         createdAnonymousPlayers: createdAnonymousPlayers,
         perfomances: perfomances,
       );

  /// Returns a shallow copy of this [PlayerData]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PlayerData copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? authUserId,
    Object? authUser = _Undefined,
    String? displayName,
    _i2.Language? preferredLanguage,
    Object? currentLocationId = _Undefined,
    Object? currentLocation = _Undefined,
    _i5.Faction? favoriteFaction,
    Object? matchEntries = _Undefined,
    Object? posts = _Undefined,
    Object? comments = _Undefined,
    Object? currentHosting = _Undefined,
    Object? subscriptions = _Undefined,
    Object? notPlayedMarkedSchedules = _Undefined,
    Object? chatMessages = _Undefined,
    Object? chatParticipantStates = _Undefined,
    Object? pushNotificationTokens = _Undefined,
    Object? manualInputLocations = _Undefined,
    Object? createdAnonymousPlayers = _Undefined,
    Object? perfomances = _Undefined,
  }) {
    return PlayerData(
      id: id is int? ? id : this.id,
      authUserId: authUserId ?? this.authUserId,
      authUser: authUser is _i3.AuthUser?
          ? authUser
          : this.authUser?.copyWith(),
      displayName: displayName ?? this.displayName,
      preferredLanguage: preferredLanguage ?? this.preferredLanguage,
      currentLocationId: currentLocationId is int?
          ? currentLocationId
          : this.currentLocationId,
      currentLocation: currentLocation is _i4.GeoLocation?
          ? currentLocation
          : this.currentLocation?.copyWith(),
      favoriteFaction: favoriteFaction ?? this.favoriteFaction,
      matchEntries: matchEntries is List<_i6.PlayerInMatch>?
          ? matchEntries
          : this.matchEntries?.map((e0) => e0.copyWith()).toList(),
      posts: posts is List<_i7.Post>?
          ? posts
          : this.posts?.map((e0) => e0.copyWith()).toList(),
      comments: comments is List<_i8.PostComment>?
          ? comments
          : this.comments?.map((e0) => e0.copyWith()).toList(),
      currentHosting: currentHosting is List<_i9.MatchSchedulePairingAttempt>?
          ? currentHosting
          : this.currentHosting?.map((e0) => e0.copyWith()).toList(),
      subscriptions: subscriptions is List<_i10.MatchSubscription>?
          ? subscriptions
          : this.subscriptions?.map((e0) => e0.copyWith()).toList(),
      notPlayedMarkedSchedules:
          notPlayedMarkedSchedules is List<_i9.MatchSchedulePairingAttempt>?
          ? notPlayedMarkedSchedules
          : this.notPlayedMarkedSchedules?.map((e0) => e0.copyWith()).toList(),
      chatMessages: chatMessages is List<_i11.MatchChatMessage>?
          ? chatMessages
          : this.chatMessages?.map((e0) => e0.copyWith()).toList(),
      chatParticipantStates:
          chatParticipantStates is List<_i12.MatchChatParticipantState>?
          ? chatParticipantStates
          : this.chatParticipantStates?.map((e0) => e0.copyWith()).toList(),
      pushNotificationTokens:
          pushNotificationTokens is List<_i13.PlayerPushNotificationToken>?
          ? pushNotificationTokens
          : this.pushNotificationTokens?.map((e0) => e0.copyWith()).toList(),
      manualInputLocations:
          manualInputLocations is List<_i14.ManualInputLocation>?
          ? manualInputLocations
          : this.manualInputLocations?.map((e0) => e0.copyWith()).toList(),
      createdAnonymousPlayers:
          createdAnonymousPlayers is List<_i15.AnonymousPlayer>?
          ? createdAnonymousPlayers
          : this.createdAnonymousPlayers?.map((e0) => e0.copyWith()).toList(),
      perfomances: perfomances is List<_i16.PlayerPerfomanceInMatch>?
          ? perfomances
          : this.perfomances?.map((e0) => e0.copyWith()).toList(),
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

  _i1.ColumnValue<String, String> displayName(String value) => _i1.ColumnValue(
    table.displayName,
    value,
  );

  _i1.ColumnValue<_i2.Language, _i2.Language> preferredLanguage(
    _i2.Language value,
  ) => _i1.ColumnValue(
    table.preferredLanguage,
    value,
  );

  _i1.ColumnValue<int, int> currentLocationId(int? value) => _i1.ColumnValue(
    table.currentLocationId,
    value,
  );

  _i1.ColumnValue<_i5.Faction, _i5.Faction> favoriteFaction(
    _i5.Faction value,
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
    displayName = _i1.ColumnString(
      'displayName',
      this,
    );
    preferredLanguage = _i1.ColumnEnum(
      'preferredLanguage',
      this,
      _i1.EnumSerialization.byName,
      hasDefault: true,
    );
    currentLocationId = _i1.ColumnInt(
      'currentLocationId',
      this,
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
  _i3.AuthUserTable? _authUser;

  late final _i1.ColumnString displayName;

  late final _i1.ColumnEnum<_i2.Language> preferredLanguage;

  late final _i1.ColumnInt currentLocationId;

  _i4.GeoLocationTable? _currentLocation;

  late final _i1.ColumnEnum<_i5.Faction> favoriteFaction;

  _i6.PlayerInMatchTable? ___matchEntries;

  _i1.ManyRelation<_i6.PlayerInMatchTable>? _matchEntries;

  _i7.PostTable? ___posts;

  _i1.ManyRelation<_i7.PostTable>? _posts;

  _i8.PostCommentTable? ___comments;

  _i1.ManyRelation<_i8.PostCommentTable>? _comments;

  _i9.MatchSchedulePairingAttemptTable? ___currentHosting;

  _i1.ManyRelation<_i9.MatchSchedulePairingAttemptTable>? _currentHosting;

  _i10.MatchSubscriptionTable? ___subscriptions;

  _i1.ManyRelation<_i10.MatchSubscriptionTable>? _subscriptions;

  _i9.MatchSchedulePairingAttemptTable? ___notPlayedMarkedSchedules;

  _i1.ManyRelation<_i9.MatchSchedulePairingAttemptTable>?
  _notPlayedMarkedSchedules;

  _i11.MatchChatMessageTable? ___chatMessages;

  _i1.ManyRelation<_i11.MatchChatMessageTable>? _chatMessages;

  _i12.MatchChatParticipantStateTable? ___chatParticipantStates;

  _i1.ManyRelation<_i12.MatchChatParticipantStateTable>? _chatParticipantStates;

  _i13.PlayerPushNotificationTokenTable? ___pushNotificationTokens;

  _i1.ManyRelation<_i13.PlayerPushNotificationTokenTable>?
  _pushNotificationTokens;

  _i14.ManualInputLocationTable? ___manualInputLocations;

  _i1.ManyRelation<_i14.ManualInputLocationTable>? _manualInputLocations;

  _i15.AnonymousPlayerTable? ___createdAnonymousPlayers;

  _i1.ManyRelation<_i15.AnonymousPlayerTable>? _createdAnonymousPlayers;

  _i16.PlayerPerfomanceInMatchTable? ___perfomances;

  _i1.ManyRelation<_i16.PlayerPerfomanceInMatchTable>? _perfomances;

  _i3.AuthUserTable get authUser {
    if (_authUser != null) return _authUser!;
    _authUser = _i1.createRelationTable(
      relationFieldName: 'authUser',
      field: PlayerData.t.authUserId,
      foreignField: _i3.AuthUser.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.AuthUserTable(tableRelation: foreignTableRelation),
    );
    return _authUser!;
  }

  _i4.GeoLocationTable get currentLocation {
    if (_currentLocation != null) return _currentLocation!;
    _currentLocation = _i1.createRelationTable(
      relationFieldName: 'currentLocation',
      field: PlayerData.t.currentLocationId,
      foreignField: _i4.GeoLocation.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.GeoLocationTable(tableRelation: foreignTableRelation),
    );
    return _currentLocation!;
  }

  _i6.PlayerInMatchTable get __matchEntries {
    if (___matchEntries != null) return ___matchEntries!;
    ___matchEntries = _i1.createRelationTable(
      relationFieldName: '__matchEntries',
      field: PlayerData.t.id,
      foreignField: _i6.PlayerInMatch.t.playerId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i6.PlayerInMatchTable(tableRelation: foreignTableRelation),
    );
    return ___matchEntries!;
  }

  _i7.PostTable get __posts {
    if (___posts != null) return ___posts!;
    ___posts = _i1.createRelationTable(
      relationFieldName: '__posts',
      field: PlayerData.t.id,
      foreignField: _i7.Post.t.authorId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i7.PostTable(tableRelation: foreignTableRelation),
    );
    return ___posts!;
  }

  _i8.PostCommentTable get __comments {
    if (___comments != null) return ___comments!;
    ___comments = _i1.createRelationTable(
      relationFieldName: '__comments',
      field: PlayerData.t.id,
      foreignField: _i8.PostComment.t.ownerId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i8.PostCommentTable(tableRelation: foreignTableRelation),
    );
    return ___comments!;
  }

  _i9.MatchSchedulePairingAttemptTable get __currentHosting {
    if (___currentHosting != null) return ___currentHosting!;
    ___currentHosting = _i1.createRelationTable(
      relationFieldName: '__currentHosting',
      field: PlayerData.t.id,
      foreignField: _i9.MatchSchedulePairingAttempt.t.playerDataId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i9.MatchSchedulePairingAttemptTable(
            tableRelation: foreignTableRelation,
          ),
    );
    return ___currentHosting!;
  }

  _i10.MatchSubscriptionTable get __subscriptions {
    if (___subscriptions != null) return ___subscriptions!;
    ___subscriptions = _i1.createRelationTable(
      relationFieldName: '__subscriptions',
      field: PlayerData.t.id,
      foreignField: _i10.MatchSubscription.t.playerDataId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i10.MatchSubscriptionTable(tableRelation: foreignTableRelation),
    );
    return ___subscriptions!;
  }

  _i9.MatchSchedulePairingAttemptTable get __notPlayedMarkedSchedules {
    if (___notPlayedMarkedSchedules != null)
      return ___notPlayedMarkedSchedules!;
    ___notPlayedMarkedSchedules = _i1.createRelationTable(
      relationFieldName: '__notPlayedMarkedSchedules',
      field: PlayerData.t.id,
      foreignField:
          _i9.MatchSchedulePairingAttempt.t.notPlayedMarkedByPlayerDataId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i9.MatchSchedulePairingAttemptTable(
            tableRelation: foreignTableRelation,
          ),
    );
    return ___notPlayedMarkedSchedules!;
  }

  _i11.MatchChatMessageTable get __chatMessages {
    if (___chatMessages != null) return ___chatMessages!;
    ___chatMessages = _i1.createRelationTable(
      relationFieldName: '__chatMessages',
      field: PlayerData.t.id,
      foreignField: _i11.MatchChatMessage.t.playerDataId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i11.MatchChatMessageTable(tableRelation: foreignTableRelation),
    );
    return ___chatMessages!;
  }

  _i12.MatchChatParticipantStateTable get __chatParticipantStates {
    if (___chatParticipantStates != null) return ___chatParticipantStates!;
    ___chatParticipantStates = _i1.createRelationTable(
      relationFieldName: '__chatParticipantStates',
      field: PlayerData.t.id,
      foreignField: _i12.MatchChatParticipantState.t.playerDataId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i12.MatchChatParticipantStateTable(
            tableRelation: foreignTableRelation,
          ),
    );
    return ___chatParticipantStates!;
  }

  _i13.PlayerPushNotificationTokenTable get __pushNotificationTokens {
    if (___pushNotificationTokens != null) return ___pushNotificationTokens!;
    ___pushNotificationTokens = _i1.createRelationTable(
      relationFieldName: '__pushNotificationTokens',
      field: PlayerData.t.id,
      foreignField: _i13.PlayerPushNotificationToken.t.playerDataId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i13.PlayerPushNotificationTokenTable(
            tableRelation: foreignTableRelation,
          ),
    );
    return ___pushNotificationTokens!;
  }

  _i14.ManualInputLocationTable get __manualInputLocations {
    if (___manualInputLocations != null) return ___manualInputLocations!;
    ___manualInputLocations = _i1.createRelationTable(
      relationFieldName: '__manualInputLocations',
      field: PlayerData.t.id,
      foreignField: _i14.ManualInputLocation.t.playerDataId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i14.ManualInputLocationTable(tableRelation: foreignTableRelation),
    );
    return ___manualInputLocations!;
  }

  _i15.AnonymousPlayerTable get __createdAnonymousPlayers {
    if (___createdAnonymousPlayers != null) return ___createdAnonymousPlayers!;
    ___createdAnonymousPlayers = _i1.createRelationTable(
      relationFieldName: '__createdAnonymousPlayers',
      field: PlayerData.t.id,
      foreignField: _i15.AnonymousPlayer.t.createdByPlayerId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i15.AnonymousPlayerTable(tableRelation: foreignTableRelation),
    );
    return ___createdAnonymousPlayers!;
  }

  _i16.PlayerPerfomanceInMatchTable get __perfomances {
    if (___perfomances != null) return ___perfomances!;
    ___perfomances = _i1.createRelationTable(
      relationFieldName: '__perfomances',
      field: PlayerData.t.id,
      foreignField: _i16.PlayerPerfomanceInMatch.t.playerDataId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) => _i16.PlayerPerfomanceInMatchTable(
        tableRelation: foreignTableRelation,
      ),
    );
    return ___perfomances!;
  }

  _i1.ManyRelation<_i6.PlayerInMatchTable> get matchEntries {
    if (_matchEntries != null) return _matchEntries!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'matchEntries',
      field: PlayerData.t.id,
      foreignField: _i6.PlayerInMatch.t.playerId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i6.PlayerInMatchTable(tableRelation: foreignTableRelation),
    );
    _matchEntries = _i1.ManyRelation<_i6.PlayerInMatchTable>(
      tableWithRelations: relationTable,
      table: _i6.PlayerInMatchTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _matchEntries!;
  }

  _i1.ManyRelation<_i7.PostTable> get posts {
    if (_posts != null) return _posts!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'posts',
      field: PlayerData.t.id,
      foreignField: _i7.Post.t.authorId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i7.PostTable(tableRelation: foreignTableRelation),
    );
    _posts = _i1.ManyRelation<_i7.PostTable>(
      tableWithRelations: relationTable,
      table: _i7.PostTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _posts!;
  }

  _i1.ManyRelation<_i8.PostCommentTable> get comments {
    if (_comments != null) return _comments!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'comments',
      field: PlayerData.t.id,
      foreignField: _i8.PostComment.t.ownerId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i8.PostCommentTable(tableRelation: foreignTableRelation),
    );
    _comments = _i1.ManyRelation<_i8.PostCommentTable>(
      tableWithRelations: relationTable,
      table: _i8.PostCommentTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _comments!;
  }

  _i1.ManyRelation<_i9.MatchSchedulePairingAttemptTable> get currentHosting {
    if (_currentHosting != null) return _currentHosting!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'currentHosting',
      field: PlayerData.t.id,
      foreignField: _i9.MatchSchedulePairingAttempt.t.playerDataId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i9.MatchSchedulePairingAttemptTable(
            tableRelation: foreignTableRelation,
          ),
    );
    _currentHosting = _i1.ManyRelation<_i9.MatchSchedulePairingAttemptTable>(
      tableWithRelations: relationTable,
      table: _i9.MatchSchedulePairingAttemptTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _currentHosting!;
  }

  _i1.ManyRelation<_i10.MatchSubscriptionTable> get subscriptions {
    if (_subscriptions != null) return _subscriptions!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'subscriptions',
      field: PlayerData.t.id,
      foreignField: _i10.MatchSubscription.t.playerDataId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i10.MatchSubscriptionTable(tableRelation: foreignTableRelation),
    );
    _subscriptions = _i1.ManyRelation<_i10.MatchSubscriptionTable>(
      tableWithRelations: relationTable,
      table: _i10.MatchSubscriptionTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _subscriptions!;
  }

  _i1.ManyRelation<_i9.MatchSchedulePairingAttemptTable>
  get notPlayedMarkedSchedules {
    if (_notPlayedMarkedSchedules != null) return _notPlayedMarkedSchedules!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'notPlayedMarkedSchedules',
      field: PlayerData.t.id,
      foreignField:
          _i9.MatchSchedulePairingAttempt.t.notPlayedMarkedByPlayerDataId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i9.MatchSchedulePairingAttemptTable(
            tableRelation: foreignTableRelation,
          ),
    );
    _notPlayedMarkedSchedules =
        _i1.ManyRelation<_i9.MatchSchedulePairingAttemptTable>(
          tableWithRelations: relationTable,
          table: _i9.MatchSchedulePairingAttemptTable(
            tableRelation: relationTable.tableRelation!.lastRelation,
          ),
        );
    return _notPlayedMarkedSchedules!;
  }

  _i1.ManyRelation<_i11.MatchChatMessageTable> get chatMessages {
    if (_chatMessages != null) return _chatMessages!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'chatMessages',
      field: PlayerData.t.id,
      foreignField: _i11.MatchChatMessage.t.playerDataId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i11.MatchChatMessageTable(tableRelation: foreignTableRelation),
    );
    _chatMessages = _i1.ManyRelation<_i11.MatchChatMessageTable>(
      tableWithRelations: relationTable,
      table: _i11.MatchChatMessageTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _chatMessages!;
  }

  _i1.ManyRelation<_i12.MatchChatParticipantStateTable>
  get chatParticipantStates {
    if (_chatParticipantStates != null) return _chatParticipantStates!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'chatParticipantStates',
      field: PlayerData.t.id,
      foreignField: _i12.MatchChatParticipantState.t.playerDataId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i12.MatchChatParticipantStateTable(
            tableRelation: foreignTableRelation,
          ),
    );
    _chatParticipantStates =
        _i1.ManyRelation<_i12.MatchChatParticipantStateTable>(
          tableWithRelations: relationTable,
          table: _i12.MatchChatParticipantStateTable(
            tableRelation: relationTable.tableRelation!.lastRelation,
          ),
        );
    return _chatParticipantStates!;
  }

  _i1.ManyRelation<_i13.PlayerPushNotificationTokenTable>
  get pushNotificationTokens {
    if (_pushNotificationTokens != null) return _pushNotificationTokens!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'pushNotificationTokens',
      field: PlayerData.t.id,
      foreignField: _i13.PlayerPushNotificationToken.t.playerDataId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i13.PlayerPushNotificationTokenTable(
            tableRelation: foreignTableRelation,
          ),
    );
    _pushNotificationTokens =
        _i1.ManyRelation<_i13.PlayerPushNotificationTokenTable>(
          tableWithRelations: relationTable,
          table: _i13.PlayerPushNotificationTokenTable(
            tableRelation: relationTable.tableRelation!.lastRelation,
          ),
        );
    return _pushNotificationTokens!;
  }

  _i1.ManyRelation<_i14.ManualInputLocationTable> get manualInputLocations {
    if (_manualInputLocations != null) return _manualInputLocations!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'manualInputLocations',
      field: PlayerData.t.id,
      foreignField: _i14.ManualInputLocation.t.playerDataId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i14.ManualInputLocationTable(tableRelation: foreignTableRelation),
    );
    _manualInputLocations = _i1.ManyRelation<_i14.ManualInputLocationTable>(
      tableWithRelations: relationTable,
      table: _i14.ManualInputLocationTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _manualInputLocations!;
  }

  _i1.ManyRelation<_i15.AnonymousPlayerTable> get createdAnonymousPlayers {
    if (_createdAnonymousPlayers != null) return _createdAnonymousPlayers!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'createdAnonymousPlayers',
      field: PlayerData.t.id,
      foreignField: _i15.AnonymousPlayer.t.createdByPlayerId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i15.AnonymousPlayerTable(tableRelation: foreignTableRelation),
    );
    _createdAnonymousPlayers = _i1.ManyRelation<_i15.AnonymousPlayerTable>(
      tableWithRelations: relationTable,
      table: _i15.AnonymousPlayerTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _createdAnonymousPlayers!;
  }

  _i1.ManyRelation<_i16.PlayerPerfomanceInMatchTable> get perfomances {
    if (_perfomances != null) return _perfomances!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'perfomances',
      field: PlayerData.t.id,
      foreignField: _i16.PlayerPerfomanceInMatch.t.playerDataId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) => _i16.PlayerPerfomanceInMatchTable(
        tableRelation: foreignTableRelation,
      ),
    );
    _perfomances = _i1.ManyRelation<_i16.PlayerPerfomanceInMatchTable>(
      tableWithRelations: relationTable,
      table: _i16.PlayerPerfomanceInMatchTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _perfomances!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    authUserId,
    displayName,
    preferredLanguage,
    currentLocationId,
    favoriteFaction,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'authUser') {
      return authUser;
    }
    if (relationField == 'currentLocation') {
      return currentLocation;
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
    if (relationField == 'currentHosting') {
      return __currentHosting;
    }
    if (relationField == 'subscriptions') {
      return __subscriptions;
    }
    if (relationField == 'notPlayedMarkedSchedules') {
      return __notPlayedMarkedSchedules;
    }
    if (relationField == 'chatMessages') {
      return __chatMessages;
    }
    if (relationField == 'chatParticipantStates') {
      return __chatParticipantStates;
    }
    if (relationField == 'pushNotificationTokens') {
      return __pushNotificationTokens;
    }
    if (relationField == 'manualInputLocations') {
      return __manualInputLocations;
    }
    if (relationField == 'createdAnonymousPlayers') {
      return __createdAnonymousPlayers;
    }
    if (relationField == 'perfomances') {
      return __perfomances;
    }
    return null;
  }
}

class PlayerDataInclude extends _i1.IncludeObject {
  PlayerDataInclude._({
    _i3.AuthUserInclude? authUser,
    _i4.GeoLocationInclude? currentLocation,
    _i6.PlayerInMatchIncludeList? matchEntries,
    _i7.PostIncludeList? posts,
    _i8.PostCommentIncludeList? comments,
    _i9.MatchSchedulePairingAttemptIncludeList? currentHosting,
    _i10.MatchSubscriptionIncludeList? subscriptions,
    _i9.MatchSchedulePairingAttemptIncludeList? notPlayedMarkedSchedules,
    _i11.MatchChatMessageIncludeList? chatMessages,
    _i12.MatchChatParticipantStateIncludeList? chatParticipantStates,
    _i13.PlayerPushNotificationTokenIncludeList? pushNotificationTokens,
    _i14.ManualInputLocationIncludeList? manualInputLocations,
    _i15.AnonymousPlayerIncludeList? createdAnonymousPlayers,
    _i16.PlayerPerfomanceInMatchIncludeList? perfomances,
  }) {
    _authUser = authUser;
    _currentLocation = currentLocation;
    _matchEntries = matchEntries;
    _posts = posts;
    _comments = comments;
    _currentHosting = currentHosting;
    _subscriptions = subscriptions;
    _notPlayedMarkedSchedules = notPlayedMarkedSchedules;
    _chatMessages = chatMessages;
    _chatParticipantStates = chatParticipantStates;
    _pushNotificationTokens = pushNotificationTokens;
    _manualInputLocations = manualInputLocations;
    _createdAnonymousPlayers = createdAnonymousPlayers;
    _perfomances = perfomances;
  }

  _i3.AuthUserInclude? _authUser;

  _i4.GeoLocationInclude? _currentLocation;

  _i6.PlayerInMatchIncludeList? _matchEntries;

  _i7.PostIncludeList? _posts;

  _i8.PostCommentIncludeList? _comments;

  _i9.MatchSchedulePairingAttemptIncludeList? _currentHosting;

  _i10.MatchSubscriptionIncludeList? _subscriptions;

  _i9.MatchSchedulePairingAttemptIncludeList? _notPlayedMarkedSchedules;

  _i11.MatchChatMessageIncludeList? _chatMessages;

  _i12.MatchChatParticipantStateIncludeList? _chatParticipantStates;

  _i13.PlayerPushNotificationTokenIncludeList? _pushNotificationTokens;

  _i14.ManualInputLocationIncludeList? _manualInputLocations;

  _i15.AnonymousPlayerIncludeList? _createdAnonymousPlayers;

  _i16.PlayerPerfomanceInMatchIncludeList? _perfomances;

  @override
  Map<String, _i1.Include?> get includes => {
    'authUser': _authUser,
    'currentLocation': _currentLocation,
    'matchEntries': _matchEntries,
    'posts': _posts,
    'comments': _comments,
    'currentHosting': _currentHosting,
    'subscriptions': _subscriptions,
    'notPlayedMarkedSchedules': _notPlayedMarkedSchedules,
    'chatMessages': _chatMessages,
    'chatParticipantStates': _chatParticipantStates,
    'pushNotificationTokens': _pushNotificationTokens,
    'manualInputLocations': _manualInputLocations,
    'createdAnonymousPlayers': _createdAnonymousPlayers,
    'perfomances': _perfomances,
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
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
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
      lockMode: lockMode,
      lockBehavior: lockBehavior,
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
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<PlayerData>(
      where: where?.call(PlayerData.t),
      orderBy: orderBy?.call(PlayerData.t),
      orderByList: orderByList?.call(PlayerData.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [PlayerData] by its [id] or null if no such row exists.
  Future<PlayerData?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    PlayerDataInclude? include,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<PlayerData>(
      id,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [PlayerData]s in the list and returns the inserted rows.
  ///
  /// The returned [PlayerData]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<PlayerData>> insert(
    _i1.Session session,
    List<PlayerData> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<PlayerData>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
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

  /// Acquires row-level locks on [PlayerData] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PlayerDataTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<PlayerData>(
      where: where(PlayerData.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
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
    List<_i6.PlayerInMatch> playerInMatch, {
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
    await session.db.update<_i6.PlayerInMatch>(
      $playerInMatch,
      columns: [_i6.PlayerInMatch.t.playerId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [PlayerData] and the given [Post]s
  /// by setting each [Post]'s foreign key `authorId` to refer to this [PlayerData].
  Future<void> posts(
    _i1.Session session,
    PlayerData playerData,
    List<_i7.Post> post, {
    _i1.Transaction? transaction,
  }) async {
    if (post.any((e) => e.id == null)) {
      throw ArgumentError.notNull('post.id');
    }
    if (playerData.id == null) {
      throw ArgumentError.notNull('playerData.id');
    }

    var $post = post.map((e) => e.copyWith(authorId: playerData.id)).toList();
    await session.db.update<_i7.Post>(
      $post,
      columns: [_i7.Post.t.authorId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [PlayerData] and the given [PostComment]s
  /// by setting each [PostComment]'s foreign key `ownerId` to refer to this [PlayerData].
  Future<void> comments(
    _i1.Session session,
    PlayerData playerData,
    List<_i8.PostComment> postComment, {
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
    await session.db.update<_i8.PostComment>(
      $postComment,
      columns: [_i8.PostComment.t.ownerId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [PlayerData] and the given [MatchSchedulePairingAttempt]s
  /// by setting each [MatchSchedulePairingAttempt]'s foreign key `playerDataId` to refer to this [PlayerData].
  Future<void> currentHosting(
    _i1.Session session,
    PlayerData playerData,
    List<_i9.MatchSchedulePairingAttempt> matchSchedulePairingAttempt, {
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
    await session.db.update<_i9.MatchSchedulePairingAttempt>(
      $matchSchedulePairingAttempt,
      columns: [_i9.MatchSchedulePairingAttempt.t.playerDataId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [PlayerData] and the given [MatchSubscription]s
  /// by setting each [MatchSubscription]'s foreign key `playerDataId` to refer to this [PlayerData].
  Future<void> subscriptions(
    _i1.Session session,
    PlayerData playerData,
    List<_i10.MatchSubscription> matchSubscription, {
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
    await session.db.update<_i10.MatchSubscription>(
      $matchSubscription,
      columns: [_i10.MatchSubscription.t.playerDataId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [PlayerData] and the given [MatchSchedulePairingAttempt]s
  /// by setting each [MatchSchedulePairingAttempt]'s foreign key `notPlayedMarkedByPlayerDataId` to refer to this [PlayerData].
  Future<void> notPlayedMarkedSchedules(
    _i1.Session session,
    PlayerData playerData,
    List<_i9.MatchSchedulePairingAttempt> matchSchedulePairingAttempt, {
    _i1.Transaction? transaction,
  }) async {
    if (matchSchedulePairingAttempt.any((e) => e.id == null)) {
      throw ArgumentError.notNull('matchSchedulePairingAttempt.id');
    }
    if (playerData.id == null) {
      throw ArgumentError.notNull('playerData.id');
    }

    var $matchSchedulePairingAttempt = matchSchedulePairingAttempt
        .map((e) => e.copyWith(notPlayedMarkedByPlayerDataId: playerData.id))
        .toList();
    await session.db.update<_i9.MatchSchedulePairingAttempt>(
      $matchSchedulePairingAttempt,
      columns: [
        _i9.MatchSchedulePairingAttempt.t.notPlayedMarkedByPlayerDataId,
      ],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [PlayerData] and the given [MatchChatMessage]s
  /// by setting each [MatchChatMessage]'s foreign key `playerDataId` to refer to this [PlayerData].
  Future<void> chatMessages(
    _i1.Session session,
    PlayerData playerData,
    List<_i11.MatchChatMessage> matchChatMessage, {
    _i1.Transaction? transaction,
  }) async {
    if (matchChatMessage.any((e) => e.id == null)) {
      throw ArgumentError.notNull('matchChatMessage.id');
    }
    if (playerData.id == null) {
      throw ArgumentError.notNull('playerData.id');
    }

    var $matchChatMessage = matchChatMessage
        .map((e) => e.copyWith(playerDataId: playerData.id))
        .toList();
    await session.db.update<_i11.MatchChatMessage>(
      $matchChatMessage,
      columns: [_i11.MatchChatMessage.t.playerDataId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [PlayerData] and the given [MatchChatParticipantState]s
  /// by setting each [MatchChatParticipantState]'s foreign key `playerDataId` to refer to this [PlayerData].
  Future<void> chatParticipantStates(
    _i1.Session session,
    PlayerData playerData,
    List<_i12.MatchChatParticipantState> matchChatParticipantState, {
    _i1.Transaction? transaction,
  }) async {
    if (matchChatParticipantState.any((e) => e.id == null)) {
      throw ArgumentError.notNull('matchChatParticipantState.id');
    }
    if (playerData.id == null) {
      throw ArgumentError.notNull('playerData.id');
    }

    var $matchChatParticipantState = matchChatParticipantState
        .map((e) => e.copyWith(playerDataId: playerData.id))
        .toList();
    await session.db.update<_i12.MatchChatParticipantState>(
      $matchChatParticipantState,
      columns: [_i12.MatchChatParticipantState.t.playerDataId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [PlayerData] and the given [PlayerPushNotificationToken]s
  /// by setting each [PlayerPushNotificationToken]'s foreign key `playerDataId` to refer to this [PlayerData].
  Future<void> pushNotificationTokens(
    _i1.Session session,
    PlayerData playerData,
    List<_i13.PlayerPushNotificationToken> playerPushNotificationToken, {
    _i1.Transaction? transaction,
  }) async {
    if (playerPushNotificationToken.any((e) => e.id == null)) {
      throw ArgumentError.notNull('playerPushNotificationToken.id');
    }
    if (playerData.id == null) {
      throw ArgumentError.notNull('playerData.id');
    }

    var $playerPushNotificationToken = playerPushNotificationToken
        .map((e) => e.copyWith(playerDataId: playerData.id))
        .toList();
    await session.db.update<_i13.PlayerPushNotificationToken>(
      $playerPushNotificationToken,
      columns: [_i13.PlayerPushNotificationToken.t.playerDataId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [PlayerData] and the given [ManualInputLocation]s
  /// by setting each [ManualInputLocation]'s foreign key `playerDataId` to refer to this [PlayerData].
  Future<void> manualInputLocations(
    _i1.Session session,
    PlayerData playerData,
    List<_i14.ManualInputLocation> manualInputLocation, {
    _i1.Transaction? transaction,
  }) async {
    if (manualInputLocation.any((e) => e.id == null)) {
      throw ArgumentError.notNull('manualInputLocation.id');
    }
    if (playerData.id == null) {
      throw ArgumentError.notNull('playerData.id');
    }

    var $manualInputLocation = manualInputLocation
        .map((e) => e.copyWith(playerDataId: playerData.id))
        .toList();
    await session.db.update<_i14.ManualInputLocation>(
      $manualInputLocation,
      columns: [_i14.ManualInputLocation.t.playerDataId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [PlayerData] and the given [AnonymousPlayer]s
  /// by setting each [AnonymousPlayer]'s foreign key `createdByPlayerId` to refer to this [PlayerData].
  Future<void> createdAnonymousPlayers(
    _i1.Session session,
    PlayerData playerData,
    List<_i15.AnonymousPlayer> anonymousPlayer, {
    _i1.Transaction? transaction,
  }) async {
    if (anonymousPlayer.any((e) => e.id == null)) {
      throw ArgumentError.notNull('anonymousPlayer.id');
    }
    if (playerData.id == null) {
      throw ArgumentError.notNull('playerData.id');
    }

    var $anonymousPlayer = anonymousPlayer
        .map((e) => e.copyWith(createdByPlayerId: playerData.id))
        .toList();
    await session.db.update<_i15.AnonymousPlayer>(
      $anonymousPlayer,
      columns: [_i15.AnonymousPlayer.t.createdByPlayerId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [PlayerData] and the given [PlayerPerfomanceInMatch]s
  /// by setting each [PlayerPerfomanceInMatch]'s foreign key `playerDataId` to refer to this [PlayerData].
  Future<void> perfomances(
    _i1.Session session,
    PlayerData playerData,
    List<_i16.PlayerPerfomanceInMatch> playerPerfomanceInMatch, {
    _i1.Transaction? transaction,
  }) async {
    if (playerPerfomanceInMatch.any((e) => e.id == null)) {
      throw ArgumentError.notNull('playerPerfomanceInMatch.id');
    }
    if (playerData.id == null) {
      throw ArgumentError.notNull('playerData.id');
    }

    var $playerPerfomanceInMatch = playerPerfomanceInMatch
        .map((e) => e.copyWith(playerDataId: playerData.id))
        .toList();
    await session.db.update<_i16.PlayerPerfomanceInMatch>(
      $playerPerfomanceInMatch,
      columns: [_i16.PlayerPerfomanceInMatch.t.playerDataId],
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
    _i3.AuthUser authUser, {
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

  /// Creates a relation between the given [PlayerData] and [GeoLocation]
  /// by setting the [PlayerData]'s foreign key `currentLocationId` to refer to the [GeoLocation].
  Future<void> currentLocation(
    _i1.Session session,
    PlayerData playerData,
    _i4.GeoLocation currentLocation, {
    _i1.Transaction? transaction,
  }) async {
    if (playerData.id == null) {
      throw ArgumentError.notNull('playerData.id');
    }
    if (currentLocation.id == null) {
      throw ArgumentError.notNull('currentLocation.id');
    }

    var $playerData = playerData.copyWith(
      currentLocationId: currentLocation.id,
    );
    await session.db.updateRow<PlayerData>(
      $playerData,
      columns: [PlayerData.t.currentLocationId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [PlayerData] and the given [PlayerInMatch]
  /// by setting the [PlayerInMatch]'s foreign key `playerId` to refer to this [PlayerData].
  Future<void> matchEntries(
    _i1.Session session,
    PlayerData playerData,
    _i6.PlayerInMatch playerInMatch, {
    _i1.Transaction? transaction,
  }) async {
    if (playerInMatch.id == null) {
      throw ArgumentError.notNull('playerInMatch.id');
    }
    if (playerData.id == null) {
      throw ArgumentError.notNull('playerData.id');
    }

    var $playerInMatch = playerInMatch.copyWith(playerId: playerData.id);
    await session.db.updateRow<_i6.PlayerInMatch>(
      $playerInMatch,
      columns: [_i6.PlayerInMatch.t.playerId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [PlayerData] and the given [Post]
  /// by setting the [Post]'s foreign key `authorId` to refer to this [PlayerData].
  Future<void> posts(
    _i1.Session session,
    PlayerData playerData,
    _i7.Post post, {
    _i1.Transaction? transaction,
  }) async {
    if (post.id == null) {
      throw ArgumentError.notNull('post.id');
    }
    if (playerData.id == null) {
      throw ArgumentError.notNull('playerData.id');
    }

    var $post = post.copyWith(authorId: playerData.id);
    await session.db.updateRow<_i7.Post>(
      $post,
      columns: [_i7.Post.t.authorId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [PlayerData] and the given [PostComment]
  /// by setting the [PostComment]'s foreign key `ownerId` to refer to this [PlayerData].
  Future<void> comments(
    _i1.Session session,
    PlayerData playerData,
    _i8.PostComment postComment, {
    _i1.Transaction? transaction,
  }) async {
    if (postComment.id == null) {
      throw ArgumentError.notNull('postComment.id');
    }
    if (playerData.id == null) {
      throw ArgumentError.notNull('playerData.id');
    }

    var $postComment = postComment.copyWith(ownerId: playerData.id);
    await session.db.updateRow<_i8.PostComment>(
      $postComment,
      columns: [_i8.PostComment.t.ownerId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [PlayerData] and the given [MatchSchedulePairingAttempt]
  /// by setting the [MatchSchedulePairingAttempt]'s foreign key `playerDataId` to refer to this [PlayerData].
  Future<void> currentHosting(
    _i1.Session session,
    PlayerData playerData,
    _i9.MatchSchedulePairingAttempt matchSchedulePairingAttempt, {
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
    await session.db.updateRow<_i9.MatchSchedulePairingAttempt>(
      $matchSchedulePairingAttempt,
      columns: [_i9.MatchSchedulePairingAttempt.t.playerDataId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [PlayerData] and the given [MatchSubscription]
  /// by setting the [MatchSubscription]'s foreign key `playerDataId` to refer to this [PlayerData].
  Future<void> subscriptions(
    _i1.Session session,
    PlayerData playerData,
    _i10.MatchSubscription matchSubscription, {
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
    await session.db.updateRow<_i10.MatchSubscription>(
      $matchSubscription,
      columns: [_i10.MatchSubscription.t.playerDataId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [PlayerData] and the given [MatchSchedulePairingAttempt]
  /// by setting the [MatchSchedulePairingAttempt]'s foreign key `notPlayedMarkedByPlayerDataId` to refer to this [PlayerData].
  Future<void> notPlayedMarkedSchedules(
    _i1.Session session,
    PlayerData playerData,
    _i9.MatchSchedulePairingAttempt matchSchedulePairingAttempt, {
    _i1.Transaction? transaction,
  }) async {
    if (matchSchedulePairingAttempt.id == null) {
      throw ArgumentError.notNull('matchSchedulePairingAttempt.id');
    }
    if (playerData.id == null) {
      throw ArgumentError.notNull('playerData.id');
    }

    var $matchSchedulePairingAttempt = matchSchedulePairingAttempt.copyWith(
      notPlayedMarkedByPlayerDataId: playerData.id,
    );
    await session.db.updateRow<_i9.MatchSchedulePairingAttempt>(
      $matchSchedulePairingAttempt,
      columns: [
        _i9.MatchSchedulePairingAttempt.t.notPlayedMarkedByPlayerDataId,
      ],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [PlayerData] and the given [MatchChatMessage]
  /// by setting the [MatchChatMessage]'s foreign key `playerDataId` to refer to this [PlayerData].
  Future<void> chatMessages(
    _i1.Session session,
    PlayerData playerData,
    _i11.MatchChatMessage matchChatMessage, {
    _i1.Transaction? transaction,
  }) async {
    if (matchChatMessage.id == null) {
      throw ArgumentError.notNull('matchChatMessage.id');
    }
    if (playerData.id == null) {
      throw ArgumentError.notNull('playerData.id');
    }

    var $matchChatMessage = matchChatMessage.copyWith(
      playerDataId: playerData.id,
    );
    await session.db.updateRow<_i11.MatchChatMessage>(
      $matchChatMessage,
      columns: [_i11.MatchChatMessage.t.playerDataId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [PlayerData] and the given [MatchChatParticipantState]
  /// by setting the [MatchChatParticipantState]'s foreign key `playerDataId` to refer to this [PlayerData].
  Future<void> chatParticipantStates(
    _i1.Session session,
    PlayerData playerData,
    _i12.MatchChatParticipantState matchChatParticipantState, {
    _i1.Transaction? transaction,
  }) async {
    if (matchChatParticipantState.id == null) {
      throw ArgumentError.notNull('matchChatParticipantState.id');
    }
    if (playerData.id == null) {
      throw ArgumentError.notNull('playerData.id');
    }

    var $matchChatParticipantState = matchChatParticipantState.copyWith(
      playerDataId: playerData.id,
    );
    await session.db.updateRow<_i12.MatchChatParticipantState>(
      $matchChatParticipantState,
      columns: [_i12.MatchChatParticipantState.t.playerDataId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [PlayerData] and the given [PlayerPushNotificationToken]
  /// by setting the [PlayerPushNotificationToken]'s foreign key `playerDataId` to refer to this [PlayerData].
  Future<void> pushNotificationTokens(
    _i1.Session session,
    PlayerData playerData,
    _i13.PlayerPushNotificationToken playerPushNotificationToken, {
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
    await session.db.updateRow<_i13.PlayerPushNotificationToken>(
      $playerPushNotificationToken,
      columns: [_i13.PlayerPushNotificationToken.t.playerDataId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [PlayerData] and the given [ManualInputLocation]
  /// by setting the [ManualInputLocation]'s foreign key `playerDataId` to refer to this [PlayerData].
  Future<void> manualInputLocations(
    _i1.Session session,
    PlayerData playerData,
    _i14.ManualInputLocation manualInputLocation, {
    _i1.Transaction? transaction,
  }) async {
    if (manualInputLocation.id == null) {
      throw ArgumentError.notNull('manualInputLocation.id');
    }
    if (playerData.id == null) {
      throw ArgumentError.notNull('playerData.id');
    }

    var $manualInputLocation = manualInputLocation.copyWith(
      playerDataId: playerData.id,
    );
    await session.db.updateRow<_i14.ManualInputLocation>(
      $manualInputLocation,
      columns: [_i14.ManualInputLocation.t.playerDataId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [PlayerData] and the given [AnonymousPlayer]
  /// by setting the [AnonymousPlayer]'s foreign key `createdByPlayerId` to refer to this [PlayerData].
  Future<void> createdAnonymousPlayers(
    _i1.Session session,
    PlayerData playerData,
    _i15.AnonymousPlayer anonymousPlayer, {
    _i1.Transaction? transaction,
  }) async {
    if (anonymousPlayer.id == null) {
      throw ArgumentError.notNull('anonymousPlayer.id');
    }
    if (playerData.id == null) {
      throw ArgumentError.notNull('playerData.id');
    }

    var $anonymousPlayer = anonymousPlayer.copyWith(
      createdByPlayerId: playerData.id,
    );
    await session.db.updateRow<_i15.AnonymousPlayer>(
      $anonymousPlayer,
      columns: [_i15.AnonymousPlayer.t.createdByPlayerId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [PlayerData] and the given [PlayerPerfomanceInMatch]
  /// by setting the [PlayerPerfomanceInMatch]'s foreign key `playerDataId` to refer to this [PlayerData].
  Future<void> perfomances(
    _i1.Session session,
    PlayerData playerData,
    _i16.PlayerPerfomanceInMatch playerPerfomanceInMatch, {
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
    await session.db.updateRow<_i16.PlayerPerfomanceInMatch>(
      $playerPerfomanceInMatch,
      columns: [_i16.PlayerPerfomanceInMatch.t.playerDataId],
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
    List<_i6.PlayerInMatch> playerInMatch, {
    _i1.Transaction? transaction,
  }) async {
    if (playerInMatch.any((e) => e.id == null)) {
      throw ArgumentError.notNull('playerInMatch.id');
    }

    var $playerInMatch = playerInMatch
        .map((e) => e.copyWith(playerId: null))
        .toList();
    await session.db.update<_i6.PlayerInMatch>(
      $playerInMatch,
      columns: [_i6.PlayerInMatch.t.playerId],
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
    List<_i7.Post> post, {
    _i1.Transaction? transaction,
  }) async {
    if (post.any((e) => e.id == null)) {
      throw ArgumentError.notNull('post.id');
    }

    var $post = post.map((e) => e.copyWith(authorId: null)).toList();
    await session.db.update<_i7.Post>(
      $post,
      columns: [_i7.Post.t.authorId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [PlayerData] and the given [MatchSchedulePairingAttempt]
  /// by setting the [MatchSchedulePairingAttempt]'s foreign key `playerDataId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> currentHosting(
    _i1.Session session,
    List<_i9.MatchSchedulePairingAttempt> matchSchedulePairingAttempt, {
    _i1.Transaction? transaction,
  }) async {
    if (matchSchedulePairingAttempt.any((e) => e.id == null)) {
      throw ArgumentError.notNull('matchSchedulePairingAttempt.id');
    }

    var $matchSchedulePairingAttempt = matchSchedulePairingAttempt
        .map((e) => e.copyWith(playerDataId: null))
        .toList();
    await session.db.update<_i9.MatchSchedulePairingAttempt>(
      $matchSchedulePairingAttempt,
      columns: [_i9.MatchSchedulePairingAttempt.t.playerDataId],
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
    List<_i10.MatchSubscription> matchSubscription, {
    _i1.Transaction? transaction,
  }) async {
    if (matchSubscription.any((e) => e.id == null)) {
      throw ArgumentError.notNull('matchSubscription.id');
    }

    var $matchSubscription = matchSubscription
        .map((e) => e.copyWith(playerDataId: null))
        .toList();
    await session.db.update<_i10.MatchSubscription>(
      $matchSubscription,
      columns: [_i10.MatchSubscription.t.playerDataId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [PlayerData] and the given [MatchSchedulePairingAttempt]
  /// by setting the [MatchSchedulePairingAttempt]'s foreign key `notPlayedMarkedByPlayerDataId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> notPlayedMarkedSchedules(
    _i1.Session session,
    List<_i9.MatchSchedulePairingAttempt> matchSchedulePairingAttempt, {
    _i1.Transaction? transaction,
  }) async {
    if (matchSchedulePairingAttempt.any((e) => e.id == null)) {
      throw ArgumentError.notNull('matchSchedulePairingAttempt.id');
    }

    var $matchSchedulePairingAttempt = matchSchedulePairingAttempt
        .map((e) => e.copyWith(notPlayedMarkedByPlayerDataId: null))
        .toList();
    await session.db.update<_i9.MatchSchedulePairingAttempt>(
      $matchSchedulePairingAttempt,
      columns: [
        _i9.MatchSchedulePairingAttempt.t.notPlayedMarkedByPlayerDataId,
      ],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [PlayerData] and the given [MatchChatMessage]
  /// by setting the [MatchChatMessage]'s foreign key `playerDataId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> chatMessages(
    _i1.Session session,
    List<_i11.MatchChatMessage> matchChatMessage, {
    _i1.Transaction? transaction,
  }) async {
    if (matchChatMessage.any((e) => e.id == null)) {
      throw ArgumentError.notNull('matchChatMessage.id');
    }

    var $matchChatMessage = matchChatMessage
        .map((e) => e.copyWith(playerDataId: null))
        .toList();
    await session.db.update<_i11.MatchChatMessage>(
      $matchChatMessage,
      columns: [_i11.MatchChatMessage.t.playerDataId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [PlayerData] and the given [MatchChatParticipantState]
  /// by setting the [MatchChatParticipantState]'s foreign key `playerDataId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> chatParticipantStates(
    _i1.Session session,
    List<_i12.MatchChatParticipantState> matchChatParticipantState, {
    _i1.Transaction? transaction,
  }) async {
    if (matchChatParticipantState.any((e) => e.id == null)) {
      throw ArgumentError.notNull('matchChatParticipantState.id');
    }

    var $matchChatParticipantState = matchChatParticipantState
        .map((e) => e.copyWith(playerDataId: null))
        .toList();
    await session.db.update<_i12.MatchChatParticipantState>(
      $matchChatParticipantState,
      columns: [_i12.MatchChatParticipantState.t.playerDataId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [PlayerData] and the given [PlayerPushNotificationToken]
  /// by setting the [PlayerPushNotificationToken]'s foreign key `playerDataId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> pushNotificationTokens(
    _i1.Session session,
    List<_i13.PlayerPushNotificationToken> playerPushNotificationToken, {
    _i1.Transaction? transaction,
  }) async {
    if (playerPushNotificationToken.any((e) => e.id == null)) {
      throw ArgumentError.notNull('playerPushNotificationToken.id');
    }

    var $playerPushNotificationToken = playerPushNotificationToken
        .map((e) => e.copyWith(playerDataId: null))
        .toList();
    await session.db.update<_i13.PlayerPushNotificationToken>(
      $playerPushNotificationToken,
      columns: [_i13.PlayerPushNotificationToken.t.playerDataId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [PlayerData] and the given [ManualInputLocation]
  /// by setting the [ManualInputLocation]'s foreign key `playerDataId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> manualInputLocations(
    _i1.Session session,
    List<_i14.ManualInputLocation> manualInputLocation, {
    _i1.Transaction? transaction,
  }) async {
    if (manualInputLocation.any((e) => e.id == null)) {
      throw ArgumentError.notNull('manualInputLocation.id');
    }

    var $manualInputLocation = manualInputLocation
        .map((e) => e.copyWith(playerDataId: null))
        .toList();
    await session.db.update<_i14.ManualInputLocation>(
      $manualInputLocation,
      columns: [_i14.ManualInputLocation.t.playerDataId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [PlayerData] and the given [PlayerPerfomanceInMatch]
  /// by setting the [PlayerPerfomanceInMatch]'s foreign key `playerDataId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> perfomances(
    _i1.Session session,
    List<_i16.PlayerPerfomanceInMatch> playerPerfomanceInMatch, {
    _i1.Transaction? transaction,
  }) async {
    if (playerPerfomanceInMatch.any((e) => e.id == null)) {
      throw ArgumentError.notNull('playerPerfomanceInMatch.id');
    }

    var $playerPerfomanceInMatch = playerPerfomanceInMatch
        .map((e) => e.copyWith(playerDataId: null))
        .toList();
    await session.db.update<_i16.PlayerPerfomanceInMatch>(
      $playerPerfomanceInMatch,
      columns: [_i16.PlayerPerfomanceInMatch.t.playerDataId],
      transaction: transaction,
    );
  }
}

class PlayerDataDetachRowRepository {
  const PlayerDataDetachRowRepository._();

  /// Detaches the relation between this [PlayerData] and the [GeoLocation] set in `currentLocation`
  /// by setting the [PlayerData]'s foreign key `currentLocationId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> currentLocation(
    _i1.Session session,
    PlayerData playerData, {
    _i1.Transaction? transaction,
  }) async {
    if (playerData.id == null) {
      throw ArgumentError.notNull('playerData.id');
    }

    var $playerData = playerData.copyWith(currentLocationId: null);
    await session.db.updateRow<PlayerData>(
      $playerData,
      columns: [PlayerData.t.currentLocationId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [PlayerData] and the given [PlayerInMatch]
  /// by setting the [PlayerInMatch]'s foreign key `playerId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> matchEntries(
    _i1.Session session,
    _i6.PlayerInMatch playerInMatch, {
    _i1.Transaction? transaction,
  }) async {
    if (playerInMatch.id == null) {
      throw ArgumentError.notNull('playerInMatch.id');
    }

    var $playerInMatch = playerInMatch.copyWith(playerId: null);
    await session.db.updateRow<_i6.PlayerInMatch>(
      $playerInMatch,
      columns: [_i6.PlayerInMatch.t.playerId],
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
    _i7.Post post, {
    _i1.Transaction? transaction,
  }) async {
    if (post.id == null) {
      throw ArgumentError.notNull('post.id');
    }

    var $post = post.copyWith(authorId: null);
    await session.db.updateRow<_i7.Post>(
      $post,
      columns: [_i7.Post.t.authorId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [PlayerData] and the given [MatchSchedulePairingAttempt]
  /// by setting the [MatchSchedulePairingAttempt]'s foreign key `playerDataId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> currentHosting(
    _i1.Session session,
    _i9.MatchSchedulePairingAttempt matchSchedulePairingAttempt, {
    _i1.Transaction? transaction,
  }) async {
    if (matchSchedulePairingAttempt.id == null) {
      throw ArgumentError.notNull('matchSchedulePairingAttempt.id');
    }

    var $matchSchedulePairingAttempt = matchSchedulePairingAttempt.copyWith(
      playerDataId: null,
    );
    await session.db.updateRow<_i9.MatchSchedulePairingAttempt>(
      $matchSchedulePairingAttempt,
      columns: [_i9.MatchSchedulePairingAttempt.t.playerDataId],
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
    _i10.MatchSubscription matchSubscription, {
    _i1.Transaction? transaction,
  }) async {
    if (matchSubscription.id == null) {
      throw ArgumentError.notNull('matchSubscription.id');
    }

    var $matchSubscription = matchSubscription.copyWith(playerDataId: null);
    await session.db.updateRow<_i10.MatchSubscription>(
      $matchSubscription,
      columns: [_i10.MatchSubscription.t.playerDataId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [PlayerData] and the given [MatchSchedulePairingAttempt]
  /// by setting the [MatchSchedulePairingAttempt]'s foreign key `notPlayedMarkedByPlayerDataId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> notPlayedMarkedSchedules(
    _i1.Session session,
    _i9.MatchSchedulePairingAttempt matchSchedulePairingAttempt, {
    _i1.Transaction? transaction,
  }) async {
    if (matchSchedulePairingAttempt.id == null) {
      throw ArgumentError.notNull('matchSchedulePairingAttempt.id');
    }

    var $matchSchedulePairingAttempt = matchSchedulePairingAttempt.copyWith(
      notPlayedMarkedByPlayerDataId: null,
    );
    await session.db.updateRow<_i9.MatchSchedulePairingAttempt>(
      $matchSchedulePairingAttempt,
      columns: [
        _i9.MatchSchedulePairingAttempt.t.notPlayedMarkedByPlayerDataId,
      ],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [PlayerData] and the given [MatchChatMessage]
  /// by setting the [MatchChatMessage]'s foreign key `playerDataId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> chatMessages(
    _i1.Session session,
    _i11.MatchChatMessage matchChatMessage, {
    _i1.Transaction? transaction,
  }) async {
    if (matchChatMessage.id == null) {
      throw ArgumentError.notNull('matchChatMessage.id');
    }

    var $matchChatMessage = matchChatMessage.copyWith(playerDataId: null);
    await session.db.updateRow<_i11.MatchChatMessage>(
      $matchChatMessage,
      columns: [_i11.MatchChatMessage.t.playerDataId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [PlayerData] and the given [MatchChatParticipantState]
  /// by setting the [MatchChatParticipantState]'s foreign key `playerDataId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> chatParticipantStates(
    _i1.Session session,
    _i12.MatchChatParticipantState matchChatParticipantState, {
    _i1.Transaction? transaction,
  }) async {
    if (matchChatParticipantState.id == null) {
      throw ArgumentError.notNull('matchChatParticipantState.id');
    }

    var $matchChatParticipantState = matchChatParticipantState.copyWith(
      playerDataId: null,
    );
    await session.db.updateRow<_i12.MatchChatParticipantState>(
      $matchChatParticipantState,
      columns: [_i12.MatchChatParticipantState.t.playerDataId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [PlayerData] and the given [PlayerPushNotificationToken]
  /// by setting the [PlayerPushNotificationToken]'s foreign key `playerDataId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> pushNotificationTokens(
    _i1.Session session,
    _i13.PlayerPushNotificationToken playerPushNotificationToken, {
    _i1.Transaction? transaction,
  }) async {
    if (playerPushNotificationToken.id == null) {
      throw ArgumentError.notNull('playerPushNotificationToken.id');
    }

    var $playerPushNotificationToken = playerPushNotificationToken.copyWith(
      playerDataId: null,
    );
    await session.db.updateRow<_i13.PlayerPushNotificationToken>(
      $playerPushNotificationToken,
      columns: [_i13.PlayerPushNotificationToken.t.playerDataId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [PlayerData] and the given [ManualInputLocation]
  /// by setting the [ManualInputLocation]'s foreign key `playerDataId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> manualInputLocations(
    _i1.Session session,
    _i14.ManualInputLocation manualInputLocation, {
    _i1.Transaction? transaction,
  }) async {
    if (manualInputLocation.id == null) {
      throw ArgumentError.notNull('manualInputLocation.id');
    }

    var $manualInputLocation = manualInputLocation.copyWith(playerDataId: null);
    await session.db.updateRow<_i14.ManualInputLocation>(
      $manualInputLocation,
      columns: [_i14.ManualInputLocation.t.playerDataId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [PlayerData] and the given [PlayerPerfomanceInMatch]
  /// by setting the [PlayerPerfomanceInMatch]'s foreign key `playerDataId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> perfomances(
    _i1.Session session,
    _i16.PlayerPerfomanceInMatch playerPerfomanceInMatch, {
    _i1.Transaction? transaction,
  }) async {
    if (playerPerfomanceInMatch.id == null) {
      throw ArgumentError.notNull('playerPerfomanceInMatch.id');
    }

    var $playerPerfomanceInMatch = playerPerfomanceInMatch.copyWith(
      playerDataId: null,
    );
    await session.db.updateRow<_i16.PlayerPerfomanceInMatch>(
      $playerPerfomanceInMatch,
      columns: [_i16.PlayerPerfomanceInMatch.t.playerDataId],
      transaction: transaction,
    );
  }
}
