import 'package:root_hub_server/src/api/match_chat/match_chat_participant_state_service.dart';
import 'package:root_hub_server/src/api/match_chat/send_system_chat_message.dart';
import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:root_hub_server/src/core/server_translations.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class SubscribeToMatch extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<MatchSubscription> v1(
    Session session, {
    required ServerSupportedTranslation language,
    required int scheduledMatchId,
  }) async {
    final t = ServerTranslations.of(language);

    return guardRootHubEndpointErrors(
      () async {
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

        final match = await MatchSchedulePairingAttempt.db.findById(
          session,
          scheduledMatchId,
          include: MatchSchedulePairingAttempt.include(
            subscriptions: MatchSubscription.includeList(),
            chatHistory: MatchChatHistory.include(),
          ),
        );

        if (match == null) {
          throw RootHubEndpointError.notFound(
            language: language,
            title: t.errors.scheduledMatchNotFoundTitle,
            description: t.errors.scheduledMatchWithIdNotFound(
              scheduledMatchId: scheduledMatchId,
            ),
          );
        }

        if (match.status != MatchScheduleStatus.scheduled) {
          throw RootHubEndpointError.invalidRequest(
            language: language,
            description: t.errors.onlyScheduledMatchesCanReceiveSubscriptions,
          );
        }

        if (match.closedForSubscriptions == true) {
          throw RootHubEndpointError.invalidRequest(
            language: language,
            title: t.errors.subscriptionsClosedTitle,
            description: t.errors.hostClosedSubscriptions,
          );
        }

        final currentSubscriptions =
            match.subscriptions ?? const <MatchSubscription>[];
        final maxPlayers = _podiumToPlayersCount(match.maxAmountOfPlayers);
        if (currentSubscriptions.length >= maxPlayers) {
          throw RootHubEndpointError.invalidRequest(
            language: language,
            title: t.errors.tableIsFullTitle,
            description: t.errors.tableReachedMaximumPlayers(
              maxPlayers: maxPlayers,
            ),
          );
        }

        final existing = await MatchSubscription.db.findFirstRow(
          session,
          where: (t) =>
              t.matchSchedulePairingAttemptId.equals(scheduledMatchId) &
              t.playerDataId.equals(playerData.id!),
        );

        if (existing != null) {
          throw RootHubEndpointError.invalidRequest(
            language: language,
            title: t.errors.subscriptionAlreadyExistsTitle,
            description: t.errors.alreadySubscribedToThisMatch,
          );
        }

        final subscription = await MatchSubscription.db.insertRow(
          session,
          MatchSubscription(
            subscribedAt: DateTime.now(),
            matchSchedulePairingAttemptId: scheduledMatchId,
            playerDataId: playerData.id!,
          ),
        );

        await MatchSubscription.db.attachRow.matchSchedulePairingAttempt(
          session,
          subscription,
          match,
        );
        await MatchSubscription.db.attachRow.playerData(
          session,
          subscription,
          playerData,
        );

        final chatHistory = match.chatHistory;
        final chatHistoryId = chatHistory?.id;
        if (chatHistory != null && chatHistoryId != null) {
          final existingState = await MatchChatParticipantState.db.findFirstRow(
            session,
            where: (t) =>
                t.matchChatHistoryId.equals(chatHistoryId) &
                t.playerDataId.equals(playerData.id!),
          );

          if (existingState == null) {
            final unreadFromExistingMessages = await MatchChatMessage.db.count(
              session,
              where: (t) =>
                  t.matchChatHistoryId.equals(chatHistoryId) &
                  t.playerDataId.notEquals(playerData.id!),
            );

            await MatchChatParticipantStateService.ensureParticipantStateExists(
              session,
              language: language,
              chatHistory: chatHistory,
              playerData: playerData,
              initialUnreadMessagesCount: unreadFromExistingMessages,
              initialLastReadMessageAt: unreadFromExistingMessages == 0
                  ? DateTime.now()
                  : null,
            );
          }
        }

        await sendSystemChatMessage(
          session,
          language: language,
          scheduledMatchId: scheduledMatchId,
          playerData: playerData,
          messageType: MatchChatMessageType.systemJoin,
          content: t.systemMessages.joinedTheTable(
            displayName: playerData.displayName,
          ),
        );

        return subscription;
      },
      language: language,
      fallbackDescription: t.fallback.unableToSubscribeToMatch,
    );
  }

  int _podiumToPlayersCount(MatchPodium podium) {
    switch (podium) {
      case MatchPodium.firstPlace:
        return 1;
      case MatchPodium.secondPlace:
        return 2;
      case MatchPodium.thirdPlace:
        return 3;
      case MatchPodium.fourthPlace:
        return 4;
      case MatchPodium.fifthPlace:
        return 5;
      case MatchPodium.sixthPlace:
        return 6;
    }
  }
}
