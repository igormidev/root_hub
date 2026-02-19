import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class GetPlayerMatches extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<List<MatchSubscription>> v1(Session session) async {
    final userIdentifier = session.authenticated!.userIdentifier;
    final authUserId = UuidValue.fromString(userIdentifier);

    final playerData = await PlayerData.db.findFirstRow(
      session,
      where: (t) => t.authUserId.equals(authUserId),
    );

    if (playerData == null) {
      throw ArgumentError('Player profile not found for authenticated user.');
    }

    return await MatchSubscription.db.find(
      session,
      where: (t) => t.playerDataId.equals(playerData.id!),
      orderBy: (t) => t.subscribedAt,
      orderDescending: true,
      include: MatchSubscription.include(
        matchSchedulePairingAttempt: MatchSchedulePairingAttempt.include(
          location: Location.include(
            googlePlaceLocation: GooglePlaceLocation.include(),
            manualInputLocation: ManualInputLocation.include(),
          ),
        ),
      ),
    );
  }
}
