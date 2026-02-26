import 'package:flutter/material.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';

class ActivityChatCard extends StatelessWidget {
  const ActivityChatCard({
    required this.chatItem,
    required this.onTap,
    required this.isEndedSection,
    super.key,
  });

  final MatchChatActivityChatItem chatItem;
  final VoidCallback onTap;
  final bool isEndedSection;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final localizations = MaterialLocalizations.of(context);
    final now = DateTime.now();
    final attemptedAtLocal = chatItem.attemptedAt.toLocal();
    final started = !attemptedAtLocal.isAfter(now);
    final unreadCount = chatItem.unreadMessagesCount;
    final messagePreview = _resolveMessagePreview(chatItem);

    final scheduleLabel =
        '${localizations.formatMediumDate(attemptedAtLocal)} • '
        '${localizations.formatTimeOfDay(TimeOfDay.fromDateTime(attemptedAtLocal))}';

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(14, 12, 14, 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: unreadCount > 0
                  ? colorScheme.primary
                  : colorScheme.outlineVariant,
              width: unreadCount > 0 ? 2 : 1.1,
            ),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                colorScheme.surface.withValues(alpha: 0.95),
                colorScheme.surfaceContainerHighest.withValues(alpha: 0.58),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      chatItem.matchTitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 4, 10, 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(999),
                      color: isEndedSection
                          ? colorScheme.secondaryContainer
                          : colorScheme.primaryContainer,
                    ),
                    child: Text(
                      isEndedSection
                          ? t.activity.ui_widgets_activity_chat_card.ended
                          : started
                          ? t.activity.ui_widgets_activity_chat_card.started
                          : t.activity.ui_widgets_activity_chat_card.upcoming,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w900,
                        color: isEndedSection
                            ? colorScheme.onSecondaryContainer
                            : colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Icons.schedule_rounded,
                    size: 17,
                    color: colorScheme.primary,
                  ),
                  SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      scheduleLabel,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4),
              Row(
                children: [
                  Icon(
                    Icons.location_on_rounded,
                    size: 17,
                    color: colorScheme.secondary,
                  ),
                  SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      chatItem.locationSubtitle == null
                          ? chatItem.locationTitle
                          : '${chatItem.locationTitle} • ${chatItem.locationSubtitle}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: colorScheme.surfaceContainerHighest.withValues(
                    alpha: 0.6,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.chat_bubble_rounded,
                      size: 15,
                      color: colorScheme.primary,
                    ),
                    SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        messagePreview,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    if (unreadCount > 0) ...[
                      SizedBox(width: 8),
                      Container(
                        constraints: BoxConstraints(minWidth: 24),
                        padding: EdgeInsets.fromLTRB(7, 3, 7, 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(999),
                          color: colorScheme.error,
                        ),
                        child: Text(
                          // ignore: feature_hardcoded_ui_string
                          unreadCount > 99 ? '99+' : '$unreadCount',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.labelSmall
                              ?.copyWith(
                                color: colorScheme.onError,
                                fontWeight: FontWeight.w900,
                              ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _resolveMessagePreview(MatchChatActivityChatItem item) {
    final lastMessagePreview = item.lastMessagePreview?.trim();
    if (lastMessagePreview != null && lastMessagePreview.isNotEmpty) {
      final sender = item.lastMessageSenderDisplayName?.trim();
      if (sender == null || sender.isEmpty) {
        return lastMessagePreview;
      }

      return t.activity.ui_widgets_activity_chat_card.senderMessage(
        sender: sender,
        message: lastMessagePreview,
      );
    }

    if (item.lastMessageType == MatchChatMessageType.userMessage) {
      return t.activity.ui_widgets_activity_chat_card.newMessage;
    }

    if (item.lastMessageType == MatchChatMessageType.systemJoin ||
        item.lastMessageType == MatchChatMessageType.systemLeave) {
      return t.activity.ui_widgets_activity_chat_card.systemUpdate;
    }

    return t.activity.ui_widgets_activity_chat_card.noMessagesYet;
  }
}
