import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/core/extension/faction_ui_extension.dart';

class AdvancedSetupFactionCardWidget extends StatelessWidget {
  const AdvancedSetupFactionCardWidget({
    required this.faction,
    required this.onTap,
    super.key,
  });

  final Faction faction;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    const cardRadius = 28.0;
    const imageHeight = 122.0;
    const labelAreaHeight = 64.0;
    const labelBottomPadding = 16.0;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(cardRadius),
        onTap: onTap,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned.fill(
              top: 28,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(cardRadius),
                  border: Border.all(
                    color: faction.factionColor.withValues(alpha: 0.28),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: faction.factionColor.withValues(alpha: 0.14),
                      blurRadius: 22,
                      offset: Offset(0, 14),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(cardRadius - 1),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                faction.factionColor.withValues(alpha: 0.18),
                                colorScheme.surfaceContainerHighest.withValues(
                                  alpha: 0.88,
                                ),
                                colorScheme.surface.withValues(alpha: 0.98),
                              ],
                              stops: [0, 0.52, 1],
                            ),
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(
                            14,
                            66,
                            14,
                            labelBottomPadding,
                          ),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: SizedBox(
                              height: labelAreaHeight,
                              child: Center(
                                child: Text(
                                  faction.displayName,
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.medievalSharp(
                                    fontSize: 23,
                                    fontWeight: FontWeight.w400,
                                    color: colorScheme.onSurface,
                                    height: 1.12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: -10,
              left: 0,
              right: 0,
              child: IgnorePointer(
                child: SizedBox(
                  height: imageHeight,
                  child: Image.asset(
                    faction.getFactionImage,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
