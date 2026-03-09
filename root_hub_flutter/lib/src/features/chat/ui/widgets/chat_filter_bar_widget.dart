import 'package:flutter/material.dart';
import 'package:root_hub_flutter/src/features/chat/ui/widgets/chat_filter_chip_widget.dart';

class ChatFilterBarWidget extends StatelessWidget {
  const ChatFilterBarWidget({
    required this.allLabel,
    required this.unreadLabel,
    required this.showAllSelected,
    required this.showUnreadSelected,
    required this.onAllTap,
    required this.onUnreadTap,
    super.key,
  });

  final String allLabel;
  final String unreadLabel;
  final bool showAllSelected;
  final bool showUnreadSelected;
  final VoidCallback onAllTap;
  final VoidCallback onUnreadTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 6, 16, 4),
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
        ],
      ),
    );
  }
}
