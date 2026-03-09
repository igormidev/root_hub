import 'package:flutter/material.dart';

class SlidingSegmentedControlOption<T> {
  const SlidingSegmentedControlOption({
    required this.value,
    required this.label,
  });

  final T value;
  final String label;
}

class SlidingSegmentedControlWidget<T> extends StatelessWidget {
  const SlidingSegmentedControlWidget({
    required this.options,
    required this.selectedValue,
    required this.onChanged,
    super.key,
  });

  final List<SlidingSegmentedControlOption<T>> options;
  final T selectedValue;
  final ValueChanged<T> onChanged;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final selectedIndex = options.indexWhere(
      (option) => option.value == selectedValue,
    );
    final resolvedSelectedIndex = selectedIndex < 0 ? 0 : selectedIndex;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.9),
        ),
        color: colorScheme.surface.withValues(alpha: 0.92),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withValues(alpha: 0.06),
            blurRadius: 18,
            offset: Offset(0, 10),
          ),
        ],
      ),
      padding: EdgeInsets.all(4),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final itemWidth = constraints.maxWidth / options.length;

          return Stack(
            children: [
              AnimatedPositioned(
                duration: Duration(milliseconds: 260),
                curve: Curves.easeInOutCubic,
                left: resolvedSelectedIndex * itemWidth,
                top: 0,
                bottom: 0,
                width: itemWidth,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        colorScheme.primaryContainer,
                        colorScheme.primaryContainer.withValues(alpha: 0.78),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: colorScheme.primary.withValues(alpha: 0.16),
                        blurRadius: 16,
                        offset: Offset(0, 8),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  for (final option in options)
                    Expanded(
                      child: Semantics(
                        button: true,
                        selected: option.value == selectedValue,
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(22),
                            onTap: () {
                              onChanged(option.value);
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 14,
                              ),
                              child: Center(
                                child: AnimatedDefaultTextStyle(
                                  duration: Duration(milliseconds: 220),
                                  curve: Curves.easeInOutCubic,
                                  style:
                                      Theme.of(
                                        context,
                                      ).textTheme.titleSmall!.copyWith(
                                        fontWeight: FontWeight.w900,
                                        color: option.value == selectedValue
                                            ? colorScheme.onPrimaryContainer
                                            : colorScheme.onSurfaceVariant,
                                      ),
                                  child: Text(
                                    option.label,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: false,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
