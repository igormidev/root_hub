import 'package:root_hub_server/src/core/settings.dart';
import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class GetCommentsEndpoint extends Endpoint {
  Future<CommentsPagination> v1(
    Session session, {
    required int postId,
    required int page,
  }) async {
    return guardRootHubEndpointErrors(
      () async {
        if (page < 1) {
          throw RootHubEndpointError.invalidRequest(
            description: 'Page must be greater than or equal to 1.',
          );
        }

        final post = await Post.db.findById(session, postId);
        if (post == null) {
          throw RootHubEndpointError.notFound(
            title: 'Post not found',
            description: 'Post with id $postId not found.',
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
      fallbackDescription:
          'Unable to load comments right now. Please try again.',
    );
  }
}
