import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';
import 'package:root_hub_flutter/src/core/navigation/app_routes.dart';
import 'package:root_hub_flutter/src/features/schedules/ui/widgets/schedule_match_card_widget.dart';
import 'package:root_hub_flutter/src/states/activity/activity_provider.dart';

class SchedulesScreen extends ConsumerStatefulWidget {
  const SchedulesScreen({
    super.key,
  });

  @override
  ConsumerState<SchedulesScreen> createState() => _SchedulesScreenState();
}

class _SchedulesScreenState extends ConsumerState<SchedulesScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }

      ref.read(activityProvider.notifier).ensureLoaded();
      ref.read(activityProvider.notifier).ensureUnreadCountLoaded();
    });
  }

  @override
  Widget build(BuildContext context) {
    final activityState = ref.watch(activityProvider);
    final schedules = activityState.subscribedActiveSchedules;
    final loadError = activityState.loadError;

    if (activityState.isLoading &&
        !activityState.hasLoadedOnce &&
        schedules.isEmpty) {
      return Center(
        child: SizedBox(
          width: 32,
          height: 32,
          child: CircularProgressIndicator(strokeWidth: 3),
        ),
      );
    }

    if (loadError != null && schedules.isEmpty) {
      return Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                loadError.title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: 8),
              Text(
                loadError.description,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 18),
              FilledButton(
                onPressed: () {
                  ref.read(activityProvider.notifier).refresh();
                },
                child: Text(
                  t.match.ui_sheets_match_table_info_error_widget.retry,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () => ref.read(activityProvider.notifier).refresh(),
      child: ListView(
        physics: AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        padding: EdgeInsets.fromLTRB(16, 12, 16, 130),
        children: [
          Text(
            t.activity.ui_screens_activity_screen.myScheduledTablesTitle,
            style: GoogleFonts.cinzel(
              fontSize: 34,
              fontWeight: FontWeight.w700,
              height: 1.02,
            ),
          ),
          SizedBox(height: 8),
          Text(
            t
                .activity
                .ui_screens_activity_screen
                .tablesYouSubscribedToThatAreStillWithinTheActiveWindow,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w700,
              height: 1.35,
            ),
          ),
          SizedBox(height: 18),
          if (schedules.isEmpty)
            Container(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Theme.of(context).colorScheme.outlineVariant,
                ),
                color: Theme.of(context).colorScheme.surface.withValues(
                  alpha: 0.88,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    t.activity.ui_screens_activity_screen.noActiveSchedules,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    t
                        .activity
                        .ui_screens_activity_screen
                        .whenYouJoinATableItWillAppearHereAsASwipeableCard,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            )
          else
            for (final schedule in schedules) ...[
              if (schedule.id != null)
                ScheduleMatchCardWidget(
                  schedule: schedule,
                  onOpenChat: () {
                    _openChat(schedule.id!, schedule.title);
                  },
                ),
              SizedBox(height: 12),
            ],
          if (loadError != null) ...[
            SizedBox(height: 8),
            Text(
              '${loadError.title}: ${loadError.description}',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.error,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Future<void> _openChat(int scheduledMatchId, String matchTitle) async {
    await context.push(
      dashboardMatchChatPathForMatch(scheduledMatchId),
      extra: matchTitle,
    );

    if (!mounted) {
      return;
    }

    await ref.read(activityProvider.notifier).refresh();
  }
}
