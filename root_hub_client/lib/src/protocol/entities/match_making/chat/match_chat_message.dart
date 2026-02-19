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
import '../../../entities/match_making/chat/match_chat_history.dart' as _i2;
import '../../../entities/core/player_data.dart' as _i3;
import 'package:root_hub_client/src/protocol/protocol.dart' as _i4;

abstract class MatchChatMessage implements _i1.SerializableModel {
  MatchChatMessage._({
    this.id,
    required this.sentAt,
    required this.content,
    required this.matchChatHistoryId,
    this.matchChatHistory,
    required this.playerDataId,
    this.sender,
  });

  factory MatchChatMessage({
    int? id,
    required DateTime sentAt,
    required String content,
    required int matchChatHistoryId,
    _i2.MatchChatHistory? matchChatHistory,
    required int playerDataId,
    _i3.PlayerData? sender,
  }) = _MatchChatMessageImpl;

  factory MatchChatMessage.fromJson(Map<String, dynamic> jsonSerialization) {
    return MatchChatMessage(
      id: jsonSerialization['id'] as int?,
      sentAt: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['sentAt']),
      content: jsonSerialization['content'] as String,
      matchChatHistoryId: jsonSerialization['matchChatHistoryId'] as int,
      matchChatHistory: jsonSerialization['matchChatHistory'] == null
          ? null
          : _i4.Protocol().deserialize<_i2.MatchChatHistory>(
              jsonSerialization['matchChatHistory'],
            ),
      playerDataId: jsonSerialization['playerDataId'] as int,
      sender: jsonSerialization['sender'] == null
          ? null
          : _i4.Protocol().deserialize<_i3.PlayerData>(
              jsonSerialization['sender'],
            ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  DateTime sentAt;

  String content;

  int matchChatHistoryId;

  _i2.MatchChatHistory? matchChatHistory;

  int playerDataId;

  _i3.PlayerData? sender;

  /// Returns a shallow copy of this [MatchChatMessage]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  MatchChatMessage copyWith({
    int? id,
    DateTime? sentAt,
    String? content,
    int? matchChatHistoryId,
    _i2.MatchChatHistory? matchChatHistory,
    int? playerDataId,
    _i3.PlayerData? sender,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'MatchChatMessage',
      if (id != null) 'id': id,
      'sentAt': sentAt.toJson(),
      'content': content,
      'matchChatHistoryId': matchChatHistoryId,
      if (matchChatHistory != null)
        'matchChatHistory': matchChatHistory?.toJson(),
      'playerDataId': playerDataId,
      if (sender != null) 'sender': sender?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MatchChatMessageImpl extends MatchChatMessage {
  _MatchChatMessageImpl({
    int? id,
    required DateTime sentAt,
    required String content,
    required int matchChatHistoryId,
    _i2.MatchChatHistory? matchChatHistory,
    required int playerDataId,
    _i3.PlayerData? sender,
  }) : super._(
         id: id,
         sentAt: sentAt,
         content: content,
         matchChatHistoryId: matchChatHistoryId,
         matchChatHistory: matchChatHistory,
         playerDataId: playerDataId,
         sender: sender,
       );

  /// Returns a shallow copy of this [MatchChatMessage]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  MatchChatMessage copyWith({
    Object? id = _Undefined,
    DateTime? sentAt,
    String? content,
    int? matchChatHistoryId,
    Object? matchChatHistory = _Undefined,
    int? playerDataId,
    Object? sender = _Undefined,
  }) {
    return MatchChatMessage(
      id: id is int? ? id : this.id,
      sentAt: sentAt ?? this.sentAt,
      content: content ?? this.content,
      matchChatHistoryId: matchChatHistoryId ?? this.matchChatHistoryId,
      matchChatHistory: matchChatHistory is _i2.MatchChatHistory?
          ? matchChatHistory
          : this.matchChatHistory?.copyWith(),
      playerDataId: playerDataId ?? this.playerDataId,
      sender: sender is _i3.PlayerData? ? sender : this.sender?.copyWith(),
    );
  }
}
