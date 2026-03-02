import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:root_hub_server/src/core/server_translations.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class SearchRegisteredPlayers extends Endpoint {
  static const _defaultResultsLimit = 40;

  @override
  bool get requireLogin => true;

  Future<List<RegisteredPlayerSearchResult>> v1(
    Session session, {
    required ServerSupportedTranslation language,
    required String query,
  }) async {
    final t = ServerTranslations.of(language);

    return guardRootHubEndpointErrors(
      () async {
        final normalizedQuery = _normalizeQuery(query);

        final players = await PlayerData.db.find(
          session,
          where: normalizedQuery.isEmpty
              ? null
              : (t) => t.displayName.ilike('%$normalizedQuery%'),
          orderBy: (t) => t.displayName,
          limit: normalizedQuery.isEmpty ? _defaultResultsLimit : null,
        );

        return players
            .where((player) => player.id != null)
            .map(
              (player) => RegisteredPlayerSearchResult(
                playerDataId: player.id!,
                displayName: player.displayName,
              ),
            )
            .toList();
      },
      language: language,
      fallbackDescription: t.fallback.unableToSearchRegisteredPlayers,
    );
  }

  String _normalizeQuery(String rawQuery) {
    return rawQuery.trim().replaceAll(RegExp(r'\s+'), ' ');
  }
}
