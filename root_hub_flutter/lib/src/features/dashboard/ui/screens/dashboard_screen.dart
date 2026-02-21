import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:root_hub_flutter/src/features/home/ui/screens/home_screen.dart';
import 'package:root_hub_flutter/src/features/match/ui/screens/match_screen.dart';
import 'package:root_hub_flutter/src/features/shop/ui/screens/shop_screen.dart';
import 'package:root_hub_flutter/src/global_providers/session_provider.dart';
import 'package:root_hub_flutter/src/states/auth_flow/auth_flow_state.dart';
import 'package:root_hub_flutter/src/states/auth_flow/auth_flow_provider.dart';
import 'package:root_hub_flutter/src/states/dashboard/dashboard_provider.dart';
import 'package:root_hub_flutter/src/states/dashboard/dashboard_state.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final selectedTab = ref.watch(dashboardProvider).selectedTab;
    final displayName = ref
        .watch(authFlowProvider)
        .maybeWhen(
          authenticated: (playerData) => playerData.displayName,
          orElse: () => 'Root Player',
        );

    return Scaffold(
      body: Container(
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
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 14, 16, 12),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ROOT HUB',
                            style: Theme.of(context).textTheme.headlineMedium
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
                    FilledButton.icon(
                      onPressed: () async {
                        await ref.read(clientProvider).auth.signOutDevice();
                      },
                      icon: const Icon(Icons.logout_rounded, size: 18),
                      label: const Text('Sign out'),
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
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _subtitleFromTab(selectedTab),
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
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
