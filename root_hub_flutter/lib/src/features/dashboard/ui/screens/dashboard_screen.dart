import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/core/navigation/app_routes.dart';
import 'package:root_hub_flutter/src/features/dashboard/ui/dialogs/edit_display_name_dialog.dart';
import 'package:root_hub_flutter/src/features/dashboard/ui/dialogs/edit_location_dialog.dart';
import 'package:root_hub_flutter/src/features/dashboard/ui/widgets/dashboard_profile_drawer_widget.dart';
import 'package:root_hub_flutter/src/features/home/ui/screens/home_screen.dart';
import 'package:root_hub_flutter/src/features/match/ui/screens/match_screen.dart';
import 'package:root_hub_flutter/src/features/shop/ui/screens/shop_screen.dart';
import 'package:root_hub_flutter/src/global_providers/session_provider.dart';
import 'package:root_hub_flutter/src/states/auth_flow/auth_flow_provider.dart';
import 'package:root_hub_flutter/src/states/auth_flow/auth_flow_state.dart';
import 'package:root_hub_flutter/src/states/dashboard/dashboard_profile_provider.dart';
import 'package:root_hub_flutter/src/states/dashboard/dashboard_provider.dart';
import 'package:root_hub_flutter/src/states/dashboard/dashboard_state.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({
    super.key,
  });

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  static const _bottomNavigationHeightOffset = 108.0;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> _prepareDrawerTransition() async {
    final scaffoldState = _scaffoldKey.currentState;
    if (scaffoldState == null || !scaffoldState.isDrawerOpen) {
      return;
    }

    scaffoldState.closeDrawer();
    await Future<void>.delayed(const Duration(milliseconds: 220));
  }

  Future<void> _openDisplayNameDialog(PlayerData playerData) async {
    await _prepareDrawerTransition();
    if (!mounted) {
      return;
    }

    await showDialog<bool>(
      context: context,
      builder: (context) => EditDisplayNameDialog(
        initialDisplayName: playerData.displayName,
      ),
    );
  }

  Future<void> _openLocationDialog(PlayerData playerData) async {
    await _prepareDrawerTransition();
    if (!mounted) {
      return;
    }

    await showDialog<bool>(
      context: context,
      builder: (context) => EditLocationDialog(
        initialLocation: playerData.currentLocation,
      ),
    );
  }

  Future<void> _openFactionEditorScreen() async {
    await _prepareDrawerTransition();
    if (!mounted) {
      return;
    }

    await context.push(dashboardFactionPath);
  }

  Future<void> _logOut() async {
    await _prepareDrawerTransition();
    if (!mounted) {
      return;
    }

    await ref.read(clientProvider).auth.signOutDevice();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final selectedTab = ref.watch(dashboardProvider).selectedTab;
    final profileState = ref.watch(dashboardProfileProvider);
    final playerData = ref
        .watch(authFlowProvider)
        .maybeWhen(
          authenticated: (playerData) => playerData,
          orElse: () => null,
        );
    final displayName = playerData?.displayName ?? 'Root Player';
    final viewPadding = MediaQuery.viewPaddingOf(context);

    return Scaffold(
      key: _scaffoldKey,
      drawer: playerData == null
          ? null
          : DashboardProfileDrawerWidget(
              playerData: playerData,
              onDisplayNameEditTap: () {
                _openDisplayNameDialog(playerData);
              },
              onLocationEditTap: () {
                _openLocationDialog(playerData);
              },
              onFactionEditTap: _openFactionEditorScreen,
              onLogoutTap: _logOut,
              isUpdatingDisplayName: profileState.isUpdatingDisplayName,
              isUpdatingLocation: profileState.isUpdatingLocation,
              isUpdatingFaction: profileState.isUpdatingFaction,
            ),
      body: Stack(
        children: [
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    colorScheme.primaryContainer.withValues(alpha: 0.5),
                    colorScheme.surface,
                    colorScheme.tertiaryContainer.withValues(alpha: 0.35),
                  ],
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: viewPadding.bottom + _bottomNavigationHeightOffset,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 14, 16, 12),
                      child: Row(
                        children: [
                          IconButton.filledTonal(
                            onPressed: playerData == null
                                ? null
                                : () {
                                    _scaffoldKey.currentState?.openDrawer();
                                  },
                            icon: const Icon(Icons.menu_rounded),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'ROOT HUB',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 0.8,
                                      ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Welcome back, $displayName',
                                  style: Theme.of(context).textTheme.bodyMedium
                                      ?.copyWith(
                                        color: colorScheme.onSurfaceVariant,
                                        fontWeight: FontWeight.w700,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            width: 54,
                            height: 54,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: colorScheme.surface.withValues(
                                alpha: 0.92,
                              ),
                              border: Border.all(
                                color: colorScheme.outlineVariant,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 14,
                                  offset: const Offset(0, 6),
                                  color: colorScheme.shadow.withValues(
                                    alpha: 0.15,
                                  ),
                                ),
                              ],
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                'assets/app_logo.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: colorScheme.outlineVariant),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              colorScheme.surface.withValues(alpha: 0.95),
                              colorScheme.surfaceContainerLowest.withValues(
                                alpha: 0.92,
                              ),
                            ],
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _titleFromTab(selectedTab),
                              style: Theme.of(context).textTheme.titleLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              _subtitleFromTab(selectedTab),
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        switchInCurve: Curves.easeOutCubic,
                        switchOutCurve: Curves.easeInCubic,
                        child: KeyedSubtree(
                          key: ValueKey(selectedTab),
                          child: _screenFromTab(selectedTab),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 14,
            right: 14,
            bottom: viewPadding.bottom + 12,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: NavigationBar(
                selectedIndex: selectedTab.index,
                onDestinationSelected: (index) {
                  ref
                      .read(dashboardProvider.notifier)
                      .changeTab(DashboardTab.values[index]);
                },
                destinations: const [
                  NavigationDestination(
                    icon: Icon(Icons.cottage_outlined),
                    selectedIcon: Icon(Icons.cottage_rounded),
                    label: 'Home',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.groups_outlined),
                    selectedIcon: Icon(Icons.groups_rounded),
                    label: 'Match',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.storefront_outlined),
                    selectedIcon: Icon(Icons.storefront_rounded),
                    label: 'Shop',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _screenFromTab(DashboardTab tab) {
    switch (tab) {
      case DashboardTab.home:
        return const HomeScreen();
      case DashboardTab.match:
        return const MatchScreen();
      case DashboardTab.shop:
        return const ShopScreen();
    }
  }

  String _titleFromTab(DashboardTab tab) {
    switch (tab) {
      case DashboardTab.home:
        return 'Community Dashboard';
      case DashboardTab.match:
        return 'Match Finder';
      case DashboardTab.shop:
        return 'Shop Preview';
    }
  }

  String _subtitleFromTab(DashboardTab tab) {
    switch (tab) {
      case DashboardTab.home:
        return 'Discover what is happening around your ROOT community.';
      case DashboardTab.match:
        return 'Browse and create match schedules with your local group.';
      case DashboardTab.shop:
        return 'Collect future cosmetics, tokens, and community bundles.';
    }
  }
}
