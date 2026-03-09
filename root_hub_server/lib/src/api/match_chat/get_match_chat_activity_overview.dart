import 'package:root_hub_server/src/api/match_chat/match_chat_participant_state_service.dart';
import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:root_hub_server/src/core/server_translations.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class GetMatchChatActivityOverview extends Endpoint {
  static const _activeMatchWindow = Duration(hours: 6);
  static const _endedChatsLimit = 8;

  @override
  bool get requireLogin => true;

  Future<MatchChatActivityOverview> v1(
    Session session, {
    required ServerSupportedTranslation language,
  }) async {
    final t = ServerTranslations.of(language);

    return guardRootHubEndpointErrors(
      () async {
        final playerData =
            await MatchChatParticipantStateService.getAuthenticatedPlayerData(
              session,
              language: language,
            );
        final playerDataId = playerData.id!;
        final now = DateTime.now();
        final activeThreshold = now.subtract(_activeMatchWindow);

        final subscriptions = await MatchSubscription.db.find(
          session,
          where: (t) => t.playerDataId.equals(playerDataId),
          include: MatchSubscription.include(
            matchSchedulePairingAttempt: MatchSchedulePairingAttempt.include(
              chatHistory: MatchChatHistory.include(),
              playedMatch: PlayedMatch.include(),
              location: Location.include(
                googlePlaceLocation: GooglePlaceLocation.include(),
                manualInputLocation: ManualInputLocation.include(),
              ),
              host: PlayerData.include(),
              subscriptions: MatchSubscription.includeList(),
            ),
          ),
        );

        final subscribedActiveSchedules = <MatchSchedulePairingAttempt>[];
        final subscribedScheduleIds = <int>{};

        for (final subscription in subscriptions) {
          final schedule = subscription.matchSchedulePairingAttempt;
          final scheduleId = schedule?.id;
          if (schedule == null || scheduleId == null) {
            continue;
          }

          subscribedScheduleIds.add(scheduleId);
          await _ensureParticipantStateForSubscribedSchedule(
            session,
            language: language,
            schedule: schedule,
            playerData: playerData,
          );

          if (_isScheduleActive(
            schedule,
            activeThreshold: activeThreshold,
          )) {
            subscribedActiveSchedules.add(schedule);
          }
        }

        subscribedActiveSchedules.sort(
          (a, b) => _compareSchedulesByClosestAttempt(
            a,
            b,
            now: now,
          ),
        );

        final participantStates = await MatchChatParticipantState.db.find(
          session,
          where: (t) => t.playerDataId.equals(playerDataId),
          include: MatchChatParticipantState.include(
            matchChatHistory: MatchChatHistory.include(
              messages: MatchChatMessage.includeList(
                orderBy: (t) => t.sentAt,
                orderDescending: true,
                limit: 1,
                include: MatchChatMessage.include(
                  sender: PlayerData.include(),
                ),
              ),
              matchSchedulePairingAttempt: MatchSchedulePairingAttempt.include(
                playedMatch: PlayedMatch.include(),
                subscriptions: MatchSubscription.includeList(),
                location: Location.include(
                  googlePlaceLocation: GooglePlaceLocation.include(),
                  manualInputLocation: ManualInputLocation.include(),
                ),
              ),
            ),
          ),
        );

        final mappedChats = <MatchChatActivityChatItem>[];
        for (final participantState in participantStates) {
          final chatHistory = participantState.matchChatHistory;
          final chatHistoryId = chatHistory?.id;
          final schedule = chatHistory?.matchSchedulePairingAttempt;
          final scheduleId = schedule?.id;

          if (chatHistory == null ||
              chatHistoryId == null ||
              schedule == null ||
              scheduleId == null) {
            continue;
          }

          final locationTitle = _resolveLocationTitle(
            schedule.location,
            language: language,
          );
          final locationSubtitle = _resolveLocationSubtitle(schedule.location);
          final isSubscribed =
              subscribedScheduleIds.contains(scheduleId) ||
              (schedule.subscriptions ?? const <MatchSubscription>[]).any(
                (entry) => entry.playerDataId == playerDataId,
              );
          final googlePlace = schedule.location?.googlePlaceLocation;

          final lastMessage = chatHistory.messages?.firstOrNull;
          final lastMessageContent = lastMessage?.content.trim();
          final normalizedLastMessageContent =
              lastMessageContent == null || lastMessageContent.isEmpty
              ? null
              : lastMessageContent;

          mappedChats.add(
            MatchChatActivityChatItem(
              scheduledMatchId: scheduleId,
              chatHistoryId: chatHistoryId,
              matchTitle: schedule.title,
              attemptedAt: schedule.attemptedAt,
              unreadMessagesCount: participantState.unreadMessagesCount,
              isSubscribed: isSubscribed,
              hasPlayedResult: schedule.status != MatchScheduleStatus.scheduled,
              scheduleStatus: schedule.status,
              locationTitle: locationTitle,
              locationSubtitle: locationSubtitle,
              locationProviderPlaceId: googlePlace?.providerPlaceId,
              locationLatitude: googlePlace?.lat,
              locationLongitude: googlePlace?.lng,
              googlePlaceLocation: googlePlace,
              lastMessageAt: lastMessage?.sentAt,
              lastMessagePreview: normalizedLastMessageContent,
              lastMessageType: lastMessage?.messageType,
              lastMessageSenderDisplayName: lastMessage?.sender?.displayName,
            ),
          );
        }

        final activeChats =
            mappedChats
                .where(
                  (entry) => _isActivityChatActive(
                    entry,
                    activeThreshold: activeThreshold,
                  ),
                )
                .toList()
              ..sort(
                (a, b) => _compareActiveChatItems(
                  a,
                  b,
                  now: now,
                ),
              );

        final endedChats =
            mappedChats
                .where(
                  (entry) => !_isActivityChatActive(
                    entry,
                    activeThreshold: activeThreshold,
                  ),
                )
                .toList()
              ..sort((a, b) => b.attemptedAt.compareTo(a.attemptedAt));

        final cappedEndedChats = endedChats.take(_endedChatsLimit).toList();
        final unreadMessagesCount = await _loadUnreadCount(
          session,
          playerDataId: playerDataId,
        );

        return MatchChatActivityOverview(
          subscribedActiveSchedules: subscribedActiveSchedules,
          activeChats: activeChats,
          endedChats: cappedEndedChats,
          unreadMessagesCount: unreadMessagesCount,
        );
      },
      language: language,
      fallbackDescription: t.fallback.unableToLoadMatchActivity,
    );
  }

  Future<void> _ensureParticipantStateForSubscribedSchedule(
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

  bool _isScheduleActive(
    MatchSchedulePairingAttempt schedule, {
    required DateTime activeThreshold,
  }) {
    return schedule.status == MatchScheduleStatus.scheduled &&
        !schedule.attemptedAt.isBefore(activeThreshold);
  }

  bool _isActivityChatActive(
    MatchChatActivityChatItem entry, {
    required DateTime activeThreshold,
  }) {
    return !entry.hasPlayedResult &&
        !entry.attemptedAt.isBefore(activeThreshold);
  }

  int _compareSchedulesByClosestAttempt(
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

  int _compareActiveChatItems(
    MatchChatActivityChatItem a,
    MatchChatActivityChatItem b, {
    required DateTime now,
  }) {
    final unreadComparison = b.unreadMessagesCount.compareTo(
      a.unreadMessagesCount,
    );
    if (unreadComparison != 0) {
      return unreadComparison;
    }

    final aDistance = a.attemptedAt.difference(now).abs();
    final bDistance = b.attemptedAt.difference(now).abs();
    final distanceComparison = aDistance.compareTo(bDistance);
    if (distanceComparison != 0) {
      return distanceComparison;
    }

    return b.attemptedAt.compareTo(a.attemptedAt);
  }

  String _resolveLocationTitle(
    Location? location, {
    required ServerSupportedTranslation language,
  }) {
    final t = ServerTranslations.of(language);

    final google = location?.googlePlaceLocation;
    final manual = location?.manualInputLocation;
    return google?.name ?? manual?.title ?? t.errors.unknownLocation;
  }

  String? _resolveLocationSubtitle(Location? location) {
    final google = location?.googlePlaceLocation;
    final manual = location?.manualInputLocation;
    return google?.shortFormattedAddress ??
        google?.formattedAddress ??
        manual?.cityName;
  }

  Future<int> _loadUnreadCount(
    Session session, {
    required int playerDataId,
  }) async {
    final unreadResult = await session.db.unsafeQuery(
      '''
      SELECT
        COALESCE(SUM("unreadMessagesCount"), 0)::bigint AS unread_total
      FROM match_chat_participant_state
      WHERE "playerDataId" = @playerDataId
        AND "unreadMessagesCount" > 0
      ''',
      parameters: QueryParameters.named(
        <String, Object?>{
          'playerDataId': playerDataId,
        },
      ),
    );

    if (unreadResult.isEmpty) {
      return 0;
    }

    final unreadValue = unreadResult.first.toColumnMap()['unread_total'];
    if (unreadValue is int) {
      return unreadValue;
    }
    if (unreadValue is BigInt) {
      return unreadValue.toInt();
    }
    if (unreadValue is num) {
      return unreadValue.toInt();
    }

    return 0;
  }
}
