import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:root_hub_server/src/core/server_translations.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class GetPendingMatchResultsCount extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<int> v1(
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
        final subscribedScheduleIds = subscriptions.map(
          (subscription) => subscription.matchSchedulePairingAttemptId,
        );

        final candidateScheduleIds = <int>{
          ...hostedScheduleIds,
          ...subscribedScheduleIds,
        };

        if (candidateScheduleIds.isEmpty) {
          return 0;
        }

        final pendingSchedulesCount = await MatchSchedulePairingAttempt.db
            .count(
              session,
              where: (t) =>
                  t.id.inSet(candidateScheduleIds) &
                  t.status.equals(MatchScheduleStatus.scheduled),
            );

        return pendingSchedulesCount;
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
