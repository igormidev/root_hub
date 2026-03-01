import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:root_hub_server/src/core/server_translations.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class GetMyAnonymousPlayers extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<List<AnonymousPlayer>> v1(
    Session session, {
    required ServerSupportedTranslation language,
  }) async {
    final t = ServerTranslations.of(language);

    return guardRootHubEndpointErrors(
      () async {
        final authenticatedPlayerData = await _getAuthenticatedPlayerData(
          session,
          language: language,
        );

        return AnonymousPlayer.db.find(
          session,
          where: (t) => t.createdByPlayerId.equals(authenticatedPlayerData.id!),
          orderBy: (t) => t.id,
          orderDescending: true,
        );
      },
      language: language,
      fallbackDescription: t.fallback.unableToLoadAnonymousPlayers,
    );
  }

  Future<PlayerData> _getAuthenticatedPlayerData(
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
