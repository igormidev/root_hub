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

enum MatchScheduleNotPlayedReason implements _i1.SerializableModel {
  notEnoughPlayers,
  hostUnavailable,
  noGameCopyAvailable,
  venueIssue,
  playerNoShow,
  weatherOrEmergency,
  expiredWithoutResult,
  other;

  static MatchScheduleNotPlayedReason fromJson(String name) {
    switch (name) {
      case 'notEnoughPlayers':
        return MatchScheduleNotPlayedReason.notEnoughPlayers;
      case 'hostUnavailable':
        return MatchScheduleNotPlayedReason.hostUnavailable;
      case 'noGameCopyAvailable':
        return MatchScheduleNotPlayedReason.noGameCopyAvailable;
      case 'venueIssue':
        return MatchScheduleNotPlayedReason.venueIssue;
      case 'playerNoShow':
        return MatchScheduleNotPlayedReason.playerNoShow;
      case 'weatherOrEmergency':
        return MatchScheduleNotPlayedReason.weatherOrEmergency;
      case 'expiredWithoutResult':
        return MatchScheduleNotPlayedReason.expiredWithoutResult;
      case 'other':
        return MatchScheduleNotPlayedReason.other;
      default:
        throw ArgumentError(
          'Value "$name" cannot be converted to "MatchScheduleNotPlayedReason"',
        );
    }
  }

  @override
  String toJson() => name;

  @override
  String toString() => name;
}
