/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import '../../entities/match_making/match_schedule_status.dart' as _i2;
import '../../entities/core/match_podium.dart' as _i3;
import '../../entities/match_making/match_schedule_not_played_reason.dart'
    as _i4;
import '../../entities/core/player_data.dart' as _i5;
import '../../entities/match_making/location.dart' as _i6;
import '../../entities/match_making/match_subscription.dart' as _i7;
import '../../entities/match_making/chat/match_chat_history.dart' as _i8;
import '../../entities/match/played_match.dart' as _i9;
import 'package:root_hub_client/src/protocol/protocol.dart' as _i10;

abstract class MatchSchedulePairingAttempt implements _i1.SerializableModel {
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
    this.locationAdditionalInfo,
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
    String? locationAdditionalInfo,
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
      locationAdditionalInfo:
          jsonSerialization['locationAdditionalInfo'] as String?,
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
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

  String? locationAdditionalInfo;

  int playerDataId;

  _i5.PlayerData? host;

  List<_i7.MatchSubscription>? subscriptions;

  _i8.MatchChatHistory? chatHistory;

  _i9.PlayedMatch? playedMatch;

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
    String? locationAdditionalInfo,
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
      if (locationAdditionalInfo != null)
        'locationAdditionalInfo': locationAdditionalInfo,
      'playerDataId': playerDataId,
      if (host != null) 'host': host?.toJson(),
      if (subscriptions != null)
        'subscriptions': subscriptions?.toJson(valueToJson: (v) => v.toJson()),
      if (chatHistory != null) 'chatHistory': chatHistory?.toJson(),
      if (playedMatch != null) 'playedMatch': playedMatch?.toJson(),
    };
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
    String? locationAdditionalInfo,
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
         locationAdditionalInfo: locationAdditionalInfo,
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
    Object? locationAdditionalInfo = _Undefined,
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
      locationAdditionalInfo: locationAdditionalInfo is String?
          ? locationAdditionalInfo
          : this.locationAdditionalInfo,
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
