part of 'register_match_wizard_sheet.dart';

class _RegisterMatchWizardBottomActionsSection extends StatelessWidget {
  const _RegisterMatchWizardBottomActionsSection({
    required this.isSubmitting,
    required this.isFirstStep,
    required this.isLastStep,
    required this.onBackOrCancel,
    required this.onContinueOrSubmit,
  });

  final bool isSubmitting;
  final bool isFirstStep;
  final bool isLastStep;
  final VoidCallback onBackOrCancel;
  final VoidCallback onContinueOrSubmit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(12, 10, 12, 12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border(
          top: BorderSide(color: Theme.of(context).colorScheme.outlineVariant),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 52,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: isSubmitting ? null : onBackOrCancel,
                child: Text(
                  isFirstStep
                      ? t
                            .register_match
                            .ui_sheets_register_match_wizard_bottom_actions_section
                            .cancel
                      : t
                            .register_match
                            .ui_sheets_register_match_wizard_bottom_actions_section
                            .back,
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: SizedBox(
              height: 52,
              child: FilledButton(
                style: FilledButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: isSubmitting ? null : onContinueOrSubmit,
                child: isSubmitting
                    ? SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Text(
                        isLastStep
                            ? t
                                  .register_match
                                  .ui_sheets_register_match_wizard_bottom_actions_section
                                  .submitReport
                            : t
                                  .register_match
                                  .ui_sheets_register_match_wizard_bottom_actions_section
                                  .continueButton,
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
