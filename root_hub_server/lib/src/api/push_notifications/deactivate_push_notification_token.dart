import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:root_hub_server/src/core/server_translations.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class DeactivatePushNotificationToken extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<void> v1(
    Session session, {
    required ServerSupportedTranslation language,
    required String token,
  }) async {
    final t = ServerTranslations.of(language);

    return guardRootHubEndpointErrors(
      () async {
        final normalizedToken = token.trim();
        if (normalizedToken.isEmpty) {
          throw RootHubEndpointError.invalidRequest(
            language: language,
            description: t.errors.pushTokenCannotBeEmpty,
          );
        }

        final playerData = await _findAuthenticatedPlayerData(
          session,
          language: language,
        );
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
      language: language,
      fallbackDescription: t.fallback.unableToDisablePushNotifications,
    );
  }

  Future<PlayerData> _findAuthenticatedPlayerData(
    Session session, {
    required ServerSupportedTranslation language,
  }) async {
    final t = ServerTranslations.of(language);

    final userIdentifier = session.authenticated!.userIdentifier;
    final authUserId = UuidValue.fromString(userIdentifier);
    final playerData = await PlayerData.db.findFirstRow(
      session,
      where: (t) => t.authUserId.equals(authUserId),
    );
    if (playerData == null) {
      throw RootHubEndpointError.notFound(
        language: language,
        title: t.errors.playerProfileMissingTitle,
        description: t.errors.playerProfileNotFoundForAuthenticatedUser,
      );
    }

    return playerData;
  }
}
