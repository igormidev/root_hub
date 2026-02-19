import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class CreateMatch extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<MatchSchedulePairingAttempt> v1(
    Session session, {
    required String title,
    String? description,
    String? aditionalLocationInfo,
    required MatchPodium minAmountOfPlayers,
    required MatchPodium maxAmountOfPlayers,
    required DateTime attemptedAt,
    required int locationId,
  }) async {
    final userIdentifier = session.authenticated!.userIdentifier;
    final authUserId = UuidValue.fromString(userIdentifier);

    final playerData = await PlayerData.db.findFirstRow(
      session,
      where: (t) => t.authUserId.equals(authUserId),
    );

    if (playerData == null) {
      throw ArgumentError('Player profile not found for authenticated user.');
    }

    final match = MatchSchedulePairingAttempt(
      createdAt: DateTime.now(),
      title: title,
      description: description,
      aditionalLocationInfo: aditionalLocationInfo,
      minAmountOfPlayers: minAmountOfPlayers,
      maxAmountOfPlayers: maxAmountOfPlayers,
      attemptedAt: attemptedAt,
      locationId: locationId,
      playerDataId: playerData.id!,
    );

    return await MatchSchedulePairingAttempt.db.insertRow(session, match);
  }
}
