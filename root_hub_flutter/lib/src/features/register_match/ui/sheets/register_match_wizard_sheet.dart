import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/core/extension/faction_ui_extension.dart';
import 'package:root_hub_flutter/src/design_system/default_error_snackbar.dart';
import 'package:root_hub_flutter/src/states/match/match_tables_provider.dart';
import 'package:root_hub_flutter/src/states/register_match/register_match_provider.dart';
import 'package:root_hub_flutter/src/states/register_match/register_match_state.dart';

enum _RegisterMatchStep {
  participants,
  factions,
  winner,
  points,
  socialProof,
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
  _WinnerType _winnerType = _WinnerType.points;
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
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                    child: _buildCurrentStep(
                      context,
                      tableInfo,
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
              '${_currentStep.index + 1}/${_RegisterMatchStep.values.length}',
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

  Widget _buildCurrentStep(
    BuildContext context,
    MatchScheduleInfo tableInfo,
  ) {
    return switch (_currentStep) {
      _RegisterMatchStep.participants => _buildParticipantsStep(context),
      _RegisterMatchStep.factions => _buildFactionsStep(context),
      _RegisterMatchStep.winner => _buildWinnerStep(context),
      _RegisterMatchStep.points => _buildPointsStep(context),
      _RegisterMatchStep.socialProof => _buildSocialProofStep(context),
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
          'Select registered players who were present. Then add anonymous players when needed.',
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
            label: const Text('AddAnonymousPlayer'),
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
          '3) Select the winner',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Set who won and the victory type. ROOT supports points and dominance victory.',
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
            title: Text(
              participant.displayName,
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
            onTap: () {
              setState(() {
                _winnerParticipantKey = participant.key;
                if (_winnerType == _WinnerType.points) {
                  _controllerFor(participant.key).text = '30';
                }
              });
            },
          ),
        const SizedBox(height: 8),
        SegmentedButton<_WinnerType>(
          segments: const [
            ButtonSegment<_WinnerType>(
              value: _WinnerType.points,
              icon: Icon(Icons.stars_rounded),
              label: Text('Points (30)'),
            ),
            ButtonSegment<_WinnerType>(
              value: _WinnerType.dominance,
              icon: Icon(Icons.flag_rounded),
              label: Text('Dominance'),
            ),
          ],
          selected: {_winnerType},
          onSelectionChanged: (selection) {
            final nextWinnerType = selection.first;
            setState(() {
              _winnerType = nextWinnerType;
              if (_winnerParticipantKey case final winnerKey?) {
                if (nextWinnerType == _WinnerType.points) {
                  _controllerFor(winnerKey).text = '30';
                } else {
                  _controllerFor(winnerKey).text = '';
                }
              }
            });
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
          '4) Points by player',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          _winnerType == _WinnerType.dominance
              ? 'Winner score stays empty for dominance. Other players must have points between 0 and 29.'
              : 'Winner score is fixed at 30 points. Other players must stay between 0 and 29.',
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
            child: TextField(
              controller: _controllerFor(participant.key),
              enabled:
                  !_isDominanceWinner(participant) &&
                  !_isPointsWinner(participant),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(2),
              ],
              decoration: InputDecoration(
                labelText: participant.displayName,
                hintText: _isDominanceWinner(participant)
                    ? 'Dominance victory'
                    : _isPointsWinner(participant)
                    ? '30'
                    : '0 to 29',
                border: const OutlineInputBorder(),
                helperText: _isDominanceWinner(participant)
                    ? 'Winner by dominance'
                    : _isPointsWinner(participant)
                    ? 'Winner by points (30)'
                    : null,
              ),
              onChanged: (_) {
                setState(() {});
              },
            ),
          ),
      ],
    );
  }

