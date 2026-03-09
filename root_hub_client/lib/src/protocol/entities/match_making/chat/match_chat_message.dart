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
import '../../../entities/match_making/chat/match_chat_message_ui_type.dart'
    as _i2;
import '../../../entities/match_making/chat/match_chat_message_type.dart'
    as _i3;
import '../../../entities/match_making/chat/match_chat_history.dart' as _i4;
import '../../../entities/core/player_data.dart' as _i5;
import 'package:root_hub_client/src/protocol/protocol.dart' as _i6;

abstract class MatchChatMessage implements _i1.SerializableModel {
  MatchChatMessage._({
    this.id,
    required this.sentAt,
    required this.content,
    this.imageUrl,
    this.audioUrl,
    this.audioDurationMilliseconds,
    this.replyToMessageId,
    this.replyToMessagePreview,
    this.replyToMessageUiType,
    this.replyToMessageSenderPlayerDataId,
    this.replyToAudioDurationMilliseconds,
    this.reactionsJson,
    this.blurhash,
    this.imageWidth,
    this.imageHeight,
    required this.messageType,
    required this.matchChatHistoryId,
    this.matchChatHistory,
    required this.playerDataId,
    this.sender,
  });

  factory MatchChatMessage({
    int? id,
    required DateTime sentAt,
    required String content,
    String? imageUrl,
    String? audioUrl,
    int? audioDurationMilliseconds,
    int? replyToMessageId,
    String? replyToMessagePreview,
    _i2.MatchChatMessageUiType? replyToMessageUiType,
    int? replyToMessageSenderPlayerDataId,
    int? replyToAudioDurationMilliseconds,
    String? reactionsJson,
    String? blurhash,
    int? imageWidth,
    int? imageHeight,
    required _i3.MatchChatMessageType messageType,
    required int matchChatHistoryId,
    _i4.MatchChatHistory? matchChatHistory,
    required int playerDataId,
    _i5.PlayerData? sender,
  }) = _MatchChatMessageImpl;

