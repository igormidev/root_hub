import 'package:root_hub_server/src/api/match_chat/player_schedule_pagination_service.dart';
import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:root_hub_server/src/core/server_translations.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class GetPlayerActiveSchedules extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<PlayerSchedulesPagination> v1(
    Session session, {
    required ServerSupportedTranslation language,
    required int page,
  }) async {
    final t = ServerTranslations.of(language);

    return guardRootHubEndpointErrors(
      () async {
        if (page < 1) {
          throw RootHubEndpointError.invalidRequest(
            language: language,
            description: t.errors.pageMustBeAtLeastOne,
          );
        }

        return PlayerSchedulePaginationService.loadPage(
          session,
          language: language,
          page: page,
          pageType: PlayerSchedulePageType.active,
        );
      },
      language: language,
      fallbackDescription: t.fallback.unableToLoadSubscribedMatches,
    );
  }
}
