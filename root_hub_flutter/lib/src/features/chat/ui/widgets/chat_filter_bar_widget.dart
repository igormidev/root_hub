import 'package:flutter/material.dart';
import 'package:root_hub_flutter/src/features/chat/ui/widgets/chat_filter_chip_widget.dart';

class ChatFilterBarWidget extends StatelessWidget {
  const ChatFilterBarWidget({
    required this.allLabel,
    required this.unreadLabel,
    required this.scheduledLabel,
    required this.completedLabel,
    required this.showAllSelected,
    required this.showUnreadSelected,
    required this.showScheduledSelected,
    required this.showCompletedSelected,
    required this.onAllTap,
    required this.onUnreadTap,
    required this.onScheduledTap,
    required this.onCompletedTap,
    super.key,
  });

  final String allLabel;
  final String unreadLabel;
  final String scheduledLabel;
  final String completedLabel;
  final bool showAllSelected;
  final bool showUnreadSelected;
  final bool showScheduledSelected;
  final bool showCompletedSelected;
  final VoidCallback onAllTap;
  final VoidCallback onUnreadTap;
  final VoidCallback onScheduledTap;
  final VoidCallback onCompletedTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 6, 16, 4),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ChatFilterChipWidget(
              label: allLabel,
              selected: showAllSelected,
              onTap: onAllTap,
            ),
            SizedBox(width: 8),
            ChatFilterChipWidget(
              label: unreadLabel,
              selected: showUnreadSelected,
              onTap: onUnreadTap,
            ),
            SizedBox(width: 8),
            ChatFilterChipWidget(
              label: scheduledLabel,
              selected: showScheduledSelected,
              onTap: onScheduledTap,
            ),
            SizedBox(width: 8),
            ChatFilterChipWidget(
              label: completedLabel,
              selected: showCompletedSelected,
              onTap: onCompletedTap,
            ),
          ],
        ),
      ),
    );
  }
}
