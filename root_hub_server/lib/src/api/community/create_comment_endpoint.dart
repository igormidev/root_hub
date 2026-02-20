import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class CreateCommentEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<PostComment> v1(
    Session session, {
    required int postId,
    required String content,
    required Language language,
  }) async {
    return guardRootHubEndpointErrors(
      () async {
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

        final post = await Post.db.findById(session, postId);
        if (post == null) {
          throw RootHubEndpointError.notFound(
            title: 'Post not found',
            description: 'Post with id $postId not found.',
          );
        }

        final comment = PostComment(
          content: content,
          language: language,
          postId: post.id!,
          ownerId: playerData.id!,
        );

        final insertedComment = await PostComment.db.insertRow(
          session,
          comment,
        );

        await PostComment.db.attachRow.post(session, insertedComment, post);
        await PostComment.db.attachRow.owner(
          session,
          insertedComment,
          playerData,
        );

        return insertedComment;
      },
      fallbackDescription:
          'Unable to create the comment right now. Please try again.',
    );
  }
}
