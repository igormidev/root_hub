import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_state.freezed.dart';

enum DashboardTab {
  home,
  match,
  shop,
}

@freezed
abstract class DashboardState with _$DashboardState {
  const factory DashboardState({
    @Default(DashboardTab.home) DashboardTab selectedTab,
  }) = _DashboardState;
}
