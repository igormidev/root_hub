part of 'register_match_wizard_sheet.dart';

class _RegisterMatchWizardLoadingSection extends StatelessWidget {
  const _RegisterMatchWizardLoadingSection();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 36,
            height: 36,
            child: CircularProgressIndicator(
              strokeWidth: 3,
              color: colorScheme.primary,
            ),
          ),
          SizedBox(height: 12),
          Text(
            t
                .register_match
                .ui_sheets_register_match_wizard_loading_section
                .loadingMatchDetails,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}
