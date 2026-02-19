import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class GetMatchLocation extends Endpoint {
  Future<List<Location>> v1(
    Session session, {
    required String query,
    required int page,
  }) async {
    throw UnimplementedError(
      'GetMatchLocation endpoint is not implemented yet.',
    );
  }
}
