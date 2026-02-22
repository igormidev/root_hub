import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/core/extension/faction_ui_extension.dart';

class DashboardProfileDrawerWidget extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final currentLocation = playerData.currentLocation;

    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 18, 16, 10),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(14, 16, 14, 16),
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
                                  offset: const Offset(0, 12),
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
                              child: _buildProfileImage(colorScheme),
                            ),
                          ),
                          Positioned(
                            right: -2,
                            bottom: -2,
                            child: Material(
                              color: colorScheme.primaryContainer,
                              shape: const CircleBorder(),
                              child: InkWell(
                                customBorder: const CircleBorder(),
                                onTap:
                                    isLoadingProfileImage ||
                                        isUpdatingProfileImage
                                    ? null
                                    : onProfileImageEditTap,
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
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
                    const SizedBox(height: 12),
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
                padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
                child: Column(
                  children: [
                    _buildProfileInfoCard(
                      context,
                      icon: Icons.badge_rounded,
                      title: 'Display Name',
                      value: playerData.displayName,
                      buttonLabel: 'Edit',
                      onPressed: onDisplayNameEditTap,
                      isLoading: isUpdatingDisplayName,
                    ),
                    const SizedBox(height: 12),
                    _buildProfileInfoCard(
                      context,
                      icon: Icons.location_on_rounded,
                      title: 'Location',
                      value: currentLocation == null
                          ? 'No location configured'
                          : 'x: ${currentLocation.x.toStringAsFixed(6)}\n'
                                'y: ${currentLocation.y.toStringAsFixed(6)}\n'
                                'ratio: ${currentLocation.ratio.toStringAsFixed(0)} km',
                      buttonLabel: 'Edit',
                      onPressed: onLocationEditTap,
                      isLoading: isUpdatingLocation,
                    ),
                    const SizedBox(height: 18),
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
                              padding: const EdgeInsets.fromLTRB(
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
                                    'Favorite Faction',
                                    style: GoogleFonts.nunitoSans(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w800,
                                      color: colorScheme.onSurfaceVariant,
                                    ),
                                  ),
                                  const SizedBox(height: 3),
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
                                  const Spacer(),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment(-1, 0.8),
                            child: SizedBox(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                child: SizedBox(
                                  height: 36,
                                  child: FilledButton.tonalIcon(
                                    onPressed: isUpdatingFaction
                                        ? null
                                        : onFactionEditTap,
                                    icon: isUpdatingFaction
                                        ? const SizedBox(
                                            width: 16,
                                            height: 16,
                                            child: CircularProgressIndicator(
                                              strokeWidth: 2,
                                            ),
                                          )
                                        : const Icon(Icons.shuffle_rounded),
                                    label: Text(
                                      isUpdatingFaction
                                          ? 'Saving...'
                                          : 'Change Faction',
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
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 18),
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: FilledButton.icon(
                  onPressed: onLogoutTap,
                  style: FilledButton.styleFrom(
                    backgroundColor: colorScheme.errorContainer,
                    foregroundColor: colorScheme.onErrorContainer,
                  ),
                  icon: const Icon(Icons.logout_rounded),
                  label: Text(
                    'Log out',
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

  Widget _buildProfileImage(ColorScheme colorScheme) {
    if (isLoadingProfileImage) {
      return Center(
        child: SizedBox(
          width: 22,
          height: 22,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: colorScheme.primary,
          ),
        ),
      );
    }

    final imageUrl = profileImageUrl;
    if (imageUrl == null || imageUrl.isEmpty) {
      return Icon(
        Icons.person_rounded,
        size: 44,
        color: colorScheme.onSurfaceVariant,
      );
    }

    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
      errorBuilder: (_, _, _) {
        return Icon(
          Icons.person_rounded,
          size: 44,
          color: colorScheme.onSurfaceVariant,
        );
      },
    );
  }

  Widget _buildProfileInfoCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String value,
    required String buttonLabel,
    required VoidCallback onPressed,
    required bool isLoading,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: colorScheme.outlineVariant),
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.62),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: colorScheme.primary),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.nunitoSans(
                    fontWeight: FontWeight.w800,
                    color: colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  value,
                  style: GoogleFonts.nunitoSans(
                    fontWeight: FontWeight.w700,
                    color: colorScheme.onSurfaceVariant,
                    height: 1.35,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          OutlinedButton.icon(
            onPressed: isLoading ? null : onPressed,
            icon: isLoading
                ? const SizedBox(
                    width: 14,
                    height: 14,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.edit_rounded, size: 18),
            label: Text(
              buttonLabel,
              style: GoogleFonts.nunitoSans(
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
