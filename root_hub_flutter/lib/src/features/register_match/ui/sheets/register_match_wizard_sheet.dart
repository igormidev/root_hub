import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/core/extension/faction_ui_extension.dart';
import 'package:root_hub_flutter/src/design_system/default_error_snackbar.dart';
import 'package:root_hub_flutter/src/features/register_match/ui/sheets/register_match_add_anonymous_player_sheet.dart';
import 'package:root_hub_flutter/src/features/register_match/ui/sheets/register_match_search_registered_player_sheet.dart';
import 'package:root_hub_flutter/src/states/match/match_tables_provider.dart';
import 'package:root_hub_flutter/src/states/register_match/register_match_provider.dart';
import 'package:root_hub_flutter/src/states/register_match/register_match_state.dart';

enum _RegisterMatchStep {
  participants,
  factions,
  winner,
  points,
  matchStartedAt,
  groupPhoto,
  boardPhoto,
  review,
}

enum _WinnerType {
  points,
  dominance,
}

class RegisterMatchWizardSheet extends ConsumerStatefulWidget {
  const RegisterMatchWizardSheet({
    super.key,
    required this.scheduledMatch,
  });

  final MatchSchedulePairingAttempt scheduledMatch;

  @override
  ConsumerState<RegisterMatchWizardSheet> createState() =>
      _RegisterMatchWizardSheetState();
}

