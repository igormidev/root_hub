import 'package:root_hub_server/src/core/settings.dart';
import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:root_hub_server/src/core/server_translations.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class GetCommentsEndpoint extends Endpoint {
  Future<CommentsPagination> v1(
    Session session, {
    required ServerSupportedTranslation language,
    required int postId,
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

        final post = await Post.db.findById(session, postId);
        if (post == null) {
          throw RootHubEndpointError.notFound(
            language: language,
            title: t.errors.postNotFoundTitle,
            description: t.errors.postWithIdNotFound(postId: postId),
          );
        }

        final pageSize = RootHubSettings.pageSizeCommentsInPost;

        Expression<dynamic> where(PostCommentTable t) {
          return t.postId.equals(post.id!);
        }

        final totalCount = await PostComment.db.count(session, where: where);

        final comments = await PostComment.db.find(
          session,
          where: where,
          orderBy: (t) => t.id,
          limit: pageSize,
          offset: (page - 1) * pageSize,
          include: PostComment.include(
            owner: PlayerData.include(),
          ),
        );

        final totalPages = (totalCount / pageSize).ceil();

        return CommentsPagination(
          comments: comments,
          paginationMetadata: PaginationMetadata(
            currentPage: page,
            itemsInCurrentPageCount: comments.length,
            totalItemsCount: totalCount,
            totalPagesCount: totalPages,
            hasNextPage: page < totalPages,
            hasPreviousPage: page > 1,
          ),
        );
      },
      language: language,
      fallbackDescription: t.fallback.unableToLoadComments,
    );
  }
}