  factory MatchChatMessage.fromJson(Map<String, dynamic> jsonSerialization) {
    return MatchChatMessage(
      id: jsonSerialization['id'] as int?,
      sentAt: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['sentAt']),
      content: jsonSerialization['content'] as String,
      imageUrl: jsonSerialization['imageUrl'] as String?,
      audioUrl: jsonSerialization['audioUrl'] as String?,
      audioDurationMilliseconds:
          jsonSerialization['audioDurationMilliseconds'] as int?,
      replyToMessageId: jsonSerialization['replyToMessageId'] as int?,
      replyToMessagePreview:
          jsonSerialization['replyToMessagePreview'] as String?,
      replyToMessageUiType: jsonSerialization['replyToMessageUiType'] == null
          ? null
          : _i2.MatchChatMessageUiType.fromJson(
              (jsonSerialization['replyToMessageUiType'] as String),
            ),
      replyToMessageSenderPlayerDataId:
          jsonSerialization['replyToMessageSenderPlayerDataId'] as int?,
      replyToAudioDurationMilliseconds:
          jsonSerialization['replyToAudioDurationMilliseconds'] as int?,
      reactionsJson: jsonSerialization['reactionsJson'] as String?,
      blurhash: jsonSerialization['blurhash'] as String?,
      imageWidth: jsonSerialization['imageWidth'] as int?,
      imageHeight: jsonSerialization['imageHeight'] as int?,
      messageType: _i3.MatchChatMessageType.fromJson(
        (jsonSerialization['messageType'] as String),
      ),
      matchChatHistoryId: jsonSerialization['matchChatHistoryId'] as int,
      matchChatHistory: jsonSerialization['matchChatHistory'] == null
          ? null
          : _i6.Protocol().deserialize<_i4.MatchChatHistory>(
              jsonSerialization['matchChatHistory'],
            ),
      playerDataId: jsonSerialization['playerDataId'] as int,
      sender: jsonSerialization['sender'] == null
          ? null
          : _i6.Protocol().deserialize<_i5.PlayerData>(
              jsonSerialization['sender'],
            ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  DateTime sentAt;

  String content;

  String? imageUrl;

  String? audioUrl;

  int? audioDurationMilliseconds;

  int? replyToMessageId;

  String? replyToMessagePreview;

  _i2.MatchChatMessageUiType? replyToMessageUiType;

  int? replyToMessageSenderPlayerDataId;

  int? replyToAudioDurationMilliseconds;

  String? reactionsJson;

  String? blurhash;

  int? imageWidth;

  int? imageHeight;

  _i3.MatchChatMessageType messageType;

  int matchChatHistoryId;

  _i4.MatchChatHistory? matchChatHistory;

  int playerDataId;

  _i5.PlayerData? sender;

  /// Returns a shallow copy of this [MatchChatMessage]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  MatchChatMessage copyWith({
    int? id,
    DateTime? sentAt,
    String? content,
    String? imageUrl,
    String? audioUrl,
    int? audioDurationMilliseconds,
    int? replyToMessageId,
    String? replyToMessagePreview,
    _i2.MatchChatMessageUiType? replyToMessageUiType,
    int? replyToMessageSenderPlayerDataId,
    int? replyToAudioDurationMilliseconds,
    String? reactionsJson,
    String? blurhash,
    int? imageWidth,
    int? imageHeight,
    _i3.MatchChatMessageType? messageType,
    int? matchChatHistoryId,
    _i4.MatchChatHistory? matchChatHistory,
    int? playerDataId,
    _i5.PlayerData? sender,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'MatchChatMessage',
      if (id != null) 'id': id,
      'sentAt': sentAt.toJson(),
      'content': content,
      if (imageUrl != null) 'imageUrl': imageUrl,
      if (audioUrl != null) 'audioUrl': audioUrl,
      if (audioDurationMilliseconds != null)
        'audioDurationMilliseconds': audioDurationMilliseconds,
      if (replyToMessageId != null) 'replyToMessageId': replyToMessageId,
      if (replyToMessagePreview != null)
        'replyToMessagePreview': replyToMessagePreview,
      if (replyToMessageUiType != null)
        'replyToMessageUiType': replyToMessageUiType?.toJson(),
      if (replyToMessageSenderPlayerDataId != null)
        'replyToMessageSenderPlayerDataId': replyToMessageSenderPlayerDataId,
      if (replyToAudioDurationMilliseconds != null)
        'replyToAudioDurationMilliseconds': replyToAudioDurationMilliseconds,
      if (reactionsJson != null) 'reactionsJson': reactionsJson,
      if (blurhash != null) 'blurhash': blurhash,
      if (imageWidth != null) 'imageWidth': imageWidth,
      if (imageHeight != null) 'imageHeight': imageHeight,
      'messageType': messageType.toJson(),
      'matchChatHistoryId': matchChatHistoryId,
      if (matchChatHistory != null)
        'matchChatHistory': matchChatHistory?.toJson(),
      'playerDataId': playerDataId,
      if (sender != null) 'sender': sender?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MatchChatMessageImpl extends MatchChatMessage {
  _MatchChatMessageImpl({
    int? id,
    required DateTime sentAt,
    required String content,
    String? imageUrl,
    String? audioUrl,
    int? audioDurationMilliseconds,
    int? replyToMessageId,
    String? replyToMessagePreview,
    _i2.MatchChatMessageUiType? replyToMessageUiType,
    int? replyToMessageSenderPlayerDataId,
    int? replyToAudioDurationMilliseconds,
    String? reactionsJson,
    String? blurhash,
    int? imageWidth,
    int? imageHeight,
    required _i3.MatchChatMessageType messageType,
    required int matchChatHistoryId,
    _i4.MatchChatHistory? matchChatHistory,
    required int playerDataId,
    _i5.PlayerData? sender,
  }) : super._(
         id: id,
         sentAt: sentAt,
         content: content,
         imageUrl: imageUrl,
         audioUrl: audioUrl,
         audioDurationMilliseconds: audioDurationMilliseconds,
         replyToMessageId: replyToMessageId,
         replyToMessagePreview: replyToMessagePreview,
         replyToMessageUiType: replyToMessageUiType,
         replyToMessageSenderPlayerDataId: replyToMessageSenderPlayerDataId,
         replyToAudioDurationMilliseconds: replyToAudioDurationMilliseconds,
         reactionsJson: reactionsJson,
         blurhash: blurhash,
         imageWidth: imageWidth,
         imageHeight: imageHeight,
         messageType: messageType,
         matchChatHistoryId: matchChatHistoryId,
         matchChatHistory: matchChatHistory,
         playerDataId: playerDataId,
         sender: sender,
       );

  /// Returns a shallow copy of this [MatchChatMessage]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  MatchChatMessage copyWith({
    Object? id = _Undefined,
    DateTime? sentAt,
    String? content,
    Object? imageUrl = _Undefined,
    Object? audioUrl = _Undefined,
    Object? audioDurationMilliseconds = _Undefined,
    Object? replyToMessageId = _Undefined,
    Object? replyToMessagePreview = _Undefined,
    Object? replyToMessageUiType = _Undefined,
    Object? replyToMessageSenderPlayerDataId = _Undefined,
    Object? replyToAudioDurationMilliseconds = _Undefined,
    Object? reactionsJson = _Undefined,
    Object? blurhash = _Undefined,
    Object? imageWidth = _Undefined,
    Object? imageHeight = _Undefined,
    _i3.MatchChatMessageType? messageType,
    int? matchChatHistoryId,
    Object? matchChatHistory = _Undefined,
    int? playerDataId,
    Object? sender = _Undefined,
  }) {
    return MatchChatMessage(
      id: id is int? ? id : this.id,
      sentAt: sentAt ?? this.sentAt,
      content: content ?? this.content,
      imageUrl: imageUrl is String? ? imageUrl : this.imageUrl,
      audioUrl: audioUrl is String? ? audioUrl : this.audioUrl,
      audioDurationMilliseconds: audioDurationMilliseconds is int?
          ? audioDurationMilliseconds
          : this.audioDurationMilliseconds,
      replyToMessageId: replyToMessageId is int?
          ? replyToMessageId
          : this.replyToMessageId,
      replyToMessagePreview: replyToMessagePreview is String?
          ? replyToMessagePreview
          : this.replyToMessagePreview,
      replyToMessageUiType: replyToMessageUiType is _i2.MatchChatMessageUiType?
          ? replyToMessageUiType
          : this.replyToMessageUiType,
      replyToMessageSenderPlayerDataId: replyToMessageSenderPlayerDataId is int?
          ? replyToMessageSenderPlayerDataId
          : this.replyToMessageSenderPlayerDataId,
      replyToAudioDurationMilliseconds: replyToAudioDurationMilliseconds is int?
          ? replyToAudioDurationMilliseconds
          : this.replyToAudioDurationMilliseconds,
      reactionsJson: reactionsJson is String?
          ? reactionsJson
          : this.reactionsJson,
      blurhash: blurhash is String? ? blurhash : this.blurhash,
      imageWidth: imageWidth is int? ? imageWidth : this.imageWidth,
      imageHeight: imageHeight is int? ? imageHeight : this.imageHeight,
      messageType: messageType ?? this.messageType,
      matchChatHistoryId: matchChatHistoryId ?? this.matchChatHistoryId,
      matchChatHistory: matchChatHistory is _i4.MatchChatHistory?
          ? matchChatHistory
          : this.matchChatHistory?.copyWith(),
      playerDataId: playerDataId ?? this.playerDataId,
      sender: sender is _i5.PlayerData? ? sender : this.sender?.copyWith(),
    );
  }
}
