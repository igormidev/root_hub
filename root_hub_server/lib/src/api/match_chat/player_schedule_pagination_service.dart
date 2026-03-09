import 'package:root_hub_server/src/api/match_chat/match_chat_participant_state_service.dart';
import 'package:root_hub_server/src/core/settings.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

enum PlayerSchedulePageType {
  active,
  past,
}

class PlayerSchedulePaginationService {
  const PlayerSchedulePaginationService._();

  static const activeMatchWindow = Duration(hours: 6);

  static Future<PlayerSchedulesPagination> loadPage(
    Session session, {
    required ServerSupportedTranslation language,
    required int page,
    required PlayerSchedulePageType pageType,
  }) async {
    final playerData =
        await MatchChatParticipantStateService.getAuthenticatedPlayerData(
          session,
          language: language,
        );
    final playerDataId = playerData.id!;

    final subscriptions = await MatchSubscription.db.find(
      session,
      where: (t) => t.playerDataId.equals(playerDataId),
      include: MatchSubscription.include(
        matchSchedulePairingAttempt: MatchSchedulePairingAttempt.include(
          chatHistory: MatchChatHistory.include(),
          location: Location.include(
            googlePlaceLocation: GooglePlaceLocation.include(),
            manualInputLocation: ManualInputLocation.include(),
          ),
          subscriptions: MatchSubscription.includeList(),
        ),
      ),
    );

    final schedulesById = <int, MatchSchedulePairingAttempt>{};
    for (final subscription in subscriptions) {
      final schedule = subscription.matchSchedulePairingAttempt;
      final scheduleId = schedule?.id;
      if (schedule == null || scheduleId == null) {
        continue;
      }

      await _ensureParticipantStateForSubscribedSchedule(
        session,
        language: language,
        schedule: schedule,
        playerData: playerData,
      );
      schedulesById[scheduleId] = schedule;
    }

    final now = DateTime.now();
    final activeThreshold = now.subtract(activeMatchWindow);
    final filteredSchedules = schedulesById.values.where((schedule) {
      final isActive = isScheduleActive(
        schedule,
        activeThreshold: activeThreshold,
      );

      return switch (pageType) {
        PlayerSchedulePageType.active => isActive,
        PlayerSchedulePageType.past => !isActive,
      };
    }).toList();

    if (pageType == PlayerSchedulePageType.active) {
      filteredSchedules.sort(
        (a, b) => compareSchedulesByClosestAttempt(
          a,
          b,
          now: now,
        ),
      );
    } else {
      filteredSchedules.sort(
        (a, b) => b.attemptedAt.compareTo(a.attemptedAt),
      );
    }

    final totalCount = filteredSchedules.length;
    final pageSize = RootHubSettings.pageSizeSubscribedMatches;
    final offset = (page - 1) * pageSize;
    final pagedSchedules = offset >= totalCount
        ? <MatchSchedulePairingAttempt>[]
        : filteredSchedules.skip(offset).take(pageSize).toList();
    final totalPages = (totalCount / pageSize).ceil();

    return PlayerSchedulesPagination(
      schedules: pagedSchedules,
      paginationMetadata: PaginationMetadata(
        currentPage: page,
        itemsInCurrentPageCount: pagedSchedules.length,
        totalItemsCount: totalCount,
        totalPagesCount: totalPages,
        hasNextPage: page < totalPages,
        hasPreviousPage: page > 1,
      ),
    );
  }

  static bool isScheduleActive(
    MatchSchedulePairingAttempt schedule, {
    required DateTime activeThreshold,
  }) {
    return schedule.status == MatchScheduleStatus.scheduled &&
        !schedule.attemptedAt.isBefore(activeThreshold);
  }

  static int compareSchedulesByClosestAttempt(
    MatchSchedulePairingAttempt a,
    MatchSchedulePairingAttempt b, {
    required DateTime now,
  }) {
    final aDistance = a.attemptedAt.difference(now).abs();
    final bDistance = b.attemptedAt.difference(now).abs();
    final distanceComparison = aDistance.compareTo(bDistance);
    if (distanceComparison != 0) {
      return distanceComparison;
    }

    return a.attemptedAt.compareTo(b.attemptedAt);
  }

  static Future<void> _ensureParticipantStateForSubscribedSchedule(
    Session session, {
    required ServerSupportedTranslation language,
    required MatchSchedulePairingAttempt schedule,
    required PlayerData playerData,
  }) async {
    final chatHistory = schedule.chatHistory;
    final chatHistoryId = chatHistory?.id;
    final playerDataId = playerData.id;
    if (chatHistory == null || chatHistoryId == null || playerDataId == null) {
      return;
    }

    final existingParticipantState = await MatchChatParticipantState.db
        .findFirstRow(
          session,
          where: (t) =>
              t.matchChatHistoryId.equals(chatHistoryId) &
              t.playerDataId.equals(playerDataId),
        );
    if (existingParticipantState != null) {
      return;
    }

    final unreadMessagesCount = await MatchChatMessage.db.count(
      session,
      where: (t) =>
          t.matchChatHistoryId.equals(chatHistoryId) &
          t.playerDataId.notEquals(playerDataId),
    );

    await MatchChatParticipantStateService.ensureParticipantStateExists(
      session,
      language: language,
      chatHistory: chatHistory,
      playerData: playerData,
      initialUnreadMessagesCount: unreadMessagesCount,
      initialLastReadMessageAt: unreadMessagesCount == 0
          ? DateTime.now()
          : null,
    );
  }
}
