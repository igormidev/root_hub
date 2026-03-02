import 'package:root_hub_server/src/api/match_chat/match_chat_participant_state_service.dart';
import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:root_hub_server/src/core/server_translations.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

Future<MatchChatMessage> sendSystemChatMessage(
  Session session, {
  required ServerSupportedTranslation language,
  required int scheduledMatchId,
  required PlayerData playerData,
  required MatchChatMessageType messageType,
  required String content,
}) async {
  final t = ServerTranslations.of(language);

  final matchSchedule = await MatchSchedulePairingAttempt.db.findById(
    session,
    scheduledMatchId,
    include: MatchSchedulePairingAttempt.include(
      chatHistory: MatchChatHistory.include(),
    ),
  );

  if (matchSchedule == null) {
    throw RootHubEndpointError.notFound(
      language: language,
      title: t.errors.scheduledMatchNotFoundTitle,
      description: t.errors.scheduledMatchWithIdNotFound(
        scheduledMatchId: scheduledMatchId,
      ),
    );
  }

  final chatHistory = matchSchedule.chatHistory;
  final chatHistoryId = chatHistory?.id;
  if (chatHistory == null || chatHistoryId == null) {
    throw RootHubEndpointError.notFound(
      language: language,
      title: t.errors.chatNotFoundTitle,
      description: t.errors.chatHistoryForScheduledMatchNotFound(
        scheduledMatchId: scheduledMatchId,
      ),
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

  await MatchChatParticipantStateService.ensureParticipantStateExists(
    session,
    language: language,
    chatHistory: chatHistory,
    playerData: playerData,
  );
  await MatchChatParticipantStateService.incrementUnreadForRecipients(
    session,
    chatHistoryId: chatHistoryId,
    senderPlayerDataId: playerData.id!,
    sentAt: message.sentAt,
    markSenderAsRead: false,
  );

  session.log(
    '[MatchChat] System message sent. '
    'scheduledMatchId=$scheduledMatchId playerDataId=${playerData.id} '
    'messageId=${message.id} type=$messageType',
    level: LogLevel.info,
  );

  return message;
}
