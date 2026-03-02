import 'package:root_hub_server/src/api/stats/mixins/stats_aggregation_mixin.dart';
import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:root_hub_server/src/core/server_translations.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class GetPlatformStats extends Endpoint with StatsAggregationMixin {
  @override
  bool get requireLogin => true;

  Future<PlatformStats?> v1(
    Session session, {
    required ServerSupportedTranslation language,
  }) async {
    final t = ServerTranslations.of(language);

    return guardRootHubEndpointErrors(
      () async {
        final summary = await loadPlatformStatsSummary(session);
        return summary?.toPlatformStats();
      },
      language: language,
      fallbackDescription: t.fallback.unableToLoadPlatformStats,
    );
  }
}
