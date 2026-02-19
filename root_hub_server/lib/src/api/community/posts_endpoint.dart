import 'package:root_hub_server/src/core/settings.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class PostsEndpoint extends Endpoint {
  Future<PostPagination> getPosts(
    Session session, {
    required int page,
  }) async {
    Expression<dynamic> whereClaude(PostTable t) {
      return Constant.bool(true);
    }

    final int totalCount = await Post.db.count(
      session,
      where: whereClaude,
    );
    final posts = Post.db.find(
      session,
      where: whereClaude,
      limit: RootHubSettings.pageSizePosts,
    );

    throw UnimplementedError();
  }
}
