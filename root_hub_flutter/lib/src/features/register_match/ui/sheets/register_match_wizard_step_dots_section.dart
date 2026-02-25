part of 'register_match_wizard_sheet.dart';

class _RegisterMatchWizardStepDotsSection extends StatelessWidget {
  const _RegisterMatchWizardStepDotsSection({
    required this.currentStepIndex,
    required this.totalSteps,
    required this.onStepTap,
  });

  final int currentStepIndex;
  final int totalSteps;
  final ValueChanged<int> onStepTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: colorScheme.outlineVariant),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (var index = 0; index < totalSteps; index++)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: InkWell(
                borderRadius: BorderRadius.circular(999),
                onTap: index <= currentStepIndex
                    ? () => onStepTap(index)
                    : null,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 220),
                  curve: Curves.easeOutCubic,
                  width: index == currentStepIndex ? 22 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(999),
                    color: index == currentStepIndex
                        ? colorScheme.primary
                        : index < currentStepIndex
                        ? colorScheme.primary.withValues(alpha: 0.55)
                        : colorScheme.outlineVariant,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
