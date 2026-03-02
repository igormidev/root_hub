import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/core/extension/faction_ui_extension.dart';
import 'package:root_hub_flutter/src/features/match/ui/screens/match_user_avatar_widget.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';

class MatchParticipantCardWidget extends StatelessWidget {
  const MatchParticipantCardWidget({
    required this.playerSnapshot,
    super.key,
  });

  final MatchSchedulePlayerSnapshot playerSnapshot;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final playerData = playerSnapshot.playerData;
    final factionColor = playerData.favoriteFaction.factionColor;
    final imageUrl = playerSnapshot.profileImageUrl?.trim();

    return SizedBox(
      height: 156,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 14,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.fromLTRB(14, 14, 108, 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: factionColor.withValues(alpha: 0.64),
                  width: 1.7,
                ),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    colorScheme.surfaceContainerHighest.withValues(alpha: 0.96),
                    colorScheme.surfaceContainer.withValues(alpha: 0.86),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      MatchUserAvatarWidget(
                        imageUrl: imageUrl,
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          playerData.displayName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                fontWeight: FontWeight.w900,
                              ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    t
                        .match
                        .ui_screens_match_participant_card_widget
                        .favoriteFaction,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    playerData.favoriteFaction.displayName.toUpperCase(),
                    style: GoogleFonts.cinzel(
                      fontSize: 21,
                      fontWeight: FontWeight.w800,
                      color: factionColor,
                      height: 1.06,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: -4,
            right: -6,
            child: Transform.rotate(
              angle: -0.08,
              child: Image.asset(
                playerData.favoriteFaction.getFactionImage,
                width: 128,
                height: 128,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
