import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';

class ReachCalculatorPlayerQuantitySelectorWidget extends StatelessWidget {
  const ReachCalculatorPlayerQuantitySelectorWidget({
    required this.selectedPlayerCount,
    required this.playerCounts,
    required this.onChanged,
    super.key,
  });

  final int selectedPlayerCount;
  final List<int> playerCounts;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final bottomInset = MediaQuery.viewPaddingOf(context).bottom;

    return Padding(
      padding: EdgeInsets.fromLTRB(16, 6, 16, bottomInset),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            t.home.ui_screens_root_reach_calculator_screen.players,
            style: GoogleFonts.medievalSharp(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: colorScheme.onSurface,
            ),
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (final playerCount in playerCounts) ...[
                if (playerCount != playerCounts.first) SizedBox(width: 8),
                AnimatedScale(
                  duration: Duration(milliseconds: 220),
                  curve: Curves.easeOutCubic,
                  scale: playerCount == selectedPlayerCount ? 1 : 0.9,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(18),
                      onTap: () {
                        onChanged(playerCount);
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 220),
                        curve: Curves.easeOutCubic,
                        width: playerCount == selectedPlayerCount ? 48 : 42,
                        height: playerCount == selectedPlayerCount ? 48 : 42,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: playerCount == selectedPlayerCount
                                ? [
                                    colorScheme.primary,
                                    colorScheme.primary.withValues(
                                      alpha: 0.84,
                                    ),
                                  ]
                                : [
                                    colorScheme.surfaceContainerHighest,
                                    colorScheme.surfaceContainer,
                                  ],
                          ),
                          border: Border.all(
                            color: playerCount == selectedPlayerCount
                                ? colorScheme.primary.withValues(
                                    alpha: 0.32,
                                  )
                                : colorScheme.outline.withValues(
                                    alpha: 0.14,
                                  ),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color:
                                  (playerCount == selectedPlayerCount
                                          ? colorScheme.primary
                                          : colorScheme.shadow)
                                      .withValues(
                                        alpha:
                                            playerCount == selectedPlayerCount
                                            ? 0.22
                                            : 0.08,
                                      ),
                              blurRadius: playerCount == selectedPlayerCount
                                  ? 16
                                  : 10,
                              offset: Offset(
                                0,
                                playerCount == selectedPlayerCount ? 8 : 4,
                              ),
                            ),
                          ],
                        ),
                        alignment: Alignment.center,
                        child: AnimatedDefaultTextStyle(
                          duration: Duration(milliseconds: 220),
                          curve: Curves.easeOutCubic,
                          style: Theme.of(context).textTheme.titleMedium!
                              .copyWith(
                                color: playerCount == selectedPlayerCount
                                    ? colorScheme.onPrimary
                                    : colorScheme.onSurface,
                                fontWeight: playerCount == selectedPlayerCount
                                    ? FontWeight.w900
                                    : FontWeight.w700,
                              ),
                          child: Text('$playerCount'),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
