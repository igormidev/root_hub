import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class GetMyAnonymousPlayers extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<List<AnonymousPlayer>> v1(Session session) async {
    return guardRootHubEndpointErrors(
      () async {
        final authenticatedPlayerData = await _getAuthenticatedPlayerData(
          session,
        );

        return AnonymousPlayer.db.find(
          session,
          where: (t) => t.createdByPlayerId.equals(authenticatedPlayerData.id!),
          orderBy: (t) => t.id,
          orderDescending: true,
        );
      },
      fallbackDescription:
          'Unable to load anonymous players right now. Please try again.',
    );
  }

  Future<PlayerData> _getAuthenticatedPlayerData(Session session) async {
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
