import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class CreateAnonymousPlayer extends Endpoint {
  static const _minNameLength = 3;
  static const _maxNameLength = 50;

  @override
  bool get requireLogin => true;

  Future<AnonymousPlayer> v1(
    Session session, {
    required String firstName,
    required String lastName,
  }) async {
    return guardRootHubEndpointErrors(
      () async {
        final normalizedFirstName = _normalizeNamePart(firstName);
        final normalizedLastName = _normalizeNamePart(lastName);
        _validateNamePart(namePart: normalizedFirstName, label: 'First name');
        _validateNamePart(namePart: normalizedLastName, label: 'Last name');

        final authenticatedPlayerData = await _getAuthenticatedPlayerData(
          session,
        );

        final existingAnonymousPlayer = await AnonymousPlayer.db.findFirstRow(
          session,
          where: (t) =>
              t.createdByPlayerId.equals(authenticatedPlayerData.id!) &
              t.firstName.equals(normalizedFirstName) &
              t.lastName.equals(normalizedLastName),
          orderBy: (t) => t.id,
          orderDescending: true,
        );

        if (existingAnonymousPlayer != null) {
          return existingAnonymousPlayer;
        }

        final anonymousPlayer = await AnonymousPlayer.db.insertRow(
          session,
          AnonymousPlayer(
            firstName: normalizedFirstName,
            lastName: normalizedLastName,
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

  void _validateNamePart({
    required String namePart,
    required String label,
  }) {
    if (namePart.isEmpty) {
      throw RootHubEndpointError.invalidRequest(
        title: 'Invalid anonymous player',
        description: '$label cannot be empty.',
      );
    }

    if (namePart.length < _minNameLength) {
      throw RootHubEndpointError.invalidRequest(
        title: 'Invalid anonymous player',
        description: '$label must have at least $_minNameLength characters.',
      );
    }

    if (namePart.length > _maxNameLength) {
      throw RootHubEndpointError.invalidRequest(
        title: 'Invalid anonymous player',
        description: '$label cannot exceed $_maxNameLength characters.',
      );
    }
  }

  String _normalizeNamePart(String value) {
    return value.trim().replaceAll(RegExp(r'\s+'), ' ');
  }
}
