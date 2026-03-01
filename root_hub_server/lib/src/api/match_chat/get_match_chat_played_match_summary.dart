import 'package:root_hub_server/src/api/match_chat/match_chat_participant_state_service.dart';
import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:root_hub_server/src/core/server_translations.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class GetMatchChatPlayedMatchSummary extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<MatchChatPlayedMatchSummary?> v1(
    Session session, {
    required ServerSupportedTranslation language,
    required int scheduledMatchId,
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

        await MatchChatParticipantStateService.getAuthenticatedPlayerData(
          session,
          language: language,
        );

        final schedule = await MatchSchedulePairingAttempt.db.findById(
          session,
          scheduledMatchId,
          include: MatchSchedulePairingAttempt.include(
            location: Location.include(
              googlePlaceLocation: GooglePlaceLocation.include(),
              manualInputLocation: ManualInputLocation.include(),
            ),
            playedMatch: PlayedMatch.include(
              inPersonProof: MatchInPersonProof.include(),
              playerPerfomances: PlayerPerfomanceInMatch.includeList(
                include: PlayerPerfomanceInMatch.include(
                  playerData: PlayerData.include(),
                  anonymousPlayer: AnonymousPlayer.include(),
                ),
              ),
            ),
          ),
        );

        if (schedule == null) {
          throw RootHubEndpointError.notFound(
            language: language,
            title: t.errors.scheduledMatchNotFoundTitle,
            description: t.errors.scheduledMatchWithIdNotFound(
              scheduledMatchId: scheduledMatchId,
            ),
          );
        }

        final playedMatch = schedule.playedMatch;
        if (playedMatch == null) {
          return null;
        }

        final mappedPlayers =
            (playedMatch.playerPerfomances ?? const <PlayerPerfomanceInMatch>[])
                .map(
                  (performance) => MatchChatPlayedMatchPlayer(
                    displayName: _resolvePlayerDisplayName(
                      performance,
                      language: language,
                    ),
                    faction: performance.factionUsedInMatch,
                    didWin: performance.didWin,
                    score: performance.scoreInMatch,
                    isAnonymous: performance.playerData == null,
                  ),
                )
                .toList()
              ..sort(_comparePlayedMatchPlayers);

        MatchChatPlayedMatchPlayer? winnerPlayer;
        for (final player in mappedPlayers) {
          if (player.didWin) {
            winnerPlayer = player;
            break;
          }
        }

        final locationTitle = _resolveLocationTitle(
          schedule.location,
          language: language,
        );
        final locationSubtitle = _resolveLocationSubtitle(schedule.location);
        final proof = playedMatch.inPersonProof;

        return MatchChatPlayedMatchSummary(
          scheduledMatchId: schedule.id!,
          matchTitle: schedule.title,
          attemptedAt: schedule.attemptedAt,
          matchStartedAt: playedMatch.matchStartedAt,
          matchEstimatedDuration: playedMatch.matchEstimatedDuration,
          locationTitle: locationTitle,
          locationSubtitle: locationSubtitle,
          winnerDisplayName: winnerPlayer?.displayName,
          winnerFaction: winnerPlayer?.faction,
          winnerScore: winnerPlayer?.score,
          players: mappedPlayers,
          groupPhotoUrl: proof?.groupPhotoUrl,
          boardPhotoUrl: proof?.boardPhotoUrl,
        );
      },
      language: language,
      fallbackDescription: t.fallback.unableToLoadPlayedMatchSummary,
    );
  }

  String _resolvePlayerDisplayName(
    PlayerPerfomanceInMatch performance, {
    required ServerSupportedTranslation language,
  }) {
    final t = ServerTranslations.of(language);

    final playerData = performance.playerData;
    if (playerData != null) {
      return playerData.displayName;
    }

    final anonymousPlayer = performance.anonymousPlayer;
    if (anonymousPlayer != null) {
      return '${anonymousPlayer.firstName} ${anonymousPlayer.lastName}'.trim();
    }

    return t.errors.unknownPlayer;
  }

  int _comparePlayedMatchPlayers(
    MatchChatPlayedMatchPlayer a,
    MatchChatPlayedMatchPlayer b,
  ) {
    if (a.didWin != b.didWin) {
      return a.didWin ? -1 : 1;
    }

    final aScore = a.score;
    final bScore = b.score;
    if (aScore == null && bScore == null) {
      return a.displayName.compareTo(b.displayName);
    }
    if (aScore == null) {
      return 1;
    }
    if (bScore == null) {
      return -1;
    }

    return bScore.compareTo(aScore);
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
}
