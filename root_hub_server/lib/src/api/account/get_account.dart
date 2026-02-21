
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class GetAccount extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<PlayerData> v1(Session session) async {
    throw UnimplementedError();
  }
}