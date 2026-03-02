import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:root_hub_server/src/core/server_translations.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class CancelMatchSchedule extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<MatchSchedulePairingAttempt> v1(
    Session session, {
    required ServerSupportedTranslation language,
    required int scheduledMatchId,
    required MatchScheduleNotPlayedReason notPlayedReason,
    String? notPlayedReasonDetails,
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

        final normalizedReasonDetails = notPlayedReasonDetails?.trim();
        final normalizedOptionalReasonDetails =
            normalizedReasonDetails == null || normalizedReasonDetails.isEmpty
            ? null
            : normalizedReasonDetails;

        if (notPlayedReason == MatchScheduleNotPlayedReason.other &&
            normalizedOptionalReasonDetails == null) {
          throw RootHubEndpointError.invalidRequest(
            language: language,
            description: t.errors.cancellationDetailsRequiredForOtherReason,
          );
        }

        final authenticatedPlayerData = await _getAuthenticatedPlayerData(
          session,
          language: language,
        );

        final scheduledPairingAttempt = await MatchSchedulePairingAttempt.db
            .findById(
              session,
              scheduledMatchId,
              include: MatchSchedulePairingAttempt.include(
                playedMatch: PlayedMatch.include(),
              ),
            );

        if (scheduledPairingAttempt == null) {
          throw RootHubEndpointError.notFound(
            language: language,
            title: t.errors.scheduledMatchNotFoundTitle,
            description: t.errors.scheduledMatchWithIdNotFound(
              scheduledMatchId: scheduledMatchId,
            ),
          );
        }

        if (scheduledPairingAttempt.status == MatchScheduleStatus.played ||
            scheduledPairingAttempt.playedMatch != null) {
          throw RootHubEndpointError.invalidRequest(
            language: language,
            description: t.errors.scheduledMatchAlreadyHasResult,
          );
        }

        if (scheduledPairingAttempt.status == MatchScheduleStatus.notPlayed) {
          throw RootHubEndpointError.invalidRequest(
            language: language,
            description: t.errors.scheduledMatchAlreadyMarkedAsNotPlayed,
          );
        }

        final authenticatedPlayerDataId = authenticatedPlayerData.id!;
        final isHost =
            scheduledPairingAttempt.playerDataId == authenticatedPlayerDataId;

        if (!isHost) {
          final isSubscribed = await MatchSubscription.db.findFirstRow(
            session,
            where: (t) =>
                t.matchSchedulePairingAttemptId.equals(scheduledMatchId) &
                t.playerDataId.equals(authenticatedPlayerDataId),
          );

          if (isSubscribed == null) {
            throw RootHubEndpointError.accessDenied(
              language: language,
              description: t.errors.onlyHostOrSubscribedCanCancelMatch,
            );
          }
        }

        return await session.db.transaction((transaction) async {
          scheduledPairingAttempt
            ..status = MatchScheduleStatus.notPlayed
            ..notPlayedReason = notPlayedReason
            ..notPlayedReasonDetails = normalizedOptionalReasonDetails
            ..notPlayedMarkedByPlayerDataId = authenticatedPlayerDataId;

          final updatedSchedule = await MatchSchedulePairingAttempt.db
              .updateRow(
                session,
                scheduledPairingAttempt,
                transaction: transaction,
              );

          await MatchSchedulePairingAttempt.db.attachRow.notPlayedMarkedBy(
            session,
            updatedSchedule,
            authenticatedPlayerData,
            transaction: transaction,
          );

          return updatedSchedule;
        });
      },
      language: language,
      fallbackDescription: t.fallback.unableToCancelScheduledMatch,
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
