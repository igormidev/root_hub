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
          '$startedStepNumber) Match started at',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Set the time the match actually started.',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w700,
            height: 1.35,
          ),
        ),
        const SizedBox(height: 14),
        Text(
          'Match started at',
          style: theme.textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w900,
            color: colorScheme.primary,
          ),
        ),
        const SizedBox(height: 4),
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
        const SizedBox(height: 2),
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
              icon: const Icon(Icons.schedule_rounded),
              label: const Text('Change time'),
            ),
          ],
        ),
        const SizedBox(height: 14),
        Text(
          '$durationStepNumber) Estimated match duration',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Set the estimated duration. Adjust in 15-minute steps (max 8 hours).',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w700,
            height: 1.35,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Estimated duration',
          style: theme.textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w900,
            color: colorScheme.primary,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
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
                'Estimated duration',
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  IconButton.filledTonal(
                    onPressed: onDecreaseDuration,
                    icon: const Icon(Icons.remove_rounded),
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
                    icon: const Icon(Icons.add_rounded),
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
