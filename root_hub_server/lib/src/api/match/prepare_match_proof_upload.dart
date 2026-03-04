import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:root_hub_server/src/core/server_translations.dart';
import 'package:root_hub_server/src/core/uploadthing_storage_client.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class PrepareMatchProofUpload extends Endpoint {
  static const _uploadThingStorageClient = UploadThingStorageClient();
  static const _maxProofImageBytes = 3 * 1024 * 1024;
  static const _allowedImageContentTypePrefixes = <String>{'image/'};

  @override
  bool get requireLogin => true;

  Future<MatchProofUploadPreparation> v1(
    Session session, {
    required ServerSupportedTranslation language,
    required String fileName,
    required String contentType,
    required int fileSizeBytes,
  }) async {
    final t = ServerTranslations.of(language);

    return guardRootHubEndpointErrors(
      () async {
        final normalizedContentType = _normalizeContentType(contentType);

        if (fileSizeBytes <= 0) {
          throw RootHubEndpointError.invalidRequest(
            language: language,
            title: t.errors.invalidMatchRegistrationTitle,
            description: t.errors.imageRequired(
              imageDescription: t.labels.image,
            ),
          );
        }

        if (fileSizeBytes > _maxProofImageBytes) {
          throw RootHubEndpointError.invalidRequest(
            language: language,
            title: t.errors.invalidMatchRegistrationTitle,
            description: t.errors.imageTooLargeWithDescription(
              imageDescription: t.labels.image,
            ),
          );
        }

        if (!_isSupportedImageContentType(normalizedContentType)) {
          throw RootHubEndpointError.invalidRequest(
            language: language,
            title: t.errors.invalidMatchRegistrationTitle,
            description: t.errors.imageContentTypeMustBeImage(
              imageDescription: t.labels.image,
            ),
          );
        }

        final preparedUpload = await _uploadThingStorageClient
            .preparePublicImageUpload(
              session,
              language: language,
              fileName: fileName,
              fileSize: fileSizeBytes,
              contentType: normalizedContentType,
            );

        return MatchProofUploadPreparation(
          uploadUrl: preparedUpload.uploadUrl,
          uploadKey: preparedUpload.uploadKey,
        );
      },
      language: language,
      fallbackDescription: t.fallback.unableToUploadImage,
    );
  }

  String _normalizeContentType(String contentType) {
    final normalized = contentType.trim().toLowerCase();
    if (normalized.isEmpty) {
      return '';
    }

    return normalized.split(';').first.trim();
  }

  bool _isSupportedImageContentType(String contentType) {
    if (contentType.isEmpty) {
      return false;
    }

    for (final prefix in _allowedImageContentTypePrefixes) {
      if (contentType.startsWith(prefix)) {
        return true;
      }
    }

    return false;
  }
}
