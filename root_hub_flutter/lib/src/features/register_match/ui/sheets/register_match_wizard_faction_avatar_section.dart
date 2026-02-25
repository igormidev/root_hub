part of 'register_match_wizard_sheet.dart';

class _RegisterMatchWizardFactionAvatarSection extends StatelessWidget {
  const _RegisterMatchWizardFactionAvatarSection({
    required this.faction,
    this.radius = 13,
  });

  final Faction? faction;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return CircleAvatar(
      radius: radius,
      backgroundColor:
          (faction?.factionColor ?? colorScheme.surfaceContainerHighest)
              .withValues(alpha: 0.18),
      child: faction == null
          ? Icon(
              Icons.question_mark_rounded,
              size: 14,
              color: colorScheme.onSurfaceVariant,
            )
          : Image.asset(
              faction!.getFactionIconPath(
                size: FactionIconSize.size80,
              ),
              width: 15,
              height: 15,
            ),
    );
  }
}