  Widget _buildSocialProofStep(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '5) Social proof',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Upload 2 photos: one group selfie and one board photo with score track visible.',
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
        const SizedBox(height: 12),
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

  Widget _buildReviewStep(
    BuildContext context,
    MatchScheduleInfo tableInfo,
  ) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '6) Review and submit',
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
        const SizedBox(height: 14),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: colorScheme.outlineVariant),
            color: colorScheme.surfaceContainerLow,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tableInfo.matchSchedule.title,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 6),
              for (final participant in _selectedParticipants)
                Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Text(
                    _reviewLineForParticipant(participant),
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              const SizedBox(height: 6),
              Text(
                'Winner method: ${_winnerType == _WinnerType.points ? 'Points (30)' : 'Dominance'}',
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                'Group photo: ${_groupPhoto != null ? 'Attached' : 'Missing'}',
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'Board photo: ${_boardPhoto != null ? 'Attached' : 'Missing'}',
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
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
            child: OutlinedButton(
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
          const SizedBox(width: 10),
          Expanded(
            child: FilledButton(
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
        ],
      ),
    );
  }

  void _ensureParticipantsInitialized(MatchScheduleInfo tableInfo) {
    if (_didInitializeParticipants) {
      return;
    }

    _didInitializeParticipants = true;

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
            description: 'Select at least 2 participants to continue.',
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

        if (_winnerParticipantKey case final winnerKey?) {
          if (_winnerType == _WinnerType.points) {
            _controllerFor(winnerKey).text = '30';
          } else {
            _controllerFor(winnerKey).text = '';
          }
        }

        return null;
      case _RegisterMatchStep.points:
        final winnerKey = _winnerParticipantKey;
        if (winnerKey == null) {
          return RootHubException(
            title: 'Winner missing',
            description: 'Select the winner before setting points.',
          );
        }

        for (final participant in _selectedParticipants) {
          final isWinner = participant.key == winnerKey;
          if (_winnerType == _WinnerType.dominance && isWinner) {
            continue;
          }

          final rawPoints = _controllerFor(participant.key).text.trim();
          final parsedPoints = int.tryParse(rawPoints);
          if (parsedPoints == null) {
            return RootHubException(
              title: 'Points missing',
              description: 'Enter valid points for ${participant.displayName}.',
            );
          }

          if (parsedPoints < 0 || parsedPoints > 30) {
            return RootHubException(
              title: 'Invalid points',
              description:
                  '${participant.displayName} must have points between 0 and 30.',
            );
          }

          if (isWinner &&
              _winnerType == _WinnerType.points &&
              parsedPoints != 30) {
            return RootHubException(
              title: 'Invalid winner score',
              description: 'Winner by points must have exactly 30 points.',
            );
          }

          if (!isWinner && parsedPoints == 30) {
            return RootHubException(
              title: 'Invalid non-winner score',
              description: 'Only the winner can have 30 points.',
            );
          }
        }

        return null;
      case _RegisterMatchStep.socialProof:
        if (_groupPhoto == null || _boardPhoto == null) {
          return RootHubException(
            title: 'Proof photos required',
            description: 'Add both group and board photos before continuing.',
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
    final groupPhoto = _groupPhoto;
    final boardPhoto = _boardPhoto;

    if (winnerKey == null || groupPhoto == null || boardPhoto == null) {
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
        final points = _winnerType == _WinnerType.dominance && isWinner
            ? null
            : int.tryParse(_controllerFor(participant.key).text.trim());

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

  String _reviewLineForParticipant(_ParticipantDraft participant) {
    final isWinner = participant.key == _winnerParticipantKey;
    final score = _winnerType == _WinnerType.dominance && isWinner
        ? 'Dominance victory'
        : _controllerFor(participant.key).text.trim();
    final winnerSuffix = isWinner ? ' • Winner' : '';
    final factionName = participant.faction?.displayName ?? 'No faction';
    final points = score.isEmpty ? '-' : score;

    return '${participant.displayName} • $factionName • $points$winnerSuffix';
  }

  bool _isDominanceWinner(_ParticipantDraft participant) {
    return _winnerType == _WinnerType.dominance &&
        participant.key == _winnerParticipantKey;
  }

  bool _isPointsWinner(_ParticipantDraft participant) {
    return _winnerType == _WinnerType.points &&
        participant.key == _winnerParticipantKey;
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
    await ref
        .read(registerMatchProvider.notifier)
        .ensureAnonymousPlayersLoaded();

    if (!mounted) {
      return;
    }

    var anonymousPlayers = [
      ...ref.read(registerMatchProvider).anonymousPlayers,
    ];
    final nameController = TextEditingController();

    final selectedAnonymousPlayer = await showModalBottomSheet<AnonymousPlayer>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (sheetContext) {
        var isCreatingPlayer = false;

        return StatefulBuilder(
          builder: (sheetContext, setModalState) {
            Future<void> createAnonymousPlayer() async {
              final normalizedName = nameController.text.trim();
              if (normalizedName.isEmpty || isCreatingPlayer) {
                return;
              }

              setModalState(() {
                isCreatingPlayer = true;
              });

              final createdPlayer = await ref
                  .read(registerMatchProvider.notifier)
                  .createAnonymousPlayer(normalizedName);

              if (!mounted) {
                return;
              }

              setModalState(() {
                isCreatingPlayer = false;
              });

              if (createdPlayer == null) {
                final error = ref
                    .read(registerMatchProvider)
                    .anonymousPlayersError;
                await showErrorDialog(
                  context,
                  title: (error ?? defaultException).title,
                  description: (error ?? defaultException).description,
                );
                return;
              }

              anonymousPlayers = [
                createdPlayer,
                ...anonymousPlayers.where(
                  (entry) => entry.id != createdPlayer.id,
                ),
              ];
              if (!sheetContext.mounted) {
                return;
              }
              Navigator.of(sheetContext).pop(createdPlayer);
            }

            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.viewInsetsOf(sheetContext).bottom,
              ),
              child: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 6, 16, 8),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Anonymous players',
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.w900),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: nameController,
                              textInputAction: TextInputAction.done,
                              decoration: const InputDecoration(
                                labelText: 'Player name',
                                border: OutlineInputBorder(),
                              ),
                              onSubmitted: (_) {
                                createAnonymousPlayer();
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                          FilledButton(
                            onPressed: isCreatingPlayer
                                ? null
                                : () {
                                    createAnonymousPlayer();
                                  },
                            child: isCreatingPlayer
                                ? const SizedBox(
                                    width: 18,
                                    height: 18,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  )
                                : const Text('Create'),
                          ),
                        ],
                      ),
                    ),
                    if (anonymousPlayers.isEmpty)
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 2, 16, 20),
                        child: Text(
                          'No anonymous players yet. Create one using the field above.',
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurfaceVariant,
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                      )
                    else
                      Flexible(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: anonymousPlayers.length,
                          itemBuilder: (context, index) {
                            final anonymousPlayer = anonymousPlayers[index];
                            final alreadyAdded = _participants.any(
                              (participant) =>
                                  participant.anonymousPlayerId ==
                                      anonymousPlayer.id &&
                                  participant.isPresent,
                            );

                            return ListTile(
                              leading: const Icon(Icons.person_outline_rounded),
                              title: Text(
                                _anonymousPlayerName(anonymousPlayer),
                              ),
                              subtitle: Text(
                                alreadyAdded
                                    ? 'Already added to this report'
                                    : 'Tap to add',
                              ),
                              enabled: !alreadyAdded,
                              onTap: alreadyAdded
                                  ? null
                                  : () {
                                      Navigator.of(
                                        sheetContext,
                                      ).pop(anonymousPlayer);
                                    },
                            );
                          },
                        ),
                      ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            );
          },
        );
      },
    );

    nameController.dispose();

    if (selectedAnonymousPlayer == null || !mounted) {
      return;
    }

    final anonymousPlayerId = selectedAnonymousPlayer.id;
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
      } else {
        final participant = _ParticipantDraft.anonymous(
          key: participantKey,
          anonymousPlayerId: anonymousPlayerId,
          displayName: _anonymousPlayerName(selectedAnonymousPlayer),
        );
        _participants.add(participant);
        _controllerFor(participant.key);
      }
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
