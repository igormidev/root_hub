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
import 'package:root_hub_flutter/i18n/strings.g.dart';

part 'register_match_wizard_bottom_actions_section.dart';
part 'register_match_wizard_error_section.dart';
part 'register_match_wizard_faction_avatar_section.dart';
part 'register_match_wizard_factions_step_section.dart';
part 'register_match_wizard_loading_section.dart';
part 'register_match_wizard_participants_step_section.dart';
part 'register_match_wizard_points_step_section.dart';
part 'register_match_wizard_proof_card_section.dart';
part 'register_match_wizard_review_photo_tile.dart';
part 'register_match_wizard_review_step_section.dart';
part 'register_match_wizard_score_summary_section.dart';
part 'register_match_wizard_social_proof_step_section.dart';
part 'register_match_wizard_step_dots_section.dart';
part 'register_match_wizard_timing_step_section.dart';
part 'register_match_wizard_top_bar_section.dart';
part 'register_match_wizard_winner_step_section.dart';

enum _RegisterMatchStep {
  participants,
  factions,
  winner,
  points,
  matchStartedAt,
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
  _WinnerType? _winnerType;
  DateTime? _matchStartedAt;
  Duration _matchEstimatedDuration = Duration(hours: 1);
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
          title: t.register_match.ui_sheets_register_match_wizard_sheet.l86c18,
          description:
              t.register_match.ui_sheets_register_match_wizard_sheet.l87c24,
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
              return _RegisterMatchWizardLoadingSection();
            }

            if (snapshot.hasError) {
              final error = snapshot.error is RootHubException
                  ? snapshot.error! as RootHubException
                  : defaultException;
              return _RegisterMatchWizardErrorSection(error: error);
            }

            final tableInfo = snapshot.data;
            if (tableInfo == null) {
              return _RegisterMatchWizardErrorSection(
                error: RootHubException(
                  title: t
                      .register_match
                      .ui_sheets_register_match_wizard_sheet
                      .l140c26,
                  description: t
                      .register_match
                      .ui_sheets_register_match_wizard_sheet
                      .l141c32,
                ),
              );
            }

            _ensureParticipantsInitialized(tableInfo);
            final selectedParticipants = _selectedParticipants;
            final localizations = MaterialLocalizations.of(context);
            final reviewMatchStartedAt =
                _matchStartedAt ??
                tableInfo.matchSchedule.attemptedAt.toLocal();
            final reviewMatchStartedLabel =
                '${localizations.formatMediumDate(reviewMatchStartedAt)} • ${localizations.formatTimeOfDay(TimeOfDay.fromDateTime(reviewMatchStartedAt))}';

            final currentStepContent = switch (_currentStep) {
              _RegisterMatchStep.participants =>
                _RegisterMatchWizardParticipantsStepSection(
                  participants: _participants,
                  onParticipantPresenceChanged: _onParticipantPresenceChanged,
                  onAddAnonymousPlayer: _openAnonymousPlayerSheet,
                  onAddRegisteredPlayer: _openRegisteredPlayerSheet,
                ),
              _RegisterMatchStep.factions =>
                _RegisterMatchWizardFactionsStepSection(
                  selectedParticipants: selectedParticipants,
                  availableFactionsForParticipant:
                      _availableFactionsForParticipant,
                  onFactionChanged: _onParticipantFactionChanged,
                ),
              _RegisterMatchStep.winner =>
                _RegisterMatchWizardWinnerStepSection(
                  stepNumber: _stepNumber(_RegisterMatchStep.winner),
                  selectedParticipants: selectedParticipants,
                  winnerParticipantKey: _winnerParticipantKey,
                  winnerType: _winnerType,
                  onWinnerSelected: _onWinnerSelected,
                  onWinnerTypeChanged: _onWinnerTypeChanged,
                ),
              _RegisterMatchStep.points =>
                _RegisterMatchWizardPointsStepSection(
                  stepNumber: _stepNumber(_RegisterMatchStep.points),
                  selectedParticipants: selectedParticipants,
                  winnerParticipantKey: _winnerParticipantKey,
                  winnerType: _winnerType,
                  controllerFor: _controllerFor,
                  onParticipantScoreModeChanged: _onParticipantScoreModeChanged,
                  onAnyScoreChanged: _onAnyScoreChanged,
                ),
              _RegisterMatchStep.matchStartedAt =>
                _RegisterMatchWizardTimingStepSection(
                  startedStepNumber: _stepNumber(
                    _RegisterMatchStep.matchStartedAt,
                  ),
                  durationStepNumber:
                      _stepNumber(_RegisterMatchStep.matchStartedAt) + 1,
                  matchStartedAt:
                      _matchStartedAt ??
                      tableInfo.matchSchedule.attemptedAt.toLocal(),
                  matchEstimatedDuration: _matchEstimatedDuration,
                  durationLabel: _durationLabel(_matchEstimatedDuration),
                  onPickMatchStartedDate: () {
                    _pickMatchStartedDate(
                      tableInfo.matchSchedule.attemptedAt.toLocal(),
                    );
                  },
                  onPickMatchStartedTime: () {
                    _pickMatchStartedTime(
                      tableInfo.matchSchedule.attemptedAt.toLocal(),
                    );
                  },
                  onDecreaseDuration:
                      _matchEstimatedDuration > Duration(minutes: 15)
                      ? _decreaseMatchEstimatedDuration
                      : null,
                  onIncreaseDuration:
                      _matchEstimatedDuration < Duration(hours: 8)
                      ? _increaseMatchEstimatedDuration
                      : null,
                ),
              _RegisterMatchStep.socialProof =>
                _RegisterMatchWizardSocialProofStepSection(
                  stepNumber: _stepNumber(_RegisterMatchStep.socialProof),
                  groupPhoto: _groupPhoto,
                  boardPhoto: _boardPhoto,
                  onPickGroupPhoto: () {
                    _pickProofImage(isGroupPhoto: true);
                  },
                  onPickBoardPhoto: () {
                    _pickProofImage(isGroupPhoto: false);
                  },
                ),
              _RegisterMatchStep.review =>
                _RegisterMatchWizardReviewStepSection(
                  stepNumber: _stepNumber(_RegisterMatchStep.review),
                  matchTitle: tableInfo.matchSchedule.title,
                  matchStartedLabel: reviewMatchStartedLabel,
                  estimatedDurationLabel: _durationLabel(
                    _matchEstimatedDuration,
                  ),
                  winnerMethodLabel: _winnerType == _WinnerType.points
                      ? 'Total points (30)'
                      : 'Dominance',
                  rankedParticipants: _rankedParticipantsForReview(),
                  scoreLabelForParticipant: _scoreLabelForParticipant,
                  groupPhoto: _groupPhoto,
                  boardPhoto: _boardPhoto,
                ),
            };

            return Column(
              children: [
                _RegisterMatchWizardTopBarSection(
                  tableInfo: tableInfo,
                  stepBadgeLabel: _stepBadgeLabel(),
                ),
                _RegisterMatchWizardStepDotsSection(
                  currentStepIndex: _currentStep.index,
                  totalSteps: _RegisterMatchStep.values.length,
                  onStepTap: _onStepDotTapped,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
                    child: AnimatedSwitcher(
                      duration: Duration(milliseconds: 280),
                      switchInCurve: Curves.easeOutCubic,
                      switchOutCurve: Curves.easeInCubic,
                      transitionBuilder: (child, animation) {
                        final offsetAnimation = Tween<Offset>(
                          begin: Offset(0.05, 0),
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
                        child: currentStepContent,
                      ),
                    ),
                  ),
                ),
                _RegisterMatchWizardBottomActionsSection(
                  isSubmitting: registerState.isSubmitting,
                  isFirstStep: _currentStep == _RegisterMatchStep.participants,
                  isLastStep: _currentStep == _RegisterMatchStep.review,
                  onBackOrCancel: _onBackOrCancelPressed,
                  onContinueOrSubmit: () {
                    _onContinueOrSubmitPressed(tableInfo);
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _onStepDotTapped(int index) {
    if (index > _currentStep.index) {
      return;
    }

    setState(() {
      _currentStep = _RegisterMatchStep.values[index];
    });
  }

  void _onBackOrCancelPressed() {
    if (_currentStep == _RegisterMatchStep.participants) {
      Navigator.of(context).pop(false);
      return;
    }

    setState(() {
      _currentStep = _RegisterMatchStep.values[_currentStep.index - 1];
    });
  }

  void _onContinueOrSubmitPressed(MatchScheduleInfo tableInfo) {
    if (_currentStep == _RegisterMatchStep.review) {
      _submitReport(tableInfo);
      return;
    }

    _goToNextStep();
  }

  void _onParticipantPresenceChanged(
    _ParticipantDraft participant,
    bool isPresent,
  ) {
    setState(() {
      participant.isPresent = isPresent;
      if (!participant.isPresent && _winnerParticipantKey == participant.key) {
        _winnerParticipantKey = null;
        _winnerType = null;
        _controllerFor(participant.key).clear();
      }
    });
  }

  void _onParticipantFactionChanged(
    _ParticipantDraft participant,
    Faction? faction,
  ) {
    setState(() {
      participant.faction = faction;
    });
  }

  void _onParticipantScoreModeChanged(
    _ParticipantDraft participant,
    _ParticipantScoreMode mode,
  ) {
    setState(() {
      participant.scoreMode = mode;
      if (mode == _ParticipantScoreMode.failedDominance) {
        _controllerFor(participant.key).clear();
      }
    });
  }

  void _onAnyScoreChanged() {
    setState(() {});
  }

  void _decreaseMatchEstimatedDuration() {
    setState(() {
      _hasEditedMatchDuration = true;
      _matchEstimatedDuration -= Duration(minutes: 15);
    });
  }

  void _increaseMatchEstimatedDuration() {
    setState(() {
      _hasEditedMatchDuration = true;
      _matchEstimatedDuration += Duration(minutes: 15);
    });
  }

  int _stepNumber(_RegisterMatchStep step) {
    return switch (step) {
      _RegisterMatchStep.participants => 1,
      _RegisterMatchStep.factions => 2,
      _RegisterMatchStep.winner => 3,
      _RegisterMatchStep.points => 4,
      _RegisterMatchStep.matchStartedAt => 5,
      _RegisterMatchStep.socialProof => 7,
      _RegisterMatchStep.review => 8,
    };
  }

  String _stepBadgeLabel() {
    const totalSteps = 8;
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
    ).subtract(Duration(days: 1));
    final oneDayAheadFromSchedule = DateTime(
      scheduledStart.year,
      scheduledStart.month,
      scheduledStart.day,
    ).add(Duration(days: 1));
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
        title: t.register_match.ui_sheets_register_match_wizard_sheet.l469c16,
        description:
            t.register_match.ui_sheets_register_match_wizard_sheet.l470c22,
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
        title: t.register_match.ui_sheets_register_match_wizard_sheet.l504c16,
        description:
            t.register_match.ui_sheets_register_match_wizard_sheet.l505c22,
      );
      return;
    }

    setState(() {
      _matchStartedAt = selectedDateTime;
    });
  }

  void _ensureParticipantsInitialized(MatchScheduleInfo tableInfo) {
    if (_didInitializeParticipants) {
      return;
    }

    _didInitializeParticipants = true;
    _matchStartedAt = tableInfo.matchSchedule.attemptedAt.toLocal();
    _matchEstimatedDuration = Duration(hours: 1);
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

  List<Faction> _availableFactionsForParticipant(
    _ParticipantDraft participant,
    List<_ParticipantDraft> selectedParticipants,
  ) {
    final usedByOtherParticipants = selectedParticipants
        .where((otherParticipant) => otherParticipant.key != participant.key)
        .map((otherParticipant) => otherParticipant.faction)
        .whereType<Faction>()
        .toSet();

    return Faction.values.where((faction) {
      if (faction == participant.faction) {
        return true;
      }

      return !usedByOtherParticipants.contains(faction);
    }).toList();
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
            title: Text(
              t.register_match.ui_sheets_register_match_wizard_sheet.l581c31,
            ),
            content: Text(
              t.register_match.ui_sheets_register_match_wizard_sheet.l583c15,
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(false),
                child: Text(
                  t
                      .register_match
                      .ui_sheets_register_match_wizard_sheet
                      .l588c35,
                ),
              ),
              FilledButton(
                onPressed: () => Navigator.of(dialogContext).pop(true),
                child: Text(
                  t
                      .register_match
                      .ui_sheets_register_match_wizard_sheet
                      .l592c35,
                ),
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
            title:
                t.register_match.ui_sheets_register_match_wizard_sheet.l615c20,
            description:
                t.register_match.ui_sheets_register_match_wizard_sheet.l617c17,
          );
        }
        return null;
      case _RegisterMatchStep.factions:
        final selectedParticipants = _selectedParticipants;
        for (final participant in selectedParticipants) {
          if (participant.faction == null) {
            return RootHubException(
              title: t
                  .register_match
                  .ui_sheets_register_match_wizard_sheet
                  .l626c22,
              description:
                  'Select a faction for ${participant.displayName} before continuing.',
            );
          }
        }

        final uniqueFactions = <Faction>{};
        for (final participant in selectedParticipants) {
          final faction = participant.faction!;
          if (!uniqueFactions.add(faction)) {
            return RootHubException(
              title: t
                  .register_match
                  .ui_sheets_register_match_wizard_sheet
                  .l638c22,
              description:
                  '${faction.displayName} was selected more than once. Each faction can only be selected once.',
            );
          }
        }

        return null;
      case _RegisterMatchStep.winner:
        if (_winnerParticipantKey == null) {
          return RootHubException(
            title:
                t.register_match.ui_sheets_register_match_wizard_sheet.l649c20,
            description:
                t.register_match.ui_sheets_register_match_wizard_sheet.l650c26,
          );
        }

        final winnerStillSelected = _selectedParticipants.any(
          (participant) => participant.key == _winnerParticipantKey,
        );
        if (!winnerStillSelected) {
          return RootHubException(
            title:
                t.register_match.ui_sheets_register_match_wizard_sheet.l659c20,
            description:
                t.register_match.ui_sheets_register_match_wizard_sheet.l661c17,
          );
        }
        return null;
      case _RegisterMatchStep.points:
        final winnerKey = _winnerParticipantKey;
        final winnerType = _winnerType;
        if (winnerKey == null) {
          return RootHubException(
            title:
                t.register_match.ui_sheets_register_match_wizard_sheet.l670c20,
            description:
                t.register_match.ui_sheets_register_match_wizard_sheet.l671c26,
          );
        }
        if (winnerType == null) {
          return RootHubException(
            title:
                t.register_match.ui_sheets_register_match_wizard_sheet.l676c20,
            description:
                t.register_match.ui_sheets_register_match_wizard_sheet.l677c26,
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
                title: t
                    .register_match
                    .ui_sheets_register_match_wizard_sheet
                    .l698c24,
                description:
                    'Enter valid points for ${participant.displayName}, or mark failed dominance.',
              );
            }

            if (parsedPoints < 0 || parsedPoints > 29) {
              return RootHubException(
                title: t
                    .register_match
                    .ui_sheets_register_match_wizard_sheet
                    .l706c24,
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
            title:
                t.register_match.ui_sheets_register_match_wizard_sheet.l719c20,
            description:
                t.register_match.ui_sheets_register_match_wizard_sheet.l720c26,
          );
        }
        if (matchStartedAt.isAfter(DateTime.now())) {
          return RootHubException(
            title:
                t.register_match.ui_sheets_register_match_wizard_sheet.l725c20,
            description:
                t.register_match.ui_sheets_register_match_wizard_sheet.l726c26,
          );
        }
        if (_matchEstimatedDuration <= Duration.zero) {
          return RootHubException(
            title:
                t.register_match.ui_sheets_register_match_wizard_sheet.l731c20,
            description:
                t.register_match.ui_sheets_register_match_wizard_sheet.l732c26,
          );
        }
        if (_matchEstimatedDuration > Duration(hours: 8)) {
          return RootHubException(
            title:
                t.register_match.ui_sheets_register_match_wizard_sheet.l737c20,
            description:
                t.register_match.ui_sheets_register_match_wizard_sheet.l738c26,
          );
        }
        return null;
      case _RegisterMatchStep.socialProof:
        if (_groupPhoto == null) {
          return RootHubException(
            title:
                t.register_match.ui_sheets_register_match_wizard_sheet.l745c20,
            description:
                t.register_match.ui_sheets_register_match_wizard_sheet.l746c26,
          );
        }
        if (_boardPhoto == null) {
          return RootHubException(
            title:
                t.register_match.ui_sheets_register_match_wizard_sheet.l751c20,
            description:
                t.register_match.ui_sheets_register_match_wizard_sheet.l752c26,
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
        title: t.register_match.ui_sheets_register_match_wizard_sheet.l785c16,
        description:
            t.register_match.ui_sheets_register_match_wizard_sheet.l786c22,
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

  Future<void> _pickProofImage({
    required bool isGroupPhoto,
  }) async {
    if (isGroupPhoto) {
      await showDialog<void>(
        context: context,
        builder: (dialogContext) {
          return AlertDialog(
            title: Text(
              t.register_match.ui_sheets_register_match_wizard_sheet.l940c31,
            ),
            content: Text(
              t.register_match.ui_sheets_register_match_wizard_sheet.l942c15,
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(),
                child: Text(
                  t
                      .register_match
                      .ui_sheets_register_match_wizard_sheet
                      .l947c35,
                ),
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
        title: t.register_match.ui_sheets_register_match_wizard_sheet.l976c16,
        description:
            t.register_match.ui_sheets_register_match_wizard_sheet.l978c13,
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
        title: t.register_match.ui_sheets_register_match_wizard_sheet.l995c16,
        description:
            t.register_match.ui_sheets_register_match_wizard_sheet.l996c22,
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
            title: Text(
              t.register_match.ui_sheets_register_match_wizard_sheet.l1025c31,
            ),
            actions: [
              CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.of(dialogContext).pop(ImageSource.camera);
                },
                child: Text(
                  t
                      .register_match
                      .ui_sheets_register_match_wizard_sheet
                      .l1031c35,
                ),
              ),
              CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.of(dialogContext).pop(ImageSource.gallery);
                },
                child: Text(
                  t
                      .register_match
                      .ui_sheets_register_match_wizard_sheet
                      .l1037c35,
                ),
              ),
            ],
            cancelButton: CupertinoActionSheetAction(
              isDestructiveAction: true,
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
              child: Text(
                t.register_match.ui_sheets_register_match_wizard_sheet.l1045c33,
              ),
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
                leading: Icon(Icons.photo_camera_rounded),
                title: Text(
                  t
                      .register_match
                      .ui_sheets_register_match_wizard_sheet
                      .l1062c35,
                ),
                onTap: () {
                  Navigator.of(dialogContext).pop(ImageSource.camera);
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library_rounded),
                title: Text(
                  t
                      .register_match
                      .ui_sheets_register_match_wizard_sheet
                      .l1069c35,
                ),
                onTap: () {
                  Navigator.of(dialogContext).pop(ImageSource.gallery);
                },
              ),
              SizedBox(height: 4),
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
  _ProofImageSelection({
    required this.bytes,
    required this.fileName,
    required this.contentType,
  });

  final Uint8List bytes;
  final String fileName;
  final String? contentType;
}
