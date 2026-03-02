import 'package:flutter/material.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';

class RegisterMatchCancelMatchDialogResult {
  const RegisterMatchCancelMatchDialogResult({
    required this.notPlayedReason,
    this.notPlayedReasonDetails,
  });

  final MatchScheduleNotPlayedReason notPlayedReason;
  final String? notPlayedReasonDetails;
}

class RegisterMatchCancelMatchDialog extends StatefulWidget {
  const RegisterMatchCancelMatchDialog({
    super.key,
  });

  @override
  State<RegisterMatchCancelMatchDialog> createState() =>
      _RegisterMatchCancelMatchDialogState();
}

class _RegisterMatchCancelMatchDialogState
    extends State<RegisterMatchCancelMatchDialog> {
  static const _selectableReasons = <MatchScheduleNotPlayedReason>[
    MatchScheduleNotPlayedReason.notEnoughPlayers,
    MatchScheduleNotPlayedReason.hostUnavailable,
    MatchScheduleNotPlayedReason.noGameCopyAvailable,
    MatchScheduleNotPlayedReason.venueIssue,
    MatchScheduleNotPlayedReason.playerNoShow,
    MatchScheduleNotPlayedReason.weatherOrEmergency,
    MatchScheduleNotPlayedReason.other,
  ];

  final TextEditingController _reasonDetailsController =
      TextEditingController();

  MatchScheduleNotPlayedReason _selectedReason =
      MatchScheduleNotPlayedReason.notEnoughPlayers;
  bool _showOtherReasonError = false;

  @override
  void dispose() {
    _reasonDetailsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dialogT =
        t.register_match.ui_dialogs_register_match_cancel_match_dialog;
    final requiresReasonDetails =
        _selectedReason == MatchScheduleNotPlayedReason.other;
    final colorScheme = Theme.of(context).colorScheme;

    return AlertDialog(
      title: Text(dialogT.cancelMatchTitle),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              dialogT.cancelMatchDescription,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 14),
            DropdownButtonFormField<MatchScheduleNotPlayedReason>(
              initialValue: _selectedReason,
              decoration: InputDecoration(
                labelText: dialogT.reasonLabel,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              items: _selectableReasons
                  .map(
                    (reason) => DropdownMenuItem(
                      value: reason,
                      child: Text(_reasonLabel(reason)),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                if (value == null) {
                  return;
                }

                setState(() {
                  _selectedReason = value;
                  if (_selectedReason != MatchScheduleNotPlayedReason.other) {
                    _showOtherReasonError = false;
                  }
                });
              },
            ),
            SizedBox(height: 12),
            TextField(
              controller: _reasonDetailsController,
              minLines: 2,
              maxLines: 4,
              decoration: InputDecoration(
                labelText: dialogT.optionalReasonDetailsLabel,
                hintText: dialogT.optionalReasonDetailsHint,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                errorText: requiresReasonDetails && _showOtherReasonError
                    ? dialogT.detailsRequiredForOtherReason
                    : null,
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(dialogT.keepMatch),
        ),
        FilledButton(
          onPressed: _onConfirmCancelMatch,
          child: Text(dialogT.confirmCancelMatch),
        ),
      ],
    );
  }

  String _reasonLabel(MatchScheduleNotPlayedReason reason) {
    final dialogT =
        t.register_match.ui_dialogs_register_match_cancel_match_dialog;

    switch (reason) {
      case MatchScheduleNotPlayedReason.notEnoughPlayers:
        return dialogT.reasonNotEnoughPlayers;
      case MatchScheduleNotPlayedReason.hostUnavailable:
        return dialogT.reasonHostUnavailable;
      case MatchScheduleNotPlayedReason.noGameCopyAvailable:
        return dialogT.reasonNoGameCopyAvailable;
      case MatchScheduleNotPlayedReason.venueIssue:
        return dialogT.reasonVenueIssue;
      case MatchScheduleNotPlayedReason.playerNoShow:
        return dialogT.reasonPlayerNoShow;
      case MatchScheduleNotPlayedReason.weatherOrEmergency:
        return dialogT.reasonWeatherOrEmergency;
      case MatchScheduleNotPlayedReason.expiredWithoutResult:
        return dialogT.reasonExpiredWithoutResult;
      case MatchScheduleNotPlayedReason.other:
        return dialogT.reasonOther;
    }
  }

  void _onConfirmCancelMatch() {
    final requiresReasonDetails =
        _selectedReason == MatchScheduleNotPlayedReason.other;
    final normalizedReasonDetails = _reasonDetailsController.text.trim();
    final normalizedOptionalReasonDetails = normalizedReasonDetails.isEmpty
        ? null
        : normalizedReasonDetails;

    if (requiresReasonDetails && normalizedOptionalReasonDetails == null) {
      setState(() {
        _showOtherReasonError = true;
      });
      return;
    }

    Navigator.of(context).pop(
      RegisterMatchCancelMatchDialogResult(
        notPlayedReason: _selectedReason,
        notPlayedReasonDetails: normalizedOptionalReasonDetails,
      ),
    );
  }
}
