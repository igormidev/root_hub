import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class SubscribeToMatch extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<MatchSubscription> v1(
    Session session, {
    required int scheduledMatchId,
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

    // Verify the scheduled match exists
    final match = await MatchSchedulePairingAttempt.db.findById(
      session,
      scheduledMatchId,
    );

    if (match == null) {
      throw ArgumentError('Scheduled match not found.');
    }

    // Check if the player is already subscribed
    final existing = await MatchSubscription.db.findFirstRow(
      session,
      where: (t) =>
          t.matchSchedulePairingAttemptId.equals(scheduledMatchId) &
          t.playerDataId.equals(playerData.id!),
    );

    if (existing != null) {
      throw ArgumentError('Already subscribed to this match.');
    }

    final subscription = MatchSubscription(
      subscribedAt: DateTime.now(),
      matchSchedulePairingAttemptId: scheduledMatchId,
      playerDataId: playerData.id!,
    );

    return await MatchSubscription.db.insertRow(session, subscription);
  }
}
