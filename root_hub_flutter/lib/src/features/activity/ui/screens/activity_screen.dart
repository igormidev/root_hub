import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:root_hub_flutter/src/core/navigation/app_routes.dart';
import 'package:root_hub_flutter/src/features/activity/ui/sections/activity_chat_list_section.dart';
import 'package:root_hub_flutter/src/features/activity/ui/sections/activity_subscribed_schedules_section.dart';
import 'package:root_hub_flutter/src/states/activity/activity_provider.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';

class ActivityScreen extends ConsumerStatefulWidget {
  const ActivityScreen({
    super.key,
  });

  @override
  ConsumerState<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends ConsumerState<ActivityScreen> {
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

    if (activityState.isLoading &&
        !activityState.hasLoadedOnce &&
        activityState.subscribedActiveSchedules.isEmpty &&
        activityState.activeChats.isEmpty &&
        activityState.endedChats.isEmpty) {
      return Center(
        child: SizedBox(
          width: 32,
          height: 32,
          child: CircularProgressIndicator(strokeWidth: 3),
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () => ref.read(activityProvider.notifier).refresh(),
      child: ListView(
        physics: AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        padding: EdgeInsets.fromLTRB(16, 8, 16, 130),
        children: [
          ActivitySubscribedSchedulesSection(
            title: t.activity.ui_screens_activity_screen.myScheduledTablesTitle,
            description: t
                .activity
                .ui_screens_activity_screen
                .tablesYouSubscribedToThatAreStillWithinTheActiveWindow,
            emptyTitle: t.activity.ui_screens_activity_screen.noActiveSchedules,
            emptyDescription: t
                .activity
                .ui_screens_activity_screen
                .whenYouJoinATableItWillAppearHereAsASwipeableCard,
            schedules: activityState.subscribedActiveSchedules,
            onOpenChat: _openChat,
          ),
          SizedBox(height: 18),
          ActivityChatListSection(
            title: t.activity.ui_screens_activity_screen.activeChatsTitle,
            description: t
                .activity
                .ui_screens_activity_screen
                .chatsForUpcomingOrRecentlyStartedTablesOrderedByUnreadMessages,
            emptyTitle: t.activity.ui_screens_activity_screen.noActiveChats,
            emptyDescription: t
                .activity
                .ui_screens_activity_screen
                .openAnyTableChatAndItWillBeTrackedHereEvenWithoutASubscription,
            icon: Icons.forum_rounded,
            chats: activityState.activeChats,
            isEndedSection: false,
            onOpenChat: _openChat,
          ),
          SizedBox(height: 18),
          ActivityChatListSection(
            title: t.activity.ui_screens_activity_screen.completedMatchesTitle,
            description: t
                .activity
                .ui_screens_activity_screen
                .latestEightCompletedOrArchivedMatchChatsYouParticipatedIn,
            emptyTitle: t.activity.ui_screens_activity_screen.noCompletedChats,
            emptyDescription: t
                .activity
                .ui_screens_activity_screen
                .onceMatchesFinishTheirChatsWillStayAvailableHere,
            icon: Icons.emoji_events_rounded,
            chats: activityState.endedChats,
            isEndedSection: true,
            onOpenChat: _openChat,
          ),
          if (activityState.loadError != null) ...[
            SizedBox(height: 16),
            Text(
              '${activityState.loadError!.title}: '
              '${activityState.loadError!.description}',
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
