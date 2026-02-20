import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class GetMyMatches extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<List<PlayedMatch>> v1(
    Session session,
  ) async {
    return guardRootHubEndpointErrors(
      () async {
        throw RootHubEndpointError.endpointUnavailable(
          description: 'Get my played matches endpoint is not implemented yet.',
        );
      },
      fallbackDescription:
          'Unable to load your played matches right now. Please try again.',
    );
  }
}
