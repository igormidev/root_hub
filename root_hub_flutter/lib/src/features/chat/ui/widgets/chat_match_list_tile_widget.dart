import 'package:flutter/material.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';
import 'package:root_hub_flutter/src/design_system/location/location_photo_avatar_widget.dart';

class ChatMatchListTileWidget extends StatelessWidget {
  const ChatMatchListTileWidget({
    required this.chatItem,
    required this.onTap,
    super.key,
  });

  final MatchChatActivityChatItem chatItem;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final localizations = MaterialLocalizations.of(context);
    final locationLabel = chatItem.locationSubtitle == null
        ? chatItem.locationTitle
        : '${chatItem.locationTitle} • ${chatItem.locationSubtitle}';
    final unreadCount = chatItem.unreadMessagesCount;
    final hasUnread = unreadCount > 0;
    final activityTimestamp = chatItem.lastMessageAt ?? chatItem.attemptedAt;
    final attemptedAtLocal = chatItem.attemptedAt.toLocal();
    final isEnded = chatItem.hasPlayedResult;
    final hasStarted = !attemptedAtLocal.isAfter(DateTime.now());
    final statusLabel = isEnded
        ? t.activity.ui_widgets_activity_chat_card.ended
        : hasStarted
        ? t.activity.ui_widgets_activity_chat_card.started
        : t.activity.ui_widgets_activity_chat_card.upcoming;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 11),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  LocationPhotoAvatarWidget(
                    googlePlaceLocation: chatItem.googlePlaceLocation,
                    providerPlaceId: chatItem.locationProviderPlaceId,
                    latitude: chatItem.locationLatitude,
                    longitude: chatItem.locationLongitude,
                    size: 58,
                    borderColor: colorScheme.outlineVariant,
                    backgroundColor: colorScheme.surfaceContainerHighest,
                  ),
                  Positioned(
                    right: -2,
                    bottom: -4,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(8, 3, 8, 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(999),
                        color: isEnded
                            ? colorScheme.secondaryContainer
                            : hasStarted
                            ? colorScheme.tertiaryContainer
                            : colorScheme.primaryContainer,
                        border: Border.all(
                          color: colorScheme.surface,
                          width: 2,
                        ),
                      ),
                      child: Text(
                        statusLabel,
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          fontWeight: FontWeight.w900,
                          color: isEnded
                              ? colorScheme.onSecondaryContainer
                              : hasStarted
                              ? colorScheme.onTertiaryContainer
                              : colorScheme.onPrimaryContainer,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 14),
              Expanded(
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
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(
                                  fontWeight: hasUnread
                                      ? FontWeight.w900
                                      : FontWeight.w800,
                                ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          localizations.formatTimeOfDay(
                            TimeOfDay.fromDateTime(activityTimestamp.toLocal()),
                          ),
                          style: Theme.of(context).textTheme.labelMedium
                              ?.copyWith(
                                color: hasUnread
                                    ? colorScheme.primary
                                    : colorScheme.onSurfaceVariant,
                                fontWeight: hasUnread
                                    ? FontWeight.w900
                                    : FontWeight.w700,
                              ),
                        ),
                      ],
                    ),
                    SizedBox(height: 3),
                    Text(
                      locationLabel,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 6),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            _resolvePreviewLabel(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  color: hasUnread
                                      ? colorScheme.onSurface
                                      : colorScheme.onSurfaceVariant,
                                  fontWeight: hasUnread
                                      ? FontWeight.w800
                                      : FontWeight.w700,
                                ),
                          ),
                        ),
                        if (hasUnread) ...[
                          SizedBox(width: 10),
                          Container(
                            constraints: BoxConstraints(minWidth: 24),
                            padding: EdgeInsets.fromLTRB(7, 4, 7, 4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(999),
                              color: colorScheme.primary,
                            ),
                            child: Text(
                              // ignore: feature_hardcoded_ui_string
                              unreadCount > 99 ? '99+' : '$unreadCount',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.labelSmall
                                  ?.copyWith(
                                    color: colorScheme.onPrimary,
                                    fontWeight: FontWeight.w900,
                                  ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _resolvePreviewLabel() {
    final preview = chatItem.lastMessagePreview?.trim();
    if (preview != null && preview.isNotEmpty) {
      final sender = chatItem.lastMessageSenderDisplayName?.trim();
      if (sender == null || sender.isEmpty) {
        return preview;
      }

      return t.activity.ui_widgets_activity_chat_card.senderMessage(
        sender: sender,
        message: preview,
      );
    }

    return switch (chatItem.lastMessageType) {
      MatchChatMessageType.userMessage =>
        t.activity.ui_widgets_activity_chat_card.photoShared,
      MatchChatMessageType.userVoiceMessage =>
        t.activity.ui_widgets_chat_match_list_tile_widget.voiceMessage,
      MatchChatMessageType.systemJoin || MatchChatMessageType.systemLeave =>
        t.activity.ui_widgets_activity_chat_card.systemUpdate,
      null => t.activity.ui_widgets_activity_chat_card.noMessagesYet,
    };
  }
}