class _RegisterMatchWizardSheetState
    extends ConsumerState<RegisterMatchWizardSheet> {
  final ImagePicker _imagePicker = ImagePicker();

  late final Future<MatchScheduleInfo> _tableDetailsFuture;
  final List<_ParticipantDraft> _participants = <_ParticipantDraft>[];
  final Map<String, TextEditingController> _scoreControllers =
      <String, TextEditingController>{};

  bool _didInitializeParticipants = false;
  _RegisterMatchStep _currentStep = _RegisterMatchStep.participants;
  String? _winnerParticipantKey;
  _WinnerType? _winnerType;
  DateTime? _matchStartedAt;
  Duration _matchEstimatedDuration = const Duration(hours: 1);
  bool _hasEditedMatchDuration = false;
  _ProofImageSelection? _groupPhoto;
  _ProofImageSelection? _boardPhoto;

  @override
  void initState() {
    super.initState();

    final scheduleId = widget.scheduledMatch.id;
    if (scheduleId == null || scheduleId <= 0) {
      _tableDetailsFuture = Future<MatchScheduleInfo>.error(
        RootHubException(
          title: 'Invalid match',
          description: 'Unable to load this match report flow.',
        ),
      );
    } else {
      _tableDetailsFuture = ref
          .read(matchTablesProvider.notifier)
          .getTableDetails(
            scheduleId,
            forceRefresh: true,
          );
    }

    Future<void>.microtask(() async {
      await ref
          .read(registerMatchProvider.notifier)
          .ensureAnonymousPlayersLoaded();
    });
  }

  @override
  void dispose() {
    for (final controller in _scoreControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final registerState = ref.watch(registerMatchProvider);

    return Material(
      color: colorScheme.surface,
      child: SafeArea(
        child: FutureBuilder<MatchScheduleInfo>(
          future: _tableDetailsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return _buildLoadingState(context);
            }

            if (snapshot.hasError) {
              final error = snapshot.error is RootHubException
                  ? snapshot.error! as RootHubException
                  : defaultException;
              return _buildErrorState(
                context,
                error,
              );
            }

            final tableInfo = snapshot.data;
            if (tableInfo == null) {
              return _buildErrorState(
                context,
                RootHubException(
                  title: 'Match not found',
                  description: 'Unable to load this match report flow.',
                ),
              );
            }

            _ensureParticipantsInitialized(tableInfo);

            return Column(
              children: [
                _buildTopBar(
                  context,
                  tableInfo,
                ),
                _buildStepDots(context),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 280),
                      switchInCurve: Curves.easeOutCubic,
                      switchOutCurve: Curves.easeInCubic,
                      transitionBuilder: (child, animation) {
                        final offsetAnimation = Tween<Offset>(
                          begin: const Offset(0.05, 0),
                          end: Offset.zero,
                        ).animate(animation);
                        return FadeTransition(
                          opacity: animation,
                          child: SlideTransition(
                            position: offsetAnimation,
                            child: child,
                          ),
                        );
                      },
                      child: KeyedSubtree(
                        key: ValueKey<String>(_currentStep.name),
                        child: _buildCurrentStep(
                          context,
                          tableInfo,
                        ),
                      ),
                    ),
                  ),
                ),
                _buildBottomActions(
                  context,
                  tableInfo,
                  registerState,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildLoadingState(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Center(
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
          const SizedBox(height: 12),
          Text(
            'Loading match details...',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(
    BuildContext context,
    RootHubException error,
  ) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () => Navigator.of(context).pop(false),
                icon: const Icon(Icons.close_rounded),
              ),
              const SizedBox(width: 2),
              Text(
                'Register Match',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
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
            child: FilledButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Close'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopBar(
    BuildContext context,
    MatchScheduleInfo tableInfo,
  ) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final localizations = MaterialLocalizations.of(context);
    final startAt = tableInfo.matchSchedule.attemptedAt.toLocal();
    final startLabel =
        '${localizations.formatMediumDate(startAt)} • ${localizations.formatTimeOfDay(TimeOfDay.fromDateTime(startAt))}';

    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 14, 10),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        border: Border(
          bottom: BorderSide(color: colorScheme.outlineVariant),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () => Navigator.of(context).pop(false),
            icon: const Icon(Icons.close_rounded),
          ),
          const SizedBox(width: 2),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Register Match Result',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  tableInfo.matchSchedule.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  startLabel,
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(999),
              color: colorScheme.primaryContainer,
            ),
            child: Text(
              _stepBadgeLabel(),
              style: theme.textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.w900,
                color: colorScheme.onPrimaryContainer,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepDots(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final currentIndex = _currentStep.index;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: colorScheme.outlineVariant),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (var index = 0; index < _RegisterMatchStep.values.length; index++)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: InkWell(
                borderRadius: BorderRadius.circular(999),
                onTap: index <= currentIndex
                    ? () {
                        setState(() {
                          _currentStep = _RegisterMatchStep.values[index];
                        });
                      }
                    : null,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 220),
                  curve: Curves.easeOutCubic,
                  width: index == currentIndex ? 22 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(999),
                    color: index == currentIndex
                        ? colorScheme.primary
                        : index < currentIndex
                        ? colorScheme.primary.withValues(alpha: 0.55)
                        : colorScheme.outlineVariant,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildCurrentStep(
    BuildContext context,
    MatchScheduleInfo tableInfo,
  ) {
    return switch (_currentStep) {
      _RegisterMatchStep.participants => _buildParticipantsStep(context),
      _RegisterMatchStep.factions => _buildFactionsStep(context),
      _RegisterMatchStep.winner => _buildWinnerStep(context),
      _RegisterMatchStep.points => _buildPointsStep(context),
      _RegisterMatchStep.matchStartedAt => _buildTimingStep(context, tableInfo),
      _RegisterMatchStep.groupPhoto => _buildGroupPhotoStep(context),
      _RegisterMatchStep.boardPhoto => _buildBoardPhotoStep(context),
      _RegisterMatchStep.review => _buildReviewStep(
        context,
        tableInfo,
      ),
    };
  }

  Widget _buildParticipantsStep(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '1) Who actually played?',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Select registered players who were present. You can add anonymous players or search for other registered players.',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w700,
            height: 1.35,
          ),
        ),
        const SizedBox(height: 14),
        for (final participant in _participants)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: CheckboxListTile(
              value: participant.isPresent,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 2,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
                side: BorderSide(color: colorScheme.outlineVariant),
              ),
              title: Text(
                participant.displayName,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
              subtitle: Text(
                participant.isAnonymous
                    ? 'Anonymous player'
                    : 'Registered player',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w700,
                ),
              ),
              secondary: Icon(
                participant.isAnonymous
                    ? Icons.person_outline_rounded
                    : Icons.verified_user_rounded,
                color: participant.isAnonymous
                    ? colorScheme.tertiary
                    : colorScheme.primary,
              ),
              onChanged: (value) {
                setState(() {
                  participant.isPresent = value ?? false;
                  if (!participant.isPresent &&
                      _winnerParticipantKey == participant.key) {
                    _winnerParticipantKey = null;
                    _winnerType = null;
                    _controllerFor(participant.key).clear();
                  }
                });
              },
            ),
          ),
        const SizedBox(height: 4),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: _openAnonymousPlayerSheet,
            icon: const Icon(Icons.person_add_alt_rounded),
            label: const Text('Add anonymous player'),
          ),
        ),
        const SizedBox(height: 2),
        Align(
          alignment: Alignment.centerLeft,
          child: TextButton.icon(
            onPressed: _openRegisteredPlayerSheet,
            icon: const Icon(Icons.search_rounded),
            label: const Text('Add registered player from platform'),
          ),
        ),
      ],
    );
  }

  Widget _buildFactionsStep(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final selectedParticipants = _selectedParticipants;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '2) Select factions',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Choose the faction used by each player in this match.',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 14),
        for (final participant in selectedParticipants)
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Container(
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: colorScheme.outlineVariant),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    participant.displayName,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<Faction>(
                    key: ValueKey(
                      '${participant.key}-${participant.faction?.name ?? 'none'}',
                    ),
                    initialValue: participant.faction,
                    isExpanded: true,
                    decoration: const InputDecoration(
                      labelText: 'Faction',
                      border: OutlineInputBorder(),
                    ),
                    items: Faction.values
                        .map(
                          (faction) => DropdownMenuItem<Faction>(
                            value: faction,
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 12,
                                  backgroundColor: faction.factionColor
                                      .withValues(alpha: 0.18),
                                  child: Image.asset(
                                    faction.getFactionIconPath(
                                      size: FactionIconSize.size80,
                                    ),
                                    width: 14,
                                    height: 14,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    faction.displayName,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        participant.faction = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildWinnerStep(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${_stepNumber(_RegisterMatchStep.winner)}) Select the winner',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Pick the player who won this match.',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w700,
            height: 1.35,
          ),
        ),
        const SizedBox(height: 14),
        for (final participant in _selectedParticipants)
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 2),
            leading: Icon(
              _winnerParticipantKey == participant.key
                  ? Icons.radio_button_checked_rounded
                  : Icons.radio_button_unchecked_rounded,
            ),
            title: Row(
              children: [
                _buildFactionAvatar(
                  context,
                  faction: participant.faction,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    participant.displayName,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
            onTap: () {
              _onWinnerSelected(participant.key);
            },
          ),
        const SizedBox(height: 10),
        Text(
          'How did the winner won?',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Total points means the winner reached 30 victory points on the score track. '
          'Dominance means the winner completed a Dominance card objective instead of winning by points.',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w700,
            height: 1.35,
          ),
        ),
        const SizedBox(height: 10),
        SegmentedButton<_WinnerType>(
          emptySelectionAllowed: true,
          segments: const [
            ButtonSegment<_WinnerType>(
              value: _WinnerType.points,
              icon: Icon(Icons.stars_rounded),
              label: Text('Total points (30)'),
            ),
            ButtonSegment<_WinnerType>(
              value: _WinnerType.dominance,
              icon: Icon(Icons.flag_rounded),
              label: Text('Dominance'),
            ),
          ],
          selected: _winnerType == null
              ? const <_WinnerType>{}
              : <_WinnerType>{_winnerType!},
          onSelectionChanged: (selection) {
            if (selection.isEmpty) {
              return;
            }
            _onWinnerTypeChanged(selection.first);
          },
        ),
      ],
    );
  }

  Widget _buildPointsStep(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${_stepNumber(_RegisterMatchStep.points)}) Points by player',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'For each non-winner, set points or mark failed dominance attempt. '
          'Failed dominance always counts as no points.',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w700,
            height: 1.35,
          ),
        ),
        const SizedBox(height: 14),
        for (final participant in _selectedParticipants)
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Container(
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: colorScheme.outlineVariant),
                color: colorScheme.surfaceContainerLow,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      _buildFactionAvatar(
                        context,
                        faction: participant.faction,
                        radius: 15,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          participant.displayName,
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      if (_isWinner(participant))
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(999),
                            color: colorScheme.primaryContainer,
                          ),
                          child: Text(
                            'Winner',
                            style: theme.textTheme.labelSmall?.copyWith(
                              fontWeight: FontWeight.w900,
                              color: colorScheme.onPrimaryContainer,
                            ),
                          ),
                        ),
                    ],
                  ),
                  if (!_isWinner(participant)) ...[
                    const SizedBox(height: 10),
                    SegmentedButton<_ParticipantScoreMode>(
                      segments: const [
                        ButtonSegment<_ParticipantScoreMode>(
                          value: _ParticipantScoreMode.points,
                          icon: Icon(Icons.pin_rounded),
                          label: Text('Points'),
                        ),
                        ButtonSegment<_ParticipantScoreMode>(
                          value: _ParticipantScoreMode.failedDominance,
                          icon: Icon(Icons.flag_rounded),
                          label: Text('Failed dominance'),
                        ),
                      ],
                      selected: <_ParticipantScoreMode>{participant.scoreMode},
                      onSelectionChanged: (selection) {
                        final nextMode = selection.first;
                        setState(() {
                          participant.scoreMode = nextMode;
                          if (nextMode ==
                              _ParticipantScoreMode.failedDominance) {
                            _controllerFor(participant.key).clear();
                          }
                        });
                      },
                    ),
                  ],
                  const SizedBox(height: 10),
                  if (_isWinner(participant) &&
                      _winnerType == _WinnerType.points)
                    _buildScoreSummary(
                      context,
                      label: 'Winner by points',
                      value: '30',
                    )
                  else if (_isWinner(participant) &&
                      _winnerType == _WinnerType.dominance)
                    _buildScoreSummary(
                      context,
                      label: 'Winner by dominance',
                      value: 'No points',
                    )
                  else if (participant.scoreMode ==
                      _ParticipantScoreMode.failedDominance)
                    _buildScoreSummary(
                      context,
                      label: 'Dominance attempt',
                      value: 'Failed (no points)',
                    )
                  else
                    TextField(
                      controller: _controllerFor(participant.key),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(2),
                      ],
                      decoration: const InputDecoration(
                        labelText: 'Points',
                        hintText: '0 to 29',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (_) {
                        setState(() {});
                      },
                    ),
                ],
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildTimingStep(
    BuildContext context,
    MatchScheduleInfo tableInfo,
  ) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final localizations = MaterialLocalizations.of(context);
    final matchStartedAt =
        _matchStartedAt ?? tableInfo.matchSchedule.attemptedAt.toLocal();
    final startedDateLabel = localizations.formatMediumDate(matchStartedAt);
    final startedTimeLabel = localizations.formatTimeOfDay(
      TimeOfDay.fromDateTime(matchStartedAt),
      alwaysUse24HourFormat: true,
    );
    final durationLabel = _durationLabel(_matchEstimatedDuration);
    final startedStepNumber = _stepNumber(_RegisterMatchStep.matchStartedAt);
    final durationStepNumber = startedStepNumber + 1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$startedStepNumber) Match started at',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Set the time the match actually started.',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w700,
            height: 1.35,
          ),
        ),
        const SizedBox(height: 14),
        Text(
          'Match started at',
          style: theme.textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w900,
            color: colorScheme.primary,
          ),
        ),
        const SizedBox(height: 4),
        GestureDetector(
          onTap: () {
            _pickMatchStartedDate(
              tableInfo.matchSchedule.attemptedAt.toLocal(),
            );
          },
          child: Text(
            startedDateLabel,
            style: theme.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ),
        const SizedBox(height: 2),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                startedTimeLabel,
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w900,
                  color: colorScheme.primary,
                ),
              ),
            ),
            FilledButton.tonalIcon(
              onPressed: () {
                _pickMatchStartedTime(
                  tableInfo.matchSchedule.attemptedAt.toLocal(),
                );
              },
              icon: const Icon(Icons.schedule_rounded),
              label: const Text('Change time'),
            ),
          ],
        ),
        const SizedBox(height: 14),
        Text(
          '$durationStepNumber) Estimated match duration',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Set the estimated duration. Adjust in 15-minute steps (max 8 hours).',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w700,
            height: 1.35,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Estimated duration',
          style: theme.textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w900,
            color: colorScheme.primary,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: colorScheme.outlineVariant,
              width: 1,
            ),
            color: colorScheme.surfaceContainerLow,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Estimated duration',
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  IconButton.filledTonal(
                    onPressed:
                        _matchEstimatedDuration > const Duration(minutes: 15)
                        ? () {
                            setState(() {
                              _hasEditedMatchDuration = true;
                              _matchEstimatedDuration -= const Duration(
                                minutes: 15,
                              );
                            });
                          }
                        : null,
                    icon: const Icon(Icons.remove_rounded),
                  ),
                  Expanded(
                    child: Text(
                      durationLabel,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  IconButton.filledTonal(
                    onPressed:
                        _matchEstimatedDuration < const Duration(hours: 8)
                        ? () {
                            setState(() {
                              _hasEditedMatchDuration = true;
                              _matchEstimatedDuration += const Duration(
                                minutes: 15,
                              );
                            });
                          }
                        : null,
                    icon: const Icon(Icons.add_rounded),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGroupPhotoStep(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${_stepNumber(_RegisterMatchStep.groupPhoto)}) Group photo proof',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Upload a selfie with all players. Include the board if possible.',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w700,
            height: 1.35,
          ),
        ),
        const SizedBox(height: 14),
        _buildProofCard(
          context,
          title: 'Group photo',
          subtitle: 'Selfie with all players. Include the board if possible.',
          image: _groupPhoto,
          onTap: () => _pickProofImage(isGroupPhoto: true),
        ),
      ],
    );
  }

  Widget _buildBoardPhotoStep(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${_stepNumber(_RegisterMatchStep.boardPhoto)}) Board photo proof',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Upload a photo of the board with the score track clearly visible.',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w700,
            height: 1.35,
          ),
        ),
        const SizedBox(height: 14),
        _buildProofCard(
          context,
          title: 'Board photo',
          subtitle: 'Capture the board and score track clearly.',
          image: _boardPhoto,
          onTap: () => _pickProofImage(isGroupPhoto: false),
        ),
      ],
    );
  }

  Widget _buildScoreSummary(
    BuildContext context, {
    required String label,
    required String value,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Text(
        '$label: $value',
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }

  Widget _buildFactionAvatar(
    BuildContext context, {
    required Faction? faction,
    double radius = 13,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return CircleAvatar(
      radius: radius,
      backgroundColor:
          (faction?.factionColor ?? colorScheme.surfaceContainerHighest)
              .withValues(alpha: 0.18),
      child: faction == null
          ? Icon(
              Icons.question_mark_rounded,
              size: 14,
              color: colorScheme.onSurfaceVariant,
            )
          : Image.asset(
              faction.getFactionIconPath(
                size: FactionIconSize.size80,
              ),
              width: 15,
              height: 15,
            ),
    );
  }

  int _stepNumber(_RegisterMatchStep step) {
    return switch (step) {
      _RegisterMatchStep.participants => 1,
      _RegisterMatchStep.factions => 2,
      _RegisterMatchStep.winner => 3,
      _RegisterMatchStep.points => 4,
      _RegisterMatchStep.matchStartedAt => 5,
      _RegisterMatchStep.groupPhoto => 7,
      _RegisterMatchStep.boardPhoto => 8,
      _RegisterMatchStep.review => 9,
    };
  }

  String _stepBadgeLabel() {
    const totalSteps = 9;
    if (_currentStep == _RegisterMatchStep.matchStartedAt) {
      final startedStepNumber = _stepNumber(_RegisterMatchStep.matchStartedAt);
      return '$startedStepNumber-${startedStepNumber + 1}/$totalSteps';
    }
    return '${_stepNumber(_currentStep)}/$totalSteps';
  }

  String _durationLabel(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final hourLabel = hours == 1 ? '1 hour' : '$hours hours';
    final minuteLabel = minutes == 0 ? '' : ' ${minutes}m';
    return '$hourLabel$minuteLabel';
  }

  Future<void> _pickMatchStartedDate(DateTime scheduledStart) async {
    final now = DateTime.now();
    final current = _matchStartedAt ?? scheduledStart.toLocal();
    final today = DateTime(now.year, now.month, now.day);
    DateTime firstDate = DateTime(
      scheduledStart.year,
      scheduledStart.month,
      scheduledStart.day,
    ).subtract(const Duration(days: 1));
    final oneDayAheadFromSchedule = DateTime(
      scheduledStart.year,
      scheduledStart.month,
      scheduledStart.day,
    ).add(const Duration(days: 1));
    DateTime lastDate = oneDayAheadFromSchedule.isAfter(today)
        ? today
        : oneDayAheadFromSchedule;

    if (firstDate.isAfter(lastDate)) {
      firstDate = lastDate;
    }

    DateTime initialDate = DateTime(current.year, current.month, current.day);
    if (initialDate.isBefore(firstDate)) {
      initialDate = firstDate;
    } else if (initialDate.isAfter(lastDate)) {
      initialDate = lastDate;
    }

    final selectedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
      helpText: 'When did the match start?',
    );

    if (!mounted || selectedDate == null) {
      return;
    }

    final selectedDateTime = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
      current.hour,
      current.minute,
    );

    if (selectedDateTime.isAfter(DateTime.now())) {
      await showErrorDialog(
        context,
        title: 'Invalid match registration',
        description: 'Match start time cannot be in the future.',
      );
      return;
    }

    setState(() {
      _matchStartedAt = selectedDateTime;
    });
  }

  Future<void> _pickMatchStartedTime(DateTime scheduledStart) async {
    final current = _matchStartedAt ?? scheduledStart.toLocal();
    final selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(current),
      helpText: 'Select start time',
    );

    if (!mounted || selectedTime == null) {
      return;
    }

    final currentDate = DateTime(current.year, current.month, current.day);
    final selectedDateTime = DateTime(
      currentDate.year,
      currentDate.month,
      currentDate.day,
      selectedTime.hour,
      selectedTime.minute,
    );

    if (selectedDateTime.isAfter(DateTime.now())) {
      await showErrorDialog(
        context,
        title: 'Invalid match registration',
        description: 'Match start time cannot be in the future.',
      );
      return;
    }

    setState(() {
      _matchStartedAt = selectedDateTime;
    });
  }

  Widget _buildReviewStep(
    BuildContext context,
    MatchScheduleInfo tableInfo,
  ) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final localizations = MaterialLocalizations.of(context);
    final matchStartedAt =
        _matchStartedAt ?? tableInfo.matchSchedule.attemptedAt.toLocal();
    final matchStartedLabel =
        '${localizations.formatMediumDate(matchStartedAt)} • ${localizations.formatTimeOfDay(TimeOfDay.fromDateTime(matchStartedAt))}';
    final rankedParticipants = _rankedParticipantsForReview();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${_stepNumber(_RegisterMatchStep.review)}) Review and submit',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Confirm all details before logging this match.',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          tableInfo.matchSchedule.title,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 10),
        const SizedBox(height: 14),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: colorScheme.surfaceContainerLow,
            border: Border.all(color: colorScheme.outlineVariant),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Match started: $matchStartedLabel',
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Estimated duration: ${_durationLabel(_matchEstimatedDuration)}',
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Winner method: ${_winnerType == _WinnerType.points ? 'Total points (30)' : 'Dominance'}',
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),
        Text(
          'Ranking',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 8),
        for (var index = 0; index < rankedParticipants.length; index++)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: colorScheme.surfaceContainerLow,
                border: Border.all(color: colorScheme.outlineVariant),
              ),
              child: Row(
                children: [
                  Container(
                    width: 28,
                    height: 28,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(999),
                      color: colorScheme.primaryContainer,
                    ),
                    child: Text(
                      '${index + 1}',
                      style: theme.textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.w900,
                        color: colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  _buildFactionAvatar(
                    context,
                    faction: rankedParticipants[index].faction,
                    radius: 14,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      rankedParticipants[index].displayName,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Text(
                    _scoreLabelForParticipant(rankedParticipants[index]),
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ),
        const SizedBox(height: 10),
        Text(
          'Social proof',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 8),
        _buildReviewPhotoTile(
          context,
          title: 'Group photo',
          image: _groupPhoto,
        ),
        const SizedBox(height: 10),
        _buildReviewPhotoTile(
          context,
          title: 'Board photo',
          image: _boardPhoto,
        ),
      ],
    );
  }

  Widget _buildProofCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required _ProofImageSelection? image,
    required VoidCallback onTap,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Ink(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: colorScheme.outlineVariant),
            color: colorScheme.surfaceContainerLow,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: SizedBox(
                  width: 94,
                  height: 94,
                  child: image == null
                      ? DecoratedBox(
                          decoration: BoxDecoration(
                            color: colorScheme.surfaceContainerHighest,
                          ),
                          child: Icon(
                            Icons.camera_alt_rounded,
                            color: colorScheme.onSurfaceVariant,
                            size: 32,
                          ),
                        )
                      : Image.memory(
                          image.bytes,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w700,
                        height: 1.35,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      image == null ? 'Tap to add photo' : 'Tap to replace',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomActions(
    BuildContext context,
    MatchScheduleInfo tableInfo,
    RegisterMatchState registerState,
  ) {
    final isSubmitting = registerState.isSubmitting;
    final isFirstStep = _currentStep == _RegisterMatchStep.participants;
    final isLastStep = _currentStep == _RegisterMatchStep.review;

    return Container(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border(
          top: BorderSide(color: Theme.of(context).colorScheme.outlineVariant),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 52,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: isSubmitting
                    ? null
                    : () {
                        if (isFirstStep) {
                          Navigator.of(context).pop(false);
                          return;
                        }

                        setState(() {
                          _currentStep =
                              _RegisterMatchStep.values[_currentStep.index - 1];
                        });
                      },
                child: Text(isFirstStep ? 'Cancel' : 'Back'),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: SizedBox(
              height: 52,
              child: FilledButton(
                style: FilledButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: isSubmitting
                    ? null
                    : () {
                        if (isLastStep) {
                          _submitReport(tableInfo);
                          return;
                        }

                        _goToNextStep();
                      },
                child: isSubmitting
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Text(isLastStep ? 'Submit report' : 'Continue'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _ensureParticipantsInitialized(MatchScheduleInfo tableInfo) {
    if (_didInitializeParticipants) {
      return;
    }

    _didInitializeParticipants = true;
    _matchStartedAt = tableInfo.matchSchedule.attemptedAt.toLocal();
    _matchEstimatedDuration = const Duration(hours: 1);
    _hasEditedMatchDuration = false;

    for (final playerSnapshot in tableInfo.players) {
      final playerId = playerSnapshot.playerData.id;
      if (playerId == null) {
        continue;
      }

      final participant = _ParticipantDraft.registered(
        key: 'p-$playerId',
        playerDataId: playerId,
        displayName: playerSnapshot.playerData.displayName,
      );
      _participants.add(participant);
      _controllerFor(participant.key);
    }
  }

  List<_ParticipantDraft> get _selectedParticipants {
    return _participants.where((participant) => participant.isPresent).toList();
  }

  Future<void> _goToNextStep() async {
    final validationError = _validationErrorForCurrentStep();
    if (validationError != null) {
      await showErrorDialog(
        context,
        title: validationError.title,
        description: validationError.description,
      );
      return;
    }

    if (_currentStep == _RegisterMatchStep.matchStartedAt &&
        !_hasEditedMatchDuration) {
      final confirmDefaultDuration = await showDialog<bool>(
        context: context,
        builder: (dialogContext) {
          return AlertDialog(
            title: const Text('Keep default duration?'),
            content: const Text(
              'You kept the default duration of 1 hour. Do you want to continue with it?',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(false),
                child: const Text('Edit'),
              ),
              FilledButton(
                onPressed: () => Navigator.of(dialogContext).pop(true),
                child: const Text('Continue'),
              ),
            ],
          );
        },
      );

      if (confirmDefaultDuration != true) {
        return;
      }
    }

    setState(() {
      _currentStep = _RegisterMatchStep.values[_currentStep.index + 1];
    });
  }

  RootHubException? _validationErrorForCurrentStep() {
    switch (_currentStep) {
      case _RegisterMatchStep.participants:
        final selectedCount = _selectedParticipants.length;
        if (selectedCount < 2) {
          return RootHubException(
            title: 'Not enough players',
            description:
                'Select at least 2 participants (registered and/or anonymous) to continue.',
          );
        }
        return null;
      case _RegisterMatchStep.factions:
        final selectedParticipants = _selectedParticipants;
        for (final participant in selectedParticipants) {
          if (participant.faction == null) {
            return RootHubException(
              title: 'Faction missing',
              description:
                  'Select a faction for ${participant.displayName} before continuing.',
            );
          }
        }

        final uniqueNonVagabondFactions = <Faction>{};
        var vagabondCount = 0;
        for (final participant in selectedParticipants) {
          final faction = participant.faction!;
          if (faction == Faction.vagabond) {
            vagabondCount++;
            continue;
          }

          if (!uniqueNonVagabondFactions.add(faction)) {
            return RootHubException(
              title: 'Invalid faction setup',
              description:
                  '${faction.displayName} was selected more than once. Only Vagabond can repeat.',
            );
          }
        }

        if (vagabondCount > 2) {
          return RootHubException(
            title: 'Invalid faction setup',
            description: 'At most 2 players can use Vagabond.',
          );
        }

        return null;
      case _RegisterMatchStep.winner:
        if (_winnerParticipantKey == null) {
          return RootHubException(
            title: 'Winner missing',
            description: 'Select the winner before continuing.',
          );
        }

        final winnerStillSelected = _selectedParticipants.any(
          (participant) => participant.key == _winnerParticipantKey,
        );
        if (!winnerStillSelected) {
          return RootHubException(
            title: 'Winner missing',
            description:
                'The selected winner is no longer in the participant list.',
          );
        }
        return null;
      case _RegisterMatchStep.points:
        final winnerKey = _winnerParticipantKey;
        final winnerType = _winnerType;
        if (winnerKey == null) {
          return RootHubException(
            title: 'Winner missing',
            description: 'Select the winner before continuing.',
          );
        }
        if (winnerType == null) {
          return RootHubException(
            title: 'Winner method missing',
            description: 'Select how the winner won before continuing.',
          );
        }

        for (final participant in _selectedParticipants) {
          final isWinner = participant.key == winnerKey;
          if (isWinner) {
            if (winnerType == _WinnerType.points) {
              continue;
            }
            if (winnerType == _WinnerType.dominance) {
              continue;
            }
          } else if (participant.scoreMode ==
              _ParticipantScoreMode.failedDominance) {
            continue;
          } else {
            final rawPoints = _controllerFor(participant.key).text.trim();
            final parsedPoints = int.tryParse(rawPoints);
            if (parsedPoints == null) {
              return RootHubException(
                title: 'Points missing',
                description:
                    'Enter valid points for ${participant.displayName}, or mark failed dominance.',
              );
            }

            if (parsedPoints < 0 || parsedPoints > 29) {
              return RootHubException(
                title: 'Invalid points',
                description:
                    '${participant.displayName} must have points between 0 and 29.',
              );
            }
          }
        }

        return null;
      case _RegisterMatchStep.matchStartedAt:
        final matchStartedAt = _matchStartedAt;
        if (matchStartedAt == null) {
          return RootHubException(
            title: 'Match start missing',
            description: 'Select when this match started.',
          );
        }
        if (matchStartedAt.isAfter(DateTime.now())) {
          return RootHubException(
            title: 'Invalid match registration',
            description: 'Match start time cannot be in the future.',
          );
        }
        if (_matchEstimatedDuration <= Duration.zero) {
          return RootHubException(
            title: 'Invalid duration',
            description: 'Match duration must be greater than zero.',
          );
        }
        if (_matchEstimatedDuration > const Duration(hours: 8)) {
          return RootHubException(
            title: 'Invalid duration',
            description: 'Match duration must be at most 8 hours.',
          );
        }
        return null;
      case _RegisterMatchStep.groupPhoto:
        if (_groupPhoto == null) {
          return RootHubException(
            title: 'Group photo required',
            description: 'Add the group selfie before continuing.',
          );
        }
        return null;
      case _RegisterMatchStep.boardPhoto:
        if (_boardPhoto == null) {
          return RootHubException(
            title: 'Board photo required',
            description: 'Add the board photo before continuing.',
          );
        }
        return null;
      case _RegisterMatchStep.review:
        return null;
    }
  }

  Future<void> _submitReport(MatchScheduleInfo tableInfo) async {
    final validationError = _validationErrorForCurrentStep();
    if (validationError != null) {
      await showErrorDialog(
        context,
        title: validationError.title,
        description: validationError.description,
      );
      return;
    }

    final winnerKey = _winnerParticipantKey;
    final winnerType = _winnerType;
    final matchStartedAt = _matchStartedAt;
    final groupPhoto = _groupPhoto;
    final boardPhoto = _boardPhoto;

    if (winnerKey == null ||
        winnerType == null ||
        matchStartedAt == null ||
        groupPhoto == null ||
        boardPhoto == null) {
      await showErrorDialog(
        context,
        title: 'Incomplete report',
        description: 'Complete all report steps before submitting.',
      );
      return;
    }

    final players = _selectedParticipants.map(
      (participant) {
        final isWinner = participant.key == winnerKey;
        final points = _scoreValueForParticipant(participant);

        return RegisterMatchPlayerReportInput(
          playerDataId: participant.playerDataId,
          anonymousPlayerId: participant.anonymousPlayerId,
          factionUsedInMatch: participant.faction!,
          didWin: isWinner,
          scoreInMatch: points,
        );
      },
    ).toList();

    final submitError = await ref
        .read(registerMatchProvider.notifier)
        .submitMatchReport(
          scheduledMatch: tableInfo.matchSchedule,
          players: players,
          matchStartedAt: matchStartedAt,
          matchEstimatedDuration: _matchEstimatedDuration,
          groupPhotoBytes: groupPhoto.bytes,
          groupPhotoFileName: groupPhoto.fileName,
          groupPhotoContentType: groupPhoto.contentType,
          boardPhotoBytes: boardPhoto.bytes,
          boardPhotoFileName: boardPhoto.fileName,
          boardPhotoContentType: boardPhoto.contentType,
        );

    if (!mounted) {
      return;
    }

    if (submitError != null) {
      await showErrorDialog(
        context,
        title: submitError.title,
        description: submitError.description,
      );
      return;
    }

    Navigator.of(context).pop(true);
  }

  void _onWinnerSelected(String winnerKey) {
    final previousWinnerKey = _winnerParticipantKey;
    final hasWinnerChanged = previousWinnerKey != winnerKey;

    setState(() {
      _winnerParticipantKey = winnerKey;
      if (!hasWinnerChanged) {
        return;
      }

      _winnerType = null;
      if (previousWinnerKey != null) {
        _controllerFor(previousWinnerKey).clear();
      }
      _controllerFor(winnerKey).clear();
    });
  }

  void _onWinnerTypeChanged(_WinnerType winnerType) {
    setState(() {
      _winnerType = winnerType;
      if (_winnerParticipantKey case final winnerKey?) {
        if (winnerType == _WinnerType.dominance) {
          _controllerFor(winnerKey).clear();
        } else {
          _controllerFor(winnerKey).text = '30';
        }
      }
    });
  }

  bool _isWinner(_ParticipantDraft participant) {
    return participant.key == _winnerParticipantKey;
  }

  int? _scoreValueForParticipant(_ParticipantDraft participant) {
    final isWinner = _isWinner(participant);
    if (isWinner) {
      if (_winnerType == _WinnerType.points) {
        return 30;
      }
      return null;
    }

    if (participant.scoreMode == _ParticipantScoreMode.failedDominance) {
      return null;
    }

    return int.tryParse(_controllerFor(participant.key).text.trim());
  }

  String _scoreLabelForParticipant(_ParticipantDraft participant) {
    final isWinner = _isWinner(participant);
    if (isWinner && _winnerType == _WinnerType.dominance) {
      return 'Dominance winner';
    }
    if (isWinner && _winnerType == _WinnerType.points) {
      return '30 • Winner';
    }

    if (participant.scoreMode == _ParticipantScoreMode.failedDominance) {
      return 'Failed dominance';
    }

    final scoreValue = _scoreValueForParticipant(participant);
    return scoreValue == null ? '-' : '$scoreValue';
  }

  List<_ParticipantDraft> _rankedParticipantsForReview() {
    final rankedParticipants = [..._selectedParticipants];
    rankedParticipants.sort((a, b) {
      final aIsWinner = _isWinner(a);
      final bIsWinner = _isWinner(b);
      if (aIsWinner != bIsWinner) {
        return aIsWinner ? -1 : 1;
      }

      final aScore = _scoreValueForParticipant(a);
      final bScore = _scoreValueForParticipant(b);

      final aDominanceLoser = !aIsWinner && aScore == null;
      final bDominanceLoser = !bIsWinner && bScore == null;
      if (aDominanceLoser != bDominanceLoser) {
        return aDominanceLoser ? 1 : -1;
      }

      if (aScore != null && bScore != null && aScore != bScore) {
        return bScore.compareTo(aScore);
      }

      return a.displayName.toLowerCase().compareTo(b.displayName.toLowerCase());
    });
    return rankedParticipants;
  }

  Widget _buildReviewPhotoTile(
    BuildContext context, {
    required String title,
    required _ProofImageSelection? image,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [
            colorScheme.primary.withValues(alpha: 0.35),
            colorScheme.secondary.withValues(alpha: 0.28),
          ],
        ),
      ),
      padding: const EdgeInsets.all(1.5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Container(
          color: colorScheme.surface,
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: SizedBox(
                  width: 96,
                  height: 96,
                  child: image == null
                      ? DecoratedBox(
                          decoration: BoxDecoration(
                            color: colorScheme.surfaceContainerHighest,
                          ),
                          child: Icon(
                            Icons.image_outlined,
                            color: colorScheme.onSurfaceVariant,
                          ),
                        )
                      : Image.memory(
                          image.bytes,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Text(
                image == null ? 'Missing' : 'Ready',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w900,
                  color: image == null
                      ? colorScheme.error
                      : colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pickProofImage({
    required bool isGroupPhoto,
  }) async {
    if (isGroupPhoto) {
      await showDialog<void>(
        context: context,
        builder: (dialogContext) {
          return AlertDialog(
            title: const Text('Group selfie proof'),
            content: const Text(
              'Take a selfie with everyone at the table. If possible, include the board in the same photo.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(),
                child: const Text('Ok'),
              ),
            ],
          );
        },
      );
    }

    final source = await _pickImageSource();
    if (!mounted || source == null) {
      return;
    }

    XFile? pickedImage;
    try {
      pickedImage = await _imagePicker.pickImage(
        source: source,
        maxWidth: 2200,
        maxHeight: 2200,
        imageQuality: 92,
        requestFullMetadata: false,
      );
    } catch (_) {
      if (!mounted) {
        return;
      }

      await showErrorDialog(
        context,
        title: 'Unable to access camera or gallery',
        description:
            'Allow camera and photo permissions in system settings and try again.',
      );
      return;
    }

    if (pickedImage == null) {
      return;
    }

    final bytes = await pickedImage.readAsBytes();
    if (!mounted) {
      return;
    }

    if (bytes.isEmpty) {
      await showErrorDialog(
        context,
        title: 'Invalid image',
        description: 'Selected image is empty. Choose another image.',
      );
      return;
    }

    final selectedImage = _ProofImageSelection(
      bytes: bytes,
      fileName: pickedImage.name.isEmpty
          ? (isGroupPhoto ? 'group-photo.jpg' : 'board-photo.jpg')
          : pickedImage.name,
      contentType: pickedImage.mimeType,
    );

    setState(() {
      if (isGroupPhoto) {
        _groupPhoto = selectedImage;
      } else {
        _boardPhoto = selectedImage;
      }
    });
  }

  Future<ImageSource?> _pickImageSource() async {
    final platform = Theme.of(context).platform;
    if (platform == TargetPlatform.iOS) {
      return showCupertinoModalPopup<ImageSource>(
        context: context,
        builder: (dialogContext) {
          return CupertinoActionSheet(
            title: const Text('Select source'),
            actions: [
              CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.of(dialogContext).pop(ImageSource.camera);
                },
                child: const Text('Camera'),
              ),
              CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.of(dialogContext).pop(ImageSource.gallery);
                },
                child: const Text('Gallery'),
              ),
            ],
            cancelButton: CupertinoActionSheetAction(
              isDestructiveAction: true,
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
              child: const Text('Cancel'),
            ),
          );
        },
      );
    }

    return showModalBottomSheet<ImageSource>(
      context: context,
      showDragHandle: true,
      builder: (dialogContext) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.photo_camera_rounded),
                title: const Text('Camera'),
                onTap: () {
                  Navigator.of(dialogContext).pop(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library_rounded),
                title: const Text('Gallery'),
                onTap: () {
                  Navigator.of(dialogContext).pop(ImageSource.gallery);
                },
              ),
              const SizedBox(height: 4),
            ],
          ),
        );
      },
    );
  }

  Future<void> _openAnonymousPlayerSheet() async {
    final selectedAnonymousPlayer =
        await RegisterMatchAddAnonymousPlayerSheet.show(
          context,
          activeAnonymousPlayerIds: _participants
              .where((participant) => participant.isPresent)
              .map((participant) => participant.anonymousPlayerId)
              .whereType<int>()
              .toSet(),
        );

    if (selectedAnonymousPlayer == null || !mounted) {
      return;
    }

    _addAnonymousPlayerToParticipants(selectedAnonymousPlayer);
  }

  Future<void> _openRegisteredPlayerSheet() async {
    final selectedRegisteredPlayer =
        await RegisterMatchSearchRegisteredPlayerSheet.show(
          context,
          activeRegisteredPlayerIds: _participants
              .where((participant) => participant.isPresent)
              .map((participant) => participant.playerDataId)
              .whereType<int>()
              .toSet(),
        );

    if (selectedRegisteredPlayer == null || !mounted) {
      return;
    }

    _addRegisteredPlayerToParticipants(selectedRegisteredPlayer);
  }

  void _addAnonymousPlayerToParticipants(AnonymousPlayer anonymousPlayer) {
    final anonymousPlayerId = anonymousPlayer.id;
    if (anonymousPlayerId == null) {
      return;
    }

    final participantKey = 'a-$anonymousPlayerId';
    final existingParticipantIndex = _participants.indexWhere(
      (participant) => participant.key == participantKey,
    );

    setState(() {
      if (existingParticipantIndex >= 0) {
        _participants[existingParticipantIndex].isPresent = true;
        return;
      }

      final participant = _ParticipantDraft.anonymous(
        key: participantKey,
        anonymousPlayerId: anonymousPlayerId,
        displayName: _anonymousPlayerName(anonymousPlayer),
      );
      _participants.add(participant);
      _controllerFor(participant.key);
    });
  }

  void _addRegisteredPlayerToParticipants(
    RegisteredPlayerSearchResult registeredPlayer,
  ) {
    final participantKey = 'p-${registeredPlayer.playerDataId}';
    final existingParticipantIndex = _participants.indexWhere(
      (participant) => participant.key == participantKey,
    );

    setState(() {
      if (existingParticipantIndex >= 0) {
        _participants[existingParticipantIndex].isPresent = true;
        return;
      }

      final participant = _ParticipantDraft.registered(
        key: participantKey,
        playerDataId: registeredPlayer.playerDataId,
        displayName: registeredPlayer.displayName,
      );
      _participants.add(participant);
      _controllerFor(participant.key);
    });
  }

  String _anonymousPlayerName(AnonymousPlayer anonymousPlayer) {
    final firstName = anonymousPlayer.firstName.trim();
    final lastName = anonymousPlayer.lastName.trim();
    final combinedName = '$firstName $lastName'.trim();

    if (combinedName.isNotEmpty) {
      return combinedName;
    }

    return 'Anonymous Player';
  }

  TextEditingController _controllerFor(String key) {
    final existingController = _scoreControllers[key];
    if (existingController != null) {
      return existingController;
    }

    final newController = TextEditingController();
    _scoreControllers[key] = newController;
    return newController;
  }
}

class _ParticipantDraft {
  _ParticipantDraft._({
    required this.key,
    required this.playerDataId,
    required this.anonymousPlayerId,
    required this.displayName,
    required this.isAnonymous,
  });

  factory _ParticipantDraft.registered({
    required String key,
    required int playerDataId,
    required String displayName,
  }) {
    return _ParticipantDraft._(
      key: key,
      playerDataId: playerDataId,
      anonymousPlayerId: null,
      displayName: displayName,
      isAnonymous: false,
    );
  }

  factory _ParticipantDraft.anonymous({
    required String key,
    required int anonymousPlayerId,
    required String displayName,
  }) {
    return _ParticipantDraft._(
      key: key,
      playerDataId: null,
      anonymousPlayerId: anonymousPlayerId,
      displayName: displayName,
      isAnonymous: true,
    );
  }

  final String key;
  final int? playerDataId;
  final int? anonymousPlayerId;
  final String displayName;
  final bool isAnonymous;

  bool isPresent = true;
  Faction? faction;
  _ParticipantScoreMode scoreMode = _ParticipantScoreMode.points;
}

enum _ParticipantScoreMode {
  points,
  failedDominance,
}

class _ProofImageSelection {
  const _ProofImageSelection({
    required this.bytes,
    required this.fileName,
    required this.contentType,
  });

  final Uint8List bytes;
  final String fileName;
  final String? contentType;
}
