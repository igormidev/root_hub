import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class CreateMatchSchedule extends Endpoint {
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

    final location = await Location.db.findById(session, locationId);
    if (location == null) {
      throw ArgumentError('Location not found.');
    }

    return await session.db.transaction((transaction) async {
      final match = await MatchSchedulePairingAttempt.db.insertRow(
        session,
        MatchSchedulePairingAttempt(
          createdAt: DateTime.now(),
          title: title,
          description: description,
          aditionalLocationInfo: aditionalLocationInfo,
          minAmountOfPlayers: minAmountOfPlayers,
          maxAmountOfPlayers: maxAmountOfPlayers,
          attemptedAt: attemptedAt,
          locationId: location.id!,
          playerDataId: playerData.id!,
        ),
        transaction: transaction,
      );

      await MatchSchedulePairingAttempt.db.attachRow.location(
        session,
        match,
        location,
        transaction: transaction,
      );
      await MatchSchedulePairingAttempt.db.attachRow.host(
        session,
        match,
        playerData,
        transaction: transaction,
      );

      return match;
    });
  }
}
