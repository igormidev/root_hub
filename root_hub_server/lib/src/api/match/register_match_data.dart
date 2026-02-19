import 'package:serverpod/serverpod.dart';
import 'package:root_hub_server/src/generated/protocol.dart';

class RegisterMatchData extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<PlayedMatch> v1(
    Session session, {
    required DateTime matchStartedAt,
    required Duration matchEstimatedDuration,
    required int locationId,
    required int scheduledPairingAttemptId,
  }) async {
    throw UnimplementedError('Not implemented yet');
  }
}
