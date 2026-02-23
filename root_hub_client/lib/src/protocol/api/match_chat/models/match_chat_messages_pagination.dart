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
import '../../../entities/match_making/chat/match_chat_message.dart' as _i2;
import '../../../entities/others/pagination_metadata.dart' as _i3;
import 'package:root_hub_client/src/protocol/protocol.dart' as _i4;

abstract class MatchChatMessagesPagination implements _i1.SerializableModel {
  MatchChatMessagesPagination._({
    required this.messages,
    required this.subscribedPlayerIds,
    required this.paginationMetadata,
  });

  factory MatchChatMessagesPagination({
    required List<_i2.MatchChatMessage> messages,
    required List<int> subscribedPlayerIds,
    required _i3.PaginationMetadata paginationMetadata,
  }) = _MatchChatMessagesPaginationImpl;

  factory MatchChatMessagesPagination.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return MatchChatMessagesPagination(
      messages: _i4.Protocol().deserialize<List<_i2.MatchChatMessage>>(
        jsonSerialization['messages'],
      ),
      subscribedPlayerIds: _i4.Protocol().deserialize<List<int>>(
        jsonSerialization['subscribedPlayerIds'],
      ),
      paginationMetadata: _i4.Protocol().deserialize<_i3.PaginationMetadata>(
        jsonSerialization['paginationMetadata'],
      ),
    );
  }

  List<_i2.MatchChatMessage> messages;

  List<int> subscribedPlayerIds;

  _i3.PaginationMetadata paginationMetadata;

  /// Returns a shallow copy of this [MatchChatMessagesPagination]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  MatchChatMessagesPagination copyWith({
    List<_i2.MatchChatMessage>? messages,
    List<int>? subscribedPlayerIds,
    _i3.PaginationMetadata? paginationMetadata,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'MatchChatMessagesPagination',
      'messages': messages.toJson(valueToJson: (v) => v.toJson()),
      'subscribedPlayerIds': subscribedPlayerIds.toJson(),
      'paginationMetadata': paginationMetadata.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _MatchChatMessagesPaginationImpl extends MatchChatMessagesPagination {
  _MatchChatMessagesPaginationImpl({
    required List<_i2.MatchChatMessage> messages,
    required List<int> subscribedPlayerIds,
    required _i3.PaginationMetadata paginationMetadata,
  }) : super._(
         messages: messages,
         subscribedPlayerIds: subscribedPlayerIds,
         paginationMetadata: paginationMetadata,
       );

  /// Returns a shallow copy of this [MatchChatMessagesPagination]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  MatchChatMessagesPagination copyWith({
    List<_i2.MatchChatMessage>? messages,
    List<int>? subscribedPlayerIds,
    _i3.PaginationMetadata? paginationMetadata,
  }) {
    return MatchChatMessagesPagination(
      messages: messages ?? this.messages.map((e0) => e0.copyWith()).toList(),
      subscribedPlayerIds:
          subscribedPlayerIds ??
          this.subscribedPlayerIds.map((e0) => e0).toList(),
      paginationMetadata:
          paginationMetadata ?? this.paginationMetadata.copyWith(),
    );
  }
}
