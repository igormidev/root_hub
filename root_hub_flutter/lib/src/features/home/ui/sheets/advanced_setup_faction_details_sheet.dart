import 'package:babel_text/babel_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';
import 'package:root_hub_flutter/src/core/content/root_community_tools_content.dart';
import 'package:root_hub_flutter/src/core/extension/app_locale_ui_extension.dart';
import 'package:root_hub_flutter/src/core/extension/faction_ui_extension.dart';

class AdvancedSetupFactionDetailsSheet extends StatefulWidget {
  const AdvancedSetupFactionDetailsSheet({
    required this.faction,
    super.key,
  });

  final Faction faction;

  @override
  State<AdvancedSetupFactionDetailsSheet> createState() =>
      _AdvancedSetupFactionDetailsSheetState();
}

class _AdvancedSetupFactionDetailsSheetState
    extends State<AdvancedSetupFactionDetailsSheet> {
  bool _showEnglishSource = false;

  @override
  Widget build(BuildContext context) {
    const imageTopOffset = 8.0;
    const imageSize = 154.0;
    const sheetTopOffset = 68.0;
    final currentLocale = LocaleSettings.currentLocale;
    final showLanguageToggle = currentLocale != AppLocale.en;
    final guideContent = buildAdvancedSetupFactionGuideContent(
      widget.faction,
      locale: currentLocale,
    );
    final visibleBody = _showEnglishSource
        ? guideContent.englishBody
        : guideContent.localizedBody;
    final colorScheme = Theme.of(context).colorScheme;
    final safeAreaBottom = MediaQuery.viewPaddingOf(context).bottom;
    final maxHeight = MediaQuery.sizeOf(context).height * 0.78;

    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: maxHeight + sheetTopOffset,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: sheetTopOffset,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 12, 20, 0),
                decoration: BoxDecoration(
                  color: colorScheme.surface,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.2),
                      blurRadius: 24,
                      offset: Offset(0, -8),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 42,
                        height: 5,
                        decoration: BoxDecoration(
                          color: colorScheme.outline.withValues(alpha: 0.35),
                          borderRadius: BorderRadius.circular(999),
                        ),
                      ),
                    ),
                    SizedBox(height: 22),
                    Padding(
                      padding: EdgeInsets.only(left: 120),
                      child: Text(
                        widget.faction.displayName,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.cormorantGaramond(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          color: colorScheme.onSurface,
                          height: 0.98,
                        ),
                      ),
                    ),
                    if (showLanguageToggle) ...[
                      SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 8,
                        children: [
                          ChoiceChip(
                            label: Text(
                              currentLocale.displayLabel(t),
                            ),
                            selected: !_showEnglishSource,
                            onSelected: (_) {
                              setState(() {
                                _showEnglishSource = false;
                              });
                            },
                          ),
                          ChoiceChip(
                            label: Text(
                              t
                                  .home
                                  .ui_sheets_advanced_setup_faction_details_sheet
                                  .originalEnglish,
                            ),
                            selected: _showEnglishSource,
                            onSelected: (_) {
                              setState(() {
                                _showEnglishSource = true;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                    SizedBox(height: 16),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.only(bottom: safeAreaBottom),
                        child: BabelSelectableText(
                          visibleBody,
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(
                                color: colorScheme.onSurface,
                                height: 1.56,
                                fontWeight: FontWeight.w700,
                              ),
                          styleMapping: {
                            '<h>': (_, currentStyle) =>
                                GoogleFonts.cormorantGaramond(
                                  textStyle: currentStyle.copyWith(
                                    color: widget.faction.factionColor,
                                    fontSize: 28,
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
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: imageTopOffset,
              left: 0,
              child: IgnorePointer(
                child: SizedBox(
                  width: imageSize,
                  height: imageSize,
                  child: Image.asset(
                    widget.faction.getFactionImage,
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
