import 'package:root_hub_server/src/api/community/mixin/create_post_mixin.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class CreatePostEndpoint extends Endpoint with CreatePostMixin {
  @override
  bool get requireLogin => true;

  Future<Post> v1(
    Session session, {
    required String title,
    required String content,
    required Language language,
    int? attachedMatchId,
  }) async {
    return createPost(
      session,
      title: title,
      content: content,
      language: language,
      attachedMatchId: attachedMatchId,
    );
  }
}
