import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class GetMatchLocation extends Endpoint {
  Future<Location> v1(
    Session session, {
    required String query,
  }) async {
    throw UnimplementedError(
      'GetMatchLocation endpoint is not implemented yet.',
    );
  }
}
