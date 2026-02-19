import 'package:root_hub_server/src/core/settings.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class CommentsEndpoint extends Endpoint {
  Future<CommentsPagination> getComments(
    Session session, {
    required int postId,
    required int page,
  }) async {
    final pageSize = RootHubSettings.pageSizeCommentsInPost;

    Expression<dynamic> where(PostCommentTable t) {
      return t.postId.equals(postId);
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
  }
}
