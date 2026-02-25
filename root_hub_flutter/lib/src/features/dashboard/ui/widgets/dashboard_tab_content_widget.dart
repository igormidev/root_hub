import 'package:flutter/material.dart';
import 'package:root_hub_flutter/src/features/home/ui/screens/home_screen.dart';
import 'package:root_hub_flutter/src/features/match/ui/screens/match_screen.dart';
import 'package:root_hub_flutter/src/features/shop/ui/screens/shop_screen.dart';
import 'package:root_hub_flutter/src/states/dashboard/dashboard_state.dart';

class DashboardTabContentWidget extends StatelessWidget {
  const DashboardTabContentWidget({
    required this.tab,
    super.key,
  });

  final DashboardTab tab;

  @override
  Widget build(BuildContext context) {
    switch (tab) {
      case DashboardTab.home:
        return HomeScreen();
      case DashboardTab.match:
        return MatchScreen();
      case DashboardTab.shop:
        return ShopScreen();
    }
  }
}
