import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/core/extension/match_podium_extension.dart';
import 'package:root_hub_flutter/src/design_system/default_error_snackbar.dart';
import 'package:root_hub_flutter/src/states/match/match_tables_provider.dart';

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
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(28),
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: FutureBuilder<MatchScheduleInfo>(
          future: _detailsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return _buildLoading(context);
            }

            if (snapshot.hasError) {
              final error = snapshot.error is RootHubException
                  ? snapshot.error! as RootHubException
                  : defaultException;
              return _buildError(context, error);
            }

            final tableInfo = snapshot.data;
            if (tableInfo == null) {
              return _buildError(
                context,
                RootHubException(
                  title: 'Table not found',
                  description: 'Unable to load table details.',
                ),
              );
            }

            _initializeFormFromTable(tableInfo);
            return _buildForm(context);
          },
        ),
      ),
    );
  }

  Widget _buildLoading(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        _buildDragHandle(context),
        Expanded(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 36,
                  height: 36,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    color: colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  'Loading table details...',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildError(BuildContext context, RootHubException error) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 16, 18, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: _buildDragHandle(context)),
          Text(
            error.title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            error.description,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Close'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final localizations = MaterialLocalizations.of(context);

    final dateLabel = localizations.formatMediumDate(_scheduledDate);
    final timeLabel = localizations.formatTimeOfDay(_scheduledTime);

    return Column(
      children: [
        _buildDragHandle(context),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(18, 4, 18, 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Edit Table',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Edit Details',
                  style: GoogleFonts.cinzel(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.fromLTRB(14, 6, 6, 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: _closedForSubscriptions
                          ? colorScheme.error.withValues(alpha: 0.5)
                          : colorScheme.outlineVariant,
                    ),
                    color: _closedForSubscriptions
                        ? colorScheme.errorContainer.withValues(alpha: 0.3)
                        : colorScheme.surfaceContainerHighest.withValues(
                            alpha: 0.5,
                          ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        _closedForSubscriptions
                            ? Icons.lock_rounded
                            : Icons.lock_open_rounded,
                        color: _closedForSubscriptions
                            ? colorScheme.error
                            : colorScheme.onSurfaceVariant,
                        size: 22,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Close subscriptions',
                              style: Theme.of(context).textTheme.titleSmall
                                  ?.copyWith(
                                    fontWeight: FontWeight.w900,
                                  ),
                            ),
                            Text(
                              _closedForSubscriptions
                                  ? 'New players cannot join this table.'
                                  : 'New players can still join this table.',
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Switch(
                        value: _closedForSubscriptions,
                        onChanged: (value) {
                          setState(() => _closedForSubscriptions = value);
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                _buildSectionTitle(
                  context,
                  title: 'Table title',
                  description: 'A short name so players can find your table.',
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _titleController,
                  textInputAction: TextInputAction.next,
                  maxLength: 80,
                  decoration: InputDecoration(
                    hintText: 'Example: Saturday ROOT at Lantern Café',
                    filled: true,
                    fillColor: colorScheme.surfaceContainerHighest.withValues(
                      alpha: 0.5,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                _buildSectionTitle(
                  context,
                  title: 'Description (optional)',
                  description:
                      'Extra details like expansions, parking tips, etc.',
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _descriptionController,
                  minLines: 2,
                  maxLines: 5,
                  maxLength: 400,
                  decoration: InputDecoration(
                    hintText: 'Example: We have Marauder expansion.',
                    filled: true,
                    fillColor: colorScheme.surfaceContainerHighest.withValues(
                      alpha: 0.5,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                _buildSectionTitle(
                  context,
                  title: 'Players range',
                  description: _currentSubscriberCount > 0
                      ? '$_currentSubscriberCount player(s) already subscribed.'
                      : 'Set between 2 and 6 players.',
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: colorScheme.outlineVariant),
                    color: colorScheme.surfaceContainerHighest.withValues(
                      alpha: 0.5,
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: _buildCounterColumn(
                          context,
                          title: 'Minimum',
                          value: _minPlayers,
                          onDecrease: _minPlayers > 2
                              ? () => setState(() => _minPlayers--)
                              : null,
                          onIncrease: _minPlayers < _maxPlayers
                              ? () => setState(() => _minPlayers++)
                              : null,
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 62,
                        color: colorScheme.outlineVariant,
                      ),
                      Expanded(
                        child: _buildCounterColumn(
                          context,
                          title: 'Maximum',
                          value: _maxPlayers,
                          onDecrease:
                              _maxPlayers > _minPlayers &&
                                  _maxPlayers > _currentSubscriberCount
                              ? () => setState(() => _maxPlayers--)
                              : null,
                          onIncrease: _maxPlayers < 6
                              ? () => setState(() => _maxPlayers++)
                              : null,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                _buildSectionTitle(
                  context,
                  title: 'Schedule',
                  description:
                      'Must be at least 10 minutes from now, '
                      'up to $_maxScheduleDays days ahead.',
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: FilledButton.tonalIcon(
                        onPressed: _pickDate,
                        icon: const Icon(Icons.calendar_month_rounded),
                        label: Text(dateLabel),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: FilledButton.tonalIcon(
                        onPressed: _pickTime,
                        icon: const Icon(Icons.access_time_rounded),
                        label: Text(timeLabel),
                      ),
                    ),
                  ],
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
                    onPressed: () => Navigator.of(context).pop(false),
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 52),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Cancel'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: FilledButton.icon(
                    onPressed: _isSaving ? null : _saveChanges,
                    style: FilledButton.styleFrom(
                      minimumSize: const Size(double.infinity, 52),
                      maximumSize: const Size(double.infinity, 52),
                    ),
                    icon: _isSaving
                        ? SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: colorScheme.onPrimary,
                            ),
                          )
                        : const Icon(Icons.check_rounded),
                    label: Text(_isSaving ? 'Saving...' : 'Save Changes'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final maxDate = today.add(const Duration(days: _maxScheduleDays));

    final selectedDate = await showDatePicker(
      context: context,
      initialDate: _scheduledDate.isBefore(today) ? today : _scheduledDate,
      firstDate: today,
      lastDate: maxDate,
      helpText: 'Select game day',
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
      helpText: 'Select start hour',
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
        title: 'Title required',
        description: 'Please add a title for your table.',
      );
      return;
    }

    if (_minPlayers < 2 || _maxPlayers > 6 || _minPlayers > _maxPlayers) {
      await showErrorDialog(
        context,
        title: 'Invalid players range',
        description:
            'Players range must be between 2 and 6, '
            'with minimum not greater than maximum.',
      );
      return;
    }

    if (_maxPlayers < _currentSubscriberCount) {
      await showErrorDialog(
        context,
        title: 'Too many players subscribed',
        description:
            'There are already $_currentSubscriberCount players subscribed. '
            'You cannot set the maximum below that number.',
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
      const Duration(minutes: _minScheduleMinutes),
    );
    if (attemptedAt.isBefore(minAllowedTime)) {
      if (!mounted) {
        return;
      }
      await showErrorDialog(
        context,
        title: 'Time is too soon',
        description:
            'The scheduled time must be at least '
            '$_minScheduleMinutes minutes in the future.',
      );
      return;
    }

    final maxAllowedTime = now.add(
      const Duration(days: _maxScheduleDays),
    );
    if (attemptedAt.isAfter(maxAllowedTime)) {
      if (!mounted) {
        return;
      }
      await showErrorDialog(
        context,
        title: 'Date is too far',
        description:
            'The scheduled time cannot be more than '
            '$_maxScheduleDays days in the future.',
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

  Widget _buildDragHandle(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: 50,
      height: 5,
      margin: const EdgeInsets.only(top: 12, bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        color: colorScheme.outlineVariant,
      ),
    );
  }

  Widget _buildSectionTitle(
    BuildContext context, {
    required String title,
    required String description,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w900,
            color: colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          description,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  Widget _buildCounterColumn(
    BuildContext context, {
    required String title,
    required int value,
    required VoidCallback? onDecrease,
    required VoidCallback? onIncrease,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              IconButton.filledTonal(
                onPressed: onDecrease,
                icon: const Icon(Icons.remove_rounded),
              ),
              Expanded(
                child: Text(
                  '$value',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              IconButton.filledTonal(
                onPressed: onIncrease,
                icon: const Icon(Icons.add_rounded),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
