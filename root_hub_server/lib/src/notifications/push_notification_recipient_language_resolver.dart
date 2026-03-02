import 'package:root_hub_server/src/core/server_translations.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class PushNotificationRecipientLanguageResolver {
  const PushNotificationRecipientLanguageResolver._();

  static Future<Map<ServerSupportedTranslation, Set<int>>> groupPlayerDataIds(
    Session session, {
    required Set<int> playerDataIds,
  }) async {
    if (playerDataIds.isEmpty) {
      return const <ServerSupportedTranslation, Set<int>>{};
    }

    final players = await PlayerData.db.find(
      session,
      where: (t) => t.id.inSet(playerDataIds),
    );

    final groupedIds = <ServerSupportedTranslation, Set<int>>{};
    final unresolvedIds = <int>{...playerDataIds};

    for (final player in players) {
      final playerId = player.id;
      if (playerId == null) {
        continue;
      }

      unresolvedIds.remove(playerId);
      final translation = player.preferredLanguage.toServerSupportedTranslation;
      groupedIds.putIfAbsent(translation, () => <int>{}).add(playerId);
    }

    if (unresolvedIds.isNotEmpty) {
      groupedIds
          .putIfAbsent(ServerSupportedTranslation.english, () => <int>{})
          .addAll(unresolvedIds);
    }

    return groupedIds;
  }
}
