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
import 'package:serverpod/serverpod.dart' as _i1;

abstract class MatchChatMessage
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  MatchChatMessage._({
    required this.sentAt,
    required this.content,
  });

  factory MatchChatMessage({
    required DateTime sentAt,
    required String content,
  }) = _MatchChatMessageImpl;

  factory MatchChatMessage.fromJson(Map<String, dynamic> jsonSerialization) {
    return MatchChatMessage(
      sentAt: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['sentAt']),
      content: jsonSerialization['content'] as String,
    );
  }

  DateTime sentAt;

  String content;

  /// Returns a shallow copy of this [MatchChatMessage]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  MatchChatMessage copyWith({
    DateTime? sentAt,
    String? content,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'MatchChatMessage',
      'sentAt': sentAt.toJson(),
      'content': content,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'MatchChatMessage',
      'sentAt': sentAt.toJson(),
      'content': content,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _MatchChatMessageImpl extends MatchChatMessage {
  _MatchChatMessageImpl({
    required DateTime sentAt,
    required String content,
  }) : super._(
         sentAt: sentAt,
         content: content,
       );

  /// Returns a shallow copy of this [MatchChatMessage]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  MatchChatMessage copyWith({
    DateTime? sentAt,
    String? content,
  }) {
    return MatchChatMessage(
      sentAt: sentAt ?? this.sentAt,
      content: content ?? this.content,
    );
  }
}
