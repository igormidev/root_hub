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
        SizedBox(height: 6),
        Text(
          t
              .register_match
              .ui_sheets_register_match_wizard_social_proof_step_section
              .l34c11,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w700,
            height: 1.35,
          ),
        ),
        SizedBox(height: 14),
        _RegisterMatchWizardProofCardSection(
          title: t
              .register_match
              .ui_sheets_register_match_wizard_social_proof_step_section
              .l43c18,
          subtitle: t
              .register_match
              .ui_sheets_register_match_wizard_social_proof_step_section
              .l44c21,
          image: groupPhoto,
          onTap: onPickGroupPhoto,
        ),
        SizedBox(height: 18),
        Text(
          t
              .register_match
              .ui_sheets_register_match_wizard_social_proof_step_section
              .l50c11,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        SizedBox(height: 6),
        Text(
          t
              .register_match
              .ui_sheets_register_match_wizard_social_proof_step_section
              .l57c11,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w700,
            height: 1.35,
          ),
        ),
        SizedBox(height: 14),
        _RegisterMatchWizardProofCardSection(
          title: t
              .register_match
              .ui_sheets_register_match_wizard_social_proof_step_section
              .l66c18,
          subtitle: t
              .register_match
              .ui_sheets_register_match_wizard_social_proof_step_section
              .l67c21,
          image: boardPhoto,
          onTap: onPickBoardPhoto,
        ),
      ],
    );
  }
}
