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

abstract class MatchChatSenderProfile implements _i1.SerializableModel {
  MatchChatSenderProfile._({
    required this.playerDataId,
    this.profileImageUrl,
  });

  factory MatchChatSenderProfile({
    required int playerDataId,
    String? profileImageUrl,
  }) = _MatchChatSenderProfileImpl;

  factory MatchChatSenderProfile.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return MatchChatSenderProfile(
      playerDataId: jsonSerialization['playerDataId'] as int,
      profileImageUrl: jsonSerialization['profileImageUrl'] as String?,
    );
  }

  int playerDataId;

  String? profileImageUrl;

  /// Returns a shallow copy of this [MatchChatSenderProfile]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  MatchChatSenderProfile copyWith({
    int? playerDataId,
    String? profileImageUrl,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'MatchChatSenderProfile',
      'playerDataId': playerDataId,
      if (profileImageUrl != null) 'profileImageUrl': profileImageUrl,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MatchChatSenderProfileImpl extends MatchChatSenderProfile {
  _MatchChatSenderProfileImpl({
    required int playerDataId,
    String? profileImageUrl,
  }) : super._(
         playerDataId: playerDataId,
         profileImageUrl: profileImageUrl,
       );

  /// Returns a shallow copy of this [MatchChatSenderProfile]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  MatchChatSenderProfile copyWith({
    int? playerDataId,
    Object? profileImageUrl = _Undefined,
  }) {
    return MatchChatSenderProfile(
      playerDataId: playerDataId ?? this.playerDataId,
      profileImageUrl: profileImageUrl is String?
          ? profileImageUrl
          : this.profileImageUrl,
    );
  }
}
