import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';
import 'package:root_hub_flutter/src/core/content/root_community_tools_content.dart';
import 'package:root_hub_flutter/src/core/navigation/app_routes.dart';
import 'package:root_hub_flutter/src/features/home/ui/widgets/home_community_tool_card_widget.dart';

class HomeCommunityToolsSection extends StatelessWidget {
  const HomeCommunityToolsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final tools = RootCommunityTool.values;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            t.home.ui_sections_home_community_tools_section.title,
            style: GoogleFonts.cormorantGaramond(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: colorScheme.onSurface,
            ),
          ),
        ),
        SizedBox(height: 6),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            t.home.ui_sections_home_community_tools_section.description,
            style: textTheme.bodyLarge?.copyWith(
              color: colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w600,
              height: 1.4,
            ),
          ),
        ),
        SizedBox(height: 14),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: GridView.builder(
            itemCount: tools.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 14,
              mainAxisSpacing: 14,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              final tool = tools[index];
              final route = switch (tool) {
                RootCommunityTool.reachCalculator =>
                  dashboardReachCalculatorPath,
                RootCommunityTool.advancedSetupQuickguide =>
                  dashboardAdvancedSetupQuickguidePath,
                RootCommunityTool.setupOrder => dashboardSetupOrderPath,
                RootCommunityTool.recommendedFactionsToPlay =>
                  dashboardRecommendedCompositionsPath,
              };

              return HomeCommunityToolCardWidget(
                title: tool.localizedTitle(t),
                icon: tool.icon,
                accentColor: tool.accentColor,
                enabled: tool.isEnabled,
                titleMaxLines:
                    tool == RootCommunityTool.recommendedFactionsToPlay ? 3 : 2,
                titleMinFontSize:
                    tool == RootCommunityTool.recommendedFactionsToPlay
                    ? 12
                    : 18,
                topLabel: tool.isEnabled
                    ? t.home.ui_sections_home_community_tools_section.rootTag
                    : t
                          .home
                          .ui_sections_home_community_tools_section
                          .comingSoon,
                onTap: () {
                  context.push(route);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
