import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeCommunityToolCardWidget extends StatelessWidget {
  const HomeCommunityToolCardWidget({
    required this.title,
    required this.icon,
    required this.accentColor,
    required this.enabled,
    required this.topLabel,
    this.titleMaxLines = 2,
    this.titleMinFontSize = 18,
    this.onTap,
    super.key,
  });

  final String title;
  final IconData icon;
  final Color accentColor;
  final bool enabled;
  final String topLabel;
  final int titleMaxLines;
  final double titleMinFontSize;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(28),
        onTap: enabled ? onTap : null,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            border: Border.all(
              color: enabled
                  ? accentColor.withValues(alpha: 0.38)
                  : colorScheme.outline.withValues(alpha: 0.14),
            ),
            boxShadow: [
              BoxShadow(
                color: accentColor.withValues(alpha: enabled ? 0.16 : 0.04),
                blurRadius: enabled ? 26 : 14,
                offset: Offset(0, enabled ? 16 : 8),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(27),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Padding(
                    padding: EdgeInsets.all(1.5),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.5),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            accentColor.withValues(
                              alpha: enabled ? 0.18 : 0.08,
                            ),
                            colorScheme.surfaceContainerHighest.withValues(
                              alpha: enabled ? 0.92 : 0.74,
                            ),
                            colorScheme.surface.withValues(alpha: 0.98),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 12,
                  right: 2,
                  child: Icon(
                    icon,
                    size: 90,
                    color: accentColor.withValues(alpha: enabled ? 0.18 : 0.1),
                  ),
                ),
                Positioned(
                  top: 14,
                  left: 14,
                  child: enabled
                      ? Container(
                          width: 34,
                          height: 34,
                          decoration: BoxDecoration(
                            color: colorScheme.surface.withValues(alpha: 0.78),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: accentColor.withValues(alpha: 0.22),
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Icon(
                            CupertinoIcons.arrow_up_right,
                            size: 16,
                            color: accentColor,
                          ),
                        )
                      : Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: colorScheme.surface.withValues(alpha: 0.76),
                            borderRadius: BorderRadius.circular(999),
                            border: Border.all(
                              color: colorScheme.outline.withValues(
                                alpha: 0.16,
                              ),
                            ),
                          ),
                          child: Text(
                            topLabel,
                            style: Theme.of(context).textTheme.labelMedium
                                ?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 0.3,
                                ),
                          ),
                        ),
                ),
                Positioned(
                  left: 16,
                  right: 16,
                  top: 104,
                  bottom: 16,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: AutoSizeText(
                      title,
                      maxLines: titleMaxLines,
                      minFontSize: titleMinFontSize,
                      overflow: TextOverflow.ellipsis,
                      stepGranularity: 0.5,
                      style: GoogleFonts.cormorantGaramond(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: colorScheme.onSurface,
                        height: 0.95,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
