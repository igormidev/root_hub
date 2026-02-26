import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class SyncPushNotificationToken extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<void> v1(
    Session session, {
    required String token,
    required PushNotificationPlatform platform,
  }) async {
    return guardRootHubEndpointErrors(
      () async {
        final normalizedToken = token.trim();
        if (normalizedToken.isEmpty) {
          throw RootHubEndpointError.invalidRequest(
            description: 'Push token cannot be empty.',
          );
        }

        if (normalizedToken.length > 4096) {
          throw RootHubEndpointError.invalidRequest(
            description: 'Push token is too long.',
          );
        }

        final playerData = await _findAuthenticatedPlayerData(session);
        final playerDataId = playerData.id!;
        final now = DateTime.now();

        final existingToken = await PlayerPushNotificationToken.db.findFirstRow(
          session,
          where: (t) => t.token.equals(normalizedToken),
        );

        if (existingToken == null) {
          final createdToken = await PlayerPushNotificationToken.db.insertRow(
            session,
            PlayerPushNotificationToken(
              token: normalizedToken,
              platform: platform,
              isActive: true,
              lastConfirmedAt: now,
              playerDataId: playerDataId,
            ),
          );

          await PlayerPushNotificationToken.db.attachRow.playerData(
            session,
            createdToken,
            playerData,
          );
          return;
        }

        if (existingToken.playerDataId != playerDataId) {
          await PlayerPushNotificationToken.db.attachRow.playerData(
            session,
            existingToken,
            playerData,
          );
          existingToken.playerDataId = playerDataId;
        }

        existingToken
          ..platform = platform
          ..isActive = true
          ..lastConfirmedAt = now;

        await PlayerPushNotificationToken.db.updateRow(
          session,
          existingToken,
        );
      },
      fallbackDescription:
          'Unable to sync push notifications for this device right now.',
    );
  }

  Future<PlayerData> _findAuthenticatedPlayerData(Session session) async {
    final userIdentifier = session.authenticated!.userIdentifier;
    final authUserId = UuidValue.fromString(userIdentifier);
    final playerData = await PlayerData.db.findFirstRow(
      session,
      where: (t) => t.authUserId.equals(authUserId),
    );
    if (playerData == null) {
      throw RootHubEndpointError.notFound(
        title: 'Player profile missing',
        description: 'Player profile not found for authenticated user.',
      );
    }

    return playerData;
  }
}
