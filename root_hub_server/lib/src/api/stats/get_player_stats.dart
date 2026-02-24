import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class GetPlayerStats extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<PlayerStats> v1(
    Session session,
  ) async {
    throw UnimplementedError(
      'Get player stats endpoint is not implemented yet.',
    );
  }
}
