import 'package:flutter/material.dart';

class ShopCarouselIndicatorWidget extends StatelessWidget {
  const ShopCarouselIndicatorWidget({
    required this.itemCount,
    required this.activeIndex,
    required this.onTap,
    this.activeColor,
    this.inactiveColor,
    super.key,
  });

  final int itemCount;
  final int activeIndex;
  final void Function(int index) onTap;
  final Color? activeColor;
  final Color? inactiveColor;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final selectedColor = activeColor ?? colorScheme.primary;
    final idleColor =
        inactiveColor ?? colorScheme.outlineVariant.withValues(alpha: 0.84);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(itemCount, (index) {
        final selected = index == activeIndex;

        return GestureDetector(
          onTap: () {
            onTap(index);
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 220),
            curve: Curves.easeOutCubic,
            margin: EdgeInsets.symmetric(horizontal: 4),
            width: selected ? 22 : 8,
            height: 8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(999),
              color: selected ? selectedColor : idleColor,
            ),
          ),
        );
      }),
    );
  }
}
