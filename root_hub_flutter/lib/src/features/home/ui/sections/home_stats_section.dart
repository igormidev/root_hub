import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';
import 'package:root_hub_flutter/src/features/home/ui/widgets/home_stats_legend_chip_widget.dart';
import 'package:root_hub_flutter/src/features/home/ui/widgets/home_stats_metric_chart_widget.dart';
import 'package:root_hub_flutter/src/features/home/ui/widgets/home_stats_status_message_widget.dart';
import 'package:root_hub_flutter/src/states/home/home_stats_snapshot.dart';

class HomeStatsSection extends StatefulWidget {
  const HomeStatsSection({
    required this.title,
    required this.description,
    required this.emptyTitle,
    required this.emptyDescription,
    required this.onRetry,
    required this.isLoading,
    required this.stats,
    this.error,
    super.key,
  });

  final String title;
  final String description;
  final String emptyTitle;
  final String emptyDescription;
  final VoidCallback onRetry;
  final bool isLoading;
  final HomeStatsSnapshot? stats;
  final RootHubException? error;

  @override
  State<HomeStatsSection> createState() => _HomeStatsSectionState();
}

class _HomeStatsSectionState extends State<HomeStatsSection> {
  static const _carouselInterval = Duration(minutes: 2);
  static const _carouselAnimationDuration = Duration(milliseconds: 420);
  static final _metricConfigs = <_StatsMetricConfig>[
    _StatsMetricConfig(
      type: _StatsMetricType.winRate,
      title: t.home.ui_sections_home_stats_section.factionWinRate,
      description: t
          .home
          .ui_sections_home_stats_section
          .whoIsWinningTheMostOftenRightNow,
    ),
    _StatsMetricConfig(
      type: _StatsMetricType.playedGames,
      title: t.home.ui_sections_home_stats_section.playedGames,
      description: t
          .home
          .ui_sections_home_stats_section
          .howOftenEachFactionAppearsInCompletedGames,
    ),
    _StatsMetricConfig(
      type: _StatsMetricType.avgPoints,
      title: t.home.ui_sections_home_stats_section.averagePoints,
      description: t
          .home
          .ui_sections_home_stats_section
          .averageScorePerFactionWhenPointsWereTracked,
    ),
    _StatsMetricConfig(
      type: _StatsMetricType.totalWins,
      title: t.home.ui_sections_home_stats_section.totalWins,
      description: t
          .home
          .ui_sections_home_stats_section
          .absoluteNumberOfWinsForEachFaction,
    ),
  ];

