import 'package:flutter/material.dart';
import 'package:root_hub_flutter/src/core/content/root_community_tools_content.dart';

class ReachCalculatorFactionButtonWidget extends StatelessWidget {
  const ReachCalculatorFactionButtonWidget({
    required this.faction,
    required this.status,
    required this.onTap,
    super.key,
  });

  final ReachCalculatorFaction faction;
  final ReachCalculatorFactionStatus status;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isUnavailable = status == ReachCalculatorFactionStatus.unavailable;
    final isPicked = status == ReachCalculatorFactionStatus.picked;
    final isBanned = status == ReachCalculatorFactionStatus.banned;
    final badgeColor = isPicked
        ? const Color(0xFF4DA251)
        : isBanned
        ? const Color(0xFFB66969)
        : colorScheme.outlineVariant;
    final diameter = isUnavailable ? 76.0 : 98.0;

    return Semantics(
      button: true,
      enabled: !isUnavailable,
      label: faction.localizedName(),
      child: Center(
        child: AnimatedOpacity(
          duration: Duration(milliseconds: 220),
          opacity: isUnavailable ? 0.46 : 1,
          child: SizedBox(
            width: 118,
            height: 118,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: isUnavailable ? null : onTap,
              child: Center(
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 220),
                  curve: Curves.easeOutCubic,
                  width: diameter,
                  height: diameter,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        colorScheme.surface.withValues(alpha: 0.94),
                        colorScheme.surfaceContainerHighest.withValues(
                          alpha: 0.98,
                        ),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color:
                            (isPicked || isBanned
                                    ? badgeColor
                                    : colorScheme.shadow)
                                .withValues(alpha: isUnavailable ? 0.05 : 0.14),
                        blurRadius: isUnavailable ? 12 : 20,
                        spreadRadius: isUnavailable ? 0 : 1,
                        offset: Offset(0, isUnavailable ? 6 : 11),
                      ),
                    ],
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned.fill(
                        child: Padding(
                          padding: EdgeInsets.all(isUnavailable ? 14 : 10),
                          child: Image.asset(
                            faction.iconAssetPath,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      if (isPicked || isBanned)
                        Positioned.fill(
                          child: Align(
                            child: Container(
                              width: isBanned ? 58 : 54,
                              height: isBanned ? 58 : 54,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: colorScheme.surface.withValues(
                                  alpha: isPicked ? 0.58 : 0.48,
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Icon(
                                isPicked
                                    ? Icons.check_circle_rounded
                                    : Icons.block_rounded,
                                color: badgeColor,
                                size: isBanned ? 44 : 40,
                              ),
                            ),
                          ),
                        ),
                      Positioned(
                        top: -4,
                        right: -2,
                        child: Container(
                          width: isUnavailable ? 30 : 38,
                          height: isUnavailable ? 30 : 38,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: badgeColor,
                            boxShadow: [
                              BoxShadow(
                                color: badgeColor.withValues(alpha: 0.2),
                                blurRadius: 12,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '${faction.reach}',
                            style: Theme.of(context).textTheme.labelLarge
                                ?.copyWith(
                                  color: colorScheme.surface,
                                  fontWeight: FontWeight.w900,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
