import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class MatchChatSendMessage extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<MatchChatMessage> v1(
    Session session, {
    required int matchChatHistoryId,
    required String content,
  }) async {
    final playerData = await _getPlayerData(session);

    final chatHistory = await MatchChatHistory.db.findById(
      session,
      matchChatHistoryId,
      include: MatchChatHistory.include(
        matchSchedulePairingAttempt:
            MatchSchedulePairingAttempt.include(),
      ),
    );

    if (chatHistory == null) {
      throw ArgumentError('Chat history not found.');
    }

    await _verifyParticipant(
      session,
      chatHistory.matchSchedulePairingAttempt!,
      playerData,
    );

    final message = await MatchChatMessage.db.insertRow(
      session,
      MatchChatMessage(
        sentAt: DateTime.now(),
        content: content,
        matchChatHistoryId: matchChatHistoryId,
        playerDataId: playerData.id!,
      ),
    );

    await MatchChatMessage.db.attachRow.matchChatHistory(
      session,
      message,
      chatHistory,
    );
    await MatchChatMessage.db.attachRow.sender(
      session,
      message,
      playerData,
    );

    return message;
  }

  Future<PlayerData> _getPlayerData(Session session) async {
    final userIdentifier = session.authenticated!.userIdentifier;
    final authUserId = UuidValue.fromString(userIdentifier);

    final playerData = await PlayerData.db.findFirstRow(
      session,
      where: (t) => t.authUserId.equals(authUserId),
    );

    if (playerData == null) {
      throw ArgumentError('Player profile not found for authenticated user.');
    }

    return playerData;
  }

  Future<void> _verifyParticipant(
    Session session,
    MatchSchedulePairingAttempt pairingAttempt,
    PlayerData playerData,
  ) async {
    final isHost = pairingAttempt.playerDataId == playerData.id;
    if (isHost) return;

    final subscription = await MatchSubscription.db.findFirstRow(
      session,
      where: (t) =>
          t.matchSchedulePairingAttemptId.equals(pairingAttempt.id!) &
          t.playerDataId.equals(playerData.id!),
    );

    if (subscription == null) {
      throw ArgumentError('You are not a participant of this chat.');
    }
  }
}
