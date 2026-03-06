import 'package:flutter/material.dart';
import 'package:root_hub_flutter/src/core/content/recomended_factions_content.dart';
import 'package:root_hub_flutter/src/features/home/ui/widgets/recommended_compositions_player_count_button_widget.dart';

class RecommendedCompositionsPlayerSelectorWidget extends StatelessWidget {
  const RecommendedCompositionsPlayerSelectorWidget({
    required this.selectedPlayerCount,
    required this.enabledPlayerCounts,
    required this.onChanged,
    super.key,
  });

  final AmountOfPlayersInMatch? selectedPlayerCount;
  final Set<AmountOfPlayersInMatch> enabledPlayerCounts;
  final ValueChanged<AmountOfPlayersInMatch> onChanged;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        for (final playerCount in AmountOfPlayersInMatch.values)
          RecommendedCompositionsPlayerCountButtonWidget(
            playerCount: playerCount,
            isEnabled: enabledPlayerCounts.contains(playerCount),
            isSelected: selectedPlayerCount == playerCount,
            onTap: () {
              onChanged(playerCount);
            },
          ),
      ],
    );
  }
}
