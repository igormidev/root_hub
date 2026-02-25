import 'package:flutter/material.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/core/extension/faction_ui_extension.dart';
import 'package:root_hub_flutter/src/features/match/ui/sheets/match_table_info_user_avatar_widget.dart';

class MatchTableInfoRemovePlayerTileWidget extends StatelessWidget {
  final MatchSchedulePlayerSnapshot player;
  final VoidCallback onTap;

  const MatchTableInfoRemovePlayerTileWidget({
    super.key,
    required this.player,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final playerData = player.playerData;
    final factionColor = playerData.favoriteFaction.factionColor;
    final imageUrl = player.profileImageUrl?.trim();

    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: factionColor.withValues(alpha: 0.4),
            ),
            color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.4),
          ),
          child: Row(
            children: [
              MatchTableInfoUserAvatarWidget(imageUrl: imageUrl),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      playerData.displayName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      playerData.favoriteFaction.displayName,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: factionColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.close_rounded,
                color: colorScheme.error,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
