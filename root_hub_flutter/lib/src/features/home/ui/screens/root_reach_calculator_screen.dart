import 'package:flutter/material.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';
import 'package:root_hub_flutter/src/core/content/root_community_tools_content.dart';
import 'package:root_hub_flutter/src/features/home/ui/widgets/reach_calculator_faction_button_widget.dart';
import 'package:root_hub_flutter/src/features/home/ui/widgets/reach_calculator_player_quantity_selector_widget.dart';
import 'package:root_hub_flutter/src/features/home/ui/widgets/reach_calculator_status_indicator_widget.dart';

class RootReachCalculatorScreen extends StatefulWidget {
  const RootReachCalculatorScreen({
    super.key,
  });

  @override
  State<RootReachCalculatorScreen> createState() =>
      _RootReachCalculatorScreenState();
}

class _RootReachCalculatorScreenState extends State<RootReachCalculatorScreen> {
  int _playerCount = 4;
  final Set<ReachCalculatorFaction> _pickedFactions =
      <ReachCalculatorFaction>{};
  final Set<ReachCalculatorFaction> _bannedFactions =
      <ReachCalculatorFaction>{};

  int get _requiredReach =>
      reachCalculatorRequiredReachByPlayerCount[_playerCount]!;

  int get _currentReach => _pickedFactions.fold<int>(
    0,
    (total, faction) => total + faction.reach,
  );

  Map<ReachCalculatorFaction, ReachCalculatorFactionStatus> get _statuses {
    final statuses = <ReachCalculatorFaction, ReachCalculatorFactionStatus>{
      for (final faction in ReachCalculatorFaction.values)
        faction: _pickedFactions.contains(faction)
            ? ReachCalculatorFactionStatus.picked
            : _bannedFactions.contains(faction)
            ? ReachCalculatorFactionStatus.banned
            : ReachCalculatorFactionStatus.available,
    };

    if (_pickedFactions.length >= _playerCount) {
      for (final faction in ReachCalculatorFaction.values) {
        if (_pickedFactions.contains(faction) ||
            _bannedFactions.contains(faction)) {
          continue;
        }

        statuses[faction] = ReachCalculatorFactionStatus.unavailable;
      }

      return statuses;
    }

    final neutralFactions = ReachCalculatorFaction.values
        .where(
          (faction) =>
              !_pickedFactions.contains(faction) &&
              !_bannedFactions.contains(faction),
        )
        .toList(growable: false);
    final sortedNeutralFactions = [...neutralFactions]
      ..sort((left, right) => right.reach.compareTo(left.reach));
    final playersStillToPick = _playerCount - _pickedFactions.length;

    for (final faction in neutralFactions) {
      if (faction == ReachCalculatorFaction.vagabond2 &&
          !_pickedFactions.contains(ReachCalculatorFaction.vagabond1)) {
        statuses[faction] = ReachCalculatorFactionStatus.unavailable;
        continue;
      }

      final sortedWithoutFaction = sortedNeutralFactions
          .where((candidate) => candidate != faction)
          .toList(growable: false);
      var maxReachForFaction = faction.reach;

      for (
        var index = 0;
        index < playersStillToPick - 1 && index < sortedWithoutFaction.length;
        index++
      ) {
        maxReachForFaction += sortedWithoutFaction[index].reach;
      }

      statuses[faction] = _currentReach + maxReachForFaction < _requiredReach
          ? ReachCalculatorFactionStatus.unavailable
          : ReachCalculatorFactionStatus.available;
    }

    return statuses;
  }

  void _handleFactionPressed(ReachCalculatorFaction faction) {
    final currentStatus = _statuses[faction];
    if (currentStatus == null ||
        currentStatus == ReachCalculatorFactionStatus.unavailable) {
      return;
    }

    setState(() {
      switch (currentStatus) {
        case ReachCalculatorFactionStatus.available:
          _pickedFactions.add(faction);
          break;
        case ReachCalculatorFactionStatus.picked:
          _pickedFactions.remove(faction);
          _bannedFactions.add(faction);
          break;
        case ReachCalculatorFactionStatus.banned:
          _bannedFactions.remove(faction);
          break;
        case ReachCalculatorFactionStatus.unavailable:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final statuses = _statuses;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final meetsTarget = _currentReach >= _requiredReach;
    final bottomInset = MediaQuery.viewPaddingOf(context).bottom;
    final remainingReach = (_requiredReach - _currentReach).clamp(
      0,
      _requiredReach,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          t.home.ui_screens_root_reach_calculator_screen.title,
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.fromLTRB(16, 0, 16, bottomInset),
        children: [
          Text(
            t.home.ui_screens_root_reach_calculator_screen.description,
            textAlign: TextAlign.center,
            style: textTheme.bodyLarge?.copyWith(
              color: colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w300,
              height: 1.3,
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '$_currentReach/$_requiredReach+',
                textAlign: TextAlign.center,
                style: textTheme.displayMedium?.copyWith(
                  color: meetsTarget
                      ? Color(0xFF4DA251)
                      : colorScheme.onSurface,
                  fontWeight: FontWeight.w900,
                  height: 0.92,
                ),
              ),
              SizedBox(
                width: 25,
                height: 44,
                child: VerticalDivider(
                  thickness: 1,
                ),
              ),
              SizedBox(width: 6),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 118),
                child: Text(
                  meetsTarget
                      ? t
                            .home
                            .ui_screens_root_reach_calculator_screen
                            .targetReached
                      : t.home.ui_screens_root_reach_calculator_screen
                            .needMoreReach(
                              remainingReach: remainingReach,
                            ),
                  style: textTheme.titleMedium?.copyWith(
                    color: meetsTarget
                        ? Color(0xFF2F6E31)
                        : colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w800,
                    height: 1.1,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 10,
            runSpacing: 10,
            children: [
              ReachCalculatorStatusIndicatorWidget(
                label: t.home.ui_screens_root_reach_calculator_screen.picked,
                icon: Icons.check_circle_outline_rounded,
                color: Color(0xFF4DA251),
              ),
              ReachCalculatorStatusIndicatorWidget(
                label: t.home.ui_screens_root_reach_calculator_screen.banned,
                icon: Icons.block_rounded,
                color: Color(0xFFB66969),
              ),
              ReachCalculatorStatusIndicatorWidget(
                label:
                    t.home.ui_screens_root_reach_calculator_screen.unavailable,
                icon: Icons.remove_circle_outline_rounded,
                color: colorScheme.onSurfaceVariant,
              ),
            ],
          ),
          SizedBox(height: 12),
          Wrap(
            alignment: WrapAlignment.center,
            children: [
              for (final faction in ReachCalculatorFaction.values) ...[
                // if (faction != ReachCalculatorFaction.values.first) SizedBox(width: 6),
                SizedBox(
                  width: 120,
                  height: 120,
                  child: ReachCalculatorFactionButtonWidget(
                    faction: faction,
                    status: statuses[faction]!,
                    onTap: () {
                      _handleFactionPressed(faction);
                    },
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
      bottomNavigationBar: ReachCalculatorPlayerQuantitySelectorWidget(
        selectedPlayerCount: _playerCount,
        playerCounts: reachCalculatorRequiredReachByPlayerCount.keys.toList(
          growable: false,
        ),
        onChanged: (playerCount) {
          setState(() {
            _playerCount = playerCount;
          });
        },
      ),
    );
  }
}
