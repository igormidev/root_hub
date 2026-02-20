import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class MatchChatGetMessages extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<List<MatchChatMessage>> v1(
    Session session, {
    required int matchChatHistoryId,
  }) async {
    return guardRootHubEndpointErrors(
      () async {
        final playerData = await _getPlayerData(session);

        final chatHistory = await MatchChatHistory.db.findById(
          session,
          matchChatHistoryId,
          include: MatchChatHistory.include(
            matchSchedulePairingAttempt: MatchSchedulePairingAttempt.include(),
          ),
        );

        if (chatHistory == null) {
          throw RootHubEndpointError.notFound(
            title: 'Chat not found',
            description: 'Chat history not found.',
          );
        }

        await _verifyParticipant(
          session,
          chatHistory.matchSchedulePairingAttempt!,
          playerData,
        );

        final messages = await MatchChatMessage.db.find(
          session,
          where: (t) => t.matchChatHistoryId.equals(matchChatHistoryId),
          include: MatchChatMessage.include(
            sender: PlayerData.include(),
          ),
          orderBy: (t) => t.sentAt,
        );

        return messages;
      },
      fallbackDescription:
          'Unable to load chat messages right now. Please try again.',
    );
  }

  Future<PlayerData> _getPlayerData(Session session) async {
    final userIdentifier = session.authenticated!.userIdentifier;
    final authUserId = UuidValue.fromString(userIdentifier);

    final playerData = await PlayerData.db.findFirstRow(
      session,
      where: (t) => t.authUserId.equals(authUserId),
    );

    if (playerData == null) {
      throw RootHubEndpointError.notFound(
        title: 'Player profile missing',
        description: 'Player profile not found for authenticated user.',
      );
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
      throw RootHubEndpointError.accessDenied(
        description: 'You are not a participant of this chat.',
      );
    }
  }
}
