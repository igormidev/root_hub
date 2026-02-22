import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/core/navigation/app_routes.dart';
import 'package:root_hub_flutter/src/design_system/default_error_snackbar.dart';
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
  static const _bottomNavigationHeightOffset = 90.0;

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _imagePicker = ImagePicker();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }

      ref.read(dashboardProfileProvider.notifier).ensureProfileImageLoaded();
    });
  }

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

  Future<void> _pickAndUploadProfileImage() async {
    final selectedImage = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1024,
      maxHeight: 1024,
      imageQuality: 90,
      requestFullMetadata: false,
    );
    if (selectedImage == null) {
      return;
    }

    final imageBytes = await selectedImage.readAsBytes();
    final result = await ref
        .read(dashboardProfileProvider.notifier)
        .updateProfileImage(imageBytes);
    if (!mounted || result == null) {
      return;
    }

    await showErrorDialog(
      context,
      title: result.title,
      description: result.description,
    );
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

    if (playerData != null &&
        !profileState.hasLoadedProfileImage &&
        !profileState.isLoadingProfileImage) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) {
          return;
        }

        ref.read(dashboardProfileProvider.notifier).ensureProfileImageLoaded();
      });
    }

    return Scaffold(
      key: _scaffoldKey,
      drawer: playerData == null
          ? null
          : DashboardProfileDrawerWidget(
              playerData: playerData,
              profileImageUrl: profileState.profileImageUrl,
              onProfileImageEditTap: _pickAndUploadProfileImage,
              onDisplayNameEditTap: () {
                _openDisplayNameDialog(playerData);
              },
              onLocationEditTap: () {
                _openLocationDialog(playerData);
              },
              onFactionEditTap: _openFactionEditorScreen,
              onLogoutTap: _logOut,
              isLoadingProfileImage: profileState.isLoadingProfileImage,
              isUpdatingProfileImage: profileState.isUpdatingProfileImage,
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
                      padding: const EdgeInsets.fromLTRB(16, 6, 16, 8),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/app_logo.png',
                            width: 42,
                            height: 42,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'ROOT HUB',
                                  style: Theme.of(context).textTheme.titleLarge
                                      ?.copyWith(
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 0.5,
                                      ),
                                ),
                                Text(
                                  'Welcome back, $displayName',
                                  style: Theme.of(context).textTheme.bodyMedium
                                      ?.copyWith(
                                        color: colorScheme.onSurfaceVariant,
                                        fontWeight: FontWeight.w700,
                                      ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 14),
                          IconButton.filledTonal(
                            onPressed: playerData == null
                                ? null
                                : () {
                                    _scaffoldKey.currentState?.openDrawer();
                                  },
                            icon: const Icon(Icons.menu_rounded),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
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
            bottom: viewPadding.bottom + 8,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(999),
                color: colorScheme.surface.withValues(alpha: 0.94),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 18,
                    offset: const Offset(0, 8),
                    color: colorScheme.shadow.withValues(alpha: 0.12),
                  ),
                ],
                border: Border.all(
                  color: colorScheme.outlineVariant.withValues(alpha: 0.85),
                ),
              ),
              child: SizedBox(
                height: 78,
                child: Row(
                  children: [
                    Expanded(
                      child: _buildBottomTabItem(
                        context,
                        colorScheme: colorScheme,
                        label: 'Home',
                        icon: Icons.cottage_outlined,
                        selectedIcon: Icons.cottage_rounded,
                        selected: selectedTab == DashboardTab.home,
                        onTap: () {
                          ref
                              .read(dashboardProvider.notifier)
                              .changeTab(DashboardTab.home);
                        },
                      ),
                    ),
                    Expanded(
                      child: _buildBottomTabItem(
                        context,
                        colorScheme: colorScheme,
                        label: 'Match',
                        icon: Icons.groups_outlined,
                        selectedIcon: Icons.groups_rounded,
                        selected: selectedTab == DashboardTab.match,
                        onTap: () {
                          ref
                              .read(dashboardProvider.notifier)
                              .changeTab(DashboardTab.match);
                        },
                      ),
                    ),
                    Expanded(
                      child: _buildBottomTabItem(
                        context,
                        colorScheme: colorScheme,
                        label: 'Shop',
                        icon: Icons.storefront_outlined,
                        selectedIcon: Icons.storefront_rounded,
                        selected: selectedTab == DashboardTab.shop,
                        onTap: () {
                          ref
                              .read(dashboardProvider.notifier)
                              .changeTab(DashboardTab.shop);
                        },
                      ),
                    ),
                  ],
                ),
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

  Widget _buildBottomTabItem(
    BuildContext context, {
    required ColorScheme colorScheme,
    required String label,
    required IconData icon,
    required IconData selectedIcon,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(999),
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOutCubic,
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(999),
            color: selected
                ? colorScheme.primaryContainer.withValues(alpha: 0.75)
                : Colors.transparent,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                selected ? selectedIcon : icon,
                size: 23,
                color: selected
                    ? colorScheme.primary
                    : colorScheme.onSurfaceVariant,
              ),
              const SizedBox(height: 2),
              Text(
                label,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontWeight: selected ? FontWeight.w800 : FontWeight.w700,
                  color: selected
                      ? colorScheme.onSurface
                      : colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
