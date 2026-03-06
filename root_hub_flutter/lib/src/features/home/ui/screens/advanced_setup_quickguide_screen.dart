import 'package:babel_text/babel_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    final bottomInset = MediaQuery.viewPaddingOf(context).bottom;
    final bodyTextStyle = Theme.of(context).textTheme.bodyLarge?.copyWith(
      color: colorScheme.onSurface,
      height: 1.48,
      fontWeight: FontWeight.w700,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          t.home.ui_screens_advanced_setup_quickguide_screen.title,
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.fromLTRB(16, 12, 16, bottomInset + 28),
        children: [
          Text(
            t.home.ui_screens_advanced_setup_quickguide_screen.chooseAFaction,
            style: GoogleFonts.cormorantGaramond(
              fontSize: 36,
              fontWeight: FontWeight.w700,
              color: colorScheme.onSurface,
              height: 0.96,
            ),
          ),
          SizedBox(height: 8),
          Text(
            t
                .home
                .ui_screens_advanced_setup_quickguide_screen
                .chooseAFactionDescription,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w700,
              height: 1.42,
            ),
          ),
          SizedBox(height: 22),
          GridView.builder(
            itemCount: factions.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 14,
              mainAxisSpacing: 18,
              childAspectRatio: 1.18,
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
          SizedBox(height: 34),
          Text(
            t.home.ui_screens_advanced_setup_quickguide_screen.referenceTitle,
            style: GoogleFonts.cormorantGaramond(
              fontSize: 34,
              fontWeight: FontWeight.w700,
              color: colorScheme.onSurface,
              height: 0.98,
            ),
          ),
          SizedBox(height: 8),
          Text(
            t.home.ui_screens_advanced_setup_quickguide_screen.description,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w700,
              height: 1.42,
            ),
          ),
          SizedBox(height: 18),
          BabelText(
            buildAdvancedSetupOverviewBody(),
            style: bodyTextStyle,
            styleMapping: {
              '<h>': (_, currentStyle) => GoogleFonts.cormorantGaramond(
                textStyle: currentStyle.copyWith(
                  color: Color(0xFF3F6C8F),
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  height: 1.02,
                ),
              ),
              '*': (_, currentStyle) => currentStyle.copyWith(
                fontWeight: FontWeight.w900,
              ),
              '<i>': (_, currentStyle) => currentStyle.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontStyle: FontStyle.italic,
              ),
            },
          ),
        ],
      ),
    );
  }
}
