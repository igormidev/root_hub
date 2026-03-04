import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/core/extension/match_podium_extension.dart';
import 'package:root_hub_flutter/src/design_system/default_error_snackbar.dart';
import 'package:root_hub_flutter/src/features/match/ui/sheets/match_edit_table_error_widget.dart';
import 'package:root_hub_flutter/src/features/match/ui/sheets/match_edit_table_form_widget.dart';
import 'package:root_hub_flutter/src/features/match/ui/sheets/match_edit_table_loading_widget.dart';
import 'package:root_hub_flutter/src/states/match/match_tables_provider.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';

class MatchEditTableSheet extends ConsumerStatefulWidget {
  final int scheduledMatchId;

  const MatchEditTableSheet({
    super.key,
    required this.scheduledMatchId,
  });

  @override
  ConsumerState<MatchEditTableSheet> createState() =>
      _MatchEditTableSheetState();
}

class _MatchEditTableSheetState extends ConsumerState<MatchEditTableSheet> {
  static const _maxScheduleDays = 15;
  static const _minScheduleMinutes = 10;

  late Future<MatchScheduleInfo> _detailsFuture;

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  int _minPlayers = 3;
  int _maxPlayers = 4;
  DateTime _scheduledDate = DateTime.now();
  TimeOfDay _scheduledTime = TimeOfDay.now();
  int _currentSubscriberCount = 0;
  bool _closedForSubscriptions = false;

