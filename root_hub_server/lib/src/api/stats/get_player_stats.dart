import 'package:root_hub_server/src/api/stats/mixins/stats_aggregation_mixin.dart';
import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:root_hub_server/src/core/server_translations.dart';
import 'package:root_hub_server/src/core/utils.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class GetPlayerStats extends Endpoint with StatsAggregationMixin {
  @override
  bool get requireLogin => true;

  Future<PlayerStats?> v1(
    Session session, {
    required ServerSupportedTranslation language,
  }) async {
    final t = ServerTranslations.of(language);

    return guardRootHubEndpointErrors(
      () async {
        final playerData = await Utils.findAccountOfSession(session);
        final playerDataId = playerData?.id;
        if (playerDataId == null) {
          throw RootHubEndpointError.notFound(
            language: language,
            title: t.errors.playerProfileMissingTitle,
            description: t.errors.playerProfileNotFoundForAuthenticatedUser,
          );
        }

        final summary = await loadPlayerStatsSummary(
          session,
          playerDataId: playerDataId,
        );
        return summary?.toPlayerStats();
      },
      language: language,
      fallbackDescription: t.fallback.unableToLoadYourStats,
    );
  }
}
