import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/core/extension/faction_ui_extension.dart';
import 'package:root_hub_flutter/src/design_system/default_error_snackbar.dart';
import 'package:root_hub_flutter/src/design_system/faction_selector/faction_selection_grid_widget.dart';
import 'package:root_hub_flutter/src/states/auth_flow/auth_flow_provider.dart';
import 'package:root_hub_flutter/src/states/auth_flow/auth_flow_state.dart';
import 'package:root_hub_flutter/src/states/dashboard/dashboard_profile_provider.dart';

class DashboardFactionEditorScreen extends ConsumerStatefulWidget {
  const DashboardFactionEditorScreen({
    super.key,
  });

  @override
  ConsumerState<DashboardFactionEditorScreen> createState() =>
      _DashboardFactionEditorScreenState();
}

class _DashboardFactionEditorScreenState
    extends ConsumerState<DashboardFactionEditorScreen> {
  Faction? _selectedFaction;

  @override
  void initState() {
    super.initState();
    _selectedFaction = ref
        .read(authFlowProvider)
        .maybeWhen(
          authenticated: (playerData) => playerData.favoriteFaction,
          orElse: () => null,
        );
  }

  Future<void> _saveFavoriteFaction() async {
    final faction = _selectedFaction;
    if (faction == null) {
      return;
    }

    final result = await ref
        .read(dashboardProfileProvider.notifier)
        .updateFavoriteFaction(faction);

    if (!mounted) {
      return;
    }

    if (result != null) {
      await showErrorDialog(
        context,
        title: result.title,
        description: result.description,
      );
      return;
    }

    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isSaving = ref.watch(
      dashboardProfileProvider.select((value) => value.isUpdatingFaction),
    );
    final selectedFaction = _selectedFaction;
    final viewPadding = MediaQuery.viewPaddingOf(context);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: const Alignment(0, -0.8),
            radius: 1.25,
            colors: [
              colorScheme.primaryContainer.withValues(alpha: 0.55),
              colorScheme.surface,
              colorScheme.secondaryContainer.withValues(alpha: 0.35),
            ],
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: viewPadding.top + 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  IconButton(
                    onPressed: isSaving
                        ? null
                        : () {
                            Navigator.of(context).pop(false);
                          },
                    icon: const Icon(Icons.arrow_back_rounded),
                  ),
                  Expanded(
                    child:
                        Text(
                              'Change Favorite Faction',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.cinzel(
                                fontSize: 28,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1.0,
                                color: colorScheme.onSurface,
                              ),
                            )
                            .animate()
                            .fadeIn(duration: 350.ms)
                            .slideY(begin: -0.16, end: 0, duration: 350.ms),
                  ),
                  const SizedBox(width: 48),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Choose the faction shown in your profile and used as your default preference.',
                textAlign: TextAlign.center,
                style: GoogleFonts.nunitoSans(
                  fontSize: 15,
                  color: colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w600,
                ),
              ).animate().fadeIn(delay: 80.ms, duration: 420.ms),
            ),
            const SizedBox(height: 14),
            Expanded(
              child: Stack(
                children: [
                  FactionSelectionGridWidget(
                    selectedFaction: selectedFaction,
                    bottomPadding: selectedFaction == null ? 0 : 110,
                    onFactionPressed: (faction) {
                      if (isSaving) {
                        return;
                      }

                      setState(() {
                        if (_selectedFaction == faction) {
                          _selectedFaction = null;
                          return;
                        }

                        _selectedFaction = faction;
                      });
                    },
                  ),
                  Positioned(
                    left: 16,
                    right: 16,
                    bottom: viewPadding.bottom + 10,
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 260),
                      child: selectedFaction == null
                          ? const SizedBox.shrink()
                          : SizedBox(
                                  key: ValueKey(selectedFaction.toJson()),
                                  height: 58,
                                  child: FilledButton(
                                    onPressed: isSaving
                                        ? null
                                        : _saveFavoriteFaction,
                                    style: FilledButton.styleFrom(
                                      backgroundColor:
                                          selectedFaction.factionColor,
                                      foregroundColor:
                                          selectedFaction ==
                                                  Faction.riverfolkCompany ||
                                              selectedFaction ==
                                                  Faction.keepersInIron
                                          ? Colors.black
                                          : Colors.white,
                                    ),
                                    child: isSaving
                                        ? const SizedBox(
                                            width: 20,
                                            height: 20,
                                            child: CircularProgressIndicator(
                                              strokeWidth: 2,
                                            ),
                                          )
                                        : Text(
                                            'Save ${selectedFaction.displayName}',
                                            style: GoogleFonts.getFont(
                                              'MedievalSharp',
                                              fontSize: 21,
                                              fontWeight: FontWeight.w700,
                                              letterSpacing: 0.7,
                                            ),
                                          ),
                                  ),
                                )
                                .animate()
                                .fadeIn(duration: 220.ms)
                                .slideY(begin: 0.24, end: 0, duration: 220.ms),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
