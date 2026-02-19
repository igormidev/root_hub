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
import '../../entities/match/played_match.dart' as _i2;
import 'package:root_hub_client/src/protocol/protocol.dart' as _i3;

abstract class MatchInPersonProof implements _i1.SerializableModel {
  MatchInPersonProof._({
    this.id,
    required this.matchId,
    this.match,
    required this.groupPhotoUrl,
    required this.boardPhotoUrl,
  });

  factory MatchInPersonProof({
    int? id,
    required int matchId,
    _i2.PlayedMatch? match,
    required String groupPhotoUrl,
    required String boardPhotoUrl,
  }) = _MatchInPersonProofImpl;

  factory MatchInPersonProof.fromJson(Map<String, dynamic> jsonSerialization) {
    return MatchInPersonProof(
      id: jsonSerialization['id'] as int?,
      matchId: jsonSerialization['matchId'] as int,
      match: jsonSerialization['match'] == null
          ? null
          : _i3.Protocol().deserialize<_i2.PlayedMatch>(
              jsonSerialization['match'],
            ),
      groupPhotoUrl: jsonSerialization['groupPhotoUrl'] as String,
      boardPhotoUrl: jsonSerialization['boardPhotoUrl'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int matchId;

  _i2.PlayedMatch? match;

  String groupPhotoUrl;

  String boardPhotoUrl;

  /// Returns a shallow copy of this [MatchInPersonProof]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  MatchInPersonProof copyWith({
    int? id,
    int? matchId,
    _i2.PlayedMatch? match,
    String? groupPhotoUrl,
    String? boardPhotoUrl,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'MatchInPersonProof',
      if (id != null) 'id': id,
      'matchId': matchId,
      if (match != null) 'match': match?.toJson(),
      'groupPhotoUrl': groupPhotoUrl,
      'boardPhotoUrl': boardPhotoUrl,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MatchInPersonProofImpl extends MatchInPersonProof {
  _MatchInPersonProofImpl({
    int? id,
    required int matchId,
    _i2.PlayedMatch? match,
    required String groupPhotoUrl,
    required String boardPhotoUrl,
  }) : super._(
         id: id,
         matchId: matchId,
         match: match,
         groupPhotoUrl: groupPhotoUrl,
         boardPhotoUrl: boardPhotoUrl,
       );

  /// Returns a shallow copy of this [MatchInPersonProof]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  MatchInPersonProof copyWith({
    Object? id = _Undefined,
    int? matchId,
    Object? match = _Undefined,
    String? groupPhotoUrl,
    String? boardPhotoUrl,
  }) {
    return MatchInPersonProof(
      id: id is int? ? id : this.id,
      matchId: matchId ?? this.matchId,
      match: match is _i2.PlayedMatch? ? match : this.match?.copyWith(),
      groupPhotoUrl: groupPhotoUrl ?? this.groupPhotoUrl,
      boardPhotoUrl: boardPhotoUrl ?? this.boardPhotoUrl,
    );
  }
}
