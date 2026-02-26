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
import '../../../api/match_chat/models/match_chat_activity_chat_item.dart'
    as _i3;
import 'package:root_hub_client/src/protocol/protocol.dart' as _i4;

abstract class MatchChatActivityOverview implements _i1.SerializableModel {
  MatchChatActivityOverview._({
    required this.subscribedActiveSchedules,
    required this.activeChats,
    required this.endedChats,
    required this.unreadMessagesCount,
  });

  factory MatchChatActivityOverview({
    required List<_i2.MatchSchedulePairingAttempt> subscribedActiveSchedules,
    required List<_i3.MatchChatActivityChatItem> activeChats,
    required List<_i3.MatchChatActivityChatItem> endedChats,
    required int unreadMessagesCount,
  }) = _MatchChatActivityOverviewImpl;

  factory MatchChatActivityOverview.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return MatchChatActivityOverview(
      subscribedActiveSchedules: _i4.Protocol()
          .deserialize<List<_i2.MatchSchedulePairingAttempt>>(
            jsonSerialization['subscribedActiveSchedules'],
          ),
      activeChats: _i4.Protocol()
          .deserialize<List<_i3.MatchChatActivityChatItem>>(
            jsonSerialization['activeChats'],
          ),
      endedChats: _i4.Protocol()
          .deserialize<List<_i3.MatchChatActivityChatItem>>(
            jsonSerialization['endedChats'],
          ),
      unreadMessagesCount: jsonSerialization['unreadMessagesCount'] as int,
    );
  }

  List<_i2.MatchSchedulePairingAttempt> subscribedActiveSchedules;

  List<_i3.MatchChatActivityChatItem> activeChats;

  List<_i3.MatchChatActivityChatItem> endedChats;

  int unreadMessagesCount;

  /// Returns a shallow copy of this [MatchChatActivityOverview]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  MatchChatActivityOverview copyWith({
    List<_i2.MatchSchedulePairingAttempt>? subscribedActiveSchedules,
    List<_i3.MatchChatActivityChatItem>? activeChats,
    List<_i3.MatchChatActivityChatItem>? endedChats,
    int? unreadMessagesCount,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'MatchChatActivityOverview',
      'subscribedActiveSchedules': subscribedActiveSchedules.toJson(
        valueToJson: (v) => v.toJson(),
      ),
      'activeChats': activeChats.toJson(valueToJson: (v) => v.toJson()),
      'endedChats': endedChats.toJson(valueToJson: (v) => v.toJson()),
      'unreadMessagesCount': unreadMessagesCount,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _MatchChatActivityOverviewImpl extends MatchChatActivityOverview {
  _MatchChatActivityOverviewImpl({
    required List<_i2.MatchSchedulePairingAttempt> subscribedActiveSchedules,
    required List<_i3.MatchChatActivityChatItem> activeChats,
    required List<_i3.MatchChatActivityChatItem> endedChats,
    required int unreadMessagesCount,
  }) : super._(
         subscribedActiveSchedules: subscribedActiveSchedules,
         activeChats: activeChats,
         endedChats: endedChats,
         unreadMessagesCount: unreadMessagesCount,
       );

  /// Returns a shallow copy of this [MatchChatActivityOverview]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  MatchChatActivityOverview copyWith({
    List<_i2.MatchSchedulePairingAttempt>? subscribedActiveSchedules,
    List<_i3.MatchChatActivityChatItem>? activeChats,
    List<_i3.MatchChatActivityChatItem>? endedChats,
    int? unreadMessagesCount,
  }) {
    return MatchChatActivityOverview(
      subscribedActiveSchedules:
          subscribedActiveSchedules ??
          this.subscribedActiveSchedules.map((e0) => e0.copyWith()).toList(),
      activeChats:
          activeChats ?? this.activeChats.map((e0) => e0.copyWith()).toList(),
      endedChats:
          endedChats ?? this.endedChats.map((e0) => e0.copyWith()).toList(),
      unreadMessagesCount: unreadMessagesCount ?? this.unreadMessagesCount,
    );
  }
}
