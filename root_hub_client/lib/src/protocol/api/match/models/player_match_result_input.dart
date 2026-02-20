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
import '../../../entities/core/faction.dart' as _i2;

abstract class PlayerMatchResultInput implements _i1.SerializableModel {
  PlayerMatchResultInput._({
    this.anonymousPlayerId,
    this.playerDataId,
    required this.didWin,
    required this.factionUsedInMatch,
  });

  factory PlayerMatchResultInput({
    int? anonymousPlayerId,
    int? playerDataId,
    required bool didWin,
    required _i2.Faction factionUsedInMatch,
  }) = _PlayerMatchResultInputImpl;

  factory PlayerMatchResultInput.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return PlayerMatchResultInput(
      anonymousPlayerId: jsonSerialization['anonymousPlayerId'] as int?,
      playerDataId: jsonSerialization['playerDataId'] as int?,
      didWin: jsonSerialization['didWin'] as bool,
      factionUsedInMatch: _i2.Faction.fromJson(
        (jsonSerialization['factionUsedInMatch'] as String),
      ),
    );
  }

  int? anonymousPlayerId;

  int? playerDataId;

  bool didWin;

  _i2.Faction factionUsedInMatch;

  /// Returns a shallow copy of this [PlayerMatchResultInput]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PlayerMatchResultInput copyWith({
    int? anonymousPlayerId,
    int? playerDataId,
    bool? didWin,
    _i2.Faction? factionUsedInMatch,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'PlayerMatchResultInput',
      if (anonymousPlayerId != null) 'anonymousPlayerId': anonymousPlayerId,
      if (playerDataId != null) 'playerDataId': playerDataId,
      'didWin': didWin,
      'factionUsedInMatch': factionUsedInMatch.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PlayerMatchResultInputImpl extends PlayerMatchResultInput {
  _PlayerMatchResultInputImpl({
    int? anonymousPlayerId,
    int? playerDataId,
    required bool didWin,
    required _i2.Faction factionUsedInMatch,
  }) : super._(
         anonymousPlayerId: anonymousPlayerId,
         playerDataId: playerDataId,
         didWin: didWin,
         factionUsedInMatch: factionUsedInMatch,
       );

  /// Returns a shallow copy of this [PlayerMatchResultInput]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PlayerMatchResultInput copyWith({
    Object? anonymousPlayerId = _Undefined,
    Object? playerDataId = _Undefined,
    bool? didWin,
    _i2.Faction? factionUsedInMatch,
  }) {
    return PlayerMatchResultInput(
      anonymousPlayerId: anonymousPlayerId is int?
          ? anonymousPlayerId
          : this.anonymousPlayerId,
      playerDataId: playerDataId is int? ? playerDataId : this.playerDataId,
      didWin: didWin ?? this.didWin,
      factionUsedInMatch: factionUsedInMatch ?? this.factionUsedInMatch,
    );
  }
}
