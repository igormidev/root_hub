import 'dart:async';
import 'dart:ui';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/core/extension/faction_ui_extension.dart';
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
  static const _metricConfigs = <_StatsMetricConfig>[
    _StatsMetricConfig(
      type: _StatsMetricType.winRate,
      title: 'Faction Win Rate',
      description: 'Who is winning the most often right now.',
    ),
    _StatsMetricConfig(
      type: _StatsMetricType.playedGames,
      title: 'Played Games',
      description: 'How often each faction appears in completed games.',
    ),
    _StatsMetricConfig(
      type: _StatsMetricType.avgPoints,
      title: 'Average Points',
      description: 'Average score per faction when points were tracked.',
    ),
    _StatsMetricConfig(
      type: _StatsMetricType.totalWins,
      title: 'Total Wins',
      description: 'Absolute number of wins for each faction.',
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
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            widget.title,
            style: textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(height: 6),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            widget.description,
            style: textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 14),
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
          _buildStatusMessage(
            context,
            icon: Icons.error_outline_rounded,
            title: widget.error!.title,
            description: widget.error!.description,
            actionLabel: 'Retry',
            onActionTap: widget.onRetry,
          )
        else if (widget.stats == null)
          _buildStatusMessage(
            context,
            icon: Icons.insights_rounded,
            title: widget.emptyTitle,
            description: widget.emptyDescription,
            actionLabel: null,
            onActionTap: null,
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
                      physics: const BouncingScrollPhysics(),
                      onPageChanged: (index) {
                        setState(() {
                          _activePage = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        final stats = widget.stats!;
                        final metricConfig = _metricConfigs[index];
                        final scale = _buildPageScale(index);
                        final opacity = _buildPageOpacity(index);

                        return Transform.scale(
                          scale: scale,
                          child: Opacity(
                            opacity: opacity,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 6,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: _buildMetricChart(
                                      context,
                                      stats,
                                      metricConfig.type,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    metricConfig.title,
                                    style: textTheme.titleMedium?.copyWith(
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
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
                  const SizedBox(height: 2),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
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
                                duration: const Duration(milliseconds: 260),
                                curve: Curves.easeOutCubic,
                              );
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 220),
                              margin: const EdgeInsets.symmetric(
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
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: HomeStatsSnapshot.allFactions.map((faction) {
                        return _buildLegendChip(
                          context,
                          faction,
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

  Widget _buildMetricChart(
    BuildContext context,
    HomeStatsSnapshot stats,
    _StatsMetricType metricType,
  ) {
    final valuesByFaction = <Faction, double>{
      for (final faction in HomeStatsSnapshot.allFactions)
        faction: _readMetricValue(
          stats,
          faction,
          metricType,
        ),
    };
    final totalValue = valuesByFaction.values.fold<double>(
      0,
      (sum, currentValue) => sum + currentValue,
    );
    final centerMetricValue = _buildCenterMetricValue(
      stats: stats,
      metricType: metricType,
      valuesByFaction: valuesByFaction,
    );
    final colorScheme = Theme.of(context).colorScheme;

    if (totalValue <= 0) {
      return DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [
              colorScheme.surfaceContainerLow.withValues(alpha: 0.9),
              colorScheme.surface.withValues(alpha: 0.2),
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(28),
            child: Text(
              'No values for this metric yet.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      );
    }

    return Stack(
      alignment: Alignment.center,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [
                colorScheme.primary.withValues(alpha: 0.09),
                colorScheme.tertiary.withValues(alpha: 0.05),
                colorScheme.surface.withValues(alpha: 0.01),
              ],
            ),
          ),
          child: const SizedBox.expand(),
        ),
        PieChart(
          PieChartData(
            centerSpaceRadius: 72,
            sectionsSpace: 2,
            pieTouchData: PieTouchData(
              enabled: false,
            ),
            sections: HomeStatsSnapshot.allFactions
                .where((faction) => (valuesByFaction[faction] ?? 0) > 0)
                .map(
                  (faction) => PieChartSectionData(
                    value: valuesByFaction[faction],
                    color: faction.factionColor,
                    radius: 64,
                    showTitle: false,
                    badgePositionPercentageOffset: 1.22,
                    badgeWidget: _buildFactionBadge(faction),
                  ),
                )
                .toList(),
          ),
        ),
        _buildCenterMetricValueLabel(context, centerMetricValue),
      ],
    );
  }

  _MetricCenterValue _buildCenterMetricValue({
    required HomeStatsSnapshot stats,
    required _StatsMetricType metricType,
    required Map<Faction, double> valuesByFaction,
  }) {
    return switch (metricType) {
      _StatsMetricType.winRate => _MetricCenterValue(
        value: _formatPercentValue(
          valuesByFaction.values.fold<double>(
            0,
            (currentTopRate, value) {
              return value > currentTopRate ? value : currentTopRate;
            },
          ),
        ),
        label: 'Top rate',
      ),
      _StatsMetricType.playedGames => _MetricCenterValue(
        value: _formatGroupedInt(
          valuesByFaction.values.fold<int>(
            0,
            (sum, value) => sum + value.round(),
          ),
        ),
        label: 'Total picks',
      ),
      _StatsMetricType.avgPoints => _MetricCenterValue(
        value: _formatDecimalValue(stats.avgPoints),
        label: 'Overall avg',
      ),
      _StatsMetricType.totalWins => _MetricCenterValue(
        value: _formatGroupedInt(stats.totalWins),
        label: 'Total wins',
      ),
    };
  }

  Widget _buildCenterMetricValueLabel(
    BuildContext context,
    _MetricCenterValue centerMetricValue,
  ) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return IgnorePointer(
      child: SizedBox(
        width: 116,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                centerMetricValue.value,
                textAlign: TextAlign.center,
                style: textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w900,
                  letterSpacing: 0.2,
                ),
              ),
            ),
            const SizedBox(height: 2),
            Text(
              centerMetricValue.label,
              textAlign: TextAlign.center,
              style: textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFactionBadge(Faction faction) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.94),
        shape: BoxShape.circle,
        boxShadow: const [
          BoxShadow(
            color: Color(0x1F000000),
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Image.asset(
          faction.getFactionIconPath(size: FactionIconSize.size80),
          width: 20,
          height: 20,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _buildLegendChip(
    BuildContext context,
    Faction faction,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 7,
      ),
      decoration: BoxDecoration(
        color: colorScheme.surface.withValues(alpha: 0.78),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.6),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: faction.factionColor,
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          const SizedBox(width: 6),
          Image.asset(
            faction.getFactionIconPath(size: FactionIconSize.size80),
            width: 16,
            height: 16,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 6),
          Text(
            faction.displayName,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusMessage(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String description,
    required String? actionLabel,
    required VoidCallback? onActionTap,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: colorScheme.surface.withValues(alpha: 0.85),
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.75),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 25,
            color: colorScheme.primary,
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w600,
            ),
          ),
          if (actionLabel != null && onActionTap != null) ...[
            const SizedBox(height: 12),
            FilledButton.tonal(
              onPressed: onActionTap,
              child: Text(actionLabel),
            ),
          ],
        ],
      ),
    );
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
  const _StatsMetricConfig({
    required this.type,
    required this.title,
    required this.description,
  });

  final _StatsMetricType type;
  final String title;
  final String description;
}

class _MetricCenterValue {
  const _MetricCenterValue({
    required this.value,
    required this.label,
  });

  final String value;
  final String label;
}