  bool _hasInitializedForm = false;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _detailsFuture = ref
        .read(matchTablesProvider.notifier)
        .getTableDetails(widget.scheduledMatchId, forceRefresh: true);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _initializeFormFromTable(MatchScheduleInfo tableInfo) {
    if (_hasInitializedForm) {
      return;
    }
    _hasInitializedForm = true;

    final table = tableInfo.matchSchedule;
    _titleController.text = table.title;
    _descriptionController.text = table.description ?? '';
    _minPlayers = table.minAmountOfPlayers.playerCount;
    _maxPlayers = table.maxAmountOfPlayers.playerCount;
    _currentSubscriberCount = tableInfo.players.length;
    _closedForSubscriptions = table.closedForSubscriptions == true;

    final startAt = table.attemptedAt.toLocal();
    _scheduledDate = DateTime(startAt.year, startAt.month, startAt.day);
    _scheduledTime = TimeOfDay(hour: startAt.hour, minute: startAt.minute);
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.85,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(28),
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: FutureBuilder<MatchScheduleInfo>(
          future: _detailsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return MatchEditTableLoadingWidget();
            }

            if (snapshot.hasError) {
              final error = snapshot.error is RootHubException
                  ? snapshot.error! as RootHubException
                  : defaultException;
              return MatchEditTableErrorWidget(
                error: error,
                onClose: () => Navigator.of(context).pop(false),
              );
            }

            final tableInfo = snapshot.data;
            if (tableInfo == null) {
              return MatchEditTableErrorWidget(
                error: RootHubException(
                  title: t.match.ui_sheets_match_edit_table_sheet.tableNotFound,
                  description: t
                      .match
                      .ui_sheets_match_edit_table_sheet
                      .unableToLoadTableDetails,
                ),
                onClose: () => Navigator.of(context).pop(false),
              );
            }

            _initializeFormFromTable(tableInfo);
            final localizations = MaterialLocalizations.of(context);
            final dateLabel = localizations.formatMediumDate(_scheduledDate);
            final timeLabel = localizations.formatTimeOfDay(_scheduledTime);

            return MatchEditTableFormWidget(
              closedForSubscriptions: _closedForSubscriptions,
              onClosedForSubscriptionsChanged: (value) {
                setState(() => _closedForSubscriptions = value);
              },
              titleController: _titleController,
              descriptionController: _descriptionController,
              currentSubscriberCount: _currentSubscriberCount,
              minPlayers: _minPlayers,
              maxPlayers: _maxPlayers,
              onMinDecrease: _minPlayers > 2
                  ? () => setState(() => _minPlayers--)
                  : null,
              onMinIncrease: _minPlayers < _maxPlayers
                  ? () => setState(() => _minPlayers++)
                  : null,
              onMaxDecrease:
                  _maxPlayers > _minPlayers &&
                      _maxPlayers > _currentSubscriberCount
                  ? () => setState(() => _maxPlayers--)
                  : null,
              onMaxIncrease: _maxPlayers < 6
                  ? () => setState(() => _maxPlayers++)
                  : null,
              maxScheduleDays: _maxScheduleDays,
              dateLabel: dateLabel,
              timeLabel: timeLabel,
              onPickDate: () {
                _pickDate();
              },
              onPickTime: () {
                _pickTime();
              },
              isSaving: _isSaving,
              onCancel: () => Navigator.of(context).pop(false),
              onSaveChanges: () {
                _saveChanges();
              },
            );
          },
        ),
      ),
    );
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final maxDate = today.add(Duration(days: _maxScheduleDays));

    final selectedDate = await showDatePicker(
      context: context,
      initialDate: _scheduledDate.isBefore(today) ? today : _scheduledDate,
      firstDate: today,
      lastDate: maxDate,
      helpText: t.match.ui_sheets_match_edit_table_sheet.selectGameDay,
    );

    if (!mounted || selectedDate == null) {
      return;
    }

    setState(() {
      _scheduledDate = DateTime(
        selectedDate.year,
        selectedDate.month,
        selectedDate.day,
      );
    });
  }

  Future<void> _pickTime() async {
    final selectedTime = await showTimePicker(
      context: context,
      initialTime: _scheduledTime,
      helpText: t.match.ui_sheets_match_edit_table_sheet.selectStartHour,
    );

    if (!mounted || selectedTime == null) {
      return;
    }

    setState(() {
      _scheduledTime = TimeOfDay(
        hour: selectedTime.hour,
        minute: selectedTime.minute,
      );
    });
  }

  Future<void> _saveChanges() async {
    final normalizedTitle = _titleController.text.trim();
    if (normalizedTitle.isEmpty) {
      await showErrorDialog(
        context,
        title: t.match.ui_sheets_match_edit_table_sheet.titleRequired,
        description: t
            .match
            .ui_sheets_match_edit_table_sheet
            .pleaseAddATitleForYourTable,
      );
      return;
    }

    if (_minPlayers < 2 || _maxPlayers > 6 || _minPlayers > _maxPlayers) {
      await showErrorDialog(
        context,
        title: t.match.ui_sheets_match_edit_table_sheet.invalidPlayersRange,
        description:
            t
                .match
                .ui_sheets_match_edit_table_sheet
                .playersRangeMustBeBetween2And6 +
            t
                .match
                .ui_sheets_match_edit_table_sheet
                .withMinimumNotGreaterThanMaximum,
      );
      return;
    }

    if (_maxPlayers < _currentSubscriberCount) {
      await showErrorDialog(
        context,
        title:
            t.match.ui_sheets_match_edit_table_sheet.tooManyPlayersSubscribed,
        description: t.match.ui_sheets_match_edit_table_sheet
            .tooManyPlayersSubscribedDescription(
              currentSubscriberCount: _currentSubscriberCount,
            ),
      );
      return;
    }

    final attemptedAt = DateTime(
      _scheduledDate.year,
      _scheduledDate.month,
      _scheduledDate.day,
      _scheduledTime.hour,
      _scheduledTime.minute,
    );

    final now = DateTime.now();
    final minAllowedTime = now.add(
      Duration(minutes: _minScheduleMinutes),
    );
    if (attemptedAt.isBefore(minAllowedTime)) {
      if (!mounted) {
        return;
      }
      await showErrorDialog(
        context,
        title: t.match.ui_sheets_match_edit_table_sheet.timeIsTooSoon,
        description: t.match.ui_sheets_match_edit_table_sheet
            .timeIsTooSoonDescription(minScheduleMinutes: _minScheduleMinutes),
      );
      return;
    }

    final maxAllowedTime = now.add(
      Duration(days: _maxScheduleDays),
    );
    if (attemptedAt.isAfter(maxAllowedTime)) {
      if (!mounted) {
        return;
      }
      await showErrorDialog(
        context,
        title: t.match.ui_sheets_match_edit_table_sheet.dateIsTooFar,
        description: t.match.ui_sheets_match_edit_table_sheet
            .dateIsTooFarDescription(maxScheduleDays: _maxScheduleDays),
      );
      return;
    }

    setState(() => _isSaving = true);

    final normalizedDescription = _descriptionController.text.trim();

    final error = await ref
        .read(matchTablesProvider.notifier)
        .editMatchSchedule(
          scheduledMatchId: widget.scheduledMatchId,
          title: normalizedTitle,
          description: normalizedDescription.isEmpty
              ? null
              : normalizedDescription,
          minPlayers: _minPlayers,
          maxPlayers: _maxPlayers,
          attemptedAt: attemptedAt,
          closedForSubscriptions: _closedForSubscriptions,
        );

    if (!mounted) {
      return;
    }

    if (error != null) {
      setState(() => _isSaving = false);
      await showErrorDialog(
        context,
        title: error.title,
        description: error.description,
      );
      return;
    }

    Navigator.of(context).pop(true);
  }
}
