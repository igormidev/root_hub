import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/design_system/default_error_snackbar.dart';
import 'package:root_hub_flutter/src/features/register_match/ui/dialogs/register_match_cancel_match_dialog.dart';
import 'package:root_hub_flutter/src/features/register_match/ui/sheets/register_match_picker_body_section.dart';
import 'package:root_hub_flutter/src/features/register_match/ui/sheets/register_match_picker_header_section.dart';
import 'package:root_hub_flutter/src/features/register_match/ui/sheets/register_match_wizard_sheet.dart';
import 'package:root_hub_flutter/src/states/register_match/register_match_provider.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';

class RegisterMatchPickerSheet extends ConsumerStatefulWidget {
  const RegisterMatchPickerSheet({
    super.key,
  });

  @override
  ConsumerState<RegisterMatchPickerSheet> createState() =>
      _RegisterMatchPickerSheetState();
}

class _RegisterMatchPickerSheetState
    extends ConsumerState<RegisterMatchPickerSheet> {
  int? _processingMatchId;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }

      ref.read(registerMatchProvider.notifier).loadPendingMatches();
      ref.read(registerMatchProvider.notifier).refreshPendingMatchesCount();
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final registerState = ref.watch(registerMatchProvider);

    return FractionallySizedBox(
      heightFactor: 0.84,
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(28),
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RegisterMatchPickerHeaderSection(
              pendingMatchesCount: registerState.pendingMatchesCount,
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  await ref
                      .read(registerMatchProvider.notifier)
                      .loadPendingMatches();
                  await ref
                      .read(registerMatchProvider.notifier)
                      .refreshPendingMatchesCount();
                },
                child: RegisterMatchPickerBodySection(
                  registerState: registerState,
                  onRetry: () {
                    ref
                        .read(registerMatchProvider.notifier)
                        .loadPendingMatches();
                  },
                  onRegisterMatchTap: _onRegisterMatchTap,
                  onCancelMatchTap: _onCancelMatchTap,
                  isTooEarlyToRegister: _isTooEarlyToRegister,
                  processingMatchId: _processingMatchId,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _isTooEarlyToRegister(MatchSchedulePairingAttempt match) {
    final earliestAllowedRegistrationTime = match.attemptedAt.subtract(
      Duration(hours: 2),
    );
    return DateTime.now().isBefore(earliestAllowedRegistrationTime);
  }

  Future<void> _onRegisterMatchTap(MatchSchedulePairingAttempt match) async {
    if (_isTooEarlyToRegister(match)) {
      final localizations = MaterialLocalizations.of(context);
      final earliestAllowedRegistrationTime = match.attemptedAt
          .subtract(Duration(hours: 2))
          .toLocal();
      final earliestAllowedRegistrationTimeLabel =
          '${localizations.formatMediumDate(earliestAllowedRegistrationTime)} • '
          '${localizations.formatTimeOfDay(TimeOfDay.fromDateTime(earliestAllowedRegistrationTime))}';

      await showErrorDialog(
        context,
        title: t
            .register_match
            .ui_sheets_register_match_picker_sheet
            .resultRegistrationNotAvailableYet,
        description:
            '${t.register_match.ui_sheets_register_match_picker_sheet.youCanRegisterThisMatchFrom2HoursBeforeItsScheduledStart}Try again after $earliestAllowedRegistrationTimeLabel.',
      );
      return;
    }

    final submitted = await _openMatchWizard(match);
    if (submitted != true || !mounted) {
      return;
    }

    await ref.read(registerMatchProvider.notifier).loadPendingMatches();
    await ref.read(registerMatchProvider.notifier).refreshPendingMatchesCount();

    if (!mounted) {
      return;
    }

    Navigator.of(context).pop(true);
  }

  Future<void> _onCancelMatchTap(MatchSchedulePairingAttempt match) async {
    final matchId = match.id;
    if (matchId == null || _processingMatchId != null) {
      return;
    }

    final cancelPayload =
        await showDialog<RegisterMatchCancelMatchDialogResult>(
          context: context,
          builder: (dialogContext) {
            return RegisterMatchCancelMatchDialog();
          },
        );

    if (cancelPayload == null || !mounted) {
      return;
    }

    setState(() {
      _processingMatchId = matchId;
    });

    final cancelError = await ref
        .read(registerMatchProvider.notifier)
        .cancelScheduledMatch(
          scheduledMatch: match,
          notPlayedReason: cancelPayload.notPlayedReason,
          notPlayedReasonDetails: cancelPayload.notPlayedReasonDetails,
        );

    if (!mounted) {
      return;
    }

    setState(() {
      _processingMatchId = null;
    });

    if (cancelError != null) {
      await showErrorDialog(
        context,
        title: cancelError.title,
        description: cancelError.description,
      );
      return;
    }

    await ref.read(registerMatchProvider.notifier).refreshPendingMatchesCount();
  }

  Future<bool?> _openMatchWizard(MatchSchedulePairingAttempt match) {
    final platform = Theme.of(context).platform;

    if (platform == TargetPlatform.iOS) {
      return showCupertinoModalPopup<bool>(
        context: context,
        barrierDismissible: false,
        builder: (sheetContext) {
          final size = MediaQuery.sizeOf(sheetContext);
          return SizedBox(
            width: size.width,
            height: size.height,
            child: RegisterMatchWizardSheet(
              scheduledMatch: match,
            ),
          );
        },
      );
    }

    return showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      enableDrag: false,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) {
        final size = MediaQuery.sizeOf(sheetContext);
        return SizedBox(
          width: size.width,
          height: size.height,
          child: RegisterMatchWizardSheet(
            scheduledMatch: match,
          ),
        );
      },
    );
  }
}
