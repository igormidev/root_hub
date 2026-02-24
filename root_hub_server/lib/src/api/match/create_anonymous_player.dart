import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class CreateAnonymousPlayer extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<AnonymousPlayer> v1(
    Session session, {
    required String name,
  }) async {
    return guardRootHubEndpointErrors(
      () async {
        final normalizedName = _normalizeName(name);
        if (normalizedName.isEmpty) {
          throw RootHubEndpointError.invalidRequest(
            title: 'Invalid anonymous player',
            description: 'Anonymous player name cannot be empty.',
          );
        }

        if (normalizedName.length > 50) {
          throw RootHubEndpointError.invalidRequest(
            title: 'Invalid anonymous player',
            description: 'Anonymous player name cannot exceed 50 characters.',
          );
        }

        final authenticatedPlayerData = await _getAuthenticatedPlayerData(
          session,
        );

        final firstName = _extractFirstName(normalizedName);
        final lastName = _extractLastName(normalizedName);

        final existingAnonymousPlayer = await AnonymousPlayer.db.findFirstRow(
          session,
          where: (t) =>
              t.createdByPlayerId.equals(authenticatedPlayerData.id!) &
              t.firstName.equals(firstName) &
              t.lastName.equals(lastName),
          orderBy: (t) => t.id,
          orderDescending: true,
        );

        if (existingAnonymousPlayer != null) {
          return existingAnonymousPlayer;
        }

        final anonymousPlayer = await AnonymousPlayer.db.insertRow(
          session,
          AnonymousPlayer(
            firstName: firstName,
            lastName: lastName,
            createdByPlayerId: authenticatedPlayerData.id!,
          ),
        );

        await AnonymousPlayer.db.attachRow.createdByPlayer(
          session,
          anonymousPlayer,
          authenticatedPlayerData,
        );

        return anonymousPlayer;
      },
      fallbackDescription:
          'Unable to create an anonymous player right now. Please try again.',
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

  String _normalizeName(String rawName) {
    final collapsedSpaces = rawName.trim().replaceAll(RegExp(r'\s+'), ' ');
    return collapsedSpaces;
  }

  String _extractFirstName(String normalizedName) {
    final parts = normalizedName.split(' ');
    return parts.first;
  }

  String _extractLastName(String normalizedName) {
    final parts = normalizedName.split(' ');
    if (parts.length <= 1) {
      return '';
    }

    return parts.skip(1).join(' ');
  }
}
