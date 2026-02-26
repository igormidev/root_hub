import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class DeactivatePushNotificationToken extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<void> v1(
    Session session, {
    required String token,
  }) async {
    return guardRootHubEndpointErrors(
      () async {
        final normalizedToken = token.trim();
        if (normalizedToken.isEmpty) {
          throw RootHubEndpointError.invalidRequest(
            description: 'Push token cannot be empty.',
          );
        }

        final playerData = await _findAuthenticatedPlayerData(session);
        final playerDataId = playerData.id!;

        final existingToken = await PlayerPushNotificationToken.db.findFirstRow(
          session,
          where: (t) =>
              t.token.equals(normalizedToken) &
              t.playerDataId.equals(playerDataId),
        );

        if (existingToken == null) {
          return;
        }

        if (!existingToken.isActive) {
          return;
        }

        existingToken
          ..isActive = false
          ..lastConfirmedAt = DateTime.now();

        await PlayerPushNotificationToken.db.updateRow(
          session,
          existingToken,
        );
      },
      fallbackDescription:
          'Unable to disable push notifications for this device right now.',
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
