import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/core/extension/faction_ui_extension.dart';
import 'package:root_hub_flutter/src/global_providers/shared_preferences_provider.dart';
import 'package:root_hub_flutter/src/features/dashboard/ui/widgets/dashboard_profile_drawer_info_card_widget.dart';
import 'package:root_hub_flutter/src/features/dashboard/ui/widgets/dashboard_profile_drawer_profile_image_widget.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';

const _preferredLocaleKey = 'preferred_locale';
const _deviceLocalePreferenceValue = 'device';

class DashboardProfileDrawerWidget extends ConsumerWidget {
  const DashboardProfileDrawerWidget({
    required this.playerData,
    required this.profileImageUrl,
    required this.onProfileImageEditTap,
    required this.onDisplayNameEditTap,
    required this.onLocationEditTap,
    required this.onFactionEditTap,
    required this.onLogoutTap,
    required this.isLoadingProfileImage,
    required this.isUpdatingProfileImage,
    required this.isUpdatingDisplayName,
    required this.isUpdatingLocation,
    required this.isUpdatingFaction,
    super.key,
  });

  final PlayerData playerData;
  final String? profileImageUrl;
  final VoidCallback onProfileImageEditTap;
  final VoidCallback onDisplayNameEditTap;
  final VoidCallback onLocationEditTap;
  final VoidCallback onFactionEditTap;
  final VoidCallback onLogoutTap;
  final bool isLoadingProfileImage;
  final bool isUpdatingProfileImage;
  final bool isUpdatingDisplayName;
  final bool isUpdatingLocation;
  final bool isUpdatingFaction;

  String _localeLabel(AppLocale locale) {
    return switch (locale) {
      AppLocale.en =>
        t.dashboard.ui_widgets_dashboard_profile_drawer_widget.english,
      AppLocale.ptBr =>
        t.dashboard.ui_widgets_dashboard_profile_drawer_widget.portugueseBrazil,
      AppLocale.es =>
        t.dashboard.ui_widgets_dashboard_profile_drawer_widget.spanish,
      AppLocale.fr =>
        t.dashboard.ui_widgets_dashboard_profile_drawer_widget.french,
      AppLocale.de =>
        t.dashboard.ui_widgets_dashboard_profile_drawer_widget.german,
    };
  }