  late final PageController _pageController;
  Timer? _autoSlideTimer;
  double _currentPage = 0;
  int _activePage = 0;
  final Set<int> _activePointerIds = <int>{};
  bool _isPointerHovering = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.7);
    _pageController.addListener(_handlePageScroll);
    _syncAutoSlideTimer();
  }

  @override
  void dispose() {
    _autoSlideTimer?.cancel();
    _pageController
      ..removeListener(_handlePageScroll)
      ..dispose();
    super.dispose();
  }

  void _handlePageScroll() {
    if (!_pageController.hasClients) {
      return;
    }

    final page = _pageController.page ?? _activePage.toDouble();
    if ((page - _currentPage).abs() < 0.001) {
      return;
    }

    setState(() {
      _currentPage = page;
      _activePage = page.round().clamp(
        0,
        _metricConfigs.length - 1,
      );
    });
  }

  bool get _isUserInteractingWithCarousel {
    return _isPointerHovering || _activePointerIds.isNotEmpty;
  }

  void _handleAutoSlideTick(Timer _) {
    if (!_pageController.hasClients ||
        !mounted ||
        _isUserInteractingWithCarousel) {
      return;
    }

    final currentRoundedPage = (_pageController.page ?? _activePage.toDouble())
        .round();
    final nextPage = (currentRoundedPage + 1) % _metricConfigs.length;
    _pageController.animateToPage(
      nextPage,
      duration: _carouselAnimationDuration,
      curve: Curves.easeInOutCubic,
    );
  }

  // The carousel must pause while the user is touching/hovering it and only
  // resume after all interaction has ended (all active pointers lifted).
  void _syncAutoSlideTimer() {
    if (_isUserInteractingWithCarousel) {
      _autoSlideTimer?.cancel();
      _autoSlideTimer = null;
      return;
    }

    if (_autoSlideTimer != null) {
      return;
    }

    _autoSlideTimer = Timer.periodic(_carouselInterval, _handleAutoSlideTick);
  }

  void _handlePointerDown(PointerDownEvent event) {
    _activePointerIds.add(event.pointer);
    _syncAutoSlideTimer();
  }

  void _handlePointerUp(PointerUpEvent event) {
    _activePointerIds.remove(event.pointer);
    _syncAutoSlideTimer();
  }

  void _handlePointerCancel(PointerCancelEvent event) {
    _activePointerIds.remove(event.pointer);
    _syncAutoSlideTimer();
  }

  void _handlePointerEnter(PointerEvent _) {
    if (_isPointerHovering) {
      return;
    }

    _isPointerHovering = true;
    _syncAutoSlideTimer();
  }

  void _handlePointerExit(PointerEvent _) {
    if (!_isPointerHovering) {
      return;
    }

    _isPointerHovering = false;
    _syncAutoSlideTimer();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            widget.title,
            style: textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(height: 6),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            widget.description,
            style: textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: 10),
        if (widget.isLoading && widget.stats == null)
          SizedBox(
            height: 360,
            child: Center(
              child: CircularProgressIndicator(
                color: colorScheme.primary,
              ),
            ),
          )
        else if (widget.stats == null && widget.error != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: HomeStatsStatusMessageWidget(
              icon: Icons.error_outline_rounded,
              title: widget.error!.title,
              description: widget.error!.description,
              actionLabel: 'Retry',
              onActionTap: widget.onRetry,
            ),
          )
        else if (widget.stats == null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: HomeStatsStatusMessageWidget(
              icon: Icons.insights_rounded,
              title: widget.emptyTitle,
              description: widget.emptyDescription,
              actionLabel: null,
              onActionTap: null,
            ),
          )
        else ...[
          MouseRegion(
            onEnter: _handlePointerEnter,
            onExit: _handlePointerExit,
            child: Listener(
              behavior: HitTestBehavior.translucent,
              onPointerDown: _handlePointerDown,
              onPointerUp: _handlePointerUp,
              onPointerCancel: _handlePointerCancel,
              // Auto-page should stop while this component is interacted with
              // and continue only after interaction fully ends.
              child: Column(
                children: [
                  SizedBox(
                    height: 360,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: _metricConfigs.length,
                      physics: BouncingScrollPhysics(),
                      onPageChanged: (index) {
                        setState(() {
                          _activePage = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        final stats = widget.stats!;
                        final metricConfig = _metricConfigs[index];
                        final valuesByFaction = <Faction, double>{
                          for (final faction in HomeStatsSnapshot.allFactions)
                            faction: _readMetricValue(
                              stats,
                              faction,
                              metricConfig.type,
                            ),
                        };
                        final allFactionsMetricValue =
                            _buildAllFactionsMetricValue(
                              stats: stats,
                              metricType: metricConfig.type,
                              valuesByFaction: valuesByFaction,
                            );
                        final scale = _buildPageScale(index);
                        final opacity = _buildPageOpacity(index);

                        return Transform.scale(
                          scale: scale,
                          child: Opacity(
                            opacity: opacity,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 6,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: HomeStatsMetricChartWidget(
                                      factions: HomeStatsSnapshot.allFactions,
                                      valuesByFaction: valuesByFaction,
                                      allFactionsValue:
                                          allFactionsMetricValue.value,
                                      allFactionsLabel:
                                          allFactionsMetricValue.label,
                                      selectedFactionValueBuilder: (value) {
                                        return _formatSelectedFactionMetricValue(
                                          metricConfig.type,
                                          value,
                                        );
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                  Text(
                                    metricConfig.title,
                                    style: textTheme.titleMedium?.copyWith(
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    metricConfig.description,
                                    style: textTheme.bodyMedium?.copyWith(
                                      color: colorScheme.onSurfaceVariant,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 2),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        _metricConfigs.length,
                        (index) {
                          final selected = index == _activePage;
                          return GestureDetector(
                            onTap: () {
                              _pageController.animateToPage(
                                index,
                                duration: Duration(milliseconds: 260),
                                curve: Curves.easeOutCubic,
                              );
                            },
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 220),
                              margin: EdgeInsets.symmetric(
                                horizontal: 4,
                                vertical: 8,
                              ),
                              height: 8,
                              width: selected ? 22 : 8,
                              decoration: BoxDecoration(
                                color: selected
                                    ? colorScheme.primary
                                    : colorScheme.outlineVariant,
                                borderRadius: BorderRadius.circular(999),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: HomeStatsSnapshot.allFactions.map((faction) {
                        return HomeStatsLegendChipWidget(
                          faction: faction,
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }

  double _buildPageScale(int index) {
    final distance = (index - _currentPage).abs().clamp(0.0, 1.0).toDouble();
    return lerpDouble(0.86, 1, 1 - distance) ?? 1;
  }

  double _buildPageOpacity(int index) {
    final distance = (index - _currentPage).abs().clamp(0.0, 1.0).toDouble();
    return lerpDouble(0.42, 1, 1 - distance) ?? 1;
  }

  _MetricCenterValue _buildAllFactionsMetricValue({
    required HomeStatsSnapshot stats,
    required _StatsMetricType metricType,
    required Map<Faction, double> valuesByFaction,
  }) {
    return switch (metricType) {
      _StatsMetricType.winRate => _MetricCenterValue(
        value: _formatPercentValue(
          _averageNonZeroValue(valuesByFaction.values),
        ),
        label: t.home.ui_sections_home_stats_section.allFactionsAvg2,
      ),
      _StatsMetricType.playedGames => _MetricCenterValue(
        value: _formatGroupedInt(
          valuesByFaction.values.fold<int>(
            0,
            (sum, value) => sum + value.round(),
          ),
        ),
        label: t.home.ui_sections_home_stats_section.allFactionsTotal2,
      ),
      _StatsMetricType.avgPoints => _MetricCenterValue(
        value: _formatDecimalValue(stats.avgPoints),
        label: t.home.ui_sections_home_stats_section.allFactionsAvg,
      ),
      _StatsMetricType.totalWins => _MetricCenterValue(
        value: _formatGroupedInt(stats.totalWins),
        label: t.home.ui_sections_home_stats_section.allFactionsTotal,
      ),
    };
  }

  double _readMetricValue(
    HomeStatsSnapshot stats,
    Faction faction,
    _StatsMetricType metricType,
  ) {
    return switch (metricType) {
      _StatsMetricType.winRate => stats.winRateForFaction(faction),
      _StatsMetricType.playedGames =>
        stats.playedGamesForFaction(faction).toDouble(),
      _StatsMetricType.avgPoints => stats.avgPointsForFaction(faction),
      _StatsMetricType.totalWins => stats.winsForFaction(faction).toDouble(),
    };
  }

  double _averageNonZeroValue(Iterable<double> values) {
    final nonZeroValues = values.where((value) => value > 0).toList();
    if (nonZeroValues.isEmpty) {
      return 0;
    }

    final total = nonZeroValues.fold<double>(
      0,
      (sum, value) => sum + value,
    );
    return total / nonZeroValues.length;
  }

  String _formatSelectedFactionMetricValue(
    _StatsMetricType metricType,
    double value,
  ) {
    return switch (metricType) {
      _StatsMetricType.winRate => _formatPercentValue(value),
      _StatsMetricType.playedGames => _formatGroupedInt(value.round()),
      _StatsMetricType.avgPoints => _formatDecimalValue(value),
      _StatsMetricType.totalWins => _formatGroupedInt(value.round()),
    };
  }

  String _formatGroupedInt(int value) {
    final sign = value < 0 ? '-' : '';
    final digits = value.abs().toString();
    final grouped = digits.replaceAllMapped(
      RegExp(r'\B(?=(\d{3})+(?!\d))'),
      (_) => ',',
    );
    return '$sign$grouped';
  }

  String _formatDecimalValue(double value) {
    final oneDecimal = value.toStringAsFixed(1);
    if (oneDecimal.endsWith('.0')) {
      return oneDecimal.substring(0, oneDecimal.length - 2);
    }
    return oneDecimal;
  }

  String _formatPercentValue(double ratio) {
    final percentage = ratio * 100;
    final fractionDigits =
        percentage >= 10 || percentage == percentage.roundToDouble() ? 0 : 1;
    return '${percentage.toStringAsFixed(fractionDigits)}%';
  }
}

enum _StatsMetricType {
  winRate,
  playedGames,
  avgPoints,
  totalWins,
}

class _StatsMetricConfig {
  _StatsMetricConfig({
    required this.type,
    required this.title,
    required this.description,
  });

  final _StatsMetricType type;
  final String title;
  final String description;
}

class _MetricCenterValue {
  _MetricCenterValue({
    required this.value,
    required this.label,
  });

  final String value;
  final String label;
}
