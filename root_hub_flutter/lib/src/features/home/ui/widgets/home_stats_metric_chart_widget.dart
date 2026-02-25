import 'package:flutter/material.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/features/home/ui/widgets/home_stats_pie_chart_widget.dart';

class HomeStatsMetricChartWidget extends StatelessWidget {
  const HomeStatsMetricChartWidget({
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
  Widget build(BuildContext context) {
    return HomeStatsPieChartWidget(
      factions: factions,
      valuesByFaction: valuesByFaction,
      allFactionsValue: allFactionsValue,
      allFactionsLabel: allFactionsLabel,
      selectedFactionValueBuilder: selectedFactionValueBuilder,
    );
  }
}
