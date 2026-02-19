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

abstract class MatchChatHistory
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  MatchChatHistory._({required this.content});

  factory MatchChatHistory({required String content}) = _MatchChatHistoryImpl;

  factory MatchChatHistory.fromJson(Map<String, dynamic> jsonSerialization) {
    return MatchChatHistory(content: jsonSerialization['content'] as String);
  }

  String content;

  /// Returns a shallow copy of this [MatchChatHistory]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  MatchChatHistory copyWith({String? content});
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'MatchChatHistory',
      'content': content,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'MatchChatHistory',
      'content': content,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _MatchChatHistoryImpl extends MatchChatHistory {
  _MatchChatHistoryImpl({required String content}) : super._(content: content);

  /// Returns a shallow copy of this [MatchChatHistory]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  MatchChatHistory copyWith({String? content}) {
    return MatchChatHistory(content: content ?? this.content);
  }
}
