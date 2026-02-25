part of 'register_match_wizard_sheet.dart';

class _RegisterMatchWizardParticipantsStepSection extends StatelessWidget {
  const _RegisterMatchWizardParticipantsStepSection({
    required this.participants,
    required this.onParticipantPresenceChanged,
    required this.onAddAnonymousPlayer,
    required this.onAddRegisteredPlayer,
  });

  final List<_ParticipantDraft> participants;
  final void Function(_ParticipantDraft participant, bool isPresent)
  onParticipantPresenceChanged;
  final VoidCallback onAddAnonymousPlayer;
  final VoidCallback onAddRegisteredPlayer;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t
              .register_match
              .ui_sheets_register_match_wizard_participants_step_section
              .l26c11,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        SizedBox(height: 6),
        Text(
          t
              .register_match
              .ui_sheets_register_match_wizard_participants_step_section
              .l33c11,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w700,
            height: 1.35,
          ),
        ),
        SizedBox(height: 14),
        for (final participant in participants)
          Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: CheckboxListTile(
              value: participant.isPresent,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 2,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
                side: BorderSide(color: colorScheme.outlineVariant),
              ),
              title: Text(
                participant.displayName,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
              subtitle: Text(
                participant.isAnonymous
                    ? t
                          .register_match
                          .ui_sheets_register_match_wizard_participants_step_section
                          .l62c23
                    : t
                          .register_match
                          .ui_sheets_register_match_wizard_participants_step_section
                          .l63c23,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w700,
                ),
              ),
              secondary: Icon(
                participant.isAnonymous
                    ? Icons.person_outline_rounded
                    : Icons.verified_user_rounded,
                color: participant.isAnonymous
                    ? colorScheme.tertiary
                    : colorScheme.primary,
              ),
              onChanged: (value) {
                onParticipantPresenceChanged(participant, value ?? false);
              },
            ),
          ),
        SizedBox(height: 4),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: onAddAnonymousPlayer,
            icon: Icon(Icons.person_add_alt_rounded),
            label: Text(
              t
                  .register_match
                  .ui_sheets_register_match_wizard_participants_step_section
                  .l88c31,
            ),
          ),
        ),
        SizedBox(height: 2),
        Align(
          alignment: Alignment.centerLeft,
          child: TextButton.icon(
            onPressed: onAddRegisteredPlayer,
            icon: Icon(Icons.search_rounded),
            label: Text(
              t
                  .register_match
                  .ui_sheets_register_match_wizard_participants_step_section
                  .l97c31,
            ),
          ),
        ),
      ],
    );
  }
}
