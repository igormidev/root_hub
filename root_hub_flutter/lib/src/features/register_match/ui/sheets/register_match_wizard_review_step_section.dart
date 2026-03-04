part of 'register_match_wizard_sheet.dart';

class _RegisterMatchWizardReviewStepSection extends StatelessWidget {
  const _RegisterMatchWizardReviewStepSection({
    required this.stepNumber,
    required this.matchTitle,
    required this.matchStartedLabel,
    required this.estimatedDurationLabel,
    required this.winnerMethodLabel,
    required this.rankedParticipants,
    required this.scoreLabelForParticipant,
    required this.groupPhoto,
    required this.boardPhoto,
  });

  final int stepNumber;
  final String matchTitle;
  final String matchStartedLabel;
  final String estimatedDurationLabel;
  final String winnerMethodLabel;
  final List<_ParticipantDraft> rankedParticipants;
  final String Function(_ParticipantDraft participant) scoreLabelForParticipant;
  final _ProofImageSelection? groupPhoto;
  final _ProofImageSelection? boardPhoto;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.register_match.ui_sheets_register_match_wizard_review_step_section
              .stepReviewAndSubmit(stepNumber: stepNumber),
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        SizedBox(height: 6),
        Text(
          t
              .register_match
              .ui_sheets_register_match_wizard_review_step_section
              .confirmAllDetailsBeforeLoggingThisMatch,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 10),
        Text(
          matchTitle,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        SizedBox(height: 14),
        Container(
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(12, 10, 12, 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: colorScheme.surfaceContainerLow,
            border: Border.all(color: colorScheme.outlineVariant),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                t
                    .register_match
                    .ui_sheets_register_match_wizard_review_step_section
                    .matchStartedValue(value: matchStartedLabel),
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 4),
              Text(
                t
                    .register_match
                    .ui_sheets_register_match_wizard_review_step_section
                    .estimatedDurationValue(value: estimatedDurationLabel),
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 4),
              Text(
                t
                    .register_match
                    .ui_sheets_register_match_wizard_review_step_section
                    .winnerMethodValue(value: winnerMethodLabel),
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 14),
        Text(
          t
              .register_match
              .ui_sheets_register_match_wizard_review_step_section
              .ranking,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        SizedBox(height: 8),
        for (var index = 0; index < rankedParticipants.length; index++)
          Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: colorScheme.surfaceContainerLow,
                border: Border.all(color: colorScheme.outlineVariant),
              ),
              child: Row(
                children: [
                  Container(
                    width: 28,
                    height: 28,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(999),
                      color: colorScheme.primaryContainer,
                    ),
                    child: Text(
                      '${index + 1}',
                      style: theme.textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.w900,
                        color: colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  _RegisterMatchWizardFactionAvatarSection(
                    faction: rankedParticipants[index].faction,
                    radius: 14,
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      rankedParticipants[index].displayName,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Text(
                    scoreLabelForParticipant(rankedParticipants[index]),
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ),
        SizedBox(height: 10),
        Text(
          t
              .register_match
              .ui_sheets_register_match_wizard_review_step_section
              .socialProof,
          style: GoogleFonts.getFont(
            'MedievalSharp',
            fontSize: 34,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
            color: colorScheme.onSurface,
          ),
        ),
        SizedBox(height: 8),
        _RegisterMatchWizardReviewPhotoTile(
          title: t
              .register_match
              .ui_sheets_register_match_wizard_review_step_section
              .groupPhoto,
          image: groupPhoto,
        ),
        SizedBox(height: 10),
        _RegisterMatchWizardReviewPhotoTile(
          title: t
              .register_match
              .ui_sheets_register_match_wizard_review_step_section
              .boardPhoto,
          image: boardPhoto,
        ),
      ],
    );
  }
}
