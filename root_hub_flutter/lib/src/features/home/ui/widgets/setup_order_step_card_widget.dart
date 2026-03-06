import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/core/extension/faction_ui_extension.dart';

class SetupOrderStepCardWidget extends StatelessWidget {
  const SetupOrderStepCardWidget({
    required this.position,
    required this.faction,
    super.key,
  });

  final int position;
  final Faction faction;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 148,
      child: Stack(
        children: [
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    faction.factionColor.withValues(alpha: 0.22),
                    faction.factionColor.withValues(alpha: 0.08),
                    Colors.transparent,
                  ],
                  stops: [0, 0.46, 1],
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.fromLTRB(8, 8, 0, 8),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$position',
                          style: Theme.of(context).textTheme.displayMedium
                              ?.copyWith(
                                color: faction.factionColor.withValues(
                                  alpha: 0.96,
                                ),
                                fontWeight: FontWeight.w900,
                                height: 0.9,
                              ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          faction.displayName,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.medievalSharp(
                            fontSize: 26,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).colorScheme.onSurface,
                            height: 1.04,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 12),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 112,
                        height: 112,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                            colors: [
                              faction.factionColor.withValues(alpha: 0.16),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 114,
                        height: 114,
                        child: Image.asset(
                          faction.getFactionImage,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
