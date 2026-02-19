import 'package:root_hub_server/src/core/settings.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class GetPostsEndpoint extends Endpoint {
  Future<PostPagination> v1(
    Session session, {
    required int page,
    Language? language,
  }) async {
    final pageSize = RootHubSettings.pageSizePosts;

    Expression<dynamic> where(PostTable t) {
      Expression<dynamic> expr = Constant.bool(true);
      if (language != null) {
        expr = t.language.equals(language);
      }
      return expr;
    }

    final totalCount = await Post.db.count(session, where: where);

    final posts = await Post.db.find(
      session,
      where: where,
      orderBy: (t) => t.createdAt,
      orderDescending: true,
      limit: pageSize,
      offset: (page - 1) * pageSize,
      include: Post.include(
        author: PlayerData.include(),
        attachedMatch: PlayedMatch.include(),
      ),
    );

    final totalPages = (totalCount / pageSize).ceil();

    return PostPagination(
      posts: posts,
      paginationMetadata: PaginationMetadata(
        currentPage: page,
        itemsInCurrentPageCount: posts.length,
        totalItemsCount: totalCount,
        totalPagesCount: totalPages,
        hasNextPage: page < totalPages,
        hasPreviousPage: page > 1,
      ),
    );
  }
}
