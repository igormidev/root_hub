import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart';

class Utils {
  static Future<PlayerData?> findAccountOfSession(Session session) {
    final authUserId = session.authenticated!.authUserId;
    return findAccountByAuthUserId(session, authUserId);
  }

  static Future<PlayerData?> findAccountByAuthUserId(
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
