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

abstract class MatchChatParticipantPresence implements _i1.SerializableModel {
  MatchChatParticipantPresence._({
    required this.playerDataId,
    this.lastReadMessageAt,
    this.lastTypingAt,
  });

  factory MatchChatParticipantPresence({
    required int playerDataId,
    DateTime? lastReadMessageAt,
    DateTime? lastTypingAt,
  }) = _MatchChatParticipantPresenceImpl;

  factory MatchChatParticipantPresence.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return MatchChatParticipantPresence(
      playerDataId: jsonSerialization['playerDataId'] as int,
      lastReadMessageAt: jsonSerialization['lastReadMessageAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastReadMessageAt'],
            ),
      lastTypingAt: jsonSerialization['lastTypingAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastTypingAt'],
            ),
    );
  }

  int playerDataId;

  DateTime? lastReadMessageAt;

  DateTime? lastTypingAt;

  /// Returns a shallow copy of this [MatchChatParticipantPresence]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  MatchChatParticipantPresence copyWith({
    int? playerDataId,
    DateTime? lastReadMessageAt,
    DateTime? lastTypingAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'MatchChatParticipantPresence',
      'playerDataId': playerDataId,
      if (lastReadMessageAt != null)
        'lastReadMessageAt': lastReadMessageAt?.toJson(),
      if (lastTypingAt != null) 'lastTypingAt': lastTypingAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MatchChatParticipantPresenceImpl extends MatchChatParticipantPresence {
  _MatchChatParticipantPresenceImpl({
    required int playerDataId,
    DateTime? lastReadMessageAt,
    DateTime? lastTypingAt,
  }) : super._(
         playerDataId: playerDataId,
         lastReadMessageAt: lastReadMessageAt,
         lastTypingAt: lastTypingAt,
       );

  /// Returns a shallow copy of this [MatchChatParticipantPresence]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  MatchChatParticipantPresence copyWith({
    int? playerDataId,
    Object? lastReadMessageAt = _Undefined,
    Object? lastTypingAt = _Undefined,
  }) {
    return MatchChatParticipantPresence(
      playerDataId: playerDataId ?? this.playerDataId,
      lastReadMessageAt: lastReadMessageAt is DateTime?
          ? lastReadMessageAt
          : this.lastReadMessageAt,
      lastTypingAt: lastTypingAt is DateTime?
          ? lastTypingAt
          : this.lastTypingAt,
    );
  }
}
