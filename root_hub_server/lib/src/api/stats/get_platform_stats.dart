import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class GetPlatformStats extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<PlatformStats> v1(
    Session session,
  ) async {
    throw UnimplementedError(
      'Get platform stats endpoint is not implemented yet.',
    );
  }
}
