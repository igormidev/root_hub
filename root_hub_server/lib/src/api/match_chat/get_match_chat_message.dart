import 'package:root_hub_server/src/core/settings.dart';
import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class GetMatchChatMessage extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<MatchChatMessagesPagination> v1(
    Session session, {
    required int scheduledMatchId,
    required int page,
  }) async {
    return guardRootHubEndpointErrors(
      () async {
        if (scheduledMatchId <= 0) {
          throw RootHubEndpointError.invalidRequest(
            description: 'Scheduled match id must be greater than zero.',
          );
        }

        if (page < 1) {
          throw RootHubEndpointError.invalidRequest(
            description: 'Page must be greater than or equal to 1.',
          );
        }

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
            description:
                'Scheduled match with id $scheduledMatchId was not found.',
          );
        }

        final chatHistoryId = matchSchedule.chatHistory?.id;
        if (chatHistoryId == null) {
          throw RootHubEndpointError.notFound(
            title: 'Chat not found',
            description:
                'Chat history for scheduled match $scheduledMatchId was not found.',
          );
        }

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
        final subscribedPlayerIds =
            subscriptions.map((entry) => entry.playerDataId).toSet().toList()
              ..sort();

        final totalPages = (totalCount / pageSize).ceil();

        return MatchChatMessagesPagination(
          messages: messages,
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
      fallbackDescription:
          'Unable to load chat messages right now. Please try again.',
    );
  }
}
