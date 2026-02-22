import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart';

class UpdatePlayerData extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<PlayerData> v1(
    Session session, {
    String? displayName,
    Faction? favoriteFaction,
    GeoLocation? currentLocation,
  }) async {
    return guardRootHubEndpointErrors(
      () async {
        final normalizedDisplayName = displayName?.trim();
        if (displayName != null && normalizedDisplayName!.isEmpty) {
          throw RootHubEndpointError.invalidRequest(
            description: 'Display name cannot be empty.',
          );
        }

        if (currentLocation != null && currentLocation.ratio <= 0) {
          throw RootHubEndpointError.invalidRequest(
            description: 'Location ratio must be greater than zero.',
          );
        }

        if (displayName == null &&
            favoriteFaction == null &&
            currentLocation == null) {
          throw RootHubEndpointError.invalidRequest(
            description: 'No profile fields were provided for update.',
          );
        }

        final authUserId = session.authenticated!.authUserId;
        final existingAccount = await _findAccountByAuthUserId(
          session,
          authUserId,
        );

        if (existingAccount == null) {
          throw RootHubEndpointError.notFound(
            title: 'Player profile missing',
            description: 'Authenticated user profile was not found.',
          );
        }

        final nextDisplayName =
            normalizedDisplayName ?? existingAccount.displayName;
        final nextFavoriteFaction =
            favoriteFaction ?? existingAccount.favoriteFaction;

        final updatedAccount = await session.db.transaction((
          transaction,
        ) async {
          var accountToPersist = existingAccount;

          final shouldUpdateMainFields =
              nextDisplayName != existingAccount.displayName ||
              nextFavoriteFaction != existingAccount.favoriteFaction;

          if (shouldUpdateMainFields) {
            accountToPersist = await PlayerData.db.updateRow(
              session,
              existingAccount.copyWith(
                displayName: nextDisplayName,
                favoriteFaction: nextFavoriteFaction,
              ),
              transaction: transaction,
            );
          }

          if (currentLocation != null) {
            final locationToAttach = await _upsertLocation(
              session,
              transaction,
              existingLocation: existingAccount.currentLocation,
              nextLocation: currentLocation,
            );

            await PlayerData.db.attachRow.currentLocation(
              session,
              accountToPersist,
              locationToAttach,
              transaction: transaction,
            );
          }

          return accountToPersist;
        });

        return await _findAccountByAuthUserId(session, authUserId) ??
            updatedAccount;
      },
      fallbackDescription:
          'Unable to update account info right now. Please try again.',
    );
  }

  Future<GeoLocation> _upsertLocation(
    Session session,
    Transaction transaction, {
    required GeoLocation? existingLocation,
    required GeoLocation nextLocation,
  }) {
    if (existingLocation != null) {
      return GeoLocation.db.updateRow(
        session,
        existingLocation.copyWith(
          x: nextLocation.x,
          y: nextLocation.y,
          ratio: nextLocation.ratio,
        ),
        transaction: transaction,
      );
    }

    return GeoLocation.db.insertRow(
      session,
      GeoLocation(
        x: nextLocation.x,
        y: nextLocation.y,
        ratio: nextLocation.ratio,
      ),
      transaction: transaction,
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
