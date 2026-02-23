import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

Future<MatchChatMessage> sendSystemChatMessage(
  Session session, {
  required int scheduledMatchId,
  required PlayerData playerData,
  required MatchChatMessageType messageType,
  required String content,
}) async {
  final matchSchedule = await MatchSchedulePairingAttempt.db.findById(
    session,
    scheduledMatchId,
    include: MatchSchedulePairingAttempt.include(
      chatHistory: MatchChatHistory.include(),
    ),
  );

  if (matchSchedule == null) {
    throw RootHubEndpointError.notFound(
      title: 'Scheduled match not found',
      description: 'Scheduled match with id $scheduledMatchId was not found.',
    );
  }

  final chatHistory = matchSchedule.chatHistory;
  final chatHistoryId = chatHistory?.id;
  if (chatHistory == null || chatHistoryId == null) {
    throw RootHubEndpointError.notFound(
      title: 'Chat not found',
      description:
          'Chat history for scheduled match $scheduledMatchId was not found.',
    );
  }

  final message = await MatchChatMessage.db.insertRow(
    session,
    MatchChatMessage(
      sentAt: DateTime.now(),
      content: content,
      messageType: messageType,
      matchChatHistoryId: chatHistoryId,
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

  session.log(
    '[MatchChat] System message sent. '
    'scheduledMatchId=$scheduledMatchId playerDataId=${playerData.id} '
    'messageId=${message.id} type=$messageType',
    level: LogLevel.info,
  );

  return message;
}
