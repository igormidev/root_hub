import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardThemeModeToggleWidget extends StatelessWidget {
  const DashboardThemeModeToggleWidget({
    required this.isDarkModeEnabled,
    required this.onDarkModeChanged,
    required this.title,
    required this.subtitle,
    required this.lightLabel,
    required this.darkLabel,
    super.key,
  });

  final bool isDarkModeEnabled;
  final ValueChanged<bool> onDarkModeChanged;
  final String title;
  final String subtitle;
  final String lightLabel;
  final String darkLabel;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final activePillColor = isDarkModeEnabled
        ? colorScheme.primaryContainer
        : colorScheme.secondaryContainer;
    final activePillTextColor = isDarkModeEnabled
        ? colorScheme.onPrimaryContainer
        : colorScheme.onSecondaryContainer;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeOutCubic,
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(14, 12, 14, 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: colorScheme.outlineVariant),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colorScheme.surfaceContainerHighest.withValues(alpha: 0.75),
            colorScheme.primaryContainer.withValues(alpha: 0.28),
          ],
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: activePillColor,
                ),
                child: Icon(
                  isDarkModeEnabled
                      ? Icons.nightlight_round_rounded
                      : Icons.wb_sunny_rounded,
                  color: activePillTextColor,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.nunitoSans(
                        fontWeight: FontWeight.w800,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: GoogleFonts.nunitoSans(
                        fontWeight: FontWeight.w700,
                        color: colorScheme.onSurfaceVariant,
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
              Switch.adaptive(
                value: isDarkModeEnabled,
                onChanged: onDarkModeChanged,
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 220),
                  curve: Curves.easeOutCubic,
                  padding: EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: isDarkModeEnabled
                        ? colorScheme.surfaceContainerHighest.withValues(
                            alpha: 0.62,
                          )
                        : activePillColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.wb_sunny_rounded,
                        size: 16,
                        color: isDarkModeEnabled
                            ? colorScheme.onSurfaceVariant
                            : activePillTextColor,
                      ),
                      SizedBox(width: 6),
                      Text(
                        lightLabel,
                        style: GoogleFonts.nunitoSans(
                          fontSize: 13,
                          fontWeight: FontWeight.w800,
                          color: isDarkModeEnabled
                              ? colorScheme.onSurfaceVariant
                              : activePillTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 220),
                  curve: Curves.easeOutCubic,
                  padding: EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: isDarkModeEnabled
                        ? activePillColor
                        : colorScheme.surfaceContainerHighest.withValues(
                            alpha: 0.62,
                          ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.nightlight_round_rounded,
                        size: 16,
                        color: isDarkModeEnabled
                            ? activePillTextColor
                            : colorScheme.onSurfaceVariant,
                      ),
                      SizedBox(width: 6),
                      Text(
                        darkLabel,
                        style: GoogleFonts.nunitoSans(
                          fontSize: 13,
                          fontWeight: FontWeight.w800,
                          color: isDarkModeEnabled
                              ? activePillTextColor
                              : colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
