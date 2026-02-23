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
import '../../../entities/match_making/match_schedule.dart' as _i2;
import '../../../api/match_making/models/match_schedule_player_snapshot.dart'
    as _i3;
import 'package:root_hub_client/src/protocol/protocol.dart' as _i4;

abstract class MatchScheduleInfo implements _i1.SerializableModel {
  MatchScheduleInfo._({
    required this.matchSchedule,
    required this.players,
  });

  factory MatchScheduleInfo({
    required _i2.MatchSchedulePairingAttempt matchSchedule,
    required List<_i3.MatchSchedulePlayerSnapshot> players,
  }) = _MatchScheduleInfoImpl;

  factory MatchScheduleInfo.fromJson(Map<String, dynamic> jsonSerialization) {
    return MatchScheduleInfo(
      matchSchedule: _i4.Protocol()
          .deserialize<_i2.MatchSchedulePairingAttempt>(
            jsonSerialization['matchSchedule'],
          ),
      players: _i4.Protocol()
          .deserialize<List<_i3.MatchSchedulePlayerSnapshot>>(
            jsonSerialization['players'],
          ),
    );
  }

  _i2.MatchSchedulePairingAttempt matchSchedule;

  List<_i3.MatchSchedulePlayerSnapshot> players;

  /// Returns a shallow copy of this [MatchScheduleInfo]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  MatchScheduleInfo copyWith({
    _i2.MatchSchedulePairingAttempt? matchSchedule,
    List<_i3.MatchSchedulePlayerSnapshot>? players,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'MatchScheduleInfo',
      'matchSchedule': matchSchedule.toJson(),
      'players': players.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _MatchScheduleInfoImpl extends MatchScheduleInfo {
  _MatchScheduleInfoImpl({
    required _i2.MatchSchedulePairingAttempt matchSchedule,
    required List<_i3.MatchSchedulePlayerSnapshot> players,
  }) : super._(
         matchSchedule: matchSchedule,
         players: players,
       );

  /// Returns a shallow copy of this [MatchScheduleInfo]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  MatchScheduleInfo copyWith({
    _i2.MatchSchedulePairingAttempt? matchSchedule,
    List<_i3.MatchSchedulePlayerSnapshot>? players,
  }) {
    return MatchScheduleInfo(
      matchSchedule: matchSchedule ?? this.matchSchedule.copyWith(),
      players: players ?? this.players.map((e0) => e0.copyWith()).toList(),
    );
  }
}
