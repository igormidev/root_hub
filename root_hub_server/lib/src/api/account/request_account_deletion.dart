import 'package:email_validator/email_validator.dart';
import 'package:root_hub_server/src/account_deletion/account_deletion_request_service.dart';
import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:root_hub_server/src/core/server_translations.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class RequestAccountDeletion extends Endpoint {
  @override
  bool get requireLogin => false;

  Future<void> v1(
    Session session, {
    required ServerSupportedTranslation language,
    required String email,
  }) async {
    final t = ServerTranslations.of(language);

    return guardRootHubEndpointErrors(
      () async {
        final normalizedEmail = email.trim().toLowerCase();
        if (!EmailValidator.validate(normalizedEmail)) {
          throw RootHubEndpointError.invalidRequest(
            language: language,
            description: t.errors.accountDeletionEmailInvalid,
          );
        }

        await AccountDeletionRequestService.createAndNotify(
          session,
          email: normalizedEmail,
        );
      },
      language: language,
      fallbackDescription: t.fallback.unableToRegisterAccountDeletionRequest,
    );
  }
}
