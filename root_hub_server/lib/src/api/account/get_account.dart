import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart';

class GetAccount extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<PlayerData?> v1(Session session) async {
    return guardRootHubEndpointErrors(
      () async {
        final authUserId = session.authenticated!.authUserId;
        return _findAccountByAuthUserId(session, authUserId);
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
