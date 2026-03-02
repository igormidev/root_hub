import 'package:root_hub_server/src/core/settings.dart';
import 'package:root_hub_server/src/api/match_chat/match_chat_participant_state_service.dart';
import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:root_hub_server/src/core/server_translations.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart';

class GetMatchChatMessage extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<MatchChatMessagesPagination> v1(
    Session session, {
    required ServerSupportedTranslation language,
    required int scheduledMatchId,
    required int page,
  }) async {
    final t = ServerTranslations.of(language);

    return guardRootHubEndpointErrors(
      () async {
        if (scheduledMatchId <= 0) {
          throw RootHubEndpointError.invalidRequest(
            language: language,
            description: t.errors.scheduledMatchIdMustBeGreaterThanZero,
          );
        }

        if (page < 1) {
          throw RootHubEndpointError.invalidRequest(
            language: language,
            description: t.errors.pageMustBeAtLeastOne,
          );
        }

        final playerData =
            await MatchChatParticipantStateService.getAuthenticatedPlayerData(
              session,
              language: language,
            );

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

        final chatHistoryId = matchSchedule.chatHistory?.id;
        if (chatHistoryId == null) {
          throw RootHubEndpointError.notFound(
            language: language,
            title: t.errors.chatNotFoundTitle,
            description: t.errors.chatHistoryForScheduledMatchNotFound(
              scheduledMatchId: scheduledMatchId,
            ),
          );
        }

        final chatHistory = matchSchedule.chatHistory!;
        await MatchChatParticipantStateService.ensureParticipantStateExists(
          session,
          language: language,
          chatHistory: chatHistory,
          playerData: playerData,
        );

        final pageSize = RootHubSettings.pageSizeMatchChatMessages;

        Expression<dynamic> where(MatchChatMessageTable t) {
          return t.matchChatHistoryId.equals(chatHistoryId);
        }

        final totalCount = await MatchChatMessage.db.count(
          session,
          where: where,
        );

        final messages = await MatchChatMessage.db.find(
          session,
          where: where,
          include: MatchChatMessage.include(
            sender: PlayerData.include(),
          ),
          orderBy: (t) => t.sentAt,
          orderDescending: true,
          limit: pageSize,
          offset: (page - 1) * pageSize,
        );

        final subscriptions = await MatchSubscription.db.find(
          session,
          where: (t) =>
              t.matchSchedulePairingAttemptId.equals(scheduledMatchId),
        );
        final senderProfiles = await _resolveSenderProfiles(
          session,
          messages,
        );
        final subscribedPlayerIds =
            subscriptions.map((entry) => entry.playerDataId).toSet().toList()
              ..sort();

        final totalPages = (totalCount / pageSize).ceil();

        await MatchChatParticipantStateService.markChatAsRead(
          session,
          language: language,
          chatHistory: chatHistory,
          playerData: playerData,
          readAt: DateTime.now(),
        );

        return MatchChatMessagesPagination(
          messages: messages,
          senderProfiles: senderProfiles,
          subscribedPlayerIds: subscribedPlayerIds,
          paginationMetadata: PaginationMetadata(
            currentPage: page,
            itemsInCurrentPageCount: messages.length,
            totalItemsCount: totalCount,
            totalPagesCount: totalPages,
            hasNextPage: page < totalPages,
            hasPreviousPage: page > 1,
          ),
        );
      },
      language: language,
      fallbackDescription: t.fallback.unableToLoadChatMessages,
    );
  }

  Future<List<MatchChatSenderProfile>> _resolveSenderProfiles(
    Session session,
    List<MatchChatMessage> messages,
  ) async {
    final sendersByPlayerId = <int, PlayerData>{};
    for (final message in messages) {
      final sender = message.sender;
      final playerDataId = sender?.id;
      if (sender == null || playerDataId == null) {
        continue;
      }
      sendersByPlayerId[playerDataId] = sender;
    }

    final senderProfiles = await Future.wait(
      sendersByPlayerId.entries.map((entry) async {
        final profile = await AuthServices.instance.userProfiles
            .maybeFindUserProfileByUserId(
              session,
              entry.value.authUserId,
            );

        return MatchChatSenderProfile(
          playerDataId: entry.key,
          profileImageUrl: profile?.imageUrl?.toString(),
        );
      }),
    );

    senderProfiles.sort((a, b) => a.playerDataId.compareTo(b.playerDataId));
    return senderProfiles;
  }
}
