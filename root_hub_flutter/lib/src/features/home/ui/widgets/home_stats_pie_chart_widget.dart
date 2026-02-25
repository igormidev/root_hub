import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/core/extension/faction_ui_extension.dart';

class HomeStatsPieChartWidget extends StatefulWidget {
  const HomeStatsPieChartWidget({
    required this.factions,
    required this.valuesByFaction,
    required this.allFactionsValue,
    required this.allFactionsLabel,
    required this.selectedFactionValueBuilder,
    super.key,
  });

  final List<Faction> factions;
  final Map<Faction, double> valuesByFaction;
  final String allFactionsValue;
  final String allFactionsLabel;
  final String Function(double value) selectedFactionValueBuilder;

  @override
  State<HomeStatsPieChartWidget> createState() =>
      _HomeStatsPieChartWidgetState();
}

class _HomeStatsPieChartWidgetState extends State<HomeStatsPieChartWidget> {
  static const _dimmedSectionOpacity = 0.75;

  Faction? _selectedFaction;

  @override
  void didUpdateWidget(covariant HomeStatsPieChartWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    final selectedFaction = _selectedFaction;
    if (selectedFaction == null) {
      return;
    }

    final selectedValue = widget.valuesByFaction[selectedFaction] ?? 0;
    if (selectedValue <= 0 || !widget.factions.contains(selectedFaction)) {
      _selectedFaction = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final totalValue = widget.valuesByFaction.values.fold<double>(
      0,
      (sum, currentValue) => sum + currentValue,
    );

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

    final factionsWithValue = widget.factions
        .where((faction) => (widget.valuesByFaction[faction] ?? 0) > 0)
        .toList();
    final selectedFaction = factionsWithValue.contains(_selectedFaction)
        ? _selectedFaction
        : null;
    final hasSelectedFaction = selectedFaction != null;
    final centerValue = _buildCenterValue(selectedFaction);

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
              enabled: true,
              touchCallback: (event, pieTouchResponse) {
                _handlePieTouch(
                  event,
                  pieTouchResponse,
                  factionsWithValue,
                );
              },
            ),
            sections: factionsWithValue.map((faction) {
              final isSelected = faction == selectedFaction;
              final isDimmed = hasSelectedFaction && !isSelected;
              return PieChartSectionData(
                value: widget.valuesByFaction[faction],
                color: _buildSectionColor(
                  faction.factionColor,
                  isDimmed: isDimmed,
                ),
                radius: isSelected ? 68 : 64,
                showTitle: false,
                badgePositionPercentageOffset: 1.22,
                badgeWidget: _buildFactionBadge(faction),
              );
            }).toList(),
          ),
        ),
        _buildCenterValueLabel(context, centerValue),
      ],
    );
  }

  void _handlePieTouch(
    FlTouchEvent event,
    PieTouchResponse? pieTouchResponse,
    List<Faction> factionsWithValue,
  ) {
    if (event is! FlTapUpEvent) {
      return;
    }

    final touchedSection = pieTouchResponse?.touchedSection;
    if (touchedSection == null) {
      return;
    }

    final sectionIndex = touchedSection.touchedSectionIndex;
    if (sectionIndex < 0 || sectionIndex >= factionsWithValue.length) {
      return;
    }

    final tappedFaction = factionsWithValue[sectionIndex];
    setState(() {
      // Tapping the already-selected slice toggles back to the all-factions
      // aggregate value for this metric.
      _selectedFaction = _selectedFaction == tappedFaction
          ? null
          : tappedFaction;
    });
  }

  _PieCenterValue _buildCenterValue(Faction? selectedFaction) {
    if (selectedFaction == null) {
      return _PieCenterValue(
        value: widget.allFactionsValue,
        label: widget.allFactionsLabel,
      );
    }

    return _PieCenterValue(
      value: widget.selectedFactionValueBuilder(
        widget.valuesByFaction[selectedFaction] ?? 0,
      ),
      label: selectedFaction.displayName,
    );
  }

  Color _buildSectionColor(
    Color baseColor, {
    required bool isDimmed,
  }) {
    if (!isDimmed) {
      return baseColor;
    }

    // Keep non-selected slices visible while visually prioritizing the selected
    // faction by lerping their opacity down to 75%.
    return Color.lerp(
          baseColor,
          baseColor.withValues(alpha: _dimmedSectionOpacity),
          1,
        ) ??
        baseColor.withValues(alpha: _dimmedSectionOpacity);
  }

  Widget _buildCenterValueLabel(
    BuildContext context,
    _PieCenterValue centerValue,
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
                centerValue.value,
                textAlign: TextAlign.center,
                style: textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w900,
                  letterSpacing: 0.2,
                ),
              ),
            ),
            const SizedBox(height: 2),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                centerValue.label,
                textAlign: TextAlign.center,
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w700,
                ),
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
}

class _PieCenterValue {
  const _PieCenterValue({
    required this.value,
    required this.label,
  });

  final String value;
  final String label;
}
