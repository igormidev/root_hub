import 'package:flutter/material.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';
import 'package:root_hub_flutter/src/design_system/location/location_photo_avatar_widget.dart';

class MatchChatAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const MatchChatAppBarWidget({
    required this.matchTitle,
    required this.currentTable,
    required this.isMessageActionInProgress,
    required this.isHost,
    required this.playedMatchSummary,
    required this.isLoadingPlayedMatchSummary,
    required this.onOpenEdit,
    required this.onOpenInfo,
    required this.onOpenPlayedSummary,
    super.key,
  });

  final String matchTitle;
  final MatchSchedulePairingAttempt? currentTable;
  final bool isMessageActionInProgress;
  final bool isHost;
  final MatchChatPlayedMatchSummary? playedMatchSummary;
  final bool isLoadingPlayedMatchSummary;
  final VoidCallback onOpenEdit;
  final VoidCallback onOpenInfo;
  final VoidCallback? onOpenPlayedSummary;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final googlePlace = currentTable?.location?.googlePlaceLocation;
    final manualLocation = currentTable?.location?.manualInputLocation;
    final locationTitle = googlePlace?.name ?? manualLocation?.title;
    final locationSubtitle =
        googlePlace?.shortFormattedAddress ??
        googlePlace?.formattedAddress ??
        manualLocation?.cityName;
    final onTitleTap = isLoadingPlayedMatchSummary
        ? null
        : playedMatchSummary != null
        ? onOpenPlayedSummary
        : onOpenInfo;

    return AppBar(
      titleSpacing: 0,
      title: InkWell(
        onTap: onTitleTap,
        borderRadius: BorderRadius.circular(18),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 6),
          child: Row(
            children: [
              LocationPhotoAvatarWidget(
                providerPlaceId: googlePlace?.providerPlaceId,
                latitude: googlePlace?.lat,
                longitude: googlePlace?.lng,
                size: 38,
                borderColor: colorScheme.outlineVariant,
                backgroundColor: colorScheme.surfaceContainerHighest,
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      matchTitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      locationSubtitle?.trim().isNotEmpty == true
                          ? locationSubtitle!
                          : locationTitle?.trim().isNotEmpty == true
                          ? locationTitle!
                          : t
                                .activity
                                .ui_widgets_activity_subscribed_schedule_card
                                .unknownLocation,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        if (isMessageActionInProgress)
          Padding(
            padding: EdgeInsets.only(right: 4),
            child: Center(
              child: SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(
                  strokeWidth: 2.2,
                  color: colorScheme.primary,
                ),
              ),
            ),
          ),
        if (isHost && playedMatchSummary == null)
          IconButton(
            tooltip: t.match.ui_screens_match_chat_screen.editTable,
            icon: Icon(Icons.edit_outlined),
            onPressed: onOpenEdit,
          ),
        if (isLoadingPlayedMatchSummary)
          Padding(
            padding: EdgeInsets.only(right: 4),
            child: Center(
              child: SizedBox(
                width: 17,
                height: 17,
                child: CircularProgressIndicator(
                  strokeWidth: 2.1,
                  color: colorScheme.primary,
                ),
              ),
            ),
          )
        else
          IconButton(
            tooltip: playedMatchSummary != null
                ? t.match.ui_screens_match_chat_screen.playedMatchInfo
                : t.match.ui_screens_match_chat_screen.tableInfo,
            icon: Icon(
              playedMatchSummary != null
                  ? Icons.emoji_events_rounded
                  : Icons.info_outline_rounded,
            ),
            onPressed: playedMatchSummary != null
                ? onOpenPlayedSummary
                : onOpenInfo,
          ),
      ],
    );
  }
}
