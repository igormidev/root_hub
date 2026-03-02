import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/core/extension/match_podium_extension.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';

class ActivitySubscribedScheduleCard extends StatelessWidget {
  const ActivitySubscribedScheduleCard({
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
    final now = DateTime.now();
    final attemptedAtLocal = schedule.attemptedAt.toLocal();
    final started = !attemptedAtLocal.isAfter(now);
    final subscriptions = schedule.subscriptions ?? <MatchSubscription>[];
    final subscribedPlayersCount = subscriptions.length;
    final maxPlayers = schedule.maxAmountOfPlayers.playerCount;
    final minPlayers = schedule.minAmountOfPlayers.playerCount;
    final location = schedule.location;
    final locationTitle =
        location?.googlePlaceLocation?.name ??
        location?.manualInputLocation?.title ??
        t.activity.ui_widgets_activity_subscribed_schedule_card.unknownLocation;
    final locationSubtitle =
        location?.googlePlaceLocation?.shortFormattedAddress ??
        location?.googlePlaceLocation?.formattedAddress ??
        location?.manualInputLocation?.cityName;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(22),
        onTap: onOpenChat,
        child: Container(
          padding: EdgeInsets.fromLTRB(14, 14, 14, 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: colorScheme.primary,
              width: 3,
            ),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                colorScheme.surface.withValues(alpha: 0.95),
                colorScheme.surfaceContainerHighest.withValues(alpha: 0.58),
              ],
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 18,
                offset: Offset(0, 8),
                color: colorScheme.shadow.withValues(alpha: 0.12),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      schedule.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 4, 10, 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(999),
                      color: colorScheme.primaryContainer.withValues(
                        alpha: 0.78,
                      ),
                    ),
                    child: Text(
                      '$subscribedPlayersCount/$maxPlayers',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.w900,
                        color: colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 6),
              Container(
                padding: EdgeInsets.fromLTRB(12, 3, 12, 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(999),
                  color: colorScheme.primary,
                ),
                child: Text(
                  t
                      .activity
                      .ui_widgets_activity_subscribed_schedule_card
                      .selected,
                  style: GoogleFonts.getFont(
                    'MedievalSharp',
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  Icon(
                    Icons.schedule_rounded,
                    size: 18,
                    color: colorScheme.primary,
                  ),
                  SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      '${localizations.formatMediumDate(attemptedAtLocal)} • '
                      '${localizations.formatTimeOfDay(TimeOfDay.fromDateTime(attemptedAtLocal))}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(999),
                      color: started
                          ? colorScheme.tertiaryContainer
                          : colorScheme.primaryContainer,
                    ),
                    child: Text(
                      started
                          ? t
                                .activity
                                .ui_widgets_activity_subscribed_schedule_card
                                .alreadyStarted
                          : t
                                .activity
                                .ui_widgets_activity_subscribed_schedule_card
                                .notStartedYet,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w900,
                        color: started
                            ? colorScheme.onTertiaryContainer
                            : colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.location_on_rounded,
                    size: 18,
                    color: colorScheme.secondary,
                  ),
                  SizedBox(width: 6),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          locationTitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                fontWeight: FontWeight.w800,
                              ),
                        ),
                        if (locationSubtitle != null)
                          Text(
                            locationSubtitle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 6, 10, 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(999),
                      color: colorScheme.surfaceContainerHighest.withValues(
                        alpha: 0.7,
                      ),
                    ),
                    child: Text(
                      t.activity.ui_widgets_activity_subscribed_schedule_card
                          .playersLabel(
                            minPlayers: minPlayers.toString(),
                            maxPlayers: maxPlayers.toString(),
                          ),
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 6, 10, 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(999),
                      color: colorScheme.surfaceContainerHighest.withValues(
                        alpha: 0.7,
                      ),
                    ),
                    child: Text(
                      t
                          .activity
                          .ui_widgets_activity_subscribed_schedule_card
                          .openChatHint,
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
