import 'package:flutter/material.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/features/activity/ui/widgets/activity_chat_card.dart';
import 'package:root_hub_flutter/src/features/activity/ui/widgets/activity_empty_state_widget.dart';
import 'package:root_hub_flutter/src/features/activity/ui/widgets/activity_section_heading_widget.dart';

class ActivityChatListSection extends StatelessWidget {
  const ActivityChatListSection({
    required this.title,
    required this.description,
    required this.emptyTitle,
    required this.emptyDescription,
    required this.icon,
    required this.chats,
    required this.isEndedSection,
    required this.onOpenChat,
    super.key,
  });

  final String title;
  final String description;
  final String emptyTitle;
  final String emptyDescription;
  final IconData icon;
  final List<MatchChatActivityChatItem> chats;
  final bool isEndedSection;
  final void Function(int scheduledMatchId, String matchTitle) onOpenChat;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ActivitySectionHeadingWidget(
          icon: icon,
          title: title,
          description: description,
        ),
        if (chats.isEmpty)
          ActivityEmptyStateWidget(
            title: emptyTitle,
            description: emptyDescription,
          )
        else
          for (final chat in chats)
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: ActivityChatCard(
                chatItem: chat,
                isEndedSection: isEndedSection,
                onTap: () {
                  onOpenChat(chat.scheduledMatchId, chat.matchTitle);
                },
              ),
            ),
      ],
    );
  }
}
