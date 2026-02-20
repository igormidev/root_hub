import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class GetMyMatches extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<List<PlayedMatch>> v1(
    Session session,
  ) async {
    throw UnimplementedError();
  }
}