  String _localeRaw(AppLocale locale) {
    final localeValue = locale.flutterLocale;
    final countryCode = localeValue.countryCode;
    if (countryCode == null || countryCode.isEmpty) {
      return localeValue.languageCode;
    }
    return '${localeValue.languageCode}-$countryCode';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final currentLocation = playerData.currentLocation;
    final sharedPreferences = ref.read(sharedPreferencesProvider);
    final currentLocaleLabel = _localeLabel(LocaleSettings.currentLocale);

    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(16, 18, 16, 10),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(14, 16, 14, 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      colorScheme.primaryContainer.withValues(alpha: 0.72),
                      colorScheme.surfaceContainerHighest.withValues(
                        alpha: 0.96,
                      ),
                    ],
                  ),
                  border: Border.all(
                    color: colorScheme.outlineVariant,
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      width: 96,
                      height: 96,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: 92,
                            height: 92,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 24,
                                  offset: Offset(0, 12),
                                  color: colorScheme.primary.withValues(
                                    alpha: 0.26,
                                  ),
                                ),
                              ],
                              border: Border.all(
                                color: colorScheme.primary,
                                width: 2.5,
                              ),
                              color: colorScheme.surfaceContainerHighest,
                            ),
                            child: ClipOval(
                              child: DashboardProfileDrawerProfileImageWidget(
                                isLoadingProfileImage: isLoadingProfileImage,
                                profileImageUrl: profileImageUrl,
                              ),
                            ),
                          ),
                          Positioned(
                            right: -2,
                            bottom: -2,
                            child: Material(
                              color: colorScheme.primaryContainer,
                              shape: CircleBorder(),
                              child: InkWell(
                                customBorder: CircleBorder(),
                                onTap:
                                    isLoadingProfileImage ||
                                        isUpdatingProfileImage
                                    ? null
                                    : onProfileImageEditTap,
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: isUpdatingProfileImage
                                      ? SizedBox(
                                          width: 14,
                                          height: 14,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                            color: colorScheme.primary,
                                          ),
                                        )
                                      : Icon(
                                          Icons.photo_camera_rounded,
                                          size: 16,
                                          color: colorScheme.primary,
                                        ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      playerData.displayName,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.cinzel(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(16, 4, 16, 16),
                child: Column(
                  children: [
                    DashboardProfileDrawerInfoCardWidget(
                      icon: Icons.badge_rounded,
                      title: t
                          .dashboard
                          .ui_widgets_dashboard_profile_drawer_widget
                          .displayName,
                      value: playerData.displayName,
                      buttonLabel: t
                          .dashboard
                          .ui_widgets_dashboard_profile_drawer_widget
                          .edit,
                      onPressed: onDisplayNameEditTap,
                      isLoading: isUpdatingDisplayName,
                    ),
                    SizedBox(height: 12),
                    DashboardProfileDrawerInfoCardWidget(
                      icon: Icons.location_on_rounded,
                      title: t
                          .dashboard
                          .ui_widgets_dashboard_profile_drawer_widget
                          .location,
                      value: currentLocation == null
                          ? t
                                .dashboard
                                .ui_widgets_dashboard_profile_drawer_widget
                                .noLocationConfigured
                          : '${t.dashboard.ui_widgets_dashboard_profile_drawer_widget.xLabel}: '
                                '${currentLocation.x.toStringAsFixed(6)}\n'
                                '${t.dashboard.ui_widgets_dashboard_profile_drawer_widget.yLabel}: '
                                '${currentLocation.y.toStringAsFixed(6)}\n'
                                '${t.dashboard.ui_widgets_dashboard_profile_drawer_widget.ratioLabel}: '
                                '${currentLocation.ratio.toStringAsFixed(0)} km',
                      buttonLabel: t
                          .dashboard
                          .ui_widgets_dashboard_profile_drawer_widget
                          .edit,
                      onPressed: onLocationEditTap,
                      isLoading: isUpdatingLocation,
                    ),
                    SizedBox(height: 12),
                    DashboardProfileDrawerInfoCardWidget(
                      icon: Icons.language_rounded,
                      title: t
                          .dashboard
                          .ui_widgets_dashboard_profile_drawer_widget
                          .language,
                      value: currentLocaleLabel,
                      buttonLabel: t
                          .dashboard
                          .ui_widgets_dashboard_profile_drawer_widget
                          .change,
                      onPressed: () async {
                        await showModalBottomSheet<void>(
                          context: context,
                          builder: (sheetContext) {
                            return SafeArea(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ListTile(
                                    leading: Icon(Icons.phone_iphone_rounded),
                                    title: Text(
                                      t
                                          .dashboard
                                          .ui_widgets_dashboard_profile_drawer_widget
                                          .useDeviceLanguage,
                                    ),
                                    onTap: () async {
                                      await sharedPreferences.setString(
                                        _preferredLocaleKey,
                                        _deviceLocalePreferenceValue,
                                      );
                                      await LocaleSettings.useDeviceLocale();
                                      if (!sheetContext.mounted) {
                                        return;
                                      }
                                      Navigator.of(sheetContext).pop();
                                    },
                                  ),
                                  ListTile(
                                    title: Text(
                                      t
                                          .dashboard
                                          .ui_widgets_dashboard_profile_drawer_widget
                                          .english,
                                    ),
                                    onTap: () async {
                                      await sharedPreferences.setString(
                                        _preferredLocaleKey,
                                        _localeRaw(AppLocale.en),
                                      );
                                      await LocaleSettings.setLocale(
                                        AppLocale.en,
                                      );
                                      if (!sheetContext.mounted) {
                                        return;
                                      }
                                      Navigator.of(sheetContext).pop();
                                    },
                                  ),
                                  ListTile(
                                    title: Text(
                                      t
                                          .dashboard
                                          .ui_widgets_dashboard_profile_drawer_widget
                                          .portugueseBrazil,
                                    ),
                                    onTap: () async {
                                      await sharedPreferences.setString(
                                        _preferredLocaleKey,
                                        _localeRaw(AppLocale.ptBr),
                                      );
                                      await LocaleSettings.setLocale(
                                        AppLocale.ptBr,
                                      );
                                      if (!sheetContext.mounted) {
                                        return;
                                      }
                                      Navigator.of(sheetContext).pop();
                                    },
                                  ),
                                  ListTile(
                                    title: Text(
                                      t
                                          .dashboard
                                          .ui_widgets_dashboard_profile_drawer_widget
                                          .spanish,
                                    ),
                                    onTap: () async {
                                      await sharedPreferences.setString(
                                        _preferredLocaleKey,
                                        _localeRaw(AppLocale.es),
                                      );
                                      await LocaleSettings.setLocale(
                                        AppLocale.es,
                                      );
                                      if (!sheetContext.mounted) {
                                        return;
                                      }
                                      Navigator.of(sheetContext).pop();
                                    },
                                  ),
                                  ListTile(
                                    title: Text(
                                      t
                                          .dashboard
                                          .ui_widgets_dashboard_profile_drawer_widget
                                          .french,
                                    ),
                                    onTap: () async {
                                      await sharedPreferences.setString(
                                        _preferredLocaleKey,
                                        _localeRaw(AppLocale.fr),
                                      );
                                      await LocaleSettings.setLocale(
                                        AppLocale.fr,
                                      );
                                      if (!sheetContext.mounted) {
                                        return;
                                      }
                                      Navigator.of(sheetContext).pop();
                                    },
                                  ),
                                  ListTile(
                                    title: Text(
                                      t
                                          .dashboard
                                          .ui_widgets_dashboard_profile_drawer_widget
                                          .german,
                                    ),
                                    onTap: () async {
                                      await sharedPreferences.setString(
                                        _preferredLocaleKey,
                                        _localeRaw(AppLocale.de),
                                      );
                                      await LocaleSettings.setLocale(
                                        AppLocale.de,
                                      );
                                      if (!sheetContext.mounted) {
                                        return;
                                      }
                                      Navigator.of(sheetContext).pop();
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      isLoading: false,
                    ),
                    SizedBox(height: 18),
                    SizedBox(
                      width: double.infinity,
                      height: 190,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            left: 0,
                            right: 0,
                            top: 22,
                            bottom: 0,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(
                                14,
                                14,
                                110,
                                14,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: playerData.favoriteFaction.factionColor
                                      .withValues(alpha: 0.62),
                                  width: 1.6,
                                ),
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    colorScheme.surfaceContainerHighest,
                                    colorScheme.surfaceContainer,
                                  ],
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    t
                                        .dashboard
                                        .ui_widgets_dashboard_profile_drawer_widget
                                        .favoriteFaction,
                                    style: GoogleFonts.nunitoSans(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w800,
                                      color: colorScheme.onSurfaceVariant,
                                    ),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    playerData.favoriteFaction.displayName,
                                    style: GoogleFonts.cinzel(
                                      fontSize: 21,
                                      fontWeight: FontWeight.w800,
                                      color: playerData
                                          .favoriteFaction
                                          .factionColor,
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment(-1, 0.8),
                            child: SizedBox(
                              width: double.infinity,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                child: SizedBox(
                                  height: 36,
                                  child: FilledButton.tonalIcon(
                                    onPressed: isUpdatingFaction
                                        ? null
                                        : onFactionEditTap,
                                    icon: isUpdatingFaction
                                        ? SizedBox(
                                            width: 16,
                                            height: 16,
                                            child: CircularProgressIndicator(
                                              strokeWidth: 2,
                                            ),
                                          )
                                        : Icon(Icons.shuffle_rounded),
                                    label: Text(
                                      isUpdatingFaction
                                          ? t
                                                .dashboard
                                                .ui_widgets_dashboard_profile_drawer_widget
                                                .saving
                                          : t
                                                .dashboard
                                                .ui_widgets_dashboard_profile_drawer_widget
                                                .changeFaction,
                                      style: GoogleFonts.nunitoSans(
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: -8,
                            top: -6,
                            child: Transform.rotate(
                              angle: -0.1,
                              child: Hero(
                                tag:
                                    'faction-image-${playerData.favoriteFaction.toJson()}',
                                child: Image.asset(
                                  playerData.favoriteFaction.getFactionImage,
                                  width: 136,
                                  height: 136,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 18),
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: FilledButton.icon(
                  onPressed: onLogoutTap,
                  style: FilledButton.styleFrom(
                    backgroundColor: colorScheme.errorContainer,
                    foregroundColor: colorScheme.onErrorContainer,
                  ),
                  icon: Icon(Icons.logout_rounded),
                  label: Text(
                    t
                        .dashboard
                        .ui_widgets_dashboard_profile_drawer_widget
                        .logOut,
                    style: GoogleFonts.nunitoSans(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
