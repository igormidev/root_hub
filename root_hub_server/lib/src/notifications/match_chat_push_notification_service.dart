import 'package:root_hub_server/src/core/server_translations.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:root_hub_server/src/notifications/push_notification_dispatch_service.dart';
import 'package:root_hub_server/src/notifications/push_notification_recipient_language_resolver.dart';
import 'package:serverpod/serverpod.dart';

class MatchChatPushNotificationService {
  const MatchChatPushNotificationService._();

  static const _maxBodyLength = 140;

  static Future<void> notifySubscribedPlayersForNewMessage(
    Session session, {
    required int scheduledMatchId,
    required int chatHistoryId,
    required MatchChatMessage message,
    required PlayerData senderPlayerData,
    required String matchTitle,
  }) async {
    final senderPlayerDataId = senderPlayerData.id;
    if (senderPlayerDataId == null) {
      return;
    }

    final subscriptions = await MatchSubscription.db.find(
      session,
      where: (t) =>
          t.matchSchedulePairingAttemptId.equals(scheduledMatchId) &
          t.playerDataId.notEquals(senderPlayerDataId),
    );
    if (subscriptions.isEmpty) {
      return;
    }

    final recipientPlayerIds = subscriptions
        .map((entry) => entry.playerDataId)
        .toSet();
    if (recipientPlayerIds.isEmpty) {
      return;
    }

    final notificationData = <String, String>{
      'type': 'match_chat_message',
      'scheduledMatchId': '$scheduledMatchId',
      'chatHistoryId': '$chatHistoryId',
    };
    final messageId = message.id;
    if (messageId != null) {
      notificationData['messageId'] = '$messageId';
    }

    final recipientsByTranslation =
        await PushNotificationRecipientLanguageResolver.groupPlayerDataIds(
          session,
          playerDataIds: recipientPlayerIds,
        );
    if (recipientsByTranslation.isEmpty) {
      return;
    }

    var attemptedCount = 0;
    var successCount = 0;
    var failureCount = 0;
    var invalidatedTokenCount = 0;

    for (final entry in recipientsByTranslation.entries) {
      final translation = entry.key;
      final translatedRecipients = entry.value;
      if (translatedRecipients.isEmpty) {
        continue;
      }

      final dispatchStats =
          await PushNotificationDispatchService.sendToPlayerDataIds(
            session,
            playerDataIds: translatedRecipients,
            title: _buildTitle(
              language: translation,
              matchTitle: matchTitle,
            ),
            body: _buildBody(
              language: translation,
              senderDisplayName: senderPlayerData.displayName,
              message: message,
            ),
            data: notificationData,
          );

      attemptedCount += dispatchStats.attemptedCount;
      successCount += dispatchStats.successCount;
      failureCount += dispatchStats.failureCount;
      invalidatedTokenCount += dispatchStats.invalidatedTokenCount;
    }

    if (attemptedCount == 0) {
      return;
    }

    session.log(
      '[PushNotifications] Match chat dispatch completed. '
      'scheduledMatchId=$scheduledMatchId '
      'attempted=$attemptedCount '
      'success=$successCount '
      'failed=$failureCount '
      'invalidated=$invalidatedTokenCount',
      level: LogLevel.info,
    );
  }

  static String _buildTitle({
    required ServerSupportedTranslation language,
    required String matchTitle,
  }) {
    final t = ServerTranslations.of(language);
    final normalizedTitle = matchTitle.trim();
    if (normalizedTitle.isEmpty) {
      return t.pushNotifications.matchChat.newMessageInMatchChatTitle;
    }

    return t.pushNotifications.matchChat.newMessageInMatchTitle(
      matchTitle: normalizedTitle,
    );
  }

  static String _buildBody({
    required ServerSupportedTranslation language,
    required String senderDisplayName,
    required MatchChatMessage message,
  }) {
    final t = ServerTranslations.of(language);
    final normalizedSender = senderDisplayName.trim().isEmpty
        ? t.pushNotifications.common.genericSender
        : senderDisplayName.trim();
    final normalizedContent = message.content.trim();

    if (normalizedContent.isNotEmpty) {
      final preview = normalizedContent.length > _maxBodyLength
          ? '${normalizedContent.substring(0, _maxBodyLength - 1)}…'
          : normalizedContent;
      return t.pushNotifications.matchChat.senderMessagePreview(
        senderDisplayName: normalizedSender,
        messagePreview: preview,
      );
    }

    if (message.imageUrl != null) {
      return t.pushNotifications.matchChat.senderSentImage(
        senderDisplayName: normalizedSender,
      );
    }

    return t.pushNotifications.matchChat.senderSentMessage(
      senderDisplayName: normalizedSender,
    );
  }
}
