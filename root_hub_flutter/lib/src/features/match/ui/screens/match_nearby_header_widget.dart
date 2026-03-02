import 'package:flutter/material.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';

class MatchNearbyHeaderWidget extends StatelessWidget {
  const MatchNearbyHeaderWidget({
    required this.playerData,
    super.key,
  });

  final PlayerData? playerData;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final ratioKm = playerData?.currentLocation?.ratio;
    final nearbySummary = ratioKm == null
        ? t.match.ui_screens_match_nearby_header_widget.setProfileLocation
        : t.match.ui_screens_match_nearby_header_widget.searchAreaKm(
            ratioKm: ratioKm.toStringAsFixed(0),
          );

    return Padding(
      padding: EdgeInsets.fromLTRB(4, 6, 4, 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.explore_rounded,
                color: colorScheme.secondary,
                size: 22,
              ),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  t.match.ui_screens_match_nearby_header_widget.matchFinder,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 4),
          Row(
            children: [
              Flexible(
                child: Text(
                  t
                      .match
                      .ui_screens_match_nearby_header_widget
                      .nearbyMatchTables,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: colorScheme.onSurface,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Container(
                  width: 5,
                  height: 5,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: colorScheme.onSurfaceVariant.withValues(alpha: 0.8),
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  nearbySummary,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 4),
          Text(
            t
                .match
                .ui_screens_match_nearby_header_widget
                .onlyTablesThatDidNotStartMoreThan2HoursAgoAreListed,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w700,
              height: 1.35,
            ),
          ),
        ],
      ),
    );
  }
}
