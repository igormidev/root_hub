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
import '../../../api/match_chat/models/match_chat_played_match_player.dart'
    as _i3;
import 'package:root_hub_client/src/protocol/protocol.dart' as _i4;

abstract class MatchChatPlayedMatchSummary implements _i1.SerializableModel {
  MatchChatPlayedMatchSummary._({
    required this.scheduledMatchId,
    required this.matchTitle,
    required this.attemptedAt,
    required this.matchStartedAt,
    this.matchEstimatedDuration,
    required this.locationTitle,
    this.locationSubtitle,
    this.winnerDisplayName,
    this.winnerFaction,
    this.winnerScore,
    required this.players,
    this.groupPhotoUrl,
    this.boardPhotoUrl,
  });

  factory MatchChatPlayedMatchSummary({
    required int scheduledMatchId,
    required String matchTitle,
    required DateTime attemptedAt,
    required DateTime matchStartedAt,
    Duration? matchEstimatedDuration,
    required String locationTitle,
    String? locationSubtitle,
    String? winnerDisplayName,
    _i2.Faction? winnerFaction,
    int? winnerScore,
    required List<_i3.MatchChatPlayedMatchPlayer> players,
    String? groupPhotoUrl,
    String? boardPhotoUrl,
  }) = _MatchChatPlayedMatchSummaryImpl;

