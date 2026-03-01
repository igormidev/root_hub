import 'package:root_hub_server/src/core/server_translations.dart';
import 'package:root_hub_server/src/generated/protocol.dart';

typedef EndpointOperation<T> = Future<T> Function();

class RootHubEndpointError {
  const RootHubEndpointError._();

  static RootHubException invalidRequest({
    required ServerSupportedTranslation language,
    required String description,
    String? title,
  }) {
    final translations = ServerTranslations.of(language);

    return RootHubException(
      title: title ?? translations.endpointErrorTitles.invalidRequest,
      description: description,
    );
  }

  static RootHubException notFound({
    required ServerSupportedTranslation language,
    required String description,
    String? title,
  }) {
    final translations = ServerTranslations.of(language);

    return RootHubException(
      title: title ?? translations.endpointErrorTitles.notFound,
      description: description,
    );
  }

  static RootHubException accessDenied({
    required ServerSupportedTranslation language,
    required String description,
    String? title,
  }) {
    final translations = ServerTranslations.of(language);

    return RootHubException(
      title: title ?? translations.endpointErrorTitles.accessDenied,
      description: description,
    );
  }

  static RootHubException configuration({
    required ServerSupportedTranslation language,
    required String description,
    String? title,
  }) {
    final translations = ServerTranslations.of(language);

    return RootHubException(
      title: title ?? translations.endpointErrorTitles.configuration,
      description: description,
    );
  }

  static RootHubException endpointUnavailable({
    required ServerSupportedTranslation language,
    required String description,
    String? title,
  }) {
    final translations = ServerTranslations.of(language);

    return RootHubException(
      title: title ?? translations.endpointErrorTitles.endpointUnavailable,
      description: description,
    );
  }

  static RootHubException unexpected({
    required ServerSupportedTranslation language,
    required String description,
    String? title,
  }) {
    final translations = ServerTranslations.of(language);

    return RootHubException(
      title: title ?? translations.endpointErrorTitles.unexpected,
      description: description,
    );
  }
}

Future<T> guardRootHubEndpointErrors<T>(
  EndpointOperation<T> operation, {
  required ServerSupportedTranslation language,
  String? fallbackDescription,
}) async {
  final translations = ServerTranslations.of(language);

  try {
    return await operation();
  } on RootHubException {
    rethrow;
  } catch (_) {
    throw RootHubEndpointError.unexpected(
      language: language,
      description: fallbackDescription ?? translations.fallback.unexpected,
    );
  }
}
