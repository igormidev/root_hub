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

abstract class RegisteredPlayerSearchResult
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  RegisteredPlayerSearchResult._({
    required this.playerDataId,
    required this.displayName,
  });

  factory RegisteredPlayerSearchResult({
    required int playerDataId,
    required String displayName,
  }) = _RegisteredPlayerSearchResultImpl;

  factory RegisteredPlayerSearchResult.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return RegisteredPlayerSearchResult(
      playerDataId: jsonSerialization['playerDataId'] as int,
      displayName: jsonSerialization['displayName'] as String,
    );
  }

  int playerDataId;

  String displayName;

  /// Returns a shallow copy of this [RegisteredPlayerSearchResult]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  RegisteredPlayerSearchResult copyWith({
    int? playerDataId,
    String? displayName,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'RegisteredPlayerSearchResult',
      'playerDataId': playerDataId,
      'displayName': displayName,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'RegisteredPlayerSearchResult',
      'playerDataId': playerDataId,
      'displayName': displayName,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _RegisteredPlayerSearchResultImpl extends RegisteredPlayerSearchResult {
  _RegisteredPlayerSearchResultImpl({
    required int playerDataId,
    required String displayName,
  }) : super._(
         playerDataId: playerDataId,
         displayName: displayName,
       );

  /// Returns a shallow copy of this [RegisteredPlayerSearchResult]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  RegisteredPlayerSearchResult copyWith({
    int? playerDataId,
    String? displayName,
  }) {
    return RegisteredPlayerSearchResult(
      playerDataId: playerDataId ?? this.playerDataId,
      displayName: displayName ?? this.displayName,
    );
  }
}
