part of 'register_match_wizard_sheet.dart';

class _RegisterMatchWizardFactionsStepSection extends StatelessWidget {
  const _RegisterMatchWizardFactionsStepSection({
    required this.selectedParticipants,
    required this.availableFactionsForParticipant,
    required this.onFactionChanged,
  });

  final List<_ParticipantDraft> selectedParticipants;
  final List<Faction> Function(
    _ParticipantDraft participant,
    List<_ParticipantDraft> selectedParticipants,
  )
  availableFactionsForParticipant;
  final void Function(_ParticipantDraft participant, Faction? faction)
  onFactionChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '2) Select factions',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Choose the faction used by each player in this match.',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 14),
        for (final participant in selectedParticipants)
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Container(
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: colorScheme.outlineVariant),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    participant.displayName,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<Faction>(
                    key: ValueKey(
                      '${participant.key}-${participant.faction?.name ?? 'none'}',
                    ),
                    initialValue: participant.faction,
                    isExpanded: true,
                    decoration: const InputDecoration(
                      labelText: 'Faction',
                      border: OutlineInputBorder(),
                    ),
                    hint: const Text('Select faction'),
                    items:
                        availableFactionsForParticipant(
                          participant,
                          selectedParticipants,
                        ).map((faction) {
                          return DropdownMenuItem<Faction>(
                            value: faction,
                            child: Row(
                              children: [
                                _RegisterMatchWizardFactionAvatarSection(
                                  faction: faction,
                                  radius: 12,
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    faction.displayName,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                    onChanged: (value) {
                      onFactionChanged(participant, value);
                    },
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
