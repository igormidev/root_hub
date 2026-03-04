import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:root_hub_server/src/core/server_translations.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class EditMatchSchedule extends Endpoint {
  @override
  bool get requireLogin => true;

  static const _maxScheduleDays = 15;
  static const _minScheduleMinutes = 10;
  static const _maxDescriptionLength = 1000;

  Future<void> v1(
    Session session, {
    required ServerSupportedTranslation language,
    required int scheduledMatchId,
    required String title,
    String? description,
    required MatchPodium minAmountOfPlayers,
    required MatchPodium maxAmountOfPlayers,
    required DateTime attemptedAt,
    bool? closedForSubscriptions,
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

        final normalizedTitle = title.trim();
        if (normalizedTitle.isEmpty) {
          throw RootHubEndpointError.invalidRequest(
            language: language,
            description: t.errors.titleCannotBeEmpty,
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

        final hostPlayerData = await PlayerData.db.findFirstRow(
          session,
          where: (t) => t.authUserId.equals(authUserId),
        );

        if (hostPlayerData == null) {
          throw RootHubEndpointError.notFound(
            language: language,
            title: t.errors.playerProfileMissingTitle,
            description: t.errors.playerProfileNotFoundForAuthenticatedUser,
          );
        }

        final matchSchedule = await MatchSchedulePairingAttempt.db.findById(
          session,
          scheduledMatchId,
          include: MatchSchedulePairingAttempt.include(
            subscriptions: MatchSubscription.includeList(),
          ),
        );

        if (matchSchedule == null) {
          throw RootHubEndpointError.notFound(
            language: language,
            title: t.errors.tableNotFoundTitle,
            description: t.errors.selectedTableWasNotFound,
          );
        }

        if (matchSchedule.playerDataId != hostPlayerData.id) {
          throw RootHubEndpointError.accessDenied(
            language: language,
            description: t.errors.onlyHostCanEditTable,
          );
        }

        if (matchSchedule.status != MatchScheduleStatus.scheduled) {
          throw RootHubEndpointError.invalidRequest(
            language: language,
            description: t.errors.onlyScheduledMatchesCanBeEdited,
          );
        }

        final currentSubscriberCount = matchSchedule.subscriptions?.length ?? 0;
        if (maxPlayers < currentSubscriberCount) {
          throw RootHubEndpointError.invalidRequest(
            language: language,
            title: t.errors.tooManyPlayersTitle,
            description: t.errors.tooManyPlayersSubscribed(
              currentSubscriberCount: currentSubscriberCount,
            ),
          );
        }

        final normalizedDescription = description?.trim();
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

        matchSchedule
          ..title = normalizedTitle
          ..description = normalizedDescription?.isEmpty == true
              ? null
              : normalizedDescription
          ..minAmountOfPlayers = minAmountOfPlayers
          ..maxAmountOfPlayers = maxAmountOfPlayers
          ..attemptedAt = attemptedAt
          ..closedForSubscriptions = closedForSubscriptions;

        await MatchSchedulePairingAttempt.db.updateRow(
          session,
          matchSchedule,
        );

        session.log(
          '[MatchMaking] Match schedule updated. '
          'scheduledMatchId=$scheduledMatchId '
          'hostId=${hostPlayerData.id}',
          level: LogLevel.info,
        );
      },
      language: language,
      fallbackDescription: t.fallback.unableToUpdateTable,
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
