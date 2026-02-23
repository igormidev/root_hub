import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart';

class GetMatchScheduleInfo extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<MatchScheduleInfo> v1(
    Session session, {
    required int scheduledMatchId,
  }) async {
    return guardRootHubEndpointErrors(
      () async {
        if (scheduledMatchId <= 0) {
          throw RootHubEndpointError.invalidRequest(
            description: 'Scheduled match id must be greater than zero.',
          );
        }

        final matchSchedule = await MatchSchedulePairingAttempt.db.findById(
          session,
          scheduledMatchId,
          include: MatchSchedulePairingAttempt.include(
            location: Location.include(
              googlePlaceLocation: GooglePlaceLocation.include(),
              manualInputLocation: ManualInputLocation.include(
                creator: PlayerData.include(
                  authUser: AuthUser.include(),
                ),
              ),
            ),
            host: PlayerData.include(
              authUser: AuthUser.include(),
            ),
            subscriptions: MatchSubscription.includeList(
              orderBy: (t) => t.subscribedAt,
              include: MatchSubscription.include(
                playerData: PlayerData.include(
                  authUser: AuthUser.include(),
                ),
              ),
            ),
          ),
        );

        if (matchSchedule == null) {
          throw RootHubEndpointError.notFound(
            title: 'Scheduled match not found',
            description:
                'Scheduled match with id $scheduledMatchId was not found.',
          );
        }

        final subscriptions =
            matchSchedule.subscriptions ?? const <MatchSubscription>[];

        final playerSnapshots = await Future.wait(
          subscriptions.map((subscription) async {
            final playerData = subscription.playerData;
            if (playerData == null) {
              return null;
            }

            final profile = await AuthServices.instance.userProfiles
                .maybeFindUserProfileByUserId(
                  session,
                  playerData.authUserId,
                );

            return MatchSchedulePlayerSnapshot(
              playerData: playerData,
              subscribedAt: subscription.subscribedAt,
              profileImageUrl: profile?.imageUrl?.toString(),
            );
          }),
        );

        return MatchScheduleInfo(
          matchSchedule: matchSchedule,
          players: playerSnapshots
              .whereType<MatchSchedulePlayerSnapshot>()
              .toList(),
        );
      },
      fallbackDescription:
          'Unable to load scheduled match details right now. Please try again.',
    );
  }
}
