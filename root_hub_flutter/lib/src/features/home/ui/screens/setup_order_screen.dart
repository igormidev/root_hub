import 'package:babel_text/babel_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';
import 'package:root_hub_flutter/src/core/content/root_community_tools_content.dart';
import 'package:root_hub_flutter/src/features/home/ui/widgets/setup_order_arrow_widget.dart';
import 'package:root_hub_flutter/src/features/home/ui/widgets/setup_order_step_card_widget.dart';

class SetupOrderScreen extends StatelessWidget {
  const SetupOrderScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final bottomInset = MediaQuery.viewPaddingOf(context).bottom;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          t.home.ui_screens_setup_order_screen.title,
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(top: 12, bottom: bottomInset + 28),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              t.home.ui_screens_setup_order_screen.description,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w700,
                height: 1.45,
              ),
            ),
          ),
          SizedBox(height: 22),
          for (
            var index = 0;
            index < standardSetupOrderUniqueFactions.length;
            index++
          ) ...[
            SetupOrderStepCardWidget(
              position: index + 1,
              faction: standardSetupOrderUniqueFactions[index],
            ),
            if (index != standardSetupOrderUniqueFactions.length - 1) ...[
              SizedBox(height: 4),
              Center(
                child: SetupOrderArrowWidget(),
              ),
              SizedBox(height: 4),
            ],
          ],
          SizedBox(height: 18),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              t.home.ui_screens_setup_order_screen.secondVagabondTitle,
              style: GoogleFonts.medievalSharp(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: colorScheme.onSurface,
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: BabelText(
              buildSetupOrderSecondVagabondBody(),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurface,
                height: 1.48,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
