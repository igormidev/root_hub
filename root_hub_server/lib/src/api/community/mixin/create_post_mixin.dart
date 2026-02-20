import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

mixin CreatePostMixin {
  Future<Post> createPost(
    Session session, {
    required String title,
    required String content,
    required Language language,
    int? attachedMatchId,
  }) async {
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

    PlayedMatch? match;
    if (attachedMatchId != null) {
      match = await PlayedMatch.db.findById(session, attachedMatchId);
      if (match == null) {
        throw RootHubEndpointError.notFound(
          title: 'Match not found',
          description: 'Match with id $attachedMatchId not found.',
        );
      }
    }

    final post = Post(
      createdAt: DateTime.now(),
      title: title,
      content: content,
      likesCount: 0,
      language: language,
    );

    final insertedPost = await Post.db.insertRow(session, post);

    await Post.db.attachRow.author(session, insertedPost, playerData);

    if (match != null) {
      await Post.db.attachRow.attachedMatch(session, insertedPost, match);
    }

    return insertedPost;
  }
}
