import 'dart:convert';

import 'package:root_hub_server/src/generated/protocol.dart';

class MatchChatMessagePresentation {
  const MatchChatMessagePresentation._();

  static MatchChatMessageUiType resolveUiType(MatchChatMessage message) {
    if (message.audioUrl?.trim().isNotEmpty == true ||
        message.messageType == MatchChatMessageType.userVoiceMessage) {
      return MatchChatMessageUiType.voice;
    }

    if (message.imageUrl?.trim().isNotEmpty == true) {
      return MatchChatMessageUiType.image;
    }

    if (message.messageType == MatchChatMessageType.systemJoin ||
        message.messageType == MatchChatMessageType.systemLeave) {
      return MatchChatMessageUiType.system;
    }

    return MatchChatMessageUiType.text;
  }

  static String resolveReplyPreview(MatchChatMessage message) {
    return switch (resolveUiType(message)) {
      MatchChatMessageUiType.image => message.imageUrl?.trim() ?? '',
      MatchChatMessageUiType.voice => message.audioUrl?.trim() ?? '',
      MatchChatMessageUiType.system || MatchChatMessageUiType.text =>
        message.content.trim(),
    };
  }

  static Map<String, String> decodeReactionsJson(String? reactionsJson) {
    final normalizedJson = reactionsJson?.trim();
    if (normalizedJson == null || normalizedJson.isEmpty) {
      return <String, String>{};
    }

    try {
      final decoded = jsonDecode(normalizedJson);
      if (decoded is! Map<String, dynamic>) {
        return <String, String>{};
      }

      return Map<String, String>.fromEntries(
        decoded.entries.where((entry) {
          final emoji = entry.value?.toString().trim();
          return entry.key.trim().isNotEmpty && emoji != null && emoji.isNotEmpty;
        }).map(
          (entry) => MapEntry(
            entry.key.trim(),
            entry.value.toString().trim(),
          ),
        ),
      );
    } catch (_) {
      return <String, String>{};
    }
  }

  static String? encodeReactionsJson(Map<String, String> reactionsByPlayerId) {
    if (reactionsByPlayerId.isEmpty) {
      return null;
    }

    return jsonEncode(reactionsByPlayerId);
  }
}
