import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';
import 'package:root_hub_flutter/src/core/content/recomended_factions_content.dart';
import 'package:root_hub_flutter/src/features/home/ui/sections/recommended_compositions_results_section.dart';
import 'package:root_hub_flutter/src/features/home/ui/widgets/recommended_compositions_expansion_option_widget.dart';
import 'package:root_hub_flutter/src/features/home/ui/widgets/recommended_compositions_player_selector_widget.dart';
import 'package:root_hub_flutter/src/features/home/ui/widgets/recommended_compositions_step_section_widget.dart';

class RecommendedCompositionsScreen extends StatefulWidget {
  const RecommendedCompositionsScreen({
    super.key,
  });

  @override
  State<RecommendedCompositionsScreen> createState() =>
      _RecommendedCompositionsScreenState();
}

class _RecommendedCompositionsScreenState
    extends State<RecommendedCompositionsScreen> {
  final Set<PurchasedExpansions> _selectedExpansions = {
    PurchasedExpansions.baseGame,
  };

  AmountOfPlayersInMatch? _selectedPlayerCount;

  Map<AmountOfPlayersInMatch, List<RecomendedFactionComposition>>
  get _availableCompositionsByCount => {
    for (final playerCount in AmountOfPlayersInMatch.values)
      playerCount: getRecommendedFactionsToPlay(
        amountOfPlayersInMatch: playerCount,
        purchasedExpansions: _selectedExpansions.toList(growable: false),
      ),
  };

  Set<AmountOfPlayersInMatch> get _enabledPlayerCounts =>
      _availableCompositionsByCount.entries
          .where((entry) => entry.value.isNotEmpty)
          .map((entry) => entry.key)
          .toSet();

  List<RecomendedFactionComposition> get _selectedCompositions {
    final selectedPlayerCount = _selectedPlayerCount;
    if (selectedPlayerCount == null) {
      return const [];
    }

    return _availableCompositionsByCount[selectedPlayerCount] ?? const [];
  }

  int get _resultsKey => Object.hash(
    _selectedPlayerCount,
    Object.hashAll(
      PurchasedExpansions.values.where(_selectedExpansions.contains),
    ),
  );

  void _toggleExpansion(PurchasedExpansions expansion, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedExpansions.add(expansion);
      } else {
        _selectedExpansions.remove(expansion);
      }

      final selectedPlayerCount = _selectedPlayerCount;
      if (selectedPlayerCount != null &&
          !_enabledPlayerCounts.contains(selectedPlayerCount)) {
        _selectedPlayerCount = null;
      }
    });
  }

  void _selectPlayerCount(AmountOfPlayersInMatch playerCount) {
    if (!_enabledPlayerCounts.contains(playerCount)) {
      return;
    }

    setState(() {
      _selectedPlayerCount = playerCount;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.viewPaddingOf(context).bottom;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          t.home.ui_screens_recommended_compositions_screen.title,
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.fromLTRB(16, 12, 16, bottomInset + 28),
        children: [
          RecommendedCompositionsStepSectionWidget(
                title: t
                    .home
                    .ui_screens_recommended_compositions_screen
                    .ownedBoxesTitle,
                description: t
                    .home
                    .ui_screens_recommended_compositions_screen
                    .ownedBoxesDescription,
                child: Column(
                  children: [
                    for (
                      var index = 0;
                      index < PurchasedExpansions.values.length;
                      index++
                    ) ...[
                      if (index != 0) SizedBox(height: 10),
                      RecommendedCompositionsExpansionOptionWidget(
                            expansion: PurchasedExpansions.values[index],
                            isSelected: _selectedExpansions.contains(
                              PurchasedExpansions.values[index],
                            ),
                            onChanged: (value) {
                              _toggleExpansion(
                                PurchasedExpansions.values[index],
                                value,
                              );
                            },
                          )
                          .animate(delay: (70 * index).ms)
                          .fadeIn(duration: 260.ms)
                          .slideX(begin: -0.04, end: 0, duration: 380.ms),
                    ],
                  ],
                ),
              )
              .animate()
              .fadeIn(duration: 280.ms)
              .slideY(begin: 0.08, end: 0, duration: 380.ms),
          SizedBox(height: 28),
          RecommendedCompositionsStepSectionWidget(
                title: t
                    .home
                    .ui_screens_recommended_compositions_screen
                    .playerCountTitle,
                description: t
                    .home
                    .ui_screens_recommended_compositions_screen
                    .playerCountDescription,
                child: RecommendedCompositionsPlayerSelectorWidget(
                  selectedPlayerCount: _selectedPlayerCount,
                  enabledPlayerCounts: _enabledPlayerCounts,
                  onChanged: _selectPlayerCount,
                ),
              )
              .animate(delay: 90.ms)
              .fadeIn(duration: 300.ms)
              .slideY(begin: 0.08, end: 0, duration: 400.ms),
          SizedBox(height: 28),
          AnimatedSwitcher(
            duration: Duration(milliseconds: 420),
            switchInCurve: Curves.easeOutCubic,
            switchOutCurve: Curves.easeInCubic,
            transitionBuilder: (child, animation) {
              return FadeTransition(
                opacity: animation,
                child: SlideTransition(
                  position:
                      Tween<Offset>(
                        begin: Offset(0, 0.04),
                        end: Offset.zero,
                      ).animate(
                        CurvedAnimation(
                          parent: animation,
                          curve: Curves.easeOutCubic,
                        ),
                      ),
                  child: child,
                ),
              );
            },
            child: _selectedPlayerCount == null
                ? SizedBox.shrink(
                    key: ValueKey<int>(0),
                  )
                : RecommendedCompositionsResultsSection(
                    key: ValueKey(_resultsKey),
                    compositions: _selectedCompositions,
                  ),
          ),
        ],
      ),
    );
  }
}
