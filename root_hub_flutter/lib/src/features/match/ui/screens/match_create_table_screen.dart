import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:root_hub_flutter/src/core/navigation/app_routes.dart';
import 'package:root_hub_flutter/src/design_system/default_error_snackbar.dart';
import 'package:root_hub_flutter/src/states/match/match_create_table_provider.dart';

import 'match_create_table_counter_column_widget.dart';
import 'match_create_table_section_title_widget.dart';

class MatchCreateTableScreen extends ConsumerStatefulWidget {
  const MatchCreateTableScreen({
    super.key,
  });

  @override
  ConsumerState<MatchCreateTableScreen> createState() =>
      _MatchCreateTableScreenState();
}

class _MatchCreateTableScreenState
    extends ConsumerState<MatchCreateTableScreen> {
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();

    final currentState = ref.read(matchCreateTableProvider);
    _titleController = TextEditingController(text: currentState.title);
    _descriptionController = TextEditingController(
      text: currentState.description,
    );

    _titleController.addListener(_onTitleChanged);
    _descriptionController.addListener(_onDescriptionChanged);
  }

  @override
  void dispose() {
    _titleController
      ..removeListener(_onTitleChanged)
      ..dispose();
    _descriptionController
      ..removeListener(_onDescriptionChanged)
      ..dispose();
    super.dispose();
  }

  void _onTitleChanged() {
    ref.read(matchCreateTableProvider.notifier).setTitle(_titleController.text);
  }

  void _onDescriptionChanged() {
    ref
        .read(matchCreateTableProvider.notifier)
        .setDescription(_descriptionController.text);
  }

  static const _maxScheduleDays = 15;

  Future<void> _pickDate() async {
    final state = ref.read(matchCreateTableProvider);
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final maxDate = today.add(const Duration(days: _maxScheduleDays));
    final currentScheduledDate = state.scheduledDate;

    final selectedDate = await showDatePicker(
      context: context,
      initialDate:
          currentScheduledDate != null &&
              !currentScheduledDate.isBefore(today) &&
              !currentScheduledDate.isAfter(maxDate)
          ? currentScheduledDate
          : today,
      firstDate: today,
      lastDate: maxDate,
      helpText: 'Select game day',
    );

    if (!mounted || selectedDate == null) {
      return;
    }

    if (selectedDate.isBefore(today)) {
      await showErrorDialog(
        context,
        title: 'Invalid date',
        description: 'You cannot select a day in the past.',
      );
      return;
    }

    ref.read(matchCreateTableProvider.notifier).setScheduledDate(selectedDate);
  }

  Future<void> _pickTime() async {
    final state = ref.read(matchCreateTableProvider);
    final now = TimeOfDay.now();
    final currentScheduledTime = state.scheduledTime;

    final selectedTime = await showTimePicker(
      context: context,
      initialTime: currentScheduledTime ?? now,
      helpText: 'Select start hour',
    );

    if (!mounted || selectedTime == null) {
      return;
    }

    ref.read(matchCreateTableProvider.notifier).setScheduledTime(selectedTime);
  }

  Future<void> _continueToLocationScreen() async {
    final state = ref.read(matchCreateTableProvider);
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    if (state.title.trim().isEmpty) {
      await showErrorDialog(
        context,
        title: 'Title required',
        description:
            'Add a title so players can quickly identify your table. Example: "Downtown Café Night".',
      );
      return;
    }

    final scheduledDate = state.scheduledDate;
    if (scheduledDate == null) {
      await showErrorDialog(
        context,
        title: 'Day required',
        description: 'Select the day for this table before continuing.',
      );
      return;
    }

    if (scheduledDate.isBefore(today)) {
      await showErrorDialog(
        context,
        title: 'Invalid date',
        description: 'You cannot select a day in the past.',
      );
      return;
    }

    if (state.scheduledTime == null) {
      await showErrorDialog(
        context,
        title: 'Start hour required',
        description: 'Select the start hour for this table before continuing.',
      );
      return;
    }

    if (!mounted) {
      return;
    }

    context.push(dashboardMatchCreateLocationPath);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(matchCreateTableProvider);
    final localizations = MaterialLocalizations.of(context);
    final viewPadding = MediaQuery.viewPaddingOf(context);

    final dateLabel = state.scheduledDate == null
        ? 'Select day'
        : localizations.formatMediumDate(state.scheduledDate!);
    final timeLabel = state.scheduledTime == null
        ? 'Select hour'
        : localizations.formatTimeOfDay(state.scheduledTime!);

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: const Alignment(0, -1.15),
                  radius: 1.42,
                  colors: [
                    colorScheme.primaryContainer.withValues(alpha: 0.65),
                    colorScheme.surface,
                    colorScheme.secondaryContainer.withValues(alpha: 0.45),
                  ],
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: SafeArea(
              bottom: false,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(16, 6, 16, 210),
                children: [
                  Row(
                    children: [
                      IconButton.filledTonal(
                        onPressed: () {
                          context.pop();
                        },
                        icon: const Icon(Icons.arrow_back_rounded),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Host a New Table',
                          style: GoogleFonts.cinzel(
                            fontSize: 26,
                            fontWeight: FontWeight.w800,
                            color: colorScheme.onSurface,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Set table details first. On the next screen you will choose the location.',
                    style: GoogleFonts.nunitoSans(
                      fontSize: 15,
                      color: colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.w700,
                      height: 1.35,
                    ),
                  ),
                  const SizedBox(height: 18),
                  const MatchCreateTableSectionTitleWidget(
                    title: 'Table title',
                    description:
                        'This can be anything that helps identify the table, like a place name or event style.',
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _titleController,
                    textInputAction: TextInputAction.next,
                    maxLength: 80,
                    decoration: InputDecoration(
                      hintText: 'Example: Saturday ROOT at Lantern Café',
                      filled: true,
                      fillColor: colorScheme.surface.withValues(alpha: 0.9),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const MatchCreateTableSectionTitleWidget(
                    title: 'Description (optional)',
                    description:
                        'Add extra details like expansions available, parking tips, or reference points.',
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _descriptionController,
                    minLines: 3,
                    maxLines: 6,
                    maxLength: 400,
                    decoration: InputDecoration(
                      hintText:
                          'Example: We have Marauder expansion and spare sleeves.',
                      filled: true,
                      fillColor: colorScheme.surface.withValues(alpha: 0.9),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const MatchCreateTableSectionTitleWidget(
                    title: 'Players range',
                    description:
                        'Default is 3-4. You can set between 2 and 6 players.',
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: colorScheme.outlineVariant),
                      color: colorScheme.surface.withValues(alpha: 0.88),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: MatchCreateTableCounterColumnWidget(
                            title: 'Minimum',
                            value: state.minPlayers,
                            onDecrease: state.minPlayers > 2
                                ? ref
                                      .read(matchCreateTableProvider.notifier)
                                      .decreaseMinPlayers
                                : null,
                            onIncrease: state.minPlayers < state.maxPlayers
                                ? ref
                                      .read(matchCreateTableProvider.notifier)
                                      .increaseMinPlayers
                                : null,
                          ),
                        ),
                        Container(
                          width: 1,
                          height: 62,
                          color: colorScheme.outlineVariant,
                        ),
                        Expanded(
                          child: MatchCreateTableCounterColumnWidget(
                            title: 'Maximum',
                            value: state.maxPlayers,
                            onDecrease: state.maxPlayers > state.minPlayers
                                ? ref
                                      .read(matchCreateTableProvider.notifier)
                                      .decreaseMaxPlayers
                                : null,
                            onIncrease: state.maxPlayers < 6
                                ? ref
                                      .read(matchCreateTableProvider.notifier)
                                      .increaseMaxPlayers
                                : null,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  const MatchCreateTableSectionTitleWidget(
                    title: 'Schedule',
                    description:
                        'Pick the day and start hour. Choose a time you can reliably show up.',
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
                  const SizedBox(height: 12),
                  const MatchCreateTableSectionTitleWidget(
                    title: 'Will you, the host, play?',
                    description:
                        'If you are a venue, board game club, or organizer bringing players together but not joining the match, leave this unchecked.',
                  ),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: colorScheme.outlineVariant),
                      color: colorScheme.surface.withValues(alpha: 0.88),
                    ),
                    child: CheckboxListTile(
                      value: state.hostWillPlay,
                      dense: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 2,
                      ),
                      title: Text(
                        state.hostWillPlay
                            ? 'Yes, I will play this match'
                            : 'No, I am only hosting this table',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      onChanged: (value) {
                        ref
                            .read(matchCreateTableProvider.notifier)
                            .setHostWillPlay(value ?? false);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: 0,
            child: SafeArea(
              top: false,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: viewPadding.bottom > 0 ? 0 : 8,
                ),
                child: SizedBox(
                  height: 58,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _continueToLocationScreen,
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: colorScheme.primary,
                      foregroundColor: colorScheme.onPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(
                      'Continue',
                      style: GoogleFonts.getFont(
                        'MedievalSharp',
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.7,
                        color: colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
