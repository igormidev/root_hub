import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';
import 'package:root_hub_flutter/src/design_system/default_error_snackbar.dart';
import 'package:root_hub_flutter/src/features/match/ui/screens/match_create_table_location_list_tile_widget.dart';
import 'package:root_hub_flutter/src/states/match/match_create_table_provider.dart';

class MatchCreateTableLocationConfirmationSheet extends ConsumerStatefulWidget {
  const MatchCreateTableLocationConfirmationSheet({
    required this.selectedLocation,
    super.key,
  });

  final Location selectedLocation;

  static Future<bool?> show(
    BuildContext context, {
    required Location selectedLocation,
  }) {
    return showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) {
        return MatchCreateTableLocationConfirmationSheet(
          selectedLocation: selectedLocation,
        );
      },
    );
  }

  @override
  ConsumerState<MatchCreateTableLocationConfirmationSheet> createState() =>
      _MatchCreateTableLocationConfirmationSheetState();
}

class _MatchCreateTableLocationConfirmationSheetState
    extends ConsumerState<MatchCreateTableLocationConfirmationSheet> {
  late final TextEditingController _locationAdditionalInfoController;

  @override
  void initState() {
    super.initState();
    final state = ref.read(matchCreateTableProvider);
    _locationAdditionalInfoController = TextEditingController(
      text: state.locationAdditionalInfo,
    );
    _locationAdditionalInfoController.addListener(
      _onLocationAdditionalInfoChanged,
    );
  }

  @override
  void dispose() {
    _locationAdditionalInfoController
      ..removeListener(_onLocationAdditionalInfoChanged)
      ..dispose();
    super.dispose();
  }

  void _onLocationAdditionalInfoChanged() {
    ref
        .read(matchCreateTableProvider.notifier)
        .setLocationAdditionalInfo(_locationAdditionalInfoController.text);
  }

  Future<void> _createTable() async {
    final error = await ref
        .read(matchCreateTableProvider.notifier)
        .createTable();
    if (!mounted) {
      return;
    }

    if (error != null) {
      await showErrorDialog(
        context,
        title: error.title,
        description: error.description,
      );
      return;
    }

    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final state = ref.watch(matchCreateTableProvider);
    final viewInsets = MediaQuery.viewInsetsOf(context);
    final googlePlace = widget.selectedLocation.googlePlaceLocation;
    final manualLocation = widget.selectedLocation.manualInputLocation;
    final locationTitle =
        googlePlace?.name ??
        manualLocation?.title ??
        t.match.ui_screens_match_table_card_widget.unknownLocation;
    final locationSubtitle =
        googlePlace?.shortFormattedAddress ??
        googlePlace?.formattedAddress ??
        manualLocation?.cityName ??
        t.match.ui_screens_match_table_card_widget.addressUnavailable;

    return AnimatedPadding(
      duration: const Duration(milliseconds: 180),
      curve: Curves.easeOut,
      padding: EdgeInsets.only(bottom: viewInsets.bottom),
      child: FractionallySizedBox(
        heightFactor: 0.78,
        child: Container(
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(28),
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              Container(
                width: 50,
                height: 5,
                margin: const EdgeInsets.only(top: 12, bottom: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(999),
                  color: colorScheme.outlineVariant,
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(18, 8, 18, 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        t
                            .match
                            .ui_sheets_match_create_table_location_confirmation_sheet
                            .confirmLocation,
                        style: textTheme.titleMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        t
                            .match
                            .ui_sheets_match_create_table_location_confirmation_sheet
                            .createTableAtThisLocation,
                        style: GoogleFonts.cinzel(
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                          color: colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        t
                            .match
                            .ui_sheets_match_create_table_location_confirmation_sheet
                            .reviewTheSelectedLocationBeforePublishingYourMatch,
                        style: textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          fontWeight: FontWeight.w700,
                          height: 1.35,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        t
                            .match
                            .ui_sheets_match_create_table_location_confirmation_sheet
                            .selectedLocation,
                        style: textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 8),
                      IgnorePointer(
                        child: MatchCreateTableLocationListTileWidget(
                          title: locationTitle,
                          subtitle: locationSubtitle,
                          isSelected: true,
                          onTap: () {},
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        t
                            .match
                            .ui_sheets_match_create_table_location_confirmation_sheet
                            .locationAdditionalInfoOptional,
                        style: textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        t
                            .match
                            .ui_sheets_match_create_table_location_confirmation_sheet
                            .addOptionalExtraDirectionsOrMeetingDetailsForThisLocation,
                        style: textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          fontWeight: FontWeight.w700,
                          height: 1.35,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _locationAdditionalInfoController,
                        minLines: 3,
                        maxLines: 6,
                        maxLength: 1000,
                        decoration: InputDecoration(
                          hintText: t
                              .match
                              .ui_sheets_match_create_table_location_confirmation_sheet
                              .exampleWeWillBeUpstairsNearTheBackTablesAskForTheRootGroup,
                          filled: true,
                          fillColor: colorScheme.surfaceContainerHighest
                              .withValues(
                                alpha: 0.52,
                              ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SafeArea(
                top: false,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(18, 10, 18, 14),
                  child: Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: state.isCreatingTable
                              ? null
                              : () => Navigator.of(context).pop(false),
                          style: OutlinedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 54),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          child: Text(
                            t
                                .match
                                .ui_sheets_match_create_table_location_confirmation_sheet
                                .back,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: FilledButton(
                          onPressed: state.isCreatingTable
                              ? null
                              : _createTable,
                          style: FilledButton.styleFrom(
                            minimumSize: const Size(double.infinity, 54),
                            backgroundColor: colorScheme.primary,
                            foregroundColor: colorScheme.onPrimary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          child: state.isCreatingTable
                              ? SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2.5,
                                    color: colorScheme.onPrimary,
                                  ),
                                )
                              : Text(
                                  t
                                      .match
                                      .ui_sheets_match_create_table_location_confirmation_sheet
                                      .createTable,
                                  style: GoogleFonts.getFont(
                                    'MedievalSharp',
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                    color: colorScheme.onPrimary,
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
