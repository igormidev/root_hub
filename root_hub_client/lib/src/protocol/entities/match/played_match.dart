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
import '../../entities/match_making/location.dart' as _i2;
import '../../entities/match/player_perfomance_in_match.dart' as _i3;
import '../../entities/match/match_in_person_proof.dart' as _i4;
import '../../entities/community/post.dart' as _i5;
import 'package:root_hub_client/src/protocol/protocol.dart' as _i6;

abstract class PlayedMatch implements _i1.SerializableModel {
  PlayedMatch._({
    this.id,
    required this.matchStartedAt,
    this.matchEstimatedDuration,
    required this.locationId,
    this.location,
    this.playerPerfomances,
    this.inPersonProof,
    this.posts,
  });

  factory PlayedMatch({
    int? id,
    required DateTime matchStartedAt,
    Duration? matchEstimatedDuration,
    required int locationId,
    _i2.Location? location,
    List<_i3.PlayerPerfomanceInMatch>? playerPerfomances,
    _i4.MatchInPersonProof? inPersonProof,
    List<_i5.Post>? posts,
  }) = _PlayedMatchImpl;

  factory PlayedMatch.fromJson(Map<String, dynamic> jsonSerialization) {
    return PlayedMatch(
      id: jsonSerialization['id'] as int?,
      matchStartedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['matchStartedAt'],
      ),
      matchEstimatedDuration:
          jsonSerialization['matchEstimatedDuration'] == null
          ? null
          : _i1.DurationJsonExtension.fromJson(
              jsonSerialization['matchEstimatedDuration'],
            ),
      locationId: jsonSerialization['locationId'] as int,
      location: jsonSerialization['location'] == null
          ? null
          : _i6.Protocol().deserialize<_i2.Location>(
              jsonSerialization['location'],
            ),
      playerPerfomances: jsonSerialization['playerPerfomances'] == null
          ? null
          : _i6.Protocol().deserialize<List<_i3.PlayerPerfomanceInMatch>>(
              jsonSerialization['playerPerfomances'],
            ),
      inPersonProof: jsonSerialization['inPersonProof'] == null
          ? null
          : _i6.Protocol().deserialize<_i4.MatchInPersonProof>(
              jsonSerialization['inPersonProof'],
            ),
      posts: jsonSerialization['posts'] == null
          ? null
          : _i6.Protocol().deserialize<List<_i5.Post>>(
              jsonSerialization['posts'],
            ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  DateTime matchStartedAt;

  Duration? matchEstimatedDuration;

  int locationId;

  _i2.Location? location;

  List<_i3.PlayerPerfomanceInMatch>? playerPerfomances;

  _i4.MatchInPersonProof? inPersonProof;

  List<_i5.Post>? posts;

  /// Returns a shallow copy of this [PlayedMatch]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PlayedMatch copyWith({
    int? id,
    DateTime? matchStartedAt,
    Duration? matchEstimatedDuration,
    int? locationId,
    _i2.Location? location,
    List<_i3.PlayerPerfomanceInMatch>? playerPerfomances,
    _i4.MatchInPersonProof? inPersonProof,
    List<_i5.Post>? posts,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'PlayedMatch',
      if (id != null) 'id': id,
      'matchStartedAt': matchStartedAt.toJson(),
      if (matchEstimatedDuration != null)
        'matchEstimatedDuration': matchEstimatedDuration?.toJson(),
      'locationId': locationId,
      if (location != null) 'location': location?.toJson(),
      if (playerPerfomances != null)
        'playerPerfomances': playerPerfomances?.toJson(
          valueToJson: (v) => v.toJson(),
        ),
      if (inPersonProof != null) 'inPersonProof': inPersonProof?.toJson(),
      if (posts != null) 'posts': posts?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PlayedMatchImpl extends PlayedMatch {
  _PlayedMatchImpl({
    int? id,
    required DateTime matchStartedAt,
    Duration? matchEstimatedDuration,
    required int locationId,
    _i2.Location? location,
    List<_i3.PlayerPerfomanceInMatch>? playerPerfomances,
    _i4.MatchInPersonProof? inPersonProof,
    List<_i5.Post>? posts,
  }) : super._(
         id: id,
         matchStartedAt: matchStartedAt,
         matchEstimatedDuration: matchEstimatedDuration,
         locationId: locationId,
         location: location,
         playerPerfomances: playerPerfomances,
         inPersonProof: inPersonProof,
         posts: posts,
       );

  /// Returns a shallow copy of this [PlayedMatch]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PlayedMatch copyWith({
    Object? id = _Undefined,
    DateTime? matchStartedAt,
    Object? matchEstimatedDuration = _Undefined,
    int? locationId,
    Object? location = _Undefined,
    Object? playerPerfomances = _Undefined,
    Object? inPersonProof = _Undefined,
    Object? posts = _Undefined,
  }) {
    return PlayedMatch(
      id: id is int? ? id : this.id,
      matchStartedAt: matchStartedAt ?? this.matchStartedAt,
      matchEstimatedDuration: matchEstimatedDuration is Duration?
          ? matchEstimatedDuration
          : this.matchEstimatedDuration,
      locationId: locationId ?? this.locationId,
      location: location is _i2.Location?
          ? location
          : this.location?.copyWith(),
      playerPerfomances: playerPerfomances is List<_i3.PlayerPerfomanceInMatch>?
          ? playerPerfomances
          : this.playerPerfomances?.map((e0) => e0.copyWith()).toList(),
      inPersonProof: inPersonProof is _i4.MatchInPersonProof?
          ? inPersonProof
          : this.inPersonProof?.copyWith(),
      posts: posts is List<_i5.Post>?
          ? posts
          : this.posts?.map((e0) => e0.copyWith()).toList(),
    );
  }
}
