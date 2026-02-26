import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:root_hub_server/src/notifications/push_notification_dispatch_service.dart';
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

    final dispatchStats =
        await PushNotificationDispatchService.sendToPlayerDataIds(
          session,
          playerDataIds: recipientPlayerIds,
          title: _buildTitle(matchTitle),
          body: _buildBody(
            senderDisplayName: senderPlayerData.displayName,
            message: message,
          ),
          data: <String, String>{
            'type': 'match_chat_message',
            'scheduledMatchId': '$scheduledMatchId',
            'chatHistoryId': '$chatHistoryId',
          },
        );

    if (dispatchStats.attemptedCount == 0) {
      return;
    }

    session.log(
      '[PushNotifications] Match chat dispatch completed. '
      'scheduledMatchId=$scheduledMatchId '
      'attempted=${dispatchStats.attemptedCount} '
      'success=${dispatchStats.successCount} '
      'failed=${dispatchStats.failureCount} '
      'invalidated=${dispatchStats.invalidatedTokenCount}',
      level: LogLevel.info,
    );
  }

  static String _buildTitle(String matchTitle) {
    final normalizedTitle = matchTitle.trim();
    if (normalizedTitle.isEmpty) {
      return 'New message in match chat';
    }

    return 'New message in $normalizedTitle';
  }

  static String _buildBody({
    required String senderDisplayName,
    required MatchChatMessage message,
  }) {
    final normalizedSender = senderDisplayName.trim().isEmpty
        ? 'A player'
        : senderDisplayName.trim();
    final normalizedContent = message.content.trim();

    if (normalizedContent.isNotEmpty) {
      final preview = normalizedContent.length > _maxBodyLength
          ? '${normalizedContent.substring(0, _maxBodyLength - 1)}…'
          : normalizedContent;
      return '$normalizedSender: $preview';
    }

    if (message.imageUrl != null) {
      return '$normalizedSender sent an image';
    }

    return '$normalizedSender sent a new message';
  }
}
