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
import '../../../entities/core/faction.dart' as _i2;

abstract class MatchChatPlayedMatchPlayer
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  MatchChatPlayedMatchPlayer._({
    required this.displayName,
    required this.faction,
    required this.didWin,
    this.score,
    required this.isAnonymous,
  });

  factory MatchChatPlayedMatchPlayer({
    required String displayName,
    required _i2.Faction faction,
    required bool didWin,
    int? score,
    required bool isAnonymous,
  }) = _MatchChatPlayedMatchPlayerImpl;

  factory MatchChatPlayedMatchPlayer.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return MatchChatPlayedMatchPlayer(
      displayName: jsonSerialization['displayName'] as String,
      faction: _i2.Faction.fromJson((jsonSerialization['faction'] as String)),
      didWin: jsonSerialization['didWin'] as bool,
      score: jsonSerialization['score'] as int?,
      isAnonymous: jsonSerialization['isAnonymous'] as bool,
    );
  }

  String displayName;

  _i2.Faction faction;

  bool didWin;

  int? score;

  bool isAnonymous;

  /// Returns a shallow copy of this [MatchChatPlayedMatchPlayer]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  MatchChatPlayedMatchPlayer copyWith({
    String? displayName,
    _i2.Faction? faction,
    bool? didWin,
    int? score,
    bool? isAnonymous,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'MatchChatPlayedMatchPlayer',
      'displayName': displayName,
      'faction': faction.toJson(),
      'didWin': didWin,
      if (score != null) 'score': score,
      'isAnonymous': isAnonymous,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'MatchChatPlayedMatchPlayer',
      'displayName': displayName,
      'faction': faction.toJson(),
      'didWin': didWin,
      if (score != null) 'score': score,
      'isAnonymous': isAnonymous,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MatchChatPlayedMatchPlayerImpl extends MatchChatPlayedMatchPlayer {
  _MatchChatPlayedMatchPlayerImpl({
    required String displayName,
    required _i2.Faction faction,
    required bool didWin,
    int? score,
    required bool isAnonymous,
  }) : super._(
         displayName: displayName,
         faction: faction,
         didWin: didWin,
         score: score,
         isAnonymous: isAnonymous,
       );

  /// Returns a shallow copy of this [MatchChatPlayedMatchPlayer]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  MatchChatPlayedMatchPlayer copyWith({
    String? displayName,
    _i2.Faction? faction,
    bool? didWin,
    Object? score = _Undefined,
    bool? isAnonymous,
  }) {
    return MatchChatPlayedMatchPlayer(
      displayName: displayName ?? this.displayName,
      faction: faction ?? this.faction,
      didWin: didWin ?? this.didWin,
      score: score is int? ? score : this.score,
      isAnonymous: isAnonymous ?? this.isAnonymous,
    );
  }
}
