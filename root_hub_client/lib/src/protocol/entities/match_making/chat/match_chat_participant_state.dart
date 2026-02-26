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
import '../../../entities/core/player_data.dart' as _i2;
import '../../../entities/match_making/chat/match_chat_history.dart' as _i3;
import 'package:root_hub_client/src/protocol/protocol.dart' as _i4;

abstract class MatchChatParticipantState implements _i1.SerializableModel {
  MatchChatParticipantState._({
    this.id,
    required this.playerDataId,
    this.playerData,
    required this.matchChatHistoryId,
    this.matchChatHistory,
    required this.firstSeenAt,
    required this.lastOpenedAt,
    this.lastReadMessageAt,
    int? unreadMessagesCount,
  }) : unreadMessagesCount = unreadMessagesCount ?? 0;

  factory MatchChatParticipantState({
    int? id,
    required int playerDataId,
    _i2.PlayerData? playerData,
    required int matchChatHistoryId,
    _i3.MatchChatHistory? matchChatHistory,
    required DateTime firstSeenAt,
    required DateTime lastOpenedAt,
    DateTime? lastReadMessageAt,
    int? unreadMessagesCount,
  }) = _MatchChatParticipantStateImpl;

  factory MatchChatParticipantState.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return MatchChatParticipantState(
      id: jsonSerialization['id'] as int?,
      playerDataId: jsonSerialization['playerDataId'] as int,
      playerData: jsonSerialization['playerData'] == null
          ? null
          : _i4.Protocol().deserialize<_i2.PlayerData>(
              jsonSerialization['playerData'],
            ),
      matchChatHistoryId: jsonSerialization['matchChatHistoryId'] as int,
      matchChatHistory: jsonSerialization['matchChatHistory'] == null
          ? null
          : _i4.Protocol().deserialize<_i3.MatchChatHistory>(
              jsonSerialization['matchChatHistory'],
            ),
      firstSeenAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['firstSeenAt'],
      ),
      lastOpenedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['lastOpenedAt'],
      ),
      lastReadMessageAt: jsonSerialization['lastReadMessageAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastReadMessageAt'],
            ),
      unreadMessagesCount: jsonSerialization['unreadMessagesCount'] as int?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int playerDataId;

  _i2.PlayerData? playerData;

  int matchChatHistoryId;

  _i3.MatchChatHistory? matchChatHistory;

  DateTime firstSeenAt;

  DateTime lastOpenedAt;

  DateTime? lastReadMessageAt;

  int unreadMessagesCount;

  /// Returns a shallow copy of this [MatchChatParticipantState]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  MatchChatParticipantState copyWith({
    int? id,
    int? playerDataId,
    _i2.PlayerData? playerData,
    int? matchChatHistoryId,
    _i3.MatchChatHistory? matchChatHistory,
    DateTime? firstSeenAt,
    DateTime? lastOpenedAt,
    DateTime? lastReadMessageAt,
    int? unreadMessagesCount,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'MatchChatParticipantState',
      if (id != null) 'id': id,
      'playerDataId': playerDataId,
      if (playerData != null) 'playerData': playerData?.toJson(),
      'matchChatHistoryId': matchChatHistoryId,
      if (matchChatHistory != null)
        'matchChatHistory': matchChatHistory?.toJson(),
      'firstSeenAt': firstSeenAt.toJson(),
      'lastOpenedAt': lastOpenedAt.toJson(),
      if (lastReadMessageAt != null)
        'lastReadMessageAt': lastReadMessageAt?.toJson(),
      'unreadMessagesCount': unreadMessagesCount,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MatchChatParticipantStateImpl extends MatchChatParticipantState {
  _MatchChatParticipantStateImpl({
    int? id,
    required int playerDataId,
    _i2.PlayerData? playerData,
    required int matchChatHistoryId,
    _i3.MatchChatHistory? matchChatHistory,
    required DateTime firstSeenAt,
    required DateTime lastOpenedAt,
    DateTime? lastReadMessageAt,
    int? unreadMessagesCount,
  }) : super._(
         id: id,
         playerDataId: playerDataId,
         playerData: playerData,
         matchChatHistoryId: matchChatHistoryId,
         matchChatHistory: matchChatHistory,
         firstSeenAt: firstSeenAt,
         lastOpenedAt: lastOpenedAt,
         lastReadMessageAt: lastReadMessageAt,
         unreadMessagesCount: unreadMessagesCount,
       );

  /// Returns a shallow copy of this [MatchChatParticipantState]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  MatchChatParticipantState copyWith({
    Object? id = _Undefined,
    int? playerDataId,
    Object? playerData = _Undefined,
    int? matchChatHistoryId,
    Object? matchChatHistory = _Undefined,
    DateTime? firstSeenAt,
    DateTime? lastOpenedAt,
    Object? lastReadMessageAt = _Undefined,
    int? unreadMessagesCount,
  }) {
    return MatchChatParticipantState(
      id: id is int? ? id : this.id,
      playerDataId: playerDataId ?? this.playerDataId,
      playerData: playerData is _i2.PlayerData?
          ? playerData
          : this.playerData?.copyWith(),
      matchChatHistoryId: matchChatHistoryId ?? this.matchChatHistoryId,
      matchChatHistory: matchChatHistory is _i3.MatchChatHistory?
          ? matchChatHistory
          : this.matchChatHistory?.copyWith(),
      firstSeenAt: firstSeenAt ?? this.firstSeenAt,
      lastOpenedAt: lastOpenedAt ?? this.lastOpenedAt,
      lastReadMessageAt: lastReadMessageAt is DateTime?
          ? lastReadMessageAt
          : this.lastReadMessageAt,
      unreadMessagesCount: unreadMessagesCount ?? this.unreadMessagesCount,
    );
  }
}
