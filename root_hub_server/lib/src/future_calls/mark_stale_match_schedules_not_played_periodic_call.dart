import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class MarkStaleMatchSchedulesNotPlayedPeriodicCall extends FutureCall {
  static const String recurringIdentifier =
      'mark-stale-match-schedules-not-played-periodic-call';
  static const Duration recurrenceDelay = Duration(hours: 1);
  static const Duration staleScheduleThreshold = Duration(hours: 24);

  @override
  Future<void> invoke(Session session, SerializableModel? object) async {
    try {
      final staleThreshold = DateTime.now().subtract(staleScheduleThreshold);

      final staleScheduledMatches = await MatchSchedulePairingAttempt.db.find(
        session,
        where: (t) =>
            t.status.equals(MatchScheduleStatus.scheduled) &
            (t.attemptedAt < staleThreshold),
        include: MatchSchedulePairingAttempt.include(
          playedMatch: PlayedMatch.include(),
        ),
      );

      var updatedCount = 0;
      for (final schedule in staleScheduledMatches) {
        if (schedule.playedMatch != null) {
          continue;
        }

        schedule
          ..status = MatchScheduleStatus.notPlayed
          ..notPlayedReason = MatchScheduleNotPlayedReason.expiredWithoutResult
          ..notPlayedReasonDetails = null
          ..notPlayedMarkedByPlayerDataId = null;

        await MatchSchedulePairingAttempt.db.updateRow(session, schedule);
        updatedCount += 1;
      }

      session.log(
        '[MatchLifecycle] Updated stale schedules to notPlayed. '
        'updatedCount=$updatedCount '
        'staleThreshold=$staleThreshold',
        level: LogLevel.info,
      );
    } catch (error, stackTrace) {
      session.log(
        '[MatchLifecycle] Failed to update stale schedules: $error',
        level: LogLevel.error,
        exception: error,
        stackTrace: stackTrace,
      );
    } finally {
      await _scheduleNextRun();
    }
  }

  Future<void> _scheduleNextRun() async {
    final futureCalls = Serverpod.instance.endpoints.futureCalls;
    if (futureCalls == null) {
      return;
    }

    final dispatch = futureCalls.callWithDelay(
      recurrenceDelay,
      identifier: recurringIdentifier,
    );

    await dispatch.markStaleMatchSchedulesNotPlayedPeriodicCall.invoke(null);
  }
}
