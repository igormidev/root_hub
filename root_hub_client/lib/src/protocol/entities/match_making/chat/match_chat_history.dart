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
import '../../../entities/match_making/match_schedule.dart' as _i2;
import '../../../entities/match_making/chat/match_chat_message.dart' as _i3;
import 'package:root_hub_client/src/protocol/protocol.dart' as _i4;

abstract class MatchChatHistory implements _i1.SerializableModel {
  MatchChatHistory._({
    this.id,
    required this.content,
    required this.matchSchedulePairingAttemptId,
    this.matchSchedulePairingAttempt,
    this.messages,
  });

  factory MatchChatHistory({
    int? id,
    required String content,
    required int matchSchedulePairingAttemptId,
    _i2.MatchSchedulePairingAttempt? matchSchedulePairingAttempt,
    List<_i3.MatchChatMessage>? messages,
  }) = _MatchChatHistoryImpl;

  factory MatchChatHistory.fromJson(Map<String, dynamic> jsonSerialization) {
    return MatchChatHistory(
      id: jsonSerialization['id'] as int?,
      content: jsonSerialization['content'] as String,
      matchSchedulePairingAttemptId:
          jsonSerialization['matchSchedulePairingAttemptId'] as int,
      matchSchedulePairingAttempt:
          jsonSerialization['matchSchedulePairingAttempt'] == null
          ? null
          : _i4.Protocol().deserialize<_i2.MatchSchedulePairingAttempt>(
              jsonSerialization['matchSchedulePairingAttempt'],
            ),
      messages: jsonSerialization['messages'] == null
          ? null
          : _i4.Protocol().deserialize<List<_i3.MatchChatMessage>>(
              jsonSerialization['messages'],
            ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String content;

  int matchSchedulePairingAttemptId;

  _i2.MatchSchedulePairingAttempt? matchSchedulePairingAttempt;

  List<_i3.MatchChatMessage>? messages;

  /// Returns a shallow copy of this [MatchChatHistory]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  MatchChatHistory copyWith({
    int? id,
    String? content,
    int? matchSchedulePairingAttemptId,
    _i2.MatchSchedulePairingAttempt? matchSchedulePairingAttempt,
    List<_i3.MatchChatMessage>? messages,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'MatchChatHistory',
      if (id != null) 'id': id,
      'content': content,
      'matchSchedulePairingAttemptId': matchSchedulePairingAttemptId,
      if (matchSchedulePairingAttempt != null)
        'matchSchedulePairingAttempt': matchSchedulePairingAttempt?.toJson(),
      if (messages != null)
        'messages': messages?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MatchChatHistoryImpl extends MatchChatHistory {
  _MatchChatHistoryImpl({
    int? id,
    required String content,
    required int matchSchedulePairingAttemptId,
    _i2.MatchSchedulePairingAttempt? matchSchedulePairingAttempt,
    List<_i3.MatchChatMessage>? messages,
  }) : super._(
         id: id,
         content: content,
         matchSchedulePairingAttemptId: matchSchedulePairingAttemptId,
         matchSchedulePairingAttempt: matchSchedulePairingAttempt,
         messages: messages,
       );

  /// Returns a shallow copy of this [MatchChatHistory]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  MatchChatHistory copyWith({
    Object? id = _Undefined,
    String? content,
    int? matchSchedulePairingAttemptId,
    Object? matchSchedulePairingAttempt = _Undefined,
    Object? messages = _Undefined,
  }) {
    return MatchChatHistory(
      id: id is int? ? id : this.id,
      content: content ?? this.content,
      matchSchedulePairingAttemptId:
          matchSchedulePairingAttemptId ?? this.matchSchedulePairingAttemptId,
      matchSchedulePairingAttempt:
          matchSchedulePairingAttempt is _i2.MatchSchedulePairingAttempt?
          ? matchSchedulePairingAttempt
          : this.matchSchedulePairingAttempt?.copyWith(),
      messages: messages is List<_i3.MatchChatMessage>?
          ? messages
          : this.messages?.map((e0) => e0.copyWith()).toList(),
    );
  }
}
