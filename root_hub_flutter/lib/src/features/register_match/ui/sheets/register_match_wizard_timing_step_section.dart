part of 'register_match_wizard_sheet.dart';

class _RegisterMatchWizardTimingStepSection extends StatelessWidget {
  const _RegisterMatchWizardTimingStepSection({
    required this.startedStepNumber,
    required this.durationStepNumber,
    required this.matchStartedAt,
    required this.matchEstimatedDuration,
    required this.durationLabel,
    required this.onPickMatchStartedDate,
    required this.onPickMatchStartedTime,
    required this.onDecreaseDuration,
    required this.onIncreaseDuration,
  });

  final int startedStepNumber;
  final int durationStepNumber;
  final DateTime matchStartedAt;
  final Duration matchEstimatedDuration;
  final String durationLabel;
  final VoidCallback onPickMatchStartedDate;
  final VoidCallback onPickMatchStartedTime;
  final VoidCallback? onDecreaseDuration;
  final VoidCallback? onIncreaseDuration;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final localizations = MaterialLocalizations.of(context);
    final startedDateLabel = localizations.formatMediumDate(matchStartedAt);
    final startedTimeLabel = localizations.formatTimeOfDay(
      TimeOfDay.fromDateTime(matchStartedAt),
      alwaysUse24HourFormat: true,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.register_match.ui_sheets_register_match_wizard_timing_step_section
              .stepMatchStartedAt(stepNumber: startedStepNumber),
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        SizedBox(height: 6),
        Text(
          t
              .register_match
              .ui_sheets_register_match_wizard_timing_step_section
              .setTheTimeTheMatchActuallyStarted,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w700,
            height: 1.35,
          ),
        ),
        SizedBox(height: 14),
        Text(
          t
              .register_match
              .ui_sheets_register_match_wizard_timing_step_section
              .matchStartedAt,
          style: theme.textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w900,
            color: colorScheme.primary,
          ),
        ),
        SizedBox(height: 4),
        GestureDetector(
          onTap: onPickMatchStartedDate,
          child: Text(
            startedDateLabel,
            style: theme.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ),
        SizedBox(height: 2),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                startedTimeLabel,
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w900,
                  color: colorScheme.primary,
                ),
              ),
            ),
            FilledButton.tonalIcon(
              onPressed: onPickMatchStartedTime,
              icon: Icon(Icons.schedule_rounded),
              label: Text(
                t
                    .register_match
                    .ui_sheets_register_match_wizard_timing_step_section
                    .changeTime,
              ),
            ),
          ],
        ),
        SizedBox(height: 14),
        Text(
          t.register_match.ui_sheets_register_match_wizard_timing_step_section
              .stepEstimatedMatchDuration(stepNumber: durationStepNumber),
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        SizedBox(height: 6),
        Text(
          t
              .register_match
              .ui_sheets_register_match_wizard_timing_step_section
              .setTheEstimatedDurationAdjustIn15MinuteStepsMax8Hours,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w700,
            height: 1.35,
          ),
        ),
        SizedBox(height: 10),
        Text(
          t
              .register_match
              .ui_sheets_register_match_wizard_timing_step_section
              .estimatedDuration2,
          style: theme.textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w900,
            color: colorScheme.primary,
          ),
        ),
        SizedBox(height: 6),
        Container(
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: colorScheme.outlineVariant,
              width: 1,
            ),
            color: colorScheme.surfaceContainerLow,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                t
                    .register_match
                    .ui_sheets_register_match_wizard_timing_step_section
                    .estimatedDuration,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  IconButton.filledTonal(
                    onPressed: onDecreaseDuration,
                    icon: Icon(Icons.remove_rounded),
                  ),
                  Expanded(
                    child: Text(
                      durationLabel,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  IconButton.filledTonal(
                    onPressed: onIncreaseDuration,
                    icon: Icon(Icons.add_rounded),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
