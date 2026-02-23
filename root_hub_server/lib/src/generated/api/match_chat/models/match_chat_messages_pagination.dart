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
import '../../../entities/match_making/chat/match_chat_message.dart' as _i2;
import '../../../api/match_chat/models/match_chat_sender_profile.dart' as _i3;
import '../../../entities/others/pagination_metadata.dart' as _i4;
import 'package:root_hub_server/src/generated/protocol.dart' as _i5;

abstract class MatchChatMessagesPagination
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  MatchChatMessagesPagination._({
    required this.messages,
    required this.senderProfiles,
    required this.subscribedPlayerIds,
    required this.paginationMetadata,
  });

  factory MatchChatMessagesPagination({
    required List<_i2.MatchChatMessage> messages,
    required List<_i3.MatchChatSenderProfile> senderProfiles,
    required List<int> subscribedPlayerIds,
    required _i4.PaginationMetadata paginationMetadata,
  }) = _MatchChatMessagesPaginationImpl;

  factory MatchChatMessagesPagination.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return MatchChatMessagesPagination(
      messages: _i5.Protocol().deserialize<List<_i2.MatchChatMessage>>(
        jsonSerialization['messages'],
      ),
      senderProfiles: _i5.Protocol()
          .deserialize<List<_i3.MatchChatSenderProfile>>(
            jsonSerialization['senderProfiles'],
          ),
      subscribedPlayerIds: _i5.Protocol().deserialize<List<int>>(
        jsonSerialization['subscribedPlayerIds'],
      ),
      paginationMetadata: _i5.Protocol().deserialize<_i4.PaginationMetadata>(
        jsonSerialization['paginationMetadata'],
      ),
    );
  }

  List<_i2.MatchChatMessage> messages;

  List<_i3.MatchChatSenderProfile> senderProfiles;

  List<int> subscribedPlayerIds;

  _i4.PaginationMetadata paginationMetadata;

  /// Returns a shallow copy of this [MatchChatMessagesPagination]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  MatchChatMessagesPagination copyWith({
    List<_i2.MatchChatMessage>? messages,
    List<_i3.MatchChatSenderProfile>? senderProfiles,
    List<int>? subscribedPlayerIds,
    _i4.PaginationMetadata? paginationMetadata,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'MatchChatMessagesPagination',
      'messages': messages.toJson(valueToJson: (v) => v.toJson()),
      'senderProfiles': senderProfiles.toJson(valueToJson: (v) => v.toJson()),
      'subscribedPlayerIds': subscribedPlayerIds.toJson(),
      'paginationMetadata': paginationMetadata.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'MatchChatMessagesPagination',
      'messages': messages.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'senderProfiles': senderProfiles.toJson(
        valueToJson: (v) => v.toJsonForProtocol(),
      ),
      'subscribedPlayerIds': subscribedPlayerIds.toJson(),
      'paginationMetadata': paginationMetadata.toJsonForProtocol(),
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
    required List<_i3.MatchChatSenderProfile> senderProfiles,
    required List<int> subscribedPlayerIds,
    required _i4.PaginationMetadata paginationMetadata,
  }) : super._(
         messages: messages,
         senderProfiles: senderProfiles,
         subscribedPlayerIds: subscribedPlayerIds,
         paginationMetadata: paginationMetadata,
       );

  /// Returns a shallow copy of this [MatchChatMessagesPagination]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  MatchChatMessagesPagination copyWith({
    List<_i2.MatchChatMessage>? messages,
    List<_i3.MatchChatSenderProfile>? senderProfiles,
    List<int>? subscribedPlayerIds,
    _i4.PaginationMetadata? paginationMetadata,
  }) {
    return MatchChatMessagesPagination(
      messages: messages ?? this.messages.map((e0) => e0.copyWith()).toList(),
      senderProfiles:
          senderProfiles ??
          this.senderProfiles.map((e0) => e0.copyWith()).toList(),
      subscribedPlayerIds:
          subscribedPlayerIds ??
          this.subscribedPlayerIds.map((e0) => e0).toList(),
      paginationMetadata:
          paginationMetadata ?? this.paginationMetadata.copyWith(),
    );
  }
}
