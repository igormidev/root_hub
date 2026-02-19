import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class CreateMatch extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<MatchSchedulePairingAttempt> v1(
    Session session, {
    required int minNumberOfPlayers,
    required int maxNumberOfPlayers,
    required int locationId,
  }) async {
    throw UnimplementedError('Not implemented yet');
  }
}
