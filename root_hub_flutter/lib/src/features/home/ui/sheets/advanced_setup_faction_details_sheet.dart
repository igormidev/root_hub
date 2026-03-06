import 'package:babel_text/babel_text.dart';
import 'package:flutter/material.dart';
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
      child: Container(
        height: maxHeight,
        padding: EdgeInsets.fromLTRB(16, 10, 16, 16 + safeAreaBottom),
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
            SizedBox(height: 14),
            Row(
              children: [
                Container(
                  width: 62,
                  height: 62,
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.faction.factionColor.withValues(alpha: 0.14),
                    border: Border.all(
                      color: widget.faction.factionColor.withValues(
                        alpha: 0.24,
                      ),
                    ),
                  ),
                  child: Image.asset(
                    widget.faction.getFactionImage,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(width: 14),
                Expanded(
                  child: Text(
                    widget.faction.displayName,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w900,
                      height: 1.08,
                    ),
                  ),
                ),
              ],
            ),
            if (showLanguageToggle) ...[
              SizedBox(height: 16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
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
                child: BabelSelectableText(
                  visibleBody,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurface,
                    height: 1.52,
                    fontWeight: FontWeight.w600,
                  ),
                  styleMapping: {
                    '<h>': (_, currentStyle) => currentStyle.copyWith(
                      color: widget.faction.factionColor,
                      fontWeight: FontWeight.w900,
                      decoration: TextDecoration.underline,
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
    );
  }
}
