import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:root_hub_server/src/notifications/fcm/fcm_access_token_provider.dart';
import 'package:root_hub_server/src/notifications/fcm/fcm_credentials.dart';
import 'package:root_hub_server/src/notifications/fcm/fcm_http_v1_client.dart';
import 'package:serverpod/serverpod.dart';

class PushNotificationDispatchService {
  const PushNotificationDispatchService._();

  static const _fcmClient = FcmHttpV1Client();

  static Future<PushNotificationDispatchStats> sendToPlayerDataIds(
    Session session, {
    required Set<int> playerDataIds,
    required String title,
    required String body,
    required Map<String, String> data,
  }) async {
    if (playerDataIds.isEmpty) {
      return const PushNotificationDispatchStats();
    }

    final activeTokens = await PlayerPushNotificationToken.db.find(
      session,
      where: (t) =>
          t.playerDataId.inSet(playerDataIds) & t.isActive.equals(true),
    );
    if (activeTokens.isEmpty) {
      return const PushNotificationDispatchStats();
    }

    final deduplicatedTokensByValue = <String, PlayerPushNotificationToken>{};
    for (final tokenRow in activeTokens) {
      if (tokenRow.token.trim().isEmpty) {
        continue;
      }
      deduplicatedTokensByValue[tokenRow.token] = tokenRow;
    }
    final deduplicatedTokens = deduplicatedTokensByValue.values.toList();
    if (deduplicatedTokens.isEmpty) {
      return const PushNotificationDispatchStats();
    }

    FcmCredentials credentials;
    try {
      final resolvedCredentials = FcmCredentials.tryFromSession(session);
      if (resolvedCredentials == null) {
        session.log(
          '[PushNotifications] Skipping push dispatch because '
          'firebaseServiceAccountJson is missing in passwords.yaml.',
          level: LogLevel.warning,
        );
        return const PushNotificationDispatchStats();
      }
      credentials = resolvedCredentials;
    } catch (error, stackTrace) {
      session.log(
        '[PushNotifications] Invalid Firebase credentials. '
        'Unable to dispatch notifications.',
        level: LogLevel.error,
        exception: error,
        stackTrace: stackTrace,
      );
      return const PushNotificationDispatchStats();
    }

    final invalidTokenIds = <int>{};
    var successCount = 0;
    var failureCount = 0;
    String accessToken;
    try {
      accessToken = await FcmAccessTokenProvider.getAccessToken(credentials);
    } catch (error, stackTrace) {
      session.log(
        '[PushNotifications] Failed to fetch FCM access token.',
        level: LogLevel.error,
        exception: error,
        stackTrace: stackTrace,
      );
      return const PushNotificationDispatchStats();
    }

    final sendOperations = deduplicatedTokens.map((tokenRow) async {
      try {
        final sendResult = await _fcmClient.sendToToken(
          credentials: credentials,
          token: tokenRow.token,
          title: title,
          body: body,
          data: data,
          accessToken: accessToken,
        );

        if (sendResult.success) {
          successCount += 1;
          return;
        }

        failureCount += 1;
        final tokenRowId = tokenRow.id;
        if (sendResult.indicatesInvalidToken && tokenRowId != null) {
          invalidTokenIds.add(tokenRowId);
        }

        session.log(
          '[PushNotifications] FCM send failed. '
          'httpStatus=${sendResult.httpStatusCode} '
          'errorStatus=${sendResult.errorStatus} '
          'errorCode=${sendResult.errorCode}',
          level: LogLevel.warning,
        );
      } catch (error, stackTrace) {
        failureCount += 1;
        session.log(
          '[PushNotifications] Unexpected send failure for token row '
          'id=${tokenRow.id}.',
          level: LogLevel.error,
          exception: error,
          stackTrace: stackTrace,
        );
      }
    });

    await Future.wait(sendOperations);

    if (invalidTokenIds.isNotEmpty) {
      await PlayerPushNotificationToken.db.updateWhere(
        session,
        columnValues: (t) => [
          t.isActive(false),
        ],
        where: (t) => t.id.inSet(invalidTokenIds),
      );
    }

    return PushNotificationDispatchStats(
      attemptedCount: deduplicatedTokens.length,
      successCount: successCount,
      failureCount: failureCount,
      invalidatedTokenCount: invalidTokenIds.length,
    );
  }
}

class PushNotificationDispatchStats {
  const PushNotificationDispatchStats({
    this.attemptedCount = 0,
    this.successCount = 0,
    this.failureCount = 0,
    this.invalidatedTokenCount = 0,
  });

  final int attemptedCount;
  final int successCount;
  final int failureCount;
  final int invalidatedTokenCount;
}
