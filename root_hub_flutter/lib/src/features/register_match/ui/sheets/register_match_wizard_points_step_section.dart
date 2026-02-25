part of 'register_match_wizard_sheet.dart';

class _RegisterMatchWizardPointsStepSection extends StatelessWidget {
  const _RegisterMatchWizardPointsStepSection({
    required this.stepNumber,
    required this.selectedParticipants,
    required this.winnerParticipantKey,
    required this.winnerType,
    required this.controllerFor,
    required this.onParticipantScoreModeChanged,
    required this.onAnyScoreChanged,
  });

  final int stepNumber;
  final List<_ParticipantDraft> selectedParticipants;
  final String? winnerParticipantKey;
  final _WinnerType? winnerType;
  final TextEditingController Function(String key) controllerFor;
  final void Function(_ParticipantDraft participant, _ParticipantScoreMode mode)
  onParticipantScoreModeChanged;
  final VoidCallback onAnyScoreChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$stepNumber) Points by player',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        SizedBox(height: 6),
        Text(
          t
                  .register_match
                  .ui_sheets_register_match_wizard_points_step_section
                  .forEachNonWinnerSetPointsOrMarkFailedDominanceAttempt +
              t
                  .register_match
                  .ui_sheets_register_match_wizard_points_step_section
                  .failedDominanceAlwaysCountsAsNoPoints,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w700,
            height: 1.35,
          ),
        ),
        SizedBox(height: 14),
        for (final participant in selectedParticipants)
          Padding(
            padding: EdgeInsets.only(bottom: 12),
            child: Container(
              padding: EdgeInsets.fromLTRB(12, 10, 12, 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: colorScheme.outlineVariant),
                color: colorScheme.surfaceContainerLow,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      _RegisterMatchWizardFactionAvatarSection(
                        faction: participant.faction,
                        radius: 15,
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          participant.displayName,
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      if (participant.key == winnerParticipantKey)
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(999),
                            color: colorScheme.primaryContainer,
                          ),
                          child: Text(
                            t
                                .register_match
                                .ui_sheets_register_match_wizard_points_step_section
                                .winner,
                            style: theme.textTheme.labelSmall?.copyWith(
                              fontWeight: FontWeight.w900,
                              color: colorScheme.onPrimaryContainer,
                            ),
                          ),
                        ),
                    ],
                  ),
                  if (participant.key != winnerParticipantKey) ...[
                    SizedBox(height: 10),
                    SegmentedButton<_ParticipantScoreMode>(
                      segments: [
                        ButtonSegment<_ParticipantScoreMode>(
                          value: _ParticipantScoreMode.points,
                          icon: Icon(Icons.pin_rounded),
                          label: Text(
                            t
                                .register_match
                                .ui_sheets_register_match_wizard_points_step_section
                                .points2,
                          ),
                        ),
                        ButtonSegment<_ParticipantScoreMode>(
                          value: _ParticipantScoreMode.failedDominance,
                          icon: Icon(Icons.flag_rounded),
                          label: Text(
                            t
                                .register_match
                                .ui_sheets_register_match_wizard_points_step_section
                                .failedDominance,
                          ),
                        ),
                      ],
                      selected: <_ParticipantScoreMode>{participant.scoreMode},
                      onSelectionChanged: (selection) {
                        if (selection.isEmpty) {
                          return;
                        }
                        onParticipantScoreModeChanged(
                          participant,
                          selection.first,
                        );
                      },
                    ),
                  ],
                  SizedBox(height: 10),
                  if (participant.key == winnerParticipantKey &&
                      winnerType == _WinnerType.points)
                    _RegisterMatchWizardScoreSummarySection(
                      label: t
                          .register_match
                          .ui_sheets_register_match_wizard_points_step_section
                          .winnerByPoints,
                      value: '30',
                    )
                  else if (participant.key == winnerParticipantKey &&
                      winnerType == _WinnerType.dominance)
                    _RegisterMatchWizardScoreSummarySection(
                      label: t
                          .register_match
                          .ui_sheets_register_match_wizard_points_step_section
                          .winnerByDominance,
                      value: 'No points',
                    )
                  else if (participant.scoreMode ==
                      _ParticipantScoreMode.failedDominance)
                    _RegisterMatchWizardScoreSummarySection(
                      label: t
                          .register_match
                          .ui_sheets_register_match_wizard_points_step_section
                          .dominanceAttempt,
                      value: 'Failed (no points)',
                    )
                  else
                    TextField(
                      controller: controllerFor(participant.key),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(2),
                      ],
                      decoration: InputDecoration(
                        labelText: t
                            .register_match
                            .ui_sheets_register_match_wizard_points_step_section
                            .points,
                        hintText: t
                            .register_match
                            .ui_sheets_register_match_wizard_points_step_section
                            .value0To29,
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (_) {
                        onAnyScoreChanged();
                      },
                    ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
