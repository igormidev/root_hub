import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:root_hub_server/src/core/server_translations.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class MatchChatParticipantStateService {
  const MatchChatParticipantStateService._();

  static Future<PlayerData> getAuthenticatedPlayerData(
    Session session, {
    required ServerSupportedTranslation language,
  }) async {
    final t = ServerTranslations.of(language);

    final userIdentifier = session.authenticated!.userIdentifier;
    final authUserId = UuidValue.fromString(userIdentifier);

    final playerData = await PlayerData.db.findFirstRow(
      session,
      where: (t) => t.authUserId.equals(authUserId),
    );

    if (playerData == null) {
      throw RootHubEndpointError.notFound(
        language: language,
        title: t.errors.playerProfileMissingTitle,
        description: t.errors.playerProfileNotFoundForAuthenticatedUser,
      );
    }

    return playerData;
  }

  static Future<MatchChatParticipantState> ensureParticipantStateExists(
    Session session, {
    required ServerSupportedTranslation language,
    required MatchChatHistory chatHistory,
    required PlayerData playerData,
    int initialUnreadMessagesCount = 0,
    DateTime? initialLastReadMessageAt,
    Transaction? transaction,
  }) async {
    final t = ServerTranslations.of(language);

    final chatHistoryId = chatHistory.id;
    final playerDataId = playerData.id;

    if (chatHistoryId == null || playerDataId == null) {
      throw RootHubEndpointError.invalidRequest(
        language: language,
        description: t.errors.chatHistoryAndPlayerMustBePersisted,
      );
    }

    final existing = await MatchChatParticipantState.db.findFirstRow(
      session,
      where: (t) =>
          t.matchChatHistoryId.equals(chatHistoryId) &
          t.playerDataId.equals(playerDataId),
      transaction: transaction,
    );
    if (existing != null) {
      return existing;
    }

    final now = DateTime.now();
    final createdState = await MatchChatParticipantState.db.insertRow(
      session,
      MatchChatParticipantState(
        playerDataId: playerDataId,
        matchChatHistoryId: chatHistoryId,
        firstSeenAt: now,
        lastOpenedAt: now,
        lastReadMessageAt: initialLastReadMessageAt,
        unreadMessagesCount: initialUnreadMessagesCount,
      ),
      transaction: transaction,
    );

    await MatchChatParticipantState.db.attachRow.playerData(
      session,
      createdState,
      playerData,
      transaction: transaction,
    );
    await MatchChatParticipantState.db.attachRow.matchChatHistory(
      session,
      createdState,
      chatHistory,
      transaction: transaction,
    );

    return createdState;
  }

  static Future<void> markChatAsRead(
    Session session, {
    required ServerSupportedTranslation language,
    required MatchChatHistory chatHistory,
    required PlayerData playerData,
    DateTime? readAt,
    Transaction? transaction,
  }) async {
    final resolvedReadAt = readAt ?? DateTime.now();

    final participantState = await ensureParticipantStateExists(
      session,
      language: language,
      chatHistory: chatHistory,
      playerData: playerData,
      initialUnreadMessagesCount: 0,
      initialLastReadMessageAt: resolvedReadAt,
      transaction: transaction,
    );

    final lastOpenedAt = participantState.lastOpenedAt.isAfter(resolvedReadAt)
        ? participantState.lastOpenedAt
        : resolvedReadAt;
    final lastReadMessageAt =
        participantState.lastReadMessageAt?.isAfter(resolvedReadAt) == true
        ? participantState.lastReadMessageAt
        : resolvedReadAt;

    final requiresUpdate =
        participantState.unreadMessagesCount != 0 ||
        participantState.lastOpenedAt != lastOpenedAt ||
        participantState.lastReadMessageAt != lastReadMessageAt;

    if (!requiresUpdate) {
      return;
    }

    participantState.unreadMessagesCount = 0;
    participantState.lastOpenedAt = lastOpenedAt;
    participantState.lastReadMessageAt = lastReadMessageAt;

    await MatchChatParticipantState.db.updateRow(
      session,
      participantState,
      transaction: transaction,
    );
  }

  static Future<void> setTypingState(
    Session session, {
    required ServerSupportedTranslation language,
    required MatchChatHistory chatHistory,
    required PlayerData playerData,
    required bool isTyping,
    Transaction? transaction,
  }) async {
    final participantState = await ensureParticipantStateExists(
      session,
      language: language,
      chatHistory: chatHistory,
      playerData: playerData,
      transaction: transaction,
    );

    final nextTypingAt = isTyping ? DateTime.now() : null;
    if (participantState.lastTypingAt == nextTypingAt) {
      return;
    }

    participantState.lastTypingAt = nextTypingAt;
    await MatchChatParticipantState.db.updateRow(
      session,
      participantState,
      transaction: transaction,
    );
  }

  static Future<void> incrementUnreadForRecipients(
    Session session, {
    required int chatHistoryId,
    required int senderPlayerDataId,
    required DateTime sentAt,
    required bool markSenderAsRead,
    Transaction? transaction,
  }) async {
    await session.db.unsafeExecute(
      '''
      UPDATE match_chat_participant_state
      SET "unreadMessagesCount" = "unreadMessagesCount" + 1
      WHERE "matchChatHistoryId" = @chatHistoryId
        AND "playerDataId" <> @senderPlayerDataId
      ''',
      parameters: QueryParameters.named(
        <String, Object?>{
          'chatHistoryId': chatHistoryId,
          'senderPlayerDataId': senderPlayerDataId,
        },
      ),
      transaction: transaction,
    );

    if (!markSenderAsRead) {
      return;
    }

    await session.db.unsafeExecute(
      '''
      UPDATE match_chat_participant_state
      SET
        "lastOpenedAt" = CASE
          WHEN "lastOpenedAt" > @sentAt THEN "lastOpenedAt"
          ELSE @sentAt
        END,
        "lastReadMessageAt" = CASE
          WHEN "lastReadMessageAt" IS NULL THEN @sentAt
          WHEN "lastReadMessageAt" > @sentAt THEN "lastReadMessageAt"
          ELSE @sentAt
        END,
        "lastTypingAt" = NULL,
        "unreadMessagesCount" = 0
      WHERE "matchChatHistoryId" = @chatHistoryId
        AND "playerDataId" = @senderPlayerDataId
      ''',
      parameters: QueryParameters.named(
        <String, Object?>{
          'chatHistoryId': chatHistoryId,
          'senderPlayerDataId': senderPlayerDataId,
          'sentAt': sentAt,
        },
      ),
      transaction: transaction,
    );
  }
}
