import 'package:babel_text/babel_text.dart';
import 'package:flutter/material.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';
import 'package:root_hub_flutter/src/core/content/root_community_tools_content.dart';
import 'package:root_hub_flutter/src/features/home/ui/sheets/advanced_setup_faction_details_sheet.dart';
import 'package:root_hub_flutter/src/features/home/ui/widgets/advanced_setup_faction_card_widget.dart';

class AdvancedSetupQuickguideScreen extends StatelessWidget {
  const AdvancedSetupQuickguideScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final factions = standardSetupOrderUniqueFactions;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          t.home.ui_screens_advanced_setup_quickguide_screen.title,
        ),
      ),
      body: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.fromLTRB(16, 12, 16, 28),
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(18, 18, 18, 18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF3F6C8F).withValues(alpha: 0.18),
                    colorScheme.surfaceContainerHighest.withValues(alpha: 0.92),
                    colorScheme.surface,
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF3F6C8F).withValues(alpha: 0.12),
                    blurRadius: 30,
                    offset: Offset(0, 18),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    t
                        .home
                        .ui_screens_advanced_setup_quickguide_screen
                        .description,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    t
                        .home
                        .ui_screens_advanced_setup_quickguide_screen
                        .generalFlow,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: colorScheme.onSurface,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: 10),
                  BabelText(
                    buildAdvancedSetupOverviewBody(),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurface,
                      height: 1.42,
                      fontWeight: FontWeight.w600,
                    ),
                    styleMapping: {
                      '<h>': (_, currentStyle) => currentStyle.copyWith(
                        color: Color(0xFF3F6C8F),
                        fontWeight: FontWeight.w900,
                        decoration: TextDecoration.underline,
                      ),
                      '*': (_, currentStyle) => currentStyle.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                      '<i>': (_, currentStyle) => currentStyle.copyWith(
                        fontStyle: FontStyle.italic,
                      ),
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Text(
              t.home.ui_screens_advanced_setup_quickguide_screen.chooseAFaction,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: 6),
            Text(
              t
                  .home
                  .ui_screens_advanced_setup_quickguide_screen
                  .chooseAFactionDescription,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 14),
            GridView.builder(
              itemCount: factions.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                childAspectRatio: 0.82,
              ),
              itemBuilder: (context, index) {
                final faction = factions[index];

                return AdvancedSetupFactionCardWidget(
                  faction: faction,
                  onTap: () async {
                    await showModalBottomSheet<void>(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (context) {
                        return AdvancedSetupFactionDetailsSheet(
                          faction: faction,
                        );
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
