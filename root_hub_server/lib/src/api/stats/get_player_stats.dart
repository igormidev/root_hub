import 'package:root_hub_server/src/api/stats/mixins/stats_aggregation_mixin.dart';
import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:root_hub_server/src/core/utils.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class GetPlayerStats extends Endpoint with StatsAggregationMixin {
  @override
  bool get requireLogin => true;

  Future<PlayerStats?> v1(
    Session session,
  ) async {
    return guardRootHubEndpointErrors(
      () async {
        final playerData = await Utils.findAccountOfSession(session);
        final playerDataId = playerData?.id;
        if (playerDataId == null) {
          throw RootHubEndpointError.notFound(
            title: 'Player profile missing',
            description: 'Player profile not found for authenticated user.',
          );
        }

        final summary = await loadPlayerStatsSummary(
          session,
          playerDataId: playerDataId,
        );
        return summary?.toPlayerStats();
      },
      fallbackDescription:
          'Unable to load your stats right now. Please try again.',
    );
  }
}