  factory MatchChatPlayedMatchSummary.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return MatchChatPlayedMatchSummary(
      scheduledMatchId: jsonSerialization['scheduledMatchId'] as int,
      matchTitle: jsonSerialization['matchTitle'] as String,
      attemptedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['attemptedAt'],
      ),
      matchStartedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['matchStartedAt'],
      ),
      matchEstimatedDuration:
          jsonSerialization['matchEstimatedDuration'] == null
          ? null
          : _i1.DurationJsonExtension.fromJson(
              jsonSerialization['matchEstimatedDuration'],
            ),
      locationTitle: jsonSerialization['locationTitle'] as String,
      locationSubtitle: jsonSerialization['locationSubtitle'] as String?,
      winnerDisplayName: jsonSerialization['winnerDisplayName'] as String?,
      winnerFaction: jsonSerialization['winnerFaction'] == null
          ? null
          : _i2.Faction.fromJson(
              (jsonSerialization['winnerFaction'] as String),
            ),
      winnerScore: jsonSerialization['winnerScore'] as int?,
      players: _i4.Protocol().deserialize<List<_i3.MatchChatPlayedMatchPlayer>>(
        jsonSerialization['players'],
      ),
      groupPhotoUrl: jsonSerialization['groupPhotoUrl'] as String?,
      boardPhotoUrl: jsonSerialization['boardPhotoUrl'] as String?,
    );
  }

  int scheduledMatchId;

  String matchTitle;

  DateTime attemptedAt;

  DateTime matchStartedAt;

  Duration? matchEstimatedDuration;

  String locationTitle;

  String? locationSubtitle;

  String? winnerDisplayName;

  _i2.Faction? winnerFaction;

  int? winnerScore;

  List<_i3.MatchChatPlayedMatchPlayer> players;

  String? groupPhotoUrl;

  String? boardPhotoUrl;

  /// Returns a shallow copy of this [MatchChatPlayedMatchSummary]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  MatchChatPlayedMatchSummary copyWith({
    int? scheduledMatchId,
    String? matchTitle,
    DateTime? attemptedAt,
    DateTime? matchStartedAt,
    Duration? matchEstimatedDuration,
    String? locationTitle,
    String? locationSubtitle,
    String? winnerDisplayName,
    _i2.Faction? winnerFaction,
    int? winnerScore,
    List<_i3.MatchChatPlayedMatchPlayer>? players,
    String? groupPhotoUrl,
    String? boardPhotoUrl,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'MatchChatPlayedMatchSummary',
      'scheduledMatchId': scheduledMatchId,
      'matchTitle': matchTitle,
      'attemptedAt': attemptedAt.toJson(),
      'matchStartedAt': matchStartedAt.toJson(),
      if (matchEstimatedDuration != null)
        'matchEstimatedDuration': matchEstimatedDuration?.toJson(),
      'locationTitle': locationTitle,
      if (locationSubtitle != null) 'locationSubtitle': locationSubtitle,
      if (winnerDisplayName != null) 'winnerDisplayName': winnerDisplayName,
      if (winnerFaction != null) 'winnerFaction': winnerFaction?.toJson(),
      if (winnerScore != null) 'winnerScore': winnerScore,
      'players': players.toJson(valueToJson: (v) => v.toJson()),
      if (groupPhotoUrl != null) 'groupPhotoUrl': groupPhotoUrl,
      if (boardPhotoUrl != null) 'boardPhotoUrl': boardPhotoUrl,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MatchChatPlayedMatchSummaryImpl extends MatchChatPlayedMatchSummary {
  _MatchChatPlayedMatchSummaryImpl({
    required int scheduledMatchId,
    required String matchTitle,
    required DateTime attemptedAt,
    required DateTime matchStartedAt,
    Duration? matchEstimatedDuration,
    required String locationTitle,
    String? locationSubtitle,
    String? winnerDisplayName,
    _i2.Faction? winnerFaction,
    int? winnerScore,
    required List<_i3.MatchChatPlayedMatchPlayer> players,
    String? groupPhotoUrl,
    String? boardPhotoUrl,
  }) : super._(
         scheduledMatchId: scheduledMatchId,
         matchTitle: matchTitle,
         attemptedAt: attemptedAt,
         matchStartedAt: matchStartedAt,
         matchEstimatedDuration: matchEstimatedDuration,
         locationTitle: locationTitle,
         locationSubtitle: locationSubtitle,
         winnerDisplayName: winnerDisplayName,
         winnerFaction: winnerFaction,
         winnerScore: winnerScore,
         players: players,
         groupPhotoUrl: groupPhotoUrl,
         boardPhotoUrl: boardPhotoUrl,
       );

  /// Returns a shallow copy of this [MatchChatPlayedMatchSummary]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  MatchChatPlayedMatchSummary copyWith({
    int? scheduledMatchId,
    String? matchTitle,
    DateTime? attemptedAt,
    DateTime? matchStartedAt,
    Object? matchEstimatedDuration = _Undefined,
    String? locationTitle,
    Object? locationSubtitle = _Undefined,
    Object? winnerDisplayName = _Undefined,
    Object? winnerFaction = _Undefined,
    Object? winnerScore = _Undefined,
    List<_i3.MatchChatPlayedMatchPlayer>? players,
    Object? groupPhotoUrl = _Undefined,
    Object? boardPhotoUrl = _Undefined,
  }) {
    return MatchChatPlayedMatchSummary(
      scheduledMatchId: scheduledMatchId ?? this.scheduledMatchId,
      matchTitle: matchTitle ?? this.matchTitle,
      attemptedAt: attemptedAt ?? this.attemptedAt,
      matchStartedAt: matchStartedAt ?? this.matchStartedAt,
      matchEstimatedDuration: matchEstimatedDuration is Duration?
          ? matchEstimatedDuration
          : this.matchEstimatedDuration,
      locationTitle: locationTitle ?? this.locationTitle,
      locationSubtitle: locationSubtitle is String?
          ? locationSubtitle
          : this.locationSubtitle,
      winnerDisplayName: winnerDisplayName is String?
          ? winnerDisplayName
          : this.winnerDisplayName,
      winnerFaction: winnerFaction is _i2.Faction?
          ? winnerFaction
          : this.winnerFaction,
      winnerScore: winnerScore is int? ? winnerScore : this.winnerScore,
      players: players ?? this.players.map((e0) => e0.copyWith()).toList(),
      groupPhotoUrl: groupPhotoUrl is String?
          ? groupPhotoUrl
          : this.groupPhotoUrl,
      boardPhotoUrl: boardPhotoUrl is String?
          ? boardPhotoUrl
          : this.boardPhotoUrl,
    );
  }
}
