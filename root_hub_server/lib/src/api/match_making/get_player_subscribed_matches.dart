import 'package:root_hub_server/src/core/settings.dart';
import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:root_hub_server/src/core/server_translations.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class GetPlayerSubscribedMatches extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<SubscribedMatchesPagination> v1(
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

        final pageSize = RootHubSettings.pageSizeSubscribedMatches;
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

        Expression<dynamic> where(MatchSubscriptionTable t) {
          return t.playerDataId.equals(playerData.id!);
        }

        final totalCount = await MatchSubscription.db.count(
          session,
          where: where,
        );

        final subscriptions = await MatchSubscription.db.find(
          session,
          where: where,
          orderBy: (t) => t.subscribedAt,
          orderDescending: true,
          limit: pageSize,
          offset: (page - 1) * pageSize,
          include: MatchSubscription.include(
            matchSchedulePairingAttempt: MatchSchedulePairingAttempt.include(
              location: Location.include(
                googlePlaceLocation: GooglePlaceLocation.include(),
                manualInputLocation: ManualInputLocation.include(),
              ),
            ),
          ),
        );

        final totalPages = (totalCount / pageSize).ceil();

        return SubscribedMatchesPagination(
          matches: subscriptions,
          paginationMetadata: PaginationMetadata(
            currentPage: page,
            itemsInCurrentPageCount: subscriptions.length,
            totalItemsCount: totalCount,
            totalPagesCount: totalPages,
            hasNextPage: page < totalPages,
            hasPreviousPage: page > 1,
          ),
        );
      },
      language: language,
      fallbackDescription: t.fallback.unableToLoadSubscribedMatches,
    );
  }
}
