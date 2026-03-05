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
          t
              .register_match
              .ui_sheets_register_match_wizard_factions_step_section
              .value2SelectFactions,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        SizedBox(height: 6),
        Text(
          t
              .register_match
              .ui_sheets_register_match_wizard_factions_step_section
              .chooseTheFactionUsedByEachPlayerInThisMatch,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 14),
        for (final participant in selectedParticipants)
          Padding(
            padding: EdgeInsets.only(bottom: 12),
            child: Container(
              padding: EdgeInsets.fromLTRB(12, 10, 12, 10),
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
                  SizedBox(height: 8),
                  DropdownButtonFormField<Faction>(
                    key: ValueKey(
                      '${participant.key}-${participant.faction?.name ?? 'none'}',
                    ),
                    initialValue: participant.faction,
                    isExpanded: true,
                    decoration: InputDecoration(
                      labelText: t
                          .register_match
                          .ui_sheets_register_match_wizard_factions_step_section
                          .faction,
                      border: OutlineInputBorder(),
                    ),
                    hint: Text(
                      t
                          .register_match
                          .ui_sheets_register_match_wizard_factions_step_section
                          .selectFaction,
                    ),
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
                                SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    _displayNameForFactionOption(
                                      faction: faction,
                                      participant: participant,
                                      selectedParticipants:
                                          selectedParticipants,
                                    ),
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

  String _displayNameForFactionOption({
    required Faction faction,
    required _ParticipantDraft participant,
    required List<_ParticipantDraft> selectedParticipants,
  }) {
    if (faction != Faction.vagabond) {
      return faction.displayName;
    }

    final selectedVagabonds = selectedParticipants
        .where((entry) => entry.faction == Faction.vagabond)
        .toList();

    if (participant.faction == Faction.vagabond) {
      if (selectedVagabonds.length < 2) {
        return faction.displayName;
      }

      final selectedVagabondIndex = selectedVagabonds.indexWhere(
        (entry) => entry.key == participant.key,
      );
      if (selectedVagabondIndex == 0) {
        return t
            .register_match
            .ui_sheets_register_match_wizard_factions_step_section
            .firstVagabond;
      }
      if (selectedVagabondIndex == 1) {
        return t
            .register_match
            .ui_sheets_register_match_wizard_factions_step_section
            .secondVagabond;
      }

      return faction.displayName;
    }

    final selectedVagabondsByOtherParticipants = selectedParticipants
        .where(
          (entry) =>
              entry.key != participant.key && entry.faction == Faction.vagabond,
        )
        .length;

    if (selectedVagabondsByOtherParticipants >= 1) {
      return t
          .register_match
          .ui_sheets_register_match_wizard_factions_step_section
          .secondVagabond;
    }

    return faction.displayName;
  }
}
