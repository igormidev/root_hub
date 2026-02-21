import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart';

class GetAccount extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<PlayerData> v1(Session session) async {
    return guardRootHubEndpointErrors(
      () async {
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
        if (existingAccount != null) return existingAccount;

        try {
          final createdAccount = await session.db.transaction((
            transaction,
          ) async {
            final insertedAccount = await PlayerData.db.insertRow(
              session,
              PlayerData(
                authUserId: authUserId,
                favoriteFaction: Faction.marquiseDeCat,
              ),
              transaction: transaction,
            );

            await PlayerData.db.attachRow.authUser(
              session,
              insertedAccount,
              authUser,
              transaction: transaction,
            );

            return insertedAccount;
          });

          return await PlayerData.db.findById(
                session,
                createdAccount.id!,
                include: PlayerData.include(authUser: AuthUser.include()),
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
          'Unable to load account info right now. Please try again.',
    );
  }

  Future<PlayerData?> _findAccountByAuthUserId(
    Session session,
    UuidValue authUserId,
  ) {
    return PlayerData.db.findFirstRow(
      session,
      where: (t) => t.authUserId.equals(authUserId),
      include: PlayerData.include(authUser: AuthUser.include()),
    );
  }
}
