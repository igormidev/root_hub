part of 'register_match_wizard_sheet.dart';

class _RegisterMatchWizardSocialProofStepSection extends StatelessWidget {
  const _RegisterMatchWizardSocialProofStepSection({
    required this.stepNumber,
    required this.groupPhoto,
    required this.boardPhoto,
    required this.onPickGroupPhoto,
    required this.onPickBoardPhoto,
  });

  final int stepNumber;
  final _ProofImageSelection? groupPhoto;
  final _ProofImageSelection? boardPhoto;
  final VoidCallback onPickGroupPhoto;
  final VoidCallback onPickBoardPhoto;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$stepNumber) Social proof',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Upload both photos to confirm this match happened in person.',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w700,
            height: 1.35,
          ),
        ),
        const SizedBox(height: 14),
        _RegisterMatchWizardProofCardSection(
          title: 'Group photo',
          subtitle: 'Selfie with all players. Include the board if possible.',
          image: groupPhoto,
          onTap: onPickGroupPhoto,
        ),
        const SizedBox(height: 18),
        Text(
          'Board photo proof',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Upload a photo of the board with the score track clearly visible.',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w700,
            height: 1.35,
          ),
        ),
        const SizedBox(height: 14),
        _RegisterMatchWizardProofCardSection(
          title: 'Board photo',
          subtitle: 'Capture the board and score track clearly.',
          image: boardPhoto,
          onTap: onPickBoardPhoto,
        ),
      ],
    );
  }
}
