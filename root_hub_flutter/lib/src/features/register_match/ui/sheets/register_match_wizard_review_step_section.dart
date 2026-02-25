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
          '$stepNumber) Review and submit',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Confirm all details before logging this match.',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          matchTitle,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 14),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: colorScheme.surfaceContainerLow,
            border: Border.all(color: colorScheme.outlineVariant),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Match started: $matchStartedLabel',
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Estimated duration: $estimatedDurationLabel',
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Winner method: $winnerMethodLabel',
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),
        Text(
          'Ranking',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 8),
        for (var index = 0; index < rankedParticipants.length; index++)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
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
                  const SizedBox(width: 8),
                  _RegisterMatchWizardFactionAvatarSection(
                    faction: rankedParticipants[index].faction,
                    radius: 14,
                  ),
                  const SizedBox(width: 8),
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
        const SizedBox(height: 10),
        Text(
          'Social proof',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 8),
        _RegisterMatchWizardReviewPhotoTile(
          title: 'Group photo',
          image: groupPhoto,
        ),
        const SizedBox(height: 10),
        _RegisterMatchWizardReviewPhotoTile(
          title: 'Board photo',
          image: boardPhoto,
        ),
      ],
    );
  }
}
