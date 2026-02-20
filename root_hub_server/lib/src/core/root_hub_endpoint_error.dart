import 'package:root_hub_server/src/generated/protocol.dart';

typedef EndpointOperation<T> = Future<T> Function();

class RootHubEndpointError {
  const RootHubEndpointError._();

  static RootHubException invalidRequest({
    required String description,
    String title = 'Invalid request',
  }) {
    return RootHubException(
      title: title,
      description: description,
    );
  }

  static RootHubException notFound({
    required String description,
    String title = 'Resource not found',
  }) {
    return RootHubException(
      title: title,
      description: description,
    );
  }

  static RootHubException accessDenied({
    required String description,
    String title = 'Access denied',
  }) {
    return RootHubException(
      title: title,
      description: description,
    );
  }

  static RootHubException configuration({
    required String description,
    String title = 'Configuration error',
  }) {
    return RootHubException(
      title: title,
      description: description,
    );
  }

  static RootHubException endpointUnavailable({
    required String description,
    String title = 'Endpoint unavailable',
  }) {
    return RootHubException(
      title: title,
      description: description,
    );
  }

  static RootHubException unexpected({
    required String description,
    String title = 'Unexpected error',
  }) {
    return RootHubException(
      title: title,
      description: description,
    );
  }
}

Future<T> guardRootHubEndpointErrors<T>(
  EndpointOperation<T> operation, {
  required String fallbackDescription,
}) async {
  try {
    return await operation();
  } on RootHubException {
    rethrow;
  } catch (_) {
    throw RootHubEndpointError.unexpected(
      description: fallbackDescription,
    );
  }
}
