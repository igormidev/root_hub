import 'package:root_hub_server/src/api/match_chat/match_chat_participant_state_service.dart';
import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:serverpod/serverpod.dart';

class GetMatchChatUnreadCount extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<int> v1(Session session) async {
    return guardRootHubEndpointErrors(
      () async {
        final playerData =
            await MatchChatParticipantStateService.getAuthenticatedPlayerData(
              session,
            );
        final playerDataId = playerData.id!;

        final unreadResult = await session.db.unsafeQuery(
          '''
          SELECT
            COALESCE(SUM("unreadMessagesCount"), 0)::bigint AS unread_total
          FROM match_chat_participant_state
          WHERE "playerDataId" = @playerDataId
            AND "unreadMessagesCount" > 0
          ''',
          parameters: QueryParameters.named(
            <String, Object?>{
              'playerDataId': playerDataId,
            },
          ),
        );

        if (unreadResult.isEmpty) {
          return 0;
        }

        final unreadValue = unreadResult.first.toColumnMap()['unread_total'];
        if (unreadValue is int) {
          return unreadValue;
        }
        if (unreadValue is BigInt) {
          return unreadValue.toInt();
        }
        if (unreadValue is num) {
          return unreadValue.toInt();
        }

        return 0;
      },
      fallbackDescription:
          'Unable to load unread chat count right now. Please try again.',
    );
  }
}
