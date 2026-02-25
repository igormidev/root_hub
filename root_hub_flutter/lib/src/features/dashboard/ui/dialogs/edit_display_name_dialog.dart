import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:root_hub_flutter/src/design_system/default_error_snackbar.dart';
import 'package:root_hub_flutter/src/design_system/profile_editor/profile_display_name_editor_card.dart';
import 'package:root_hub_flutter/src/states/dashboard/dashboard_profile_provider.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';

class EditDisplayNameDialog extends ConsumerStatefulWidget {
  const EditDisplayNameDialog({
    required this.initialDisplayName,
    super.key,
  });

  final String initialDisplayName;

  @override
  ConsumerState<EditDisplayNameDialog> createState() =>
      _EditDisplayNameDialogState();
}

class _EditDisplayNameDialogState extends ConsumerState<EditDisplayNameDialog> {
  late final TextEditingController _displayNameController;

  @override
  void initState() {
    super.initState();
    _displayNameController = TextEditingController(
      text: widget.initialDisplayName,
    );
  }

  @override
  void dispose() {
    _displayNameController.dispose();
    super.dispose();
  }

  Future<void> _saveDisplayName() async {
    final result = await ref
        .read(dashboardProfileProvider.notifier)
        .updateDisplayName(_displayNameController.text);

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
    final isLoading = ref.watch(
      dashboardProfileProvider.select((value) => value.isUpdatingDisplayName),
    );

    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 14),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              t.dashboard.ui_dialogs_edit_display_name_dialog.editDisplayName,
              style: GoogleFonts.cinzel(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 8),
            Text(
              t
                  .dashboard
                  .ui_dialogs_edit_display_name_dialog
                  .thisIsHowPlayersWillSeeYouAcrossRootHub,
              textAlign: TextAlign.center,
              style: GoogleFonts.nunitoSans(
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            SizedBox(height: 14),
            ProfileDisplayNameEditorCard(
              controller: _displayNameController,
              enabled: !isLoading,
            ),
            SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: isLoading
                        ? null
                        : () {
                            Navigator.of(context).pop(false);
                          },
                    child: Text(
                      t.dashboard.ui_dialogs_edit_display_name_dialog.cancel,
                      style: GoogleFonts.nunitoSans(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: FilledButton(
                    onPressed: isLoading ? null : _saveDisplayName,
                    child: isLoading
                        ? SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : Text(
                            t
                                .dashboard
                                .ui_dialogs_edit_display_name_dialog
                                .save,
                            style: GoogleFonts.nunitoSans(
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
