import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';
import 'package:root_hub_flutter/src/core/navigation/app_routes.dart';
import 'package:root_hub_flutter/src/design_system/default_error_snackbar.dart';
import 'package:root_hub_flutter/src/features/dashboard/ui/dialogs/edit_display_name_dialog.dart';
import 'package:root_hub_flutter/src/features/dashboard/ui/dialogs/edit_location_dialog.dart';
import 'package:root_hub_flutter/src/features/dashboard/ui/widgets/dashboard_bottom_tab_item_widget.dart';
import 'package:root_hub_flutter/src/features/dashboard/ui/widgets/dashboard_profile_drawer_widget.dart';
import 'package:root_hub_flutter/src/features/dashboard/ui/widgets/dashboard_tab_content_widget.dart';
import 'package:root_hub_flutter/src/global_providers/push_notifications_provider.dart';
import 'package:root_hub_flutter/src/global_providers/server_supported_translation_provider.dart';
import 'package:root_hub_flutter/src/global_providers/session_provider.dart';
import 'package:root_hub_flutter/src/global_providers/shared_preferences_provider.dart';
import 'package:root_hub_flutter/src/states/activity/activity_provider.dart';
import 'package:root_hub_flutter/src/states/auth_flow/auth_flow_provider.dart';
import 'package:root_hub_flutter/src/states/auth_flow/auth_flow_state.dart';
import 'package:root_hub_flutter/src/states/dashboard/dashboard_profile_provider.dart';
import 'package:root_hub_flutter/src/states/dashboard/dashboard_provider.dart';
import 'package:root_hub_flutter/src/states/dashboard/dashboard_state.dart';
import 'package:root_hub_flutter/src/states/deep_link/deep_link_provider.dart';
import 'package:root_hub_flutter/src/states/match/match_tables_provider.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({
    super.key,
  });

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _imagePicker = ImagePicker();
  int? _openingPendingMatchChatId;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }

      ref.read(dashboardProfileProvider.notifier).ensureProfileImageLoaded();
      ref.read(activityProvider.notifier).ensureUnreadCountLoaded();
      ref
          .read(pushNotificationsSyncProvider)
          .ensureInitializedForAuthenticatedUser();
    });
  }

  Future<void> _prepareDrawerTransition() async {
    final scaffoldState = _scaffoldKey.currentState;
    if (scaffoldState == null || !scaffoldState.isDrawerOpen) {
      return;
    }

    scaffoldState.closeDrawer();
    await Future<void>.delayed(Duration(milliseconds: 220));
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
    await ref.read(sharedPreferencesProvider).clear();
    await ref.read(pushNotificationsSyncProvider).deactivateCurrentToken();
    await ref.read(clientProvider).auth.signOutDevice();
  }

  Future<void> _pickAndUploadProfileImage() async {
    final source = await _pickImageSource();
    if (!mounted || source == null) {
      return;
    }

    XFile? selectedImage;
    try {
      selectedImage = await _imagePicker.pickImage(
        source: source,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 90,
        requestFullMetadata: false,
      );
    } catch (_) {
      if (!mounted) {
        return;
      }

      await showErrorDialog(
        context,
        title: t
            .dashboard
            .ui_screens_dashboard_screen
            .unableToAccessCameraOrGallery,
        description: t
            .dashboard
            .ui_screens_dashboard_screen
            .allowCameraAndPhotoPermissionsInSystemSettingsAndTryAgain,
      );
      return;
    }

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

  Future<ImageSource?> _pickImageSource() async {
    final platform = Theme.of(context).platform;
    if (platform == TargetPlatform.iOS) {
      return _showIosImageSourceDialog();
    }

    return _showAndroidImageSourceDialog();
  }

  Future<ImageSource?> _showIosImageSourceDialog() {
    return showCupertinoModalPopup<ImageSource>(
      context: context,
      builder: (dialogContext) {
        return CupertinoActionSheet(
          title: Text(
            t.dashboard.ui_screens_dashboard_screen.changeProfilePhoto,
          ),
          actions: [
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.of(dialogContext).pop(ImageSource.camera);
              },
              child: Text(
                t.dashboard.ui_screens_dashboard_screen.takePhoto2,
              ),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.of(dialogContext).pop(ImageSource.gallery);
              },
              child: Text(
                t.dashboard.ui_screens_dashboard_screen.chooseFromLibrary,
              ),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.of(dialogContext).pop();
            },
            child: Text(
              t.dashboard.ui_screens_dashboard_screen.cancel,
            ),
          ),
        );
      },
    );
  }

  Future<ImageSource?> _showAndroidImageSourceDialog() {
    return showModalBottomSheet<ImageSource>(
      context: context,
      showDragHandle: true,
      builder: (dialogContext) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.photo_camera_rounded),
                title: Text(
                  t.dashboard.ui_screens_dashboard_screen.takePhoto,
                ),
                onTap: () {
                  Navigator.of(dialogContext).pop(ImageSource.camera);
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library_rounded),
                title: Text(
                  t.dashboard.ui_screens_dashboard_screen.chooseFromGallery,
                ),
                onTap: () {
                  Navigator.of(dialogContext).pop(ImageSource.gallery);
                },
              ),
              SizedBox(height: 4),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final selectedTab = ref.watch(dashboardProvider).selectedTab;
    final pendingSharedMatchId = ref.watch(
      deepLinkProvider.select((value) => value.pendingMatchId),
    );
    final pendingMatchChatId = ref.watch(
      deepLinkProvider.select((value) => value.pendingMatchChatId),
    );
    final unreadActivityCount = ref.watch(
      activityProvider.select((value) => value.unreadMessagesCount),
    );
    final profileState = ref.watch(dashboardProfileProvider);
    final serverSupportedTranslation = ref.watch(
      serverSupportedTranslationProvider,
    );
    final playerData = ref
        .watch(authFlowProvider)
        .maybeWhen(
          authenticated: (playerData) => playerData,
          orElse: () => null,
        );
    final displayName =
        playerData?.displayName ??
        t.dashboard.ui_screens_dashboard_screen.rootPlayer;
    final viewPadding = MediaQuery.viewPaddingOf(context);

    if (pendingSharedMatchId != null && selectedTab != DashboardTab.match) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) {
          return;
        }
        ref.read(dashboardProvider.notifier).changeTab(DashboardTab.match);
      });
    }

    if (pendingMatchChatId != null &&
        _openingPendingMatchChatId != pendingMatchChatId) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) {
          return;
        }
        unawaited(_openPendingMatchChat(pendingMatchChatId));
      });
    }

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

    final currentLocation = playerData?.currentLocation;
    if (currentLocation == null) {
      final shouldClearResolvedLocationLabel =
          profileState.resolvedLocationLabelKey != null ||
          profileState.resolvingLocationLabelKey != null ||
          profileState.currentLocationCityName != null ||
          profileState.currentLocationShortAddress != null ||
          profileState.currentLocationFormattedAddress != null;
      if (shouldClearResolvedLocationLabel) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted) {
            return;
          }

          unawaited(
            ref
                .read(dashboardProfileProvider.notifier)
                .ensureLocationLabelLoaded(null),
          );
        });
      }
    } else {
      final expectedLocationLabelKey =
          DashboardProfileNotifier.buildLocationLabelKey(
            location: currentLocation,
            language: serverSupportedTranslation,
          );
      final hasResolvedExpectedLocationLabel =
          profileState.resolvedLocationLabelKey == expectedLocationLabelKey;
      final isResolvingExpectedLocationLabel =
          profileState.isResolvingLocationLabel &&
          profileState.resolvingLocationLabelKey == expectedLocationLabelKey;

      if (!hasResolvedExpectedLocationLabel &&
          !isResolvingExpectedLocationLabel) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted) {
            return;
          }

          unawaited(
            ref
                .read(dashboardProfileProvider.notifier)
                .ensureLocationLabelLoaded(currentLocation),
          );
        });
      }
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
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(16, 6, 16, 8),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/app_logo.png',
                          width: 42,
                          height: 42,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                t.dashboard.ui_screens_dashboard_screen.rootHub,
                                style: Theme.of(context).textTheme.titleLarge
                                    ?.copyWith(
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 0.5,
                                    ),
                              ),
                              Text(
                                t.dashboard.ui_screens_dashboard_screen
                                    .welcomeBack(displayName: displayName),
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
                        SizedBox(width: 14),
                        IconButton.filledTonal(
                          onPressed: playerData == null
                              ? null
                              : () {
                                  _scaffoldKey.currentState?.openDrawer();
                                },
                          icon: Icon(Icons.menu_rounded),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 4),
                  Expanded(
                    child: AnimatedSwitcher(
                      duration: Duration(milliseconds: 300),
                      switchInCurve: Curves.easeOutCubic,
                      switchOutCurve: Curves.easeInCubic,
                      child: KeyedSubtree(
                        key: ValueKey(selectedTab),
                        child: DashboardTabContentWidget(tab: selectedTab),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 14,
            right: 14,
            bottom: viewPadding.bottom,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(999),
                color: colorScheme.surface.withValues(alpha: 0.94),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 18,
                    offset: Offset(0, 8),
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
                      child: DashboardBottomTabItemWidget(
                        colorScheme: colorScheme,
                        label: t.dashboard.ui_screens_dashboard_screen.home,
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
                      child: DashboardBottomTabItemWidget(
                        colorScheme: colorScheme,
                        label: t.dashboard.ui_screens_dashboard_screen.match,
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
                      child: DashboardBottomTabItemWidget(
                        colorScheme: colorScheme,
                        label: t.dashboard.ui_screens_dashboard_screen.activity,
                        icon: Icons.forum_outlined,
                        selectedIcon: Icons.forum_rounded,
                        selected: selectedTab == DashboardTab.activity,
                        badgeCount: unreadActivityCount,
                        onTap: () {
                          ref
                              .read(dashboardProvider.notifier)
                              .changeTab(DashboardTab.activity);
                        },
                      ),
                    ),
                    Expanded(
                      child: DashboardBottomTabItemWidget(
                        colorScheme: colorScheme,
                        label: t.dashboard.ui_screens_dashboard_screen.shop,
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

  Future<void> _openPendingMatchChat(int scheduledMatchId) async {
    if (scheduledMatchId <= 0 ||
        _openingPendingMatchChatId == scheduledMatchId) {
      return;
    }

    _openingPendingMatchChatId = scheduledMatchId;
    ref
        .read(deepLinkProvider.notifier)
        .consumePendingMatchChatNavigation(matchId: scheduledMatchId);
    ref.read(dashboardProvider.notifier).changeTab(DashboardTab.match);

    try {
      await context.push(
        dashboardMatchChatPathForMatch(scheduledMatchId),
        extra: _resolveMatchTitleFromLoadedTables(scheduledMatchId),
      );

      if (!mounted) {
        return;
      }
      await ref.read(activityProvider.notifier).refresh();
    } catch (_) {
    } finally {
      _openingPendingMatchChatId = null;
    }
  }

  String? _resolveMatchTitleFromLoadedTables(int scheduledMatchId) {
    final table = ref
        .read(matchTablesProvider)
        .tables
        .where((entry) => entry.id == scheduledMatchId)
        .firstOrNull;
    final title = table?.title.trim();
    if (title == null || title.isEmpty) {
      return null;
    }

    return title;
  }
}
