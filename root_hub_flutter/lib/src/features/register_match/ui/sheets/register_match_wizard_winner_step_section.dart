part of 'register_match_wizard_sheet.dart';

class _RegisterMatchWizardWinnerStepSection extends StatelessWidget {
  const _RegisterMatchWizardWinnerStepSection({
    required this.stepNumber,
    required this.selectedParticipants,
    required this.winnerParticipantKey,
    required this.winnerType,
    required this.onWinnerSelected,
    required this.onWinnerTypeChanged,
  });

  final int stepNumber;
  final List<_ParticipantDraft> selectedParticipants;
  final String? winnerParticipantKey;
  final _WinnerType? winnerType;
  final ValueChanged<String> onWinnerSelected;
  final ValueChanged<_WinnerType> onWinnerTypeChanged;

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
            onWinnerTypeChanged(selection.first);
          },
        ),
      ],
    );
  }
}
