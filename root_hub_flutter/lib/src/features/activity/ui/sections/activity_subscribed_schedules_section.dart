import 'package:flutter/material.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/features/activity/ui/widgets/activity_empty_state_widget.dart';
import 'package:root_hub_flutter/src/features/activity/ui/widgets/activity_section_heading_widget.dart';
import 'package:root_hub_flutter/src/features/activity/ui/widgets/activity_subscribed_schedule_card.dart';

class ActivitySubscribedSchedulesSection extends StatefulWidget {
  const ActivitySubscribedSchedulesSection({
    required this.title,
    required this.description,
    required this.emptyTitle,
    required this.emptyDescription,
    required this.schedules,
    required this.onOpenChat,
    super.key,
  });

  final String title;
  final String description;
  final String emptyTitle;
  final String emptyDescription;
  final List<MatchSchedulePairingAttempt> schedules;
  final void Function(int scheduledMatchId, String matchTitle) onOpenChat;

  @override
  State<ActivitySubscribedSchedulesSection> createState() =>
      _ActivitySubscribedSchedulesSectionState();
}

class _ActivitySubscribedSchedulesSectionState
    extends State<ActivitySubscribedSchedulesSection> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final schedules = widget.schedules;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ActivitySectionHeadingWidget(
          icon: Icons.event_available_rounded,
          title: widget.title,
          description: widget.description,
        ),
        if (schedules.isEmpty)
          ActivityEmptyStateWidget(
            title: widget.emptyTitle,
            description: widget.emptyDescription,
          )
        else ...[
          SizedBox(
            height: 292,
            child: PageView.builder(
              controller: _pageController,
              itemCount: schedules.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                final schedule = schedules[index];
                final scheduleId = schedule.id;

                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2),
                  child: ActivitySubscribedScheduleCard(
                    schedule: schedule,
                    onOpenChat: scheduleId == null
                        ? () {}
                        : () {
                            widget.onOpenChat(scheduleId, schedule.title);
                          },
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var index = 0; index < schedules.length; index++)
                AnimatedContainer(
                  duration: Duration(milliseconds: 180),
                  curve: Curves.easeOutCubic,
                  width: _currentPage == index ? 16 : 7,
                  height: 7,
                  margin: EdgeInsets.symmetric(horizontal: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(999),
                    color: _currentPage == index
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(
                            context,
                          ).colorScheme.outlineVariant.withValues(alpha: 0.7),
                  ),
                ),
            ],
          ),
        ],
      ],
    );
  }
}
