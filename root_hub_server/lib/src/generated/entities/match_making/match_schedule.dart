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
import '../../entities/match_making/match_schedule_status.dart' as _i2;
import '../../entities/core/match_podium.dart' as _i3;
import '../../entities/match_making/match_schedule_not_played_reason.dart'
    as _i4;
import '../../entities/core/player_data.dart' as _i5;
import '../../entities/match_making/location.dart' as _i6;
import '../../entities/match_making/match_subscription.dart' as _i7;
import '../../entities/match_making/chat/match_chat_history.dart' as _i8;
import '../../entities/match/played_match.dart' as _i9;
import 'package:root_hub_server/src/generated/protocol.dart' as _i10;

abstract class MatchSchedulePairingAttempt
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  MatchSchedulePairingAttempt._({
    this.id,
    required this.createdAt,
    required this.title,
    this.description,
    required this.minAmountOfPlayers,
    required this.maxAmountOfPlayers,
    required this.attemptedAt,
    _i2.MatchScheduleStatus? status,
    this.notPlayedReason,
    this.notPlayedReasonDetails,
    this.notPlayedMarkedByPlayerDataId,
    this.notPlayedMarkedBy,
    this.closedForSubscriptions,
    required this.locationId,
    this.location,
    required this.playerDataId,
    this.host,
    this.subscriptions,
    this.chatHistory,
    this.playedMatch,
  }) : status = status ?? _i2.MatchScheduleStatus.scheduled;

  factory MatchSchedulePairingAttempt({
    int? id,
    required DateTime createdAt,
    required String title,
    String? description,
    required _i3.MatchPodium minAmountOfPlayers,
    required _i3.MatchPodium maxAmountOfPlayers,
    required DateTime attemptedAt,
    _i2.MatchScheduleStatus? status,
    _i4.MatchScheduleNotPlayedReason? notPlayedReason,
    String? notPlayedReasonDetails,
    int? notPlayedMarkedByPlayerDataId,
    _i5.PlayerData? notPlayedMarkedBy,
    bool? closedForSubscriptions,
    required int locationId,
    _i6.Location? location,
    required int playerDataId,
    _i5.PlayerData? host,
    List<_i7.MatchSubscription>? subscriptions,
    _i8.MatchChatHistory? chatHistory,
    _i9.PlayedMatch? playedMatch,
  }) = _MatchSchedulePairingAttemptImpl;

  factory MatchSchedulePairingAttempt.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return MatchSchedulePairingAttempt(
      id: jsonSerialization['id'] as int?,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      title: jsonSerialization['title'] as String,
      description: jsonSerialization['description'] as String?,
      minAmountOfPlayers: _i3.MatchPodium.fromJson(
        (jsonSerialization['minAmountOfPlayers'] as String),
      ),
      maxAmountOfPlayers: _i3.MatchPodium.fromJson(
        (jsonSerialization['maxAmountOfPlayers'] as String),
      ),
      attemptedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['attemptedAt'],
      ),
      status: jsonSerialization['status'] == null
          ? null
          : _i2.MatchScheduleStatus.fromJson(
              (jsonSerialization['status'] as String),
            ),
      notPlayedReason: jsonSerialization['notPlayedReason'] == null
          ? null
          : _i4.MatchScheduleNotPlayedReason.fromJson(
              (jsonSerialization['notPlayedReason'] as String),
            ),
      notPlayedReasonDetails:
          jsonSerialization['notPlayedReasonDetails'] as String?,
      notPlayedMarkedByPlayerDataId:
          jsonSerialization['notPlayedMarkedByPlayerDataId'] as int?,
      notPlayedMarkedBy: jsonSerialization['notPlayedMarkedBy'] == null
          ? null
          : _i10.Protocol().deserialize<_i5.PlayerData>(
              jsonSerialization['notPlayedMarkedBy'],
            ),
      closedForSubscriptions:
          jsonSerialization['closedForSubscriptions'] == null
          ? null
          : _i1.BoolJsonExtension.fromJson(
              jsonSerialization['closedForSubscriptions'],
            ),
      locationId: jsonSerialization['locationId'] as int,
      location: jsonSerialization['location'] == null
          ? null
          : _i10.Protocol().deserialize<_i6.Location>(
              jsonSerialization['location'],
            ),
      playerDataId: jsonSerialization['playerDataId'] as int,
      host: jsonSerialization['host'] == null
          ? null
          : _i10.Protocol().deserialize<_i5.PlayerData>(
              jsonSerialization['host'],
            ),
      subscriptions: jsonSerialization['subscriptions'] == null
          ? null
          : _i10.Protocol().deserialize<List<_i7.MatchSubscription>>(
              jsonSerialization['subscriptions'],
            ),
      chatHistory: jsonSerialization['chatHistory'] == null
          ? null
          : _i10.Protocol().deserialize<_i8.MatchChatHistory>(
              jsonSerialization['chatHistory'],
            ),
      playedMatch: jsonSerialization['playedMatch'] == null
          ? null
          : _i10.Protocol().deserialize<_i9.PlayedMatch>(
              jsonSerialization['playedMatch'],
            ),
    );
  }

  static final t = MatchSchedulePairingAttemptTable();

  static const db = MatchSchedulePairingAttemptRepository._();

  @override
  int? id;

  DateTime createdAt;

  String title;

  String? description;

  _i3.MatchPodium minAmountOfPlayers;

  _i3.MatchPodium maxAmountOfPlayers;

  DateTime attemptedAt;

  _i2.MatchScheduleStatus status;

  _i4.MatchScheduleNotPlayedReason? notPlayedReason;

  String? notPlayedReasonDetails;

  int? notPlayedMarkedByPlayerDataId;

  _i5.PlayerData? notPlayedMarkedBy;

  bool? closedForSubscriptions;

  int locationId;

  _i6.Location? location;

  int playerDataId;

  _i5.PlayerData? host;

  List<_i7.MatchSubscription>? subscriptions;

  _i8.MatchChatHistory? chatHistory;

  _i9.PlayedMatch? playedMatch;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [MatchSchedulePairingAttempt]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  MatchSchedulePairingAttempt copyWith({
    int? id,
    DateTime? createdAt,
    String? title,
    String? description,
    _i3.MatchPodium? minAmountOfPlayers,
    _i3.MatchPodium? maxAmountOfPlayers,
    DateTime? attemptedAt,
    _i2.MatchScheduleStatus? status,
    _i4.MatchScheduleNotPlayedReason? notPlayedReason,
    String? notPlayedReasonDetails,
    int? notPlayedMarkedByPlayerDataId,
    _i5.PlayerData? notPlayedMarkedBy,
    bool? closedForSubscriptions,
    int? locationId,
    _i6.Location? location,
    int? playerDataId,
    _i5.PlayerData? host,
    List<_i7.MatchSubscription>? subscriptions,
    _i8.MatchChatHistory? chatHistory,
    _i9.PlayedMatch? playedMatch,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'MatchSchedulePairingAttempt',
      if (id != null) 'id': id,
      'createdAt': createdAt.toJson(),
      'title': title,
      if (description != null) 'description': description,
      'minAmountOfPlayers': minAmountOfPlayers.toJson(),
      'maxAmountOfPlayers': maxAmountOfPlayers.toJson(),
      'attemptedAt': attemptedAt.toJson(),
      'status': status.toJson(),
      if (notPlayedReason != null) 'notPlayedReason': notPlayedReason?.toJson(),
      if (notPlayedReasonDetails != null)
        'notPlayedReasonDetails': notPlayedReasonDetails,
      if (notPlayedMarkedByPlayerDataId != null)
        'notPlayedMarkedByPlayerDataId': notPlayedMarkedByPlayerDataId,
      if (notPlayedMarkedBy != null)
        'notPlayedMarkedBy': notPlayedMarkedBy?.toJson(),
      if (closedForSubscriptions != null)
        'closedForSubscriptions': closedForSubscriptions,
      'locationId': locationId,
      if (location != null) 'location': location?.toJson(),
      'playerDataId': playerDataId,
      if (host != null) 'host': host?.toJson(),
      if (subscriptions != null)
        'subscriptions': subscriptions?.toJson(valueToJson: (v) => v.toJson()),
      if (chatHistory != null) 'chatHistory': chatHistory?.toJson(),
      if (playedMatch != null) 'playedMatch': playedMatch?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'MatchSchedulePairingAttempt',
      if (id != null) 'id': id,
      'createdAt': createdAt.toJson(),
      'title': title,
      if (description != null) 'description': description,
      'minAmountOfPlayers': minAmountOfPlayers.toJson(),
      'maxAmountOfPlayers': maxAmountOfPlayers.toJson(),
      'attemptedAt': attemptedAt.toJson(),
      'status': status.toJson(),
      if (notPlayedReason != null) 'notPlayedReason': notPlayedReason?.toJson(),
      if (notPlayedReasonDetails != null)
        'notPlayedReasonDetails': notPlayedReasonDetails,
      if (notPlayedMarkedByPlayerDataId != null)
        'notPlayedMarkedByPlayerDataId': notPlayedMarkedByPlayerDataId,
      if (notPlayedMarkedBy != null)
        'notPlayedMarkedBy': notPlayedMarkedBy?.toJsonForProtocol(),
      if (closedForSubscriptions != null)
        'closedForSubscriptions': closedForSubscriptions,
      'locationId': locationId,
      if (location != null) 'location': location?.toJsonForProtocol(),
      'playerDataId': playerDataId,
      if (host != null) 'host': host?.toJsonForProtocol(),
      if (subscriptions != null)
        'subscriptions': subscriptions?.toJson(
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
      if (chatHistory != null) 'chatHistory': chatHistory?.toJsonForProtocol(),
      if (playedMatch != null) 'playedMatch': playedMatch?.toJsonForProtocol(),
    };
  }

  static MatchSchedulePairingAttemptInclude include({
    _i5.PlayerDataInclude? notPlayedMarkedBy,
    _i6.LocationInclude? location,
    _i5.PlayerDataInclude? host,
    _i7.MatchSubscriptionIncludeList? subscriptions,
    _i8.MatchChatHistoryInclude? chatHistory,
    _i9.PlayedMatchInclude? playedMatch,
  }) {
    return MatchSchedulePairingAttemptInclude._(
      notPlayedMarkedBy: notPlayedMarkedBy,
      location: location,
      host: host,
      subscriptions: subscriptions,
      chatHistory: chatHistory,
      playedMatch: playedMatch,
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
    required String title,
    String? description,
    required _i3.MatchPodium minAmountOfPlayers,
    required _i3.MatchPodium maxAmountOfPlayers,
    required DateTime attemptedAt,
    _i2.MatchScheduleStatus? status,
    _i4.MatchScheduleNotPlayedReason? notPlayedReason,
    String? notPlayedReasonDetails,
    int? notPlayedMarkedByPlayerDataId,
    _i5.PlayerData? notPlayedMarkedBy,
    bool? closedForSubscriptions,
    required int locationId,
    _i6.Location? location,
    required int playerDataId,
    _i5.PlayerData? host,
    List<_i7.MatchSubscription>? subscriptions,
    _i8.MatchChatHistory? chatHistory,
    _i9.PlayedMatch? playedMatch,
  }) : super._(
         id: id,
         createdAt: createdAt,
         title: title,
         description: description,
         minAmountOfPlayers: minAmountOfPlayers,
         maxAmountOfPlayers: maxAmountOfPlayers,
         attemptedAt: attemptedAt,
         status: status,
         notPlayedReason: notPlayedReason,
         notPlayedReasonDetails: notPlayedReasonDetails,
         notPlayedMarkedByPlayerDataId: notPlayedMarkedByPlayerDataId,
         notPlayedMarkedBy: notPlayedMarkedBy,
         closedForSubscriptions: closedForSubscriptions,
         locationId: locationId,
         location: location,
         playerDataId: playerDataId,
         host: host,
         subscriptions: subscriptions,
         chatHistory: chatHistory,
         playedMatch: playedMatch,
       );

  /// Returns a shallow copy of this [MatchSchedulePairingAttempt]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  MatchSchedulePairingAttempt copyWith({
    Object? id = _Undefined,
    DateTime? createdAt,
    String? title,
    Object? description = _Undefined,
    _i3.MatchPodium? minAmountOfPlayers,
    _i3.MatchPodium? maxAmountOfPlayers,
    DateTime? attemptedAt,
    _i2.MatchScheduleStatus? status,
    Object? notPlayedReason = _Undefined,
    Object? notPlayedReasonDetails = _Undefined,
    Object? notPlayedMarkedByPlayerDataId = _Undefined,
    Object? notPlayedMarkedBy = _Undefined,
    Object? closedForSubscriptions = _Undefined,
    int? locationId,
    Object? location = _Undefined,
    int? playerDataId,
    Object? host = _Undefined,
    Object? subscriptions = _Undefined,
    Object? chatHistory = _Undefined,
    Object? playedMatch = _Undefined,
  }) {
    return MatchSchedulePairingAttempt(
      id: id is int? ? id : this.id,
      createdAt: createdAt ?? this.createdAt,
      title: title ?? this.title,
      description: description is String? ? description : this.description,
      minAmountOfPlayers: minAmountOfPlayers ?? this.minAmountOfPlayers,
      maxAmountOfPlayers: maxAmountOfPlayers ?? this.maxAmountOfPlayers,
      attemptedAt: attemptedAt ?? this.attemptedAt,
      status: status ?? this.status,
      notPlayedReason: notPlayedReason is _i4.MatchScheduleNotPlayedReason?
          ? notPlayedReason
          : this.notPlayedReason,
      notPlayedReasonDetails: notPlayedReasonDetails is String?
          ? notPlayedReasonDetails
          : this.notPlayedReasonDetails,
      notPlayedMarkedByPlayerDataId: notPlayedMarkedByPlayerDataId is int?
          ? notPlayedMarkedByPlayerDataId
          : this.notPlayedMarkedByPlayerDataId,
      notPlayedMarkedBy: notPlayedMarkedBy is _i5.PlayerData?
          ? notPlayedMarkedBy
          : this.notPlayedMarkedBy?.copyWith(),
      closedForSubscriptions: closedForSubscriptions is bool?
          ? closedForSubscriptions
          : this.closedForSubscriptions,
      locationId: locationId ?? this.locationId,
      location: location is _i6.Location?
          ? location
          : this.location?.copyWith(),
      playerDataId: playerDataId ?? this.playerDataId,
      host: host is _i5.PlayerData? ? host : this.host?.copyWith(),
      subscriptions: subscriptions is List<_i7.MatchSubscription>?
          ? subscriptions
          : this.subscriptions?.map((e0) => e0.copyWith()).toList(),
      chatHistory: chatHistory is _i8.MatchChatHistory?
          ? chatHistory
          : this.chatHistory?.copyWith(),
      playedMatch: playedMatch is _i9.PlayedMatch?
          ? playedMatch
          : this.playedMatch?.copyWith(),
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

  _i1.ColumnValue<String, String> title(String value) => _i1.ColumnValue(
    table.title,
    value,
  );

  _i1.ColumnValue<String, String> description(String? value) => _i1.ColumnValue(
    table.description,
    value,
  );

  _i1.ColumnValue<_i3.MatchPodium, _i3.MatchPodium> minAmountOfPlayers(
    _i3.MatchPodium value,
  ) => _i1.ColumnValue(
    table.minAmountOfPlayers,
    value,
  );

  _i1.ColumnValue<_i3.MatchPodium, _i3.MatchPodium> maxAmountOfPlayers(
    _i3.MatchPodium value,
  ) => _i1.ColumnValue(
    table.maxAmountOfPlayers,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> attemptedAt(DateTime value) =>
      _i1.ColumnValue(
        table.attemptedAt,
        value,
      );

  _i1.ColumnValue<_i2.MatchScheduleStatus, _i2.MatchScheduleStatus> status(
    _i2.MatchScheduleStatus value,
  ) => _i1.ColumnValue(
    table.status,
    value,
  );

  _i1.ColumnValue<
    _i4.MatchScheduleNotPlayedReason,
    _i4.MatchScheduleNotPlayedReason
  >
  notPlayedReason(_i4.MatchScheduleNotPlayedReason? value) => _i1.ColumnValue(
    table.notPlayedReason,
    value,
  );

  _i1.ColumnValue<String, String> notPlayedReasonDetails(String? value) =>
      _i1.ColumnValue(
        table.notPlayedReasonDetails,
        value,
      );

  _i1.ColumnValue<int, int> notPlayedMarkedByPlayerDataId(int? value) =>
      _i1.ColumnValue(
        table.notPlayedMarkedByPlayerDataId,
        value,
      );

  _i1.ColumnValue<bool, bool> closedForSubscriptions(bool? value) =>
      _i1.ColumnValue(
        table.closedForSubscriptions,
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
    title = _i1.ColumnString(
      'title',
      this,
    );
    description = _i1.ColumnString(
      'description',
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
    status = _i1.ColumnEnum(
      'status',
      this,
      _i1.EnumSerialization.byName,
      hasDefault: true,
    );
    notPlayedReason = _i1.ColumnEnum(
      'notPlayedReason',
      this,
      _i1.EnumSerialization.byName,
    );
    notPlayedReasonDetails = _i1.ColumnString(
      'notPlayedReasonDetails',
      this,
    );
    notPlayedMarkedByPlayerDataId = _i1.ColumnInt(
      'notPlayedMarkedByPlayerDataId',
      this,
    );
    closedForSubscriptions = _i1.ColumnBool(
      'closedForSubscriptions',
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

  late final _i1.ColumnString title;

  late final _i1.ColumnString description;

  late final _i1.ColumnEnum<_i3.MatchPodium> minAmountOfPlayers;

  late final _i1.ColumnEnum<_i3.MatchPodium> maxAmountOfPlayers;

  late final _i1.ColumnDateTime attemptedAt;

  late final _i1.ColumnEnum<_i2.MatchScheduleStatus> status;

  late final _i1.ColumnEnum<_i4.MatchScheduleNotPlayedReason> notPlayedReason;

  late final _i1.ColumnString notPlayedReasonDetails;

  late final _i1.ColumnInt notPlayedMarkedByPlayerDataId;

  _i5.PlayerDataTable? _notPlayedMarkedBy;

  late final _i1.ColumnBool closedForSubscriptions;

  late final _i1.ColumnInt locationId;

  _i6.LocationTable? _location;

  late final _i1.ColumnInt playerDataId;

  _i5.PlayerDataTable? _host;

  _i7.MatchSubscriptionTable? ___subscriptions;

  _i1.ManyRelation<_i7.MatchSubscriptionTable>? _subscriptions;

  _i8.MatchChatHistoryTable? _chatHistory;

  _i9.PlayedMatchTable? _playedMatch;

  _i5.PlayerDataTable get notPlayedMarkedBy {
    if (_notPlayedMarkedBy != null) return _notPlayedMarkedBy!;
    _notPlayedMarkedBy = _i1.createRelationTable(
      relationFieldName: 'notPlayedMarkedBy',
      field: MatchSchedulePairingAttempt.t.notPlayedMarkedByPlayerDataId,
      foreignField: _i5.PlayerData.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.PlayerDataTable(tableRelation: foreignTableRelation),
    );
    return _notPlayedMarkedBy!;
  }

  _i6.LocationTable get location {
    if (_location != null) return _location!;
    _location = _i1.createRelationTable(
      relationFieldName: 'location',
      field: MatchSchedulePairingAttempt.t.locationId,
      foreignField: _i6.Location.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i6.LocationTable(tableRelation: foreignTableRelation),
    );
    return _location!;
  }

  _i5.PlayerDataTable get host {
    if (_host != null) return _host!;
    _host = _i1.createRelationTable(
      relationFieldName: 'host',
      field: MatchSchedulePairingAttempt.t.playerDataId,
      foreignField: _i5.PlayerData.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.PlayerDataTable(tableRelation: foreignTableRelation),
    );
    return _host!;
  }

  _i7.MatchSubscriptionTable get __subscriptions {
    if (___subscriptions != null) return ___subscriptions!;
    ___subscriptions = _i1.createRelationTable(
      relationFieldName: '__subscriptions',
      field: MatchSchedulePairingAttempt.t.id,
      foreignField: _i7.MatchSubscription.t.matchSchedulePairingAttemptId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i7.MatchSubscriptionTable(tableRelation: foreignTableRelation),
    );
    return ___subscriptions!;
  }

  _i8.MatchChatHistoryTable get chatHistory {
    if (_chatHistory != null) return _chatHistory!;
    _chatHistory = _i1.createRelationTable(
      relationFieldName: 'chatHistory',
      field: MatchSchedulePairingAttempt.t.id,
      foreignField: _i8.MatchChatHistory.t.matchSchedulePairingAttemptId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i8.MatchChatHistoryTable(tableRelation: foreignTableRelation),
    );
    return _chatHistory!;
  }

  _i9.PlayedMatchTable get playedMatch {
    if (_playedMatch != null) return _playedMatch!;
    _playedMatch = _i1.createRelationTable(
      relationFieldName: 'playedMatch',
      field: MatchSchedulePairingAttempt.t.id,
      foreignField: _i9.PlayedMatch.t.scheduledPairingAttemptId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i9.PlayedMatchTable(tableRelation: foreignTableRelation),
    );
    return _playedMatch!;
  }

  _i1.ManyRelation<_i7.MatchSubscriptionTable> get subscriptions {
    if (_subscriptions != null) return _subscriptions!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'subscriptions',
      field: MatchSchedulePairingAttempt.t.id,
      foreignField: _i7.MatchSubscription.t.matchSchedulePairingAttemptId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i7.MatchSubscriptionTable(tableRelation: foreignTableRelation),
    );
    _subscriptions = _i1.ManyRelation<_i7.MatchSubscriptionTable>(
      tableWithRelations: relationTable,
      table: _i7.MatchSubscriptionTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _subscriptions!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    createdAt,
    title,
    description,
    minAmountOfPlayers,
    maxAmountOfPlayers,
    attemptedAt,
    status,
    notPlayedReason,
    notPlayedReasonDetails,
    notPlayedMarkedByPlayerDataId,
    closedForSubscriptions,
    locationId,
    playerDataId,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'notPlayedMarkedBy') {
      return notPlayedMarkedBy;
    }
    if (relationField == 'location') {
      return location;
    }
    if (relationField == 'host') {
      return host;
    }
    if (relationField == 'subscriptions') {
      return __subscriptions;
    }
    if (relationField == 'chatHistory') {
      return chatHistory;
    }
    if (relationField == 'playedMatch') {
      return playedMatch;
    }
    return null;
  }
}

class MatchSchedulePairingAttemptInclude extends _i1.IncludeObject {
  MatchSchedulePairingAttemptInclude._({
    _i5.PlayerDataInclude? notPlayedMarkedBy,
    _i6.LocationInclude? location,
    _i5.PlayerDataInclude? host,
    _i7.MatchSubscriptionIncludeList? subscriptions,
    _i8.MatchChatHistoryInclude? chatHistory,
    _i9.PlayedMatchInclude? playedMatch,
  }) {
    _notPlayedMarkedBy = notPlayedMarkedBy;
    _location = location;
    _host = host;
    _subscriptions = subscriptions;
    _chatHistory = chatHistory;
    _playedMatch = playedMatch;
  }

  _i5.PlayerDataInclude? _notPlayedMarkedBy;

  _i6.LocationInclude? _location;

  _i5.PlayerDataInclude? _host;

  _i7.MatchSubscriptionIncludeList? _subscriptions;

  _i8.MatchChatHistoryInclude? _chatHistory;

  _i9.PlayedMatchInclude? _playedMatch;

  @override
  Map<String, _i1.Include?> get includes => {
    'notPlayedMarkedBy': _notPlayedMarkedBy,
    'location': _location,
    'host': _host,
    'subscriptions': _subscriptions,
    'chatHistory': _chatHistory,
    'playedMatch': _playedMatch,
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
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
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
      lockMode: lockMode,
      lockBehavior: lockBehavior,
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
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<MatchSchedulePairingAttempt>(
      where: where?.call(MatchSchedulePairingAttempt.t),
      orderBy: orderBy?.call(MatchSchedulePairingAttempt.t),
      orderByList: orderByList?.call(MatchSchedulePairingAttempt.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [MatchSchedulePairingAttempt] by its [id] or null if no such row exists.
  Future<MatchSchedulePairingAttempt?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    MatchSchedulePairingAttemptInclude? include,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<MatchSchedulePairingAttempt>(
      id,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [MatchSchedulePairingAttempt]s in the list and returns the inserted rows.
  ///
  /// The returned [MatchSchedulePairingAttempt]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<MatchSchedulePairingAttempt>> insert(
    _i1.Session session,
    List<MatchSchedulePairingAttempt> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<MatchSchedulePairingAttempt>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
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

  /// Acquires row-level locks on [MatchSchedulePairingAttempt] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<MatchSchedulePairingAttemptTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<MatchSchedulePairingAttempt>(
      where: where(MatchSchedulePairingAttempt.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
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
    List<_i7.MatchSubscription> matchSubscription, {
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
    await session.db.update<_i7.MatchSubscription>(
      $matchSubscription,
      columns: [_i7.MatchSubscription.t.matchSchedulePairingAttemptId],
      transaction: transaction,
    );
  }
}

class MatchSchedulePairingAttemptAttachRowRepository {
  const MatchSchedulePairingAttemptAttachRowRepository._();

  /// Creates a relation between the given [MatchSchedulePairingAttempt] and [PlayerData]
  /// by setting the [MatchSchedulePairingAttempt]'s foreign key `notPlayedMarkedByPlayerDataId` to refer to the [PlayerData].
  Future<void> notPlayedMarkedBy(
    _i1.Session session,
    MatchSchedulePairingAttempt matchSchedulePairingAttempt,
    _i5.PlayerData notPlayedMarkedBy, {
    _i1.Transaction? transaction,
  }) async {
    if (matchSchedulePairingAttempt.id == null) {
      throw ArgumentError.notNull('matchSchedulePairingAttempt.id');
    }
    if (notPlayedMarkedBy.id == null) {
      throw ArgumentError.notNull('notPlayedMarkedBy.id');
    }

    var $matchSchedulePairingAttempt = matchSchedulePairingAttempt.copyWith(
      notPlayedMarkedByPlayerDataId: notPlayedMarkedBy.id,
    );
    await session.db.updateRow<MatchSchedulePairingAttempt>(
      $matchSchedulePairingAttempt,
      columns: [MatchSchedulePairingAttempt.t.notPlayedMarkedByPlayerDataId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [MatchSchedulePairingAttempt] and [Location]
  /// by setting the [MatchSchedulePairingAttempt]'s foreign key `locationId` to refer to the [Location].
  Future<void> location(
    _i1.Session session,
    MatchSchedulePairingAttempt matchSchedulePairingAttempt,
    _i6.Location location, {
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
  Future<void> host(
    _i1.Session session,
    MatchSchedulePairingAttempt matchSchedulePairingAttempt,
    _i5.PlayerData host, {
    _i1.Transaction? transaction,
  }) async {
    if (matchSchedulePairingAttempt.id == null) {
      throw ArgumentError.notNull('matchSchedulePairingAttempt.id');
    }
    if (host.id == null) {
      throw ArgumentError.notNull('host.id');
    }

    var $matchSchedulePairingAttempt = matchSchedulePairingAttempt.copyWith(
      playerDataId: host.id,
    );
    await session.db.updateRow<MatchSchedulePairingAttempt>(
      $matchSchedulePairingAttempt,
      columns: [MatchSchedulePairingAttempt.t.playerDataId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [MatchSchedulePairingAttempt] and [MatchChatHistory]
  /// by setting the [MatchSchedulePairingAttempt]'s foreign key `id` to refer to the [MatchChatHistory].
  Future<void> chatHistory(
    _i1.Session session,
    MatchSchedulePairingAttempt matchSchedulePairingAttempt,
    _i8.MatchChatHistory chatHistory, {
    _i1.Transaction? transaction,
  }) async {
    if (chatHistory.id == null) {
      throw ArgumentError.notNull('chatHistory.id');
    }
    if (matchSchedulePairingAttempt.id == null) {
      throw ArgumentError.notNull('matchSchedulePairingAttempt.id');
    }

    var $chatHistory = chatHistory.copyWith(
      matchSchedulePairingAttemptId: matchSchedulePairingAttempt.id,
    );
    await session.db.updateRow<_i8.MatchChatHistory>(
      $chatHistory,
      columns: [_i8.MatchChatHistory.t.matchSchedulePairingAttemptId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [MatchSchedulePairingAttempt] and [PlayedMatch]
  /// by setting the [MatchSchedulePairingAttempt]'s foreign key `id` to refer to the [PlayedMatch].
  Future<void> playedMatch(
    _i1.Session session,
    MatchSchedulePairingAttempt matchSchedulePairingAttempt,
    _i9.PlayedMatch playedMatch, {
    _i1.Transaction? transaction,
  }) async {
    if (playedMatch.id == null) {
      throw ArgumentError.notNull('playedMatch.id');
    }
    if (matchSchedulePairingAttempt.id == null) {
      throw ArgumentError.notNull('matchSchedulePairingAttempt.id');
    }

    var $playedMatch = playedMatch.copyWith(
      scheduledPairingAttemptId: matchSchedulePairingAttempt.id,
    );
    await session.db.updateRow<_i9.PlayedMatch>(
      $playedMatch,
      columns: [_i9.PlayedMatch.t.scheduledPairingAttemptId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [MatchSchedulePairingAttempt] and the given [MatchSubscription]
  /// by setting the [MatchSubscription]'s foreign key `matchSchedulePairingAttemptId` to refer to this [MatchSchedulePairingAttempt].
  Future<void> subscriptions(
    _i1.Session session,
    MatchSchedulePairingAttempt matchSchedulePairingAttempt,
    _i7.MatchSubscription matchSubscription, {
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
    await session.db.updateRow<_i7.MatchSubscription>(
      $matchSubscription,
      columns: [_i7.MatchSubscription.t.matchSchedulePairingAttemptId],
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
    List<_i7.MatchSubscription> matchSubscription, {
    _i1.Transaction? transaction,
  }) async {
    if (matchSubscription.any((e) => e.id == null)) {
      throw ArgumentError.notNull('matchSubscription.id');
    }

    var $matchSubscription = matchSubscription
        .map((e) => e.copyWith(matchSchedulePairingAttemptId: null))
        .toList();
    await session.db.update<_i7.MatchSubscription>(
      $matchSubscription,
      columns: [_i7.MatchSubscription.t.matchSchedulePairingAttemptId],
      transaction: transaction,
    );
  }
}

class MatchSchedulePairingAttemptDetachRowRepository {
  const MatchSchedulePairingAttemptDetachRowRepository._();

  /// Detaches the relation between this [MatchSchedulePairingAttempt] and the [PlayerData] set in `notPlayedMarkedBy`
  /// by setting the [MatchSchedulePairingAttempt]'s foreign key `notPlayedMarkedByPlayerDataId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> notPlayedMarkedBy(
    _i1.Session session,
    MatchSchedulePairingAttempt matchSchedulePairingAttempt, {
    _i1.Transaction? transaction,
  }) async {
    if (matchSchedulePairingAttempt.id == null) {
      throw ArgumentError.notNull('matchSchedulePairingAttempt.id');
    }

    var $matchSchedulePairingAttempt = matchSchedulePairingAttempt.copyWith(
      notPlayedMarkedByPlayerDataId: null,
    );
    await session.db.updateRow<MatchSchedulePairingAttempt>(
      $matchSchedulePairingAttempt,
      columns: [MatchSchedulePairingAttempt.t.notPlayedMarkedByPlayerDataId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [MatchSchedulePairingAttempt] and the given [MatchSubscription]
  /// by setting the [MatchSubscription]'s foreign key `matchSchedulePairingAttemptId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> subscriptions(
    _i1.Session session,
    _i7.MatchSubscription matchSubscription, {
    _i1.Transaction? transaction,
  }) async {
    if (matchSubscription.id == null) {
      throw ArgumentError.notNull('matchSubscription.id');
    }

    var $matchSubscription = matchSubscription.copyWith(
      matchSchedulePairingAttemptId: null,
    );
    await session.db.updateRow<_i7.MatchSubscription>(
      $matchSubscription,
      columns: [_i7.MatchSubscription.t.matchSchedulePairingAttemptId],
      transaction: transaction,
    );
  }
}
