import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:root_hub_server/src/core/server_translations.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class GetMyMatches extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<List<PlayedMatch>> v1(
    Session session, {
    required ServerSupportedTranslation language,
  }) async {
    final t = ServerTranslations.of(language);

    return guardRootHubEndpointErrors(
      () async {
        throw RootHubEndpointError.endpointUnavailable(
          language: language,
          description: t.errors.getMyPlayedMatchesNotImplemented,
        );
      },
      language: language,
      fallbackDescription: t.fallback.unableToLoadPlayedMatches,
    );
  }
}
