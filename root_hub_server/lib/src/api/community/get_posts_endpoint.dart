import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:root_hub_server/src/core/server_translations.dart';
import 'package:root_hub_server/src/core/settings.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class GetPostsEndpoint extends Endpoint {
  Future<PostPagination> v1(
    Session session, {
    required ServerSupportedTranslation language,
    required int page,
    Language? postLanguage,
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

        final pageSize = RootHubSettings.pageSizePosts;

        Expression<dynamic> where(PostTable t) {
          Expression<dynamic> expr = Constant.bool(true);
          if (postLanguage != null) {
            expr = t.language.equals(postLanguage);
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
      },
      language: language,
      fallbackDescription: t.fallback.unableToLoadPosts,
    );
  }
}
