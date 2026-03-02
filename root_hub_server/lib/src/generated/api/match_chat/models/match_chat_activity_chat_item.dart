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
import '../../../entities/match_making/chat/match_chat_message_type.dart'
    as _i2;

abstract class MatchChatActivityChatItem
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  MatchChatActivityChatItem._({
    required this.scheduledMatchId,
    required this.chatHistoryId,
    required this.matchTitle,
    required this.attemptedAt,
    required this.unreadMessagesCount,
    required this.isSubscribed,
    required this.hasPlayedResult,
    required this.locationTitle,
    this.locationSubtitle,
    this.lastMessageAt,
    this.lastMessagePreview,
    this.lastMessageType,
    this.lastMessageSenderDisplayName,
  });

  factory MatchChatActivityChatItem({
    required int scheduledMatchId,
    required int chatHistoryId,
    required String matchTitle,
    required DateTime attemptedAt,
    required int unreadMessagesCount,
    required bool isSubscribed,
    required bool hasPlayedResult,
    required String locationTitle,
    String? locationSubtitle,
    DateTime? lastMessageAt,
    String? lastMessagePreview,
    _i2.MatchChatMessageType? lastMessageType,
    String? lastMessageSenderDisplayName,
  }) = _MatchChatActivityChatItemImpl;

  factory MatchChatActivityChatItem.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return MatchChatActivityChatItem(
      scheduledMatchId: jsonSerialization['scheduledMatchId'] as int,
      chatHistoryId: jsonSerialization['chatHistoryId'] as int,
      matchTitle: jsonSerialization['matchTitle'] as String,
      attemptedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['attemptedAt'],
      ),
      unreadMessagesCount: jsonSerialization['unreadMessagesCount'] as int,
      isSubscribed: jsonSerialization['isSubscribed'] as bool,
      hasPlayedResult: jsonSerialization['hasPlayedResult'] as bool,
      locationTitle: jsonSerialization['locationTitle'] as String,
      locationSubtitle: jsonSerialization['locationSubtitle'] as String?,
      lastMessageAt: jsonSerialization['lastMessageAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastMessageAt'],
            ),
      lastMessagePreview: jsonSerialization['lastMessagePreview'] as String?,
      lastMessageType: jsonSerialization['lastMessageType'] == null
          ? null
          : _i2.MatchChatMessageType.fromJson(
              (jsonSerialization['lastMessageType'] as String),
            ),
      lastMessageSenderDisplayName:
          jsonSerialization['lastMessageSenderDisplayName'] as String?,
    );
  }

  int scheduledMatchId;

  int chatHistoryId;

  String matchTitle;

  DateTime attemptedAt;

  int unreadMessagesCount;

  bool isSubscribed;

  bool hasPlayedResult;

  String locationTitle;

  String? locationSubtitle;

  DateTime? lastMessageAt;

  String? lastMessagePreview;

  _i2.MatchChatMessageType? lastMessageType;

  String? lastMessageSenderDisplayName;

  /// Returns a shallow copy of this [MatchChatActivityChatItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  MatchChatActivityChatItem copyWith({
    int? scheduledMatchId,
    int? chatHistoryId,
    String? matchTitle,
    DateTime? attemptedAt,
    int? unreadMessagesCount,
    bool? isSubscribed,
    bool? hasPlayedResult,
    String? locationTitle,
    String? locationSubtitle,
    DateTime? lastMessageAt,
    String? lastMessagePreview,
    _i2.MatchChatMessageType? lastMessageType,
    String? lastMessageSenderDisplayName,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'MatchChatActivityChatItem',
      'scheduledMatchId': scheduledMatchId,
      'chatHistoryId': chatHistoryId,
      'matchTitle': matchTitle,
      'attemptedAt': attemptedAt.toJson(),
      'unreadMessagesCount': unreadMessagesCount,
      'isSubscribed': isSubscribed,
      'hasPlayedResult': hasPlayedResult,
      'locationTitle': locationTitle,
      if (locationSubtitle != null) 'locationSubtitle': locationSubtitle,
      if (lastMessageAt != null) 'lastMessageAt': lastMessageAt?.toJson(),
      if (lastMessagePreview != null) 'lastMessagePreview': lastMessagePreview,
      if (lastMessageType != null) 'lastMessageType': lastMessageType?.toJson(),
      if (lastMessageSenderDisplayName != null)
        'lastMessageSenderDisplayName': lastMessageSenderDisplayName,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'MatchChatActivityChatItem',
      'scheduledMatchId': scheduledMatchId,
      'chatHistoryId': chatHistoryId,
      'matchTitle': matchTitle,
      'attemptedAt': attemptedAt.toJson(),
      'unreadMessagesCount': unreadMessagesCount,
      'isSubscribed': isSubscribed,
      'hasPlayedResult': hasPlayedResult,
      'locationTitle': locationTitle,
      if (locationSubtitle != null) 'locationSubtitle': locationSubtitle,
      if (lastMessageAt != null) 'lastMessageAt': lastMessageAt?.toJson(),
      if (lastMessagePreview != null) 'lastMessagePreview': lastMessagePreview,
      if (lastMessageType != null) 'lastMessageType': lastMessageType?.toJson(),
      if (lastMessageSenderDisplayName != null)
        'lastMessageSenderDisplayName': lastMessageSenderDisplayName,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MatchChatActivityChatItemImpl extends MatchChatActivityChatItem {
  _MatchChatActivityChatItemImpl({
    required int scheduledMatchId,
    required int chatHistoryId,
    required String matchTitle,
    required DateTime attemptedAt,
    required int unreadMessagesCount,
    required bool isSubscribed,
    required bool hasPlayedResult,
    required String locationTitle,
    String? locationSubtitle,
    DateTime? lastMessageAt,
    String? lastMessagePreview,
    _i2.MatchChatMessageType? lastMessageType,
    String? lastMessageSenderDisplayName,
  }) : super._(
         scheduledMatchId: scheduledMatchId,
         chatHistoryId: chatHistoryId,
         matchTitle: matchTitle,
         attemptedAt: attemptedAt,
         unreadMessagesCount: unreadMessagesCount,
         isSubscribed: isSubscribed,
         hasPlayedResult: hasPlayedResult,
         locationTitle: locationTitle,
         locationSubtitle: locationSubtitle,
         lastMessageAt: lastMessageAt,
         lastMessagePreview: lastMessagePreview,
         lastMessageType: lastMessageType,
         lastMessageSenderDisplayName: lastMessageSenderDisplayName,
       );

  /// Returns a shallow copy of this [MatchChatActivityChatItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  MatchChatActivityChatItem copyWith({
    int? scheduledMatchId,
    int? chatHistoryId,
    String? matchTitle,
    DateTime? attemptedAt,
    int? unreadMessagesCount,
    bool? isSubscribed,
    bool? hasPlayedResult,
    String? locationTitle,
    Object? locationSubtitle = _Undefined,
    Object? lastMessageAt = _Undefined,
    Object? lastMessagePreview = _Undefined,
    Object? lastMessageType = _Undefined,
    Object? lastMessageSenderDisplayName = _Undefined,
  }) {
    return MatchChatActivityChatItem(
      scheduledMatchId: scheduledMatchId ?? this.scheduledMatchId,
      chatHistoryId: chatHistoryId ?? this.chatHistoryId,
      matchTitle: matchTitle ?? this.matchTitle,
      attemptedAt: attemptedAt ?? this.attemptedAt,
      unreadMessagesCount: unreadMessagesCount ?? this.unreadMessagesCount,
      isSubscribed: isSubscribed ?? this.isSubscribed,
      hasPlayedResult: hasPlayedResult ?? this.hasPlayedResult,
      locationTitle: locationTitle ?? this.locationTitle,
      locationSubtitle: locationSubtitle is String?
          ? locationSubtitle
          : this.locationSubtitle,
      lastMessageAt: lastMessageAt is DateTime?
          ? lastMessageAt
          : this.lastMessageAt,
      lastMessagePreview: lastMessagePreview is String?
          ? lastMessagePreview
          : this.lastMessagePreview,
      lastMessageType: lastMessageType is _i2.MatchChatMessageType?
          ? lastMessageType
          : this.lastMessageType,
      lastMessageSenderDisplayName: lastMessageSenderDisplayName is String?
          ? lastMessageSenderDisplayName
          : this.lastMessageSenderDisplayName,
    );
  }
}
