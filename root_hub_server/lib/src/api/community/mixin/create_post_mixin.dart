import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:root_hub_server/src/core/server_translations.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

mixin CreatePostMixin {
  Future<Post> createPost(
    Session session, {
    required ServerSupportedTranslation language,
    required String title,
    required String content,
    required Language postLanguage,
    int? attachedMatchId,
  }) async {
    final t = ServerTranslations.of(language);

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

    PlayedMatch? match;
    if (attachedMatchId != null) {
      match = await PlayedMatch.db.findById(session, attachedMatchId);
      if (match == null) {
        throw RootHubEndpointError.notFound(
          language: language,
          title: t.errors.matchNotFoundTitle,
          description: t.errors.matchWithIdNotFound(matchId: attachedMatchId),
        );
      }
    }

    final post = Post(
      createdAt: DateTime.now(),
      title: title,
      content: content,
      likesCount: 0,
      language: postLanguage,
    );

    final insertedPost = await Post.db.insertRow(session, post);

    await Post.db.attachRow.author(session, insertedPost, playerData);

    if (match != null) {
      await Post.db.attachRow.attachedMatch(session, insertedPost, match);
    }

    return insertedPost;
  }
}
