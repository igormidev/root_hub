import 'package:root_hub_server/src/api/match_chat/match_chat_participant_state_service.dart';
import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:root_hub_server/src/core/server_translations.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:root_hub_server/src/notifications/nearby_match_push_notification_service.dart';
import 'package:serverpod/serverpod.dart';

class CreateMatchSchedule extends Endpoint {
  @override
  bool get requireLogin => true;

  static const _maxScheduleDays = 15;
  static const _minScheduleMinutes = 10;
  static const _maxDescriptionLength = 1000;
  static const _maxLocationAdditionalInfoLength = 1000;

  Future<MatchSchedulePairingAttempt> v1(
    Session session, {
    required ServerSupportedTranslation language,
    required String title,
    String? description,
    required MatchPodium minAmountOfPlayers,
    required MatchPodium maxAmountOfPlayers,
    required DateTime attemptedAt,
    required int locationId,
    String? locationAdditionalInfo,
    required bool hostWillPlay,
  }) async {
    final t = ServerTranslations.of(language);

    return guardRootHubEndpointErrors(
      () async {
        final normalizedTitle = title.trim();
        final normalizedDescription = description?.trim();
        final normalizedLocationAdditionalInfo = locationAdditionalInfo?.trim();
        if (normalizedTitle.isEmpty) {
          throw RootHubEndpointError.invalidRequest(
            language: language,
            description: t.errors.titleCannotBeEmpty,
          );
        }
        if (normalizedDescription != null &&
            normalizedDescription.length > _maxDescriptionLength) {
          throw RootHubEndpointError.invalidRequest(
            language: language,
            description: t.errors.nameCannotExceedCharacters(
              label: t.labels.matchDescription,
              maxLength: _maxDescriptionLength,
            ),
          );
        }
        if (normalizedLocationAdditionalInfo != null &&
            normalizedLocationAdditionalInfo.length >
                _maxLocationAdditionalInfoLength) {
          throw RootHubEndpointError.invalidRequest(
            language: language,
            description: t.errors.nameCannotExceedCharacters(
              label: t.labels.locationAdditionalInfo,
              maxLength: _maxLocationAdditionalInfoLength,
            ),
          );
        }

        final minPlayers = _podiumToPlayersCount(minAmountOfPlayers);
        final maxPlayers = _podiumToPlayersCount(maxAmountOfPlayers);
        if (minPlayers < 2 || maxPlayers > 6 || minPlayers > maxPlayers) {
          throw RootHubEndpointError.invalidRequest(
            language: language,
            description: t.errors.playersRangeMustStayBetweenTwoAndSix,
          );
        }

        final now = DateTime.now();
        final minAllowedTime = now.add(
          const Duration(minutes: _minScheduleMinutes),
        );
        if (attemptedAt.isBefore(minAllowedTime)) {
          throw RootHubEndpointError.invalidRequest(
            language: language,
            description: t.errors.scheduledTimeMustBeAtLeastMinutesInTheFuture(
              minutes: _minScheduleMinutes,
            ),
          );
        }

        final maxAllowedTime = now.add(
          const Duration(days: _maxScheduleDays),
        );
        if (attemptedAt.isAfter(maxAllowedTime)) {
          throw RootHubEndpointError.invalidRequest(
            language: language,
            description: t.errors.scheduledTimeCannotBeMoreThanDaysInTheFuture(
              days: _maxScheduleDays,
            ),
          );
        }

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

        final location = await Location.db.findById(
          session,
          locationId,
          include: Location.include(
            googlePlaceLocation: GooglePlaceLocation.include(),
            manualInputLocation: ManualInputLocation.include(),
          ),
        );
        if (location == null) {
          throw RootHubEndpointError.notFound(
            language: language,
            title: t.errors.locationNotFoundTitle,
            description: t.errors.locationWithIdNotFound(
              locationId: locationId,
            ),
          );
        }

        final createdMatch = await session.db.transaction((transaction) async {
          final match = await MatchSchedulePairingAttempt.db.insertRow(
            session,
            MatchSchedulePairingAttempt(
              createdAt: DateTime.now(),
              title: normalizedTitle,
              description: normalizedDescription?.isEmpty == true
                  ? null
                  : normalizedDescription,
              minAmountOfPlayers: minAmountOfPlayers,
              maxAmountOfPlayers: maxAmountOfPlayers,
              attemptedAt: attemptedAt,
              locationId: location.id!,
              locationAdditionalInfo:
                  normalizedLocationAdditionalInfo?.isEmpty == true
                  ? null
                  : normalizedLocationAdditionalInfo,
              playerDataId: playerData.id!,
            ),
            transaction: transaction,
          );

          await MatchSchedulePairingAttempt.db.attachRow.location(
            session,
            match,
            location,
            transaction: transaction,
          );
          await MatchSchedulePairingAttempt.db.attachRow.host(
            session,
            match,
            playerData,
            transaction: transaction,
          );

          final chatHistory = await MatchChatHistory.db.insertRow(
            session,
            MatchChatHistory(
              content: '',
              matchSchedulePairingAttemptId: match.id!,
            ),
            transaction: transaction,
          );

          await MatchChatHistory.db.attachRow.matchSchedulePairingAttempt(
            session,
            chatHistory,
            match,
            transaction: transaction,
          );

          await MatchChatParticipantStateService.ensureParticipantStateExists(
            session,
            language: language,
            chatHistory: chatHistory,
            playerData: playerData,
            initialUnreadMessagesCount: 0,
            initialLastReadMessageAt: DateTime.now(),
            transaction: transaction,
          );

          if (hostWillPlay) {
            final hostSubscription = await MatchSubscription.db.insertRow(
              session,
              MatchSubscription(
                subscribedAt: DateTime.now(),
                matchSchedulePairingAttemptId: match.id!,
                playerDataId: playerData.id!,
              ),
              transaction: transaction,
            );

            await MatchSubscription.db.attachRow.matchSchedulePairingAttempt(
              session,
              hostSubscription,
              match,
              transaction: transaction,
            );
            await MatchSubscription.db.attachRow.playerData(
              session,
              hostSubscription,
              playerData,
              transaction: transaction,
            );
          }

          return match;
        });

        try {
          await NearbyMatchPushNotificationService.notifyPlayersForNewMatch(
            session,
            matchSchedule: createdMatch,
            location: location,
            hostPlayerData: playerData,
          );
        } catch (error, stackTrace) {
          session.log(
            '[PushNotifications] Failed to dispatch nearby match '
            'notification. scheduledMatchId=${createdMatch.id} '
            'hostPlayerDataId=${playerData.id}',
            level: LogLevel.error,
            exception: error,
            stackTrace: stackTrace,
          );
        }

        return createdMatch;
      },
      language: language,
      fallbackDescription: t.fallback.unableToCreateMatchSchedule,
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
