import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:root_hub_server/src/core/server_translations.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class GetPendingMatchResults extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<List<MatchSchedulePairingAttempt>> v1(
    Session session, {
    required ServerSupportedTranslation language,
  }) async {
    final t = ServerTranslations.of(language);

    return guardRootHubEndpointErrors(
      () async {
        final playerData = await _getAuthenticatedPlayerData(
          session,
          language: language,
        );

        final hostedSchedules = await MatchSchedulePairingAttempt.db.find(
          session,
          where: (t) => t.playerDataId.equals(playerData.id!),
        );
        final hostedScheduleIds = hostedSchedules
            .map((schedule) => schedule.id)
            .whereType<int>();

        final subscriptions = await MatchSubscription.db.find(
          session,
          where: (t) => t.playerDataId.equals(playerData.id!),
        );
        final subscribedScheduleIds = subscriptions
            .map((subscription) => subscription.matchSchedulePairingAttemptId);

        final candidateScheduleIds = <int>{
          ...hostedScheduleIds,
          ...subscribedScheduleIds,
        };

        if (candidateScheduleIds.isEmpty) {
          return const <MatchSchedulePairingAttempt>[];
        }

        final playedMatches = await PlayedMatch.db.find(
          session,
          where: (t) => t.scheduledPairingAttemptId.inSet(candidateScheduleIds),
        );

        final promotedScheduleIds = playedMatches
            .map((playedMatch) => playedMatch.scheduledPairingAttemptId)
            .toSet();

        final pendingScheduleIds = candidateScheduleIds.difference(
          promotedScheduleIds,
        );

        if (pendingScheduleIds.isEmpty) {
          return const <MatchSchedulePairingAttempt>[];
        }

        final pendingSchedules = await MatchSchedulePairingAttempt.db.find(
          session,
          where: (t) => t.id.inSet(pendingScheduleIds),
          orderBy: (t) => t.attemptedAt,
          orderDescending: true,
          include: MatchSchedulePairingAttempt.include(
            location: Location.include(
              googlePlaceLocation: GooglePlaceLocation.include(),
              manualInputLocation: ManualInputLocation.include(),
            ),
            host: PlayerData.include(),
            subscriptions: MatchSubscription.includeList(),
          ),
        );

        return pendingSchedules;
      },
      language: language,
      fallbackDescription: t.fallback.unableToLoadPendingMatchReports,
    );
  }

  Future<PlayerData> _getAuthenticatedPlayerData(
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
}
