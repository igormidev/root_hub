import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';
import 'package:root_hub_flutter/src/core/extension/faction_ui_extension.dart';

class MatchPlayedMatchSummaryDialog extends StatelessWidget {
  const MatchPlayedMatchSummaryDialog({
    required this.summary,
    super.key,
  });

  final MatchChatPlayedMatchSummary summary;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final localizations = MaterialLocalizations.of(context);
    final startedAtLocal = summary.matchStartedAt.toLocal();
    final attemptedAtLocal = summary.attemptedAt.toLocal();
    final durationLabel = _formatDuration(summary.matchEstimatedDuration);
    final winnerName =
        summary.winnerDisplayName ??
        t.match.ui_dialogs_match_played_match_summary_dialog.notAvailable;
    final hasGroupPhoto = summary.groupPhotoUrl?.trim().isNotEmpty == true;
    final hasBoardPhoto = summary.boardPhotoUrl?.trim().isNotEmpty == true;
    final winnerFactionIcon = summary.winnerFaction?.getFactionIconPath(
      size: FactionIconSize.size80,
    );

    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 18),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.sizeOf(context).height * 0.88,
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(18, 18, 18, 16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    colorScheme.primaryContainer,
                    colorScheme.secondaryContainer,
                    colorScheme.tertiaryContainer,
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withValues(alpha: 0.85),
                        ),
                        child: Icon(
                          Icons.emoji_events_rounded,
                          color: colorScheme.primary,
                          size: 26,
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          t
                              .match
                              .ui_dialogs_match_played_match_summary_dialog
                              .completedMatchReport,
                          style: GoogleFonts.cinzel(
                            fontWeight: FontWeight.w700,
                            fontSize: 23,
                            color: colorScheme.onSurface,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    summary.matchTitle,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    '${t.match.ui_dialogs_match_played_match_summary_dialog.winner}: $winnerName',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  if (summary.winnerFaction != null) ...[
                    SizedBox(height: 6),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(999),
                        color: Colors.white.withValues(alpha: 0.86),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (winnerFactionIcon != null) ...[
                            Image.asset(
                              winnerFactionIcon,
                              width: 18,
                              height: 18,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(width: 6),
                          ],
                          Text(
                            summary.winnerFaction!.displayName,
                            style: Theme.of(context).textTheme.labelLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.w900,
                                  color: colorScheme.onSurface,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(16, 14, 16, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 7, 10, 7),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(999),
                            color: colorScheme.surfaceContainerHighest
                                .withValues(alpha: 0.62),
                          ),
                          child: Text(
                            t.match.ui_dialogs_match_played_match_summary_dialog
                                .startedAtLabel(
                                  value:
                                      '${localizations.formatMediumDate(startedAtLocal)} '
                                      '${localizations.formatTimeOfDay(TimeOfDay.fromDateTime(startedAtLocal))}',
                                ),
                            style: Theme.of(context).textTheme.labelMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w800,
                                ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 7, 10, 7),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(999),
                            color: colorScheme.surfaceContainerHighest
                                .withValues(alpha: 0.62),
                          ),
                          child: Text(
                            t.match.ui_dialogs_match_played_match_summary_dialog
                                .durationLabel(
                                  value: durationLabel,
                                ),
                            style: Theme.of(context).textTheme.labelMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w800,
                                ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 7, 10, 7),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(999),
                            color: colorScheme.surfaceContainerHighest
                                .withValues(alpha: 0.62),
                          ),
                          child: Text(
                            t.match.ui_dialogs_match_played_match_summary_dialog
                                .scheduledAtLabel(
                                  value:
                                      '${localizations.formatMediumDate(attemptedAtLocal)} '
                                      '${localizations.formatTimeOfDay(TimeOfDay.fromDateTime(attemptedAtLocal))}',
                                ),
                            style: Theme.of(context).textTheme.labelMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w800,
                                ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(12, 10, 12, 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: colorScheme.outlineVariant),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on_rounded,
                            color: colorScheme.secondary,
                            size: 18,
                          ),
                          SizedBox(width: 7),
                          Expanded(
                            child: Text(
                              summary.locationSubtitle == null
                                  ? summary.locationTitle
                                  : '${summary.locationTitle} • ${summary.locationSubtitle}',
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (hasGroupPhoto || hasBoardPhoto) ...[
                      SizedBox(height: 14),
                      Text(
                        t
                            .match
                            .ui_dialogs_match_played_match_summary_dialog
                            .matchProofs,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(height: 8),
                      SizedBox(
                        height: 132,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            if (hasGroupPhoto)
                              Container(
                                width: 188,
                                margin: EdgeInsets.only(right: 10),
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color: colorScheme.outlineVariant,
                                  ),
                                ),
                                child: Image.network(
                                  summary.groupPhotoUrl!.trim(),
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      color:
                                          colorScheme.surfaceContainerHighest,
                                      alignment: Alignment.center,
                                      child: Icon(Icons.image_not_supported),
                                    );
                                  },
                                ),
                              ),
                            if (hasBoardPhoto)
                              Container(
                                width: 188,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color: colorScheme.outlineVariant,
                                  ),
                                ),
                                child: Image.network(
                                  summary.boardPhotoUrl!.trim(),
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      color:
                                          colorScheme.surfaceContainerHighest,
                                      alignment: Alignment.center,
                                      child: Icon(Icons.image_not_supported),
                                    );
                                  },
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                    SizedBox(height: 14),
                    Text(
                      t
                          .match
                          .ui_dialogs_match_played_match_summary_dialog
                          .players,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: 8),
                    for (final player in summary.players)
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(bottom: 8),
                        padding: EdgeInsets.fromLTRB(12, 10, 12, 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: player.didWin
                                ? colorScheme.primary
                                : colorScheme.outlineVariant,
                            width: player.didWin ? 2 : 1,
                          ),
                          color: player.didWin
                              ? colorScheme.primaryContainer.withValues(
                                  alpha: 0.5,
                                )
                              : colorScheme.surfaceContainerHighest.withValues(
                                  alpha: 0.45,
                                ),
                        ),
                        child: Row(
                          children: [
                            if (player.didWin)
                              Padding(
                                padding: EdgeInsets.only(right: 8),
                                child: Icon(
                                  Icons.workspace_premium_rounded,
                                  color: colorScheme.primary,
                                  size: 18,
                                ),
                              ),
                            Expanded(
                              child: Text(
                                player.displayName,
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.w800,
                                    ),
                              ),
                            ),
                            SizedBox(width: 8),
                            Text(
                              player.faction.displayName,
                              style: Theme.of(context).textTheme.labelMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w800,
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                            ),
                            SizedBox(width: 8),
                            Text(
                              player.score == null
                                  ? t
                                        .match
                                        .ui_dialogs_match_played_match_summary_dialog
                                        .domination
                                  : t
                                        .match
                                        .ui_dialogs_match_played_match_summary_dialog
                                        .scoreLabel(
                                          value: player.score.toString(),
                                        ),
                              style: Theme.of(context).textTheme.labelMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w900,
                                  ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 14),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(
                    t.match.ui_dialogs_match_played_match_summary_dialog.close,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDuration(Duration? duration) {
    if (duration == null) {
      return t.match.ui_dialogs_match_played_match_summary_dialog.notAvailable;
    }

    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    return t.match.ui_dialogs_match_played_match_summary_dialog.hoursMinutes(
      hours: hours.toString(),
      minutes: minutes.toString().padLeft(2, '0'),
    );
  }
}
