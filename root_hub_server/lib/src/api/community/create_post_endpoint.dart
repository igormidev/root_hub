import 'package:root_hub_server/src/api/community/mixin/create_post_mixin.dart';
import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:root_hub_server/src/core/server_translations.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class CreatePostEndpoint extends Endpoint with CreatePostMixin {
  @override
  bool get requireLogin => true;

  Future<Post> v1(
    Session session, {
    required ServerSupportedTranslation language,
    required String title,
    required String content,
    required Language postLanguage,
    int? attachedMatchId,
  }) async {
    final t = ServerTranslations.of(language);

    return guardRootHubEndpointErrors(
      () => createPost(
        session,
        language: language,
        title: title,
        content: content,
        postLanguage: postLanguage,
        attachedMatchId: attachedMatchId,
      ),
      language: language,
      fallbackDescription: t.fallback.unableToCreatePost,
    );
  }
}
