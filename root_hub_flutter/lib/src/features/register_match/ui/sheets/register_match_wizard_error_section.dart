part of 'register_match_wizard_sheet.dart';

class _RegisterMatchWizardErrorSection extends StatelessWidget {
  const _RegisterMatchWizardErrorSection({
    required this.error,
  });

  final RootHubException error;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.fromLTRB(16, 14, 16, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () => Navigator.of(context).pop(false),
                icon: Icon(Icons.close_rounded),
              ),
              SizedBox(width: 2),
              Text(
                t
                    .register_match
                    .ui_sheets_register_match_wizard_error_section
                    .l27c17,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          SizedBox(height: 18),
          Text(
            error.title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: 6),
          Text(
            error.description,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w700,
            ),
          ),
          Spacer(),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(
                t
                    .register_match
                    .ui_sheets_register_match_wizard_error_section
                    .l54c33,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
