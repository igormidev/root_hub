part of 'register_match_wizard_sheet.dart';

class _RegisterMatchWizardWinnerStepSection extends StatelessWidget {
  const _RegisterMatchWizardWinnerStepSection({
    required this.stepNumber,
    required this.selectedParticipants,
    required this.winnerParticipantKey,
    required this.coalitionVagabondWinnerKey,
    required this.coalitionEligibleVagabonds,
    required this.winnerType,
    required this.onWinnerSelected,
    required this.onWinnerTypeChanged,
    required this.onCoalitionVagabondWinnerChanged,
  });

  final int stepNumber;
  final List<_ParticipantDraft> selectedParticipants;
  final String? winnerParticipantKey;
  final String? coalitionVagabondWinnerKey;
  final List<_ParticipantDraft> coalitionEligibleVagabonds;
  final _WinnerType? winnerType;
  final ValueChanged<String> onWinnerSelected;
  final ValueChanged<_WinnerType> onWinnerTypeChanged;
  final ValueChanged<String?> onCoalitionVagabondWinnerChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.register_match.ui_sheets_register_match_wizard_winner_step_section
              .stepSelectTheWinner(stepNumber: stepNumber),
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        SizedBox(height: 6),
        Text(
          t
              .register_match
              .ui_sheets_register_match_wizard_winner_step_section
              .pickThePlayerWhoWonThisMatch,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w700,
            height: 1.35,
          ),
        ),
        SizedBox(height: 14),
        for (final participant in selectedParticipants)
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 2),
            leading: Icon(
              winnerParticipantKey == participant.key
                  ? Icons.radio_button_checked_rounded
                  : Icons.radio_button_unchecked_rounded,
            ),
            title: Row(
              children: [
                _RegisterMatchWizardFactionAvatarSection(
                  faction: participant.faction,
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    participant.displayName,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
            onTap: () {
              onWinnerSelected(participant.key);
            },
          ),
        SizedBox(height: 10),
        Text(
          t
              .register_match
              .ui_sheets_register_match_wizard_winner_step_section
              .howDidTheWinnerWon,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        SizedBox(height: 6),
        Text(
          t
                  .register_match
                  .ui_sheets_register_match_wizard_winner_step_section
                  .totalPointsMeansTheWinnerReached30VictoryPointsOnTheScoreTrack +
              t
                  .register_match
                  .ui_sheets_register_match_wizard_winner_step_section
                  .dominanceMeansTheWinnerCompletedADominanceCardObjectiveInsteadOfWinningB,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w700,
            height: 1.35,
          ),
        ),
        SizedBox(height: 10),
        SegmentedButton<_WinnerType>(
          emptySelectionAllowed: true,
          segments: [
            ButtonSegment<_WinnerType>(
              value: _WinnerType.points,
              icon: Icon(Icons.stars_rounded),
              enabled: coalitionVagabondWinnerKey == null,
              label: Text(
                t
                    .register_match
                    .ui_sheets_register_match_wizard_winner_step_section
                    .totalPoints30,
              ),
            ),
            ButtonSegment<_WinnerType>(
              value: _WinnerType.dominance,
              icon: Icon(Icons.flag_rounded),
              label: Text(
                t
                    .register_match
                    .ui_sheets_register_match_wizard_winner_step_section
                    .dominance,
              ),
            ),
          ],
          selected: winnerType == null
              ? <_WinnerType>{}
              : <_WinnerType>{winnerType!},
          onSelectionChanged: (selection) {
            if (selection.isEmpty) {
              return;
            }
            if (selection.first == _WinnerType.points &&
                coalitionVagabondWinnerKey != null) {
              return;
            }
            onWinnerTypeChanged(selection.first);
          },
        ),
        if (coalitionEligibleVagabonds.isNotEmpty &&
            winnerParticipantKey != null) ...[
          SizedBox(height: 14),
          Text(
            t
                .register_match
                .ui_sheets_register_match_wizard_winner_step_section
                .vagabondCoalitionWin,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: 6),
          Text(
            t
                .register_match
                .ui_sheets_register_match_wizard_winner_step_section
                .ifWinnerWonByDominanceSelectOneVagabondToWinToo,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w700,
              height: 1.35,
            ),
          ),
          SizedBox(height: 8),
          for (final participant in coalitionEligibleVagabonds)
            CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              value: coalitionVagabondWinnerKey == participant.key,
              onChanged: (checked) {
                onCoalitionVagabondWinnerChanged(
                  checked == true ? participant.key : null,
                );
              },
              title: Text(
                participant.displayName,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
              subtitle: Text(
                _vagabondLabelForParticipant(participant),
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          if (coalitionVagabondWinnerKey != null)
            Text(
              t
                  .register_match
                  .ui_sheets_register_match_wizard_winner_step_section
                  .selectingVagabondForcesDominance,
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w700,
              ),
            ),
        ],
      ],
    );
  }

  String _vagabondLabelForParticipant(_ParticipantDraft participant) {
    final selectedVagabonds = selectedParticipants
        .where((entry) => entry.faction == Faction.vagabond)
        .toList();
    if (selectedVagabonds.length < 2) {
      return Faction.vagabond.displayName;
    }

    final selectedVagabondIndex = selectedVagabonds.indexWhere(
      (entry) => entry.key == participant.key,
    );
    if (selectedVagabondIndex == 0) {
      return t
          .register_match
          .ui_sheets_register_match_wizard_factions_step_section
          .firstVagabond;
    }
    if (selectedVagabondIndex == 1) {
      return t
          .register_match
          .ui_sheets_register_match_wizard_factions_step_section
          .secondVagabond;
    }

    return Faction.vagabond.displayName;
  }
}
