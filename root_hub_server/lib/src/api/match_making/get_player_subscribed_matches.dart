import 'package:root_hub_server/src/core/settings.dart';
import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class GetPlayerSubscribedMatches extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<SubscribedMatchesPagination> v1(
    Session session, {
    required int page,
  }) async {
    return guardRootHubEndpointErrors(
      () async {
        if (page < 1) {
          throw RootHubEndpointError.invalidRequest(
            description: 'Page must be greater than or equal to 1.',
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
            title: 'Player profile missing',
            description: 'Player profile not found for authenticated user.',
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
      fallbackDescription:
          'Unable to load subscribed matches right now. Please try again.',
    );
  }
}
