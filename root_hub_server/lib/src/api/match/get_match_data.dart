import 'package:serverpod/serverpod.dart';

class GetMatchData extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<void> v1(Session session) async {}
}
