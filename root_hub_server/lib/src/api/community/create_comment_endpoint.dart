import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:root_hub_server/src/core/server_translations.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class CreateCommentEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<PostComment> v1(
    Session session, {
    required ServerSupportedTranslation language,
    required int postId,
    required String content,
    required Language commentLanguage,
  }) async {
    final t = ServerTranslations.of(language);

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
            language: language,
            title: t.errors.playerProfileMissingTitle,
            description: t.errors.playerProfileNotFoundForAuthenticatedUser,
          );
        }

        final post = await Post.db.findById(session, postId);
        if (post == null) {
          throw RootHubEndpointError.notFound(
            language: language,
            title: t.errors.postNotFoundTitle,
            description: t.errors.postWithIdNotFound(postId: postId),
          );
        }

        final comment = PostComment(
          content: content,
          language: commentLanguage,
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
      language: language,
      fallbackDescription: t.fallback.unableToCreateComment,
    );
  }
}
