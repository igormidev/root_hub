import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:root_hub_flutter/src/states/dashboard/dashboard_state.dart';

class DashboardNotifier extends Notifier<DashboardState> {
  @override
  DashboardState build() => const DashboardState();

  void changeTab(DashboardTab tab) {
    if (state.selectedTab == tab) {
      return;
    }

    state = state.copyWith(selectedTab: tab);
  }
}

final dashboardProvider = NotifierProvider<DashboardNotifier, DashboardState>(
  DashboardNotifier.new,
);
