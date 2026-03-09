import 'package:flutter/material.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';
import 'package:root_hub_flutter/src/core/extension/match_podium_extension.dart';
import 'package:root_hub_flutter/src/design_system/location/location_photo_avatar_widget.dart';
import 'package:root_hub_flutter/src/features/schedules/ui/widgets/schedule_meta_chip_widget.dart';

class ScheduleMatchCardWidget extends StatelessWidget {
  const ScheduleMatchCardWidget({
    required this.schedule,
    required this.onOpenChat,
    super.key,
  });

  final MatchSchedulePairingAttempt schedule;
  final VoidCallback onOpenChat;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final localizations = MaterialLocalizations.of(context);
    final attemptedAtLocal = schedule.attemptedAt.toLocal();
    final location = schedule.location;
    final googlePlace = location?.googlePlaceLocation;
    final manualLocation = location?.manualInputLocation;
    final locationTitle =
        googlePlace?.name ??
        manualLocation?.title ??
        t.activity.ui_widgets_activity_subscribed_schedule_card.unknownLocation;
    final locationSubtitle =
        googlePlace?.shortFormattedAddress ??
        googlePlace?.formattedAddress ??
        manualLocation?.cityName;
    final subscriptions = schedule.subscriptions ?? <MatchSubscription>[];
    final maxPlayers = schedule.maxAmountOfPlayers.playerCount;
    final minPlayers = schedule.minAmountOfPlayers.playerCount;
    final subscribedPlayersCount = subscriptions.length;
    final hasStarted = !attemptedAtLocal.isAfter(DateTime.now());
    final statusText = hasStarted
        ? t.activity.ui_widgets_activity_subscribed_schedule_card.alreadyStarted
        : t.activity.ui_widgets_activity_subscribed_schedule_card.notStartedYet;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: onOpenChat,
        child: Ink(
          padding: EdgeInsets.fromLTRB(14, 14, 14, 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: colorScheme.outlineVariant,
            ),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                colorScheme.surface.withValues(alpha: 0.96),
                colorScheme.surfaceContainerLowest.withValues(alpha: 0.92),
              ],
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 16,
                offset: Offset(0, 8),
                color: colorScheme.shadow.withValues(alpha: 0.08),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LocationPhotoAvatarWidget(
                providerPlaceId: googlePlace?.providerPlaceId,
                latitude: googlePlace?.lat,
                longitude: googlePlace?.lng,
                size: 58,
                borderColor: colorScheme.primary.withValues(alpha: 0.25),
                backgroundColor: colorScheme.primaryContainer.withValues(
                  alpha: 0.45,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            schedule.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w900,
                                ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(999),
                            color: hasStarted
                                ? colorScheme.tertiaryContainer
                                : colorScheme.primaryContainer,
                          ),
                          child: Text(
                            statusText,
                            style: Theme.of(context).textTheme.labelSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.w900,
                                  color: hasStarted
                                      ? colorScheme.onTertiaryContainer
                                      : colorScheme.onPrimaryContainer,
                                ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      locationSubtitle == null
                          ? locationTitle
                          : '$locationTitle • $locationSubtitle',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 10),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        ScheduleMetaChipWidget(
                          label:
                              '${localizations.formatMediumDate(attemptedAtLocal)} • '
                              '${localizations.formatTimeOfDay(TimeOfDay.fromDateTime(attemptedAtLocal))}',
                          icon: Icons.schedule_rounded,
                        ),
                        ScheduleMetaChipWidget(
                          label:
                              '$subscribedPlayersCount/$maxPlayers ${t.activity.ui_widgets_activity_subscribed_schedule_card.playersLabel(minPlayers: minPlayers.toString(), maxPlayers: maxPlayers.toString())}',
                          icon: Icons.groups_rounded,
                        ),
                        ScheduleMetaChipWidget(
                          label: t
                              .activity
                              .ui_widgets_activity_subscribed_schedule_card
                              .openChatHint,
                          icon: Icons.forum_rounded,
                        ),
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
}
