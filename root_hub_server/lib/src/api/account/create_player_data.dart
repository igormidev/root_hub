import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart';

class CreatePlayerData extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<PlayerData> v1(
    Session session, {
    required String displayName,
    required Faction favoriteFaction,
    required GeoLocation currentLocation,
  }) async {
    return guardRootHubEndpointErrors(
      () async {
        final normalizedDisplayName = displayName.trim();
        if (normalizedDisplayName.isEmpty) {
          throw RootHubEndpointError.invalidRequest(
            description: 'Display name cannot be empty.',
          );
        }
        if (currentLocation.ratio <= 0) {
          throw RootHubEndpointError.invalidRequest(
            description: 'Location ratio must be greater than zero.',
          );
        }

        final authUserId = session.authenticated!.authUserId;
        final authUser = await AuthUser.db.findById(session, authUserId);
        if (authUser == null) {
          throw RootHubEndpointError.notFound(
            title: 'Authenticated user missing',
            description: 'Authenticated user was not found.',
          );
        }

        final existingAccount = await _findAccountByAuthUserId(
          session,
          authUserId,
        );
        if (existingAccount != null) {
          throw RootHubEndpointError.invalidRequest(
            title: 'Player profile already exists',
            description: 'Authenticated user already has a player profile.',
          );
        }

        try {
          final createdAccount = await session.db.transaction((
            transaction,
          ) async {
            final insertedLocation = await GeoLocation.db.insertRow(
              session,
              GeoLocation(
                x: currentLocation.x,
                y: currentLocation.y,
                ratio: currentLocation.ratio,
              ),
              transaction: transaction,
            );

            final insertedAccount = await PlayerData.db.insertRow(
              session,
              PlayerData(
                authUserId: authUserId,
                displayName: normalizedDisplayName,
                favoriteFaction: favoriteFaction,
              ),
              transaction: transaction,
            );

            await PlayerData.db.attachRow.authUser(
              session,
              insertedAccount,
              authUser,
              transaction: transaction,
            );

            await PlayerData.db.attachRow.currentLocation(
              session,
              insertedAccount,
              insertedLocation,
              transaction: transaction,
            );

            return insertedAccount;
          });

          return await PlayerData.db.findById(
                session,
                createdAccount.id!,
                include: PlayerData.include(
                  authUser: AuthUser.include(),
                  currentLocation: GeoLocation.include(),
                ),
              ) ??
              createdAccount;
        } on DatabaseException {
          final accountCreatedConcurrently = await _findAccountByAuthUserId(
            session,
            authUserId,
          );
          if (accountCreatedConcurrently != null) {
            return accountCreatedConcurrently;
          }
          rethrow;
        }
      },
      fallbackDescription:
          'Unable to create account right now. Please try again.',
    );
  }

  Future<PlayerData?> _findAccountByAuthUserId(
    Session session,
    UuidValue authUserId,
  ) {
    return PlayerData.db.findFirstRow(
      session,
      where: (t) => t.authUserId.equals(authUserId),
      include: PlayerData.include(
        authUser: AuthUser.include(),
        currentLocation: GeoLocation.include(),
      ),
    );
  }
}
