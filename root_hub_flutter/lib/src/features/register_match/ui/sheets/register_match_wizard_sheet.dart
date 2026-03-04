import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
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
  static const int _maxProofImageBytes = 3 * 1024 * 1024;

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
          title: t
              .register_match
              .ui_sheets_register_match_wizard_sheet
              .invalidMatch,
          description: t
              .register_match
              .ui_sheets_register_match_wizard_sheet
              .unableToLoadThisMatchReportFlow2,
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
                      .matchNotFound,
                  description: t
                      .register_match
                      .ui_sheets_register_match_wizard_sheet
                      .unableToLoadThisMatchReportFlow,
                ),
              );
            }

            _ensureParticipantsInitialized(tableInfo);
            final selectedParticipants = _selectedParticipants;
            final localizations = MaterialLocalizations.of(context);
            final currentMatchStartedAt =
                _matchStartedAt ??
                tableInfo.matchSchedule.attemptedAt.toLocal();
            final reviewMatchStartedLabel =
                '${localizations.formatMediumDate(currentMatchStartedAt)} • ${localizations.formatTimeOfDay(TimeOfDay.fromDateTime(currentMatchStartedAt))}';

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
                  matchStartedAt: currentMatchStartedAt,
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
                  matchStartedAt: currentMatchStartedAt,
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
      helpText: t
          .register_match
          .ui_sheets_register_match_wizard_sheet
          .whenDidTheMatchStart,
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
        title: t
            .register_match
            .ui_sheets_register_match_wizard_sheet
            .invalidMatchRegistration3,
        description: t
            .register_match
            .ui_sheets_register_match_wizard_sheet
            .matchStartTimeCannotBeInTheFuture3,
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
      helpText: t
          .register_match
          .ui_sheets_register_match_wizard_sheet
          .selectStartTime,
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
        title: t
            .register_match
            .ui_sheets_register_match_wizard_sheet
            .invalidMatchRegistration2,
        description: t
            .register_match
            .ui_sheets_register_match_wizard_sheet
            .matchStartTimeCannotBeInTheFuture2,
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
              t
                  .register_match
                  .ui_sheets_register_match_wizard_sheet
                  .keepDefaultDuration,
            ),
            content: Text(
              t
                  .register_match
                  .ui_sheets_register_match_wizard_sheet
                  .youKeptTheDefaultDurationOf1HourDoYouWantToContinueWithIt,
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(false),
                child: Text(
                  t.register_match.ui_sheets_register_match_wizard_sheet.edit,
                ),
              ),
              FilledButton(
                onPressed: () => Navigator.of(dialogContext).pop(true),
                child: Text(
                  t
                      .register_match
                      .ui_sheets_register_match_wizard_sheet
                      .continueButton,
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
            title: t
                .register_match
                .ui_sheets_register_match_wizard_sheet
                .notEnoughPlayers,
            description: t
                .register_match
                .ui_sheets_register_match_wizard_sheet
                .selectAtLeast2ParticipantsRegisteredAndOrAnonymousToContinue,
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
                  .factionMissing,
              description: t
                  .register_match
                  .ui_sheets_register_match_wizard_sheet
                  .selectFactionForParticipantBeforeContinuing(
                    participantName: participant.displayName,
                  ),
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
                  .invalidFactionSetup,
              description: t
                  .register_match
                  .ui_sheets_register_match_wizard_sheet
                  .factionWasSelectedMoreThanOnceEachFactionCanOnlyBeSelectedOnce(
                    factionName: faction.displayName,
                  ),
            );
          }
        }

        return null;
      case _RegisterMatchStep.winner:
        if (_winnerParticipantKey == null) {
          return RootHubException(
            title: t
                .register_match
                .ui_sheets_register_match_wizard_sheet
                .winnerMissing3,
            description: t
                .register_match
                .ui_sheets_register_match_wizard_sheet
                .selectTheWinnerBeforeContinuing2,
          );
        }

        final winnerStillSelected = _selectedParticipants.any(
          (participant) => participant.key == _winnerParticipantKey,
        );
        if (!winnerStillSelected) {
          return RootHubException(
            title: t
                .register_match
                .ui_sheets_register_match_wizard_sheet
                .winnerMissing2,
            description: t
                .register_match
                .ui_sheets_register_match_wizard_sheet
                .theSelectedWinnerIsNoLongerInTheParticipantList,
          );
        }
        return null;
      case _RegisterMatchStep.points:
        final winnerKey = _winnerParticipantKey;
        final winnerType = _winnerType;
        if (winnerKey == null) {
          return RootHubException(
            title: t
                .register_match
                .ui_sheets_register_match_wizard_sheet
                .winnerMissing,
            description: t
                .register_match
                .ui_sheets_register_match_wizard_sheet
                .selectTheWinnerBeforeContinuing,
          );
        }
        if (winnerType == null) {
          return RootHubException(
            title: t
                .register_match
                .ui_sheets_register_match_wizard_sheet
                .winnerMethodMissing,
            description: t
                .register_match
                .ui_sheets_register_match_wizard_sheet
                .selectHowTheWinnerWonBeforeContinuing,
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
                    .pointsMissing,
                description: t
                    .register_match
                    .ui_sheets_register_match_wizard_sheet
                    .enterValidPointsForParticipantOrMarkFailedDominance(
                      participantName: participant.displayName,
                    ),
              );
            }

            if (parsedPoints < 0 || parsedPoints > 29) {
              return RootHubException(
                title: t
                    .register_match
                    .ui_sheets_register_match_wizard_sheet
                    .invalidPoints,
                description: t
                    .register_match
                    .ui_sheets_register_match_wizard_sheet
                    .participantMustHavePointsBetween0And29(
                      participantName: participant.displayName,
                    ),
              );
            }
          }
        }

        return null;
      case _RegisterMatchStep.matchStartedAt:
        final matchStartedAt = _matchStartedAt;
        if (matchStartedAt == null) {
          return RootHubException(
            title: t
                .register_match
                .ui_sheets_register_match_wizard_sheet
                .matchStartMissing,
            description: t
                .register_match
                .ui_sheets_register_match_wizard_sheet
                .selectWhenThisMatchStarted,
          );
        }
        if (matchStartedAt.isAfter(DateTime.now())) {
          return RootHubException(
            title: t
                .register_match
                .ui_sheets_register_match_wizard_sheet
                .invalidMatchRegistration,
            description: t
                .register_match
                .ui_sheets_register_match_wizard_sheet
                .matchStartTimeCannotBeInTheFuture,
          );
        }
        if (_matchEstimatedDuration <= Duration.zero) {
          return RootHubException(
            title: t
                .register_match
                .ui_sheets_register_match_wizard_sheet
                .invalidDuration2,
            description: t
                .register_match
                .ui_sheets_register_match_wizard_sheet
                .matchDurationMustBeGreaterThanZero,
          );
        }
        if (_matchEstimatedDuration > Duration(hours: 8)) {
          return RootHubException(
            title: t
                .register_match
                .ui_sheets_register_match_wizard_sheet
                .invalidDuration,
            description: t
                .register_match
                .ui_sheets_register_match_wizard_sheet
                .matchDurationMustBeAtMost8Hours,
          );
        }
        return null;
      case _RegisterMatchStep.socialProof:
        if (_groupPhoto == null) {
          return RootHubException(
            title: t
                .register_match
                .ui_sheets_register_match_wizard_sheet
                .groupPhotoRequired,
            description: t
                .register_match
                .ui_sheets_register_match_wizard_sheet
                .addTheGroupSelfieBeforeContinuing,
          );
        }
        if (_boardPhoto == null) {
          return RootHubException(
            title: t
                .register_match
                .ui_sheets_register_match_wizard_sheet
                .boardPhotoRequired,
            description: t
                .register_match
                .ui_sheets_register_match_wizard_sheet
                .addTheBoardPhotoBeforeContinuing,
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
        title: t
            .register_match
            .ui_sheets_register_match_wizard_sheet
            .incompleteReport,
        description: t
            .register_match
            .ui_sheets_register_match_wizard_sheet
            .completeAllReportStepsBeforeSubmitting,
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
          groupPhotoFilePath: groupPhoto.filePath,
          groupPhotoFileName: groupPhoto.fileName,
          groupPhotoContentType: groupPhoto.contentType,
          boardPhotoBytes: boardPhoto.bytes,
          boardPhotoFilePath: boardPhoto.filePath,
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
              t
                  .register_match
                  .ui_sheets_register_match_wizard_sheet
                  .groupSelfieProof,
            ),
            content: Text(
              t
                  .register_match
                  .ui_sheets_register_match_wizard_sheet
                  .takeASelfieWithEveryoneAtTheTableIfPossibleIncludeTheBoardInTheSamePhoto,
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(),
                child: Text(
                  t.register_match.ui_sheets_register_match_wizard_sheet.ok,
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
        title: t
            .register_match
            .ui_sheets_register_match_wizard_sheet
            .unableToAccessCameraOrGallery,
        description: t
            .register_match
            .ui_sheets_register_match_wizard_sheet
            .allowCameraAndPhotoPermissionsInSystemSettingsAndTryAgain,
      );
      return;
    }

    if (pickedImage == null) {
      return;
    }

    final bytes = await _readImageBytesByStreaming(pickedImage);
    if (!mounted) {
      return;
    }

    if (bytes.isEmpty) {
      await showErrorDialog(
        context,
        title:
            t.register_match.ui_sheets_register_match_wizard_sheet.invalidImage,
        description: t
            .register_match
            .ui_sheets_register_match_wizard_sheet
            .selectedImageIsEmptyChooseAnotherImage,
      );
      return;
    }

    var bytesToSubmit = bytes;
    var fileName = pickedImage.name;
    var contentType = pickedImage.mimeType;
    var filePathToUpload = pickedImage.path.trim();

    if (bytesToSubmit.length > _maxProofImageBytes) {
      final shouldCompress = await _showImageCompressionDialog(
        imageBytes: bytesToSubmit.length,
        maxBytes: _maxProofImageBytes,
      );
      if (!mounted || !shouldCompress) {
        return;
      }

      final compressedImage = await _compressImageToAllowedSize(
        sourceImage: pickedImage,
        maxBytes: _maxProofImageBytes,
        isGroupPhoto: isGroupPhoto,
      );
      if (!mounted) {
        return;
      }

      if (compressedImage == null) {
        await showErrorDialog(
          context,
          title: t
              .register_match
              .ui_sheets_register_match_wizard_sheet
              .invalidImage,
          description: t
              .register_match
              .ui_sheets_register_match_wizard_sheet
              .selectedImageIsEmptyChooseAnotherImage,
        );
        return;
      }

      bytesToSubmit = compressedImage.bytes;
      fileName = compressedImage.fileName;
      contentType = compressedImage.contentType;
      filePathToUpload = compressedImage.filePath;
    }

    if (filePathToUpload.isEmpty) {
      try {
        filePathToUpload = await _persistProofImageBytesToTemporaryFile(
          bytes: bytesToSubmit,
          fileName: fileName,
          isGroupPhoto: isGroupPhoto,
        );
      } catch (_) {
        if (!mounted) {
          return;
        }

        await showErrorDialog(
          context,
          title: t
              .register_match
              .ui_sheets_register_match_wizard_sheet
              .invalidImage,
          description: t
              .register_match
              .ui_sheets_register_match_wizard_sheet
              .selectedImageIsEmptyChooseAnotherImage,
        );
        return;
      }
    }

    final selectedImage = _ProofImageSelection(
      bytes: bytesToSubmit,
      filePath: filePathToUpload,
      fileName: _resolveProofImageFileName(
        originalFileName: fileName,
        isGroupPhoto: isGroupPhoto,
      ),
      contentType: contentType,
    );

    setState(() {
      if (isGroupPhoto) {
        _groupPhoto = selectedImage;
      } else {
        _boardPhoto = selectedImage;
      }
    });
  }

  Future<Uint8List> _readImageBytesByStreaming(XFile pickedImage) async {
    final bytesBuilder = BytesBuilder(copy: false);
    await for (final chunk in pickedImage.openRead()) {
      bytesBuilder.add(chunk);
    }
    return bytesBuilder.takeBytes();
  }

  Future<bool> _showImageCompressionDialog({
    required int imageBytes,
    required int maxBytes,
  }) async {
    final selectedImageMb = _formatMegabytes(imageBytes);
    final maxAllowedMb = _formatMegabytes(maxBytes);

    final shouldCompress = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: Text(
            t.match.ui_screens_match_chat_screen.imageIsTooLarge,
          ),
          content: Text(
            t.match.ui_screens_match_chat_screen.imageCompressionPrompt(
              selectedImageMb: selectedImageMb,
              maxAllowedMb: maxAllowedMb,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(false),
              child: Text(
                t.match.ui_screens_match_chat_screen.cancel2,
              ),
            ),
            FilledButton(
              onPressed: () => Navigator.of(dialogContext).pop(true),
              child: Text(
                t.match.ui_screens_match_chat_screen.compress,
              ),
            ),
          ],
        );
      },
    );

    return shouldCompress ?? false;
  }

  Future<_CompressedProofImageSelection?> _compressImageToAllowedSize({
    required XFile sourceImage,
    required int maxBytes,
    required bool isGroupPhoto,
  }) async {
    final sourcePath = sourceImage.path.trim();
    if (sourcePath.isEmpty) {
      return null;
    }

    final compressedFileName = _resolveCompressedImageFileName(
      originalFileName: sourceImage.name,
      isGroupPhoto: isGroupPhoto,
    );
    const minDimensionCandidates = <int>[
      2200,
      1900,
      1600,
      1300,
      1000,
      800,
      600,
      480,
      360,
    ];
    const qualityCandidates = <int>[84, 76, 68, 60, 52, 44, 36, 28, 20];

    for (final minDimension in minDimensionCandidates) {
      for (final quality in qualityCandidates) {
        final targetPath = _buildTemporaryCompressedImagePath(
          fileName: compressedFileName,
          minDimension: minDimension,
          quality: quality,
        );
        final compressedFile = await FlutterImageCompress.compressAndGetFile(
          sourcePath,
          targetPath,
          format: CompressFormat.jpeg,
          quality: quality,
          minWidth: minDimension,
          minHeight: minDimension,
          keepExif: false,
        );
        if (compressedFile == null) {
          continue;
        }

        final compressedBytes = await compressedFile.readAsBytes();
        if (compressedBytes.isEmpty) {
          continue;
        }

        if (compressedBytes.length <= maxBytes) {
          return _CompressedProofImageSelection(
            bytes: compressedBytes,
            filePath: compressedFile.path,
            fileName: compressedFileName,
            contentType: 'image/jpeg',
          );
        }
      }
    }

    return null;
  }

  Future<String> _persistProofImageBytesToTemporaryFile({
    required Uint8List bytes,
    required String fileName,
    required bool isGroupPhoto,
  }) async {
    final normalizedFileName = _resolveProofImageFileName(
      originalFileName: fileName,
      isGroupPhoto: isGroupPhoto,
    );
    final safeFileName = normalizedFileName.replaceAll(
      RegExp(r'[^A-Za-z0-9._-]'),
      '_',
    );
    final tempFilePath =
        '${Directory.systemTemp.path}/${DateTime.now().microsecondsSinceEpoch}-$safeFileName';
    final tempFile = File(tempFilePath);
    await tempFile.writeAsBytes(bytes, flush: true);
    return tempFile.path;
  }

  String _buildTemporaryCompressedImagePath({
    required String fileName,
    required int minDimension,
    required int quality,
  }) {
    final fileNameWithoutExtension = fileName.replaceFirst(
      RegExp(r'\.[^./\\]+$'),
      '',
    );
    final safeName = fileNameWithoutExtension.replaceAll(
      RegExp(r'[^A-Za-z0-9._-]'),
      '_',
    );
    return '${Directory.systemTemp.path}/$safeName-'
        '${DateTime.now().microsecondsSinceEpoch}-w$minDimension-q$quality.jpg';
  }

  String _resolveProofImageFileName({
    required String originalFileName,
    required bool isGroupPhoto,
  }) {
    final normalizedOriginalFileName = originalFileName.trim();
    if (normalizedOriginalFileName.isNotEmpty) {
      return normalizedOriginalFileName;
    }

    return isGroupPhoto ? 'group-photo.jpg' : 'board-photo.jpg';
  }

  String _resolveCompressedImageFileName({
    required String originalFileName,
    required bool isGroupPhoto,
  }) {
    final fallbackName = isGroupPhoto ? 'group-photo' : 'board-photo';
    final normalizedOriginalFileName = originalFileName.trim();
    if (normalizedOriginalFileName.isEmpty) {
      return '$fallbackName.jpg';
    }

    final fileNameWithoutExtension = normalizedOriginalFileName.replaceFirst(
      RegExp(r'\.[^./\\]+$'),
      '',
    );
    return '$fileNameWithoutExtension.jpg';
  }

  String _formatMegabytes(int bytes) {
    return (bytes / (1024 * 1024)).toStringAsFixed(1);
  }

  Future<ImageSource?> _pickImageSource() async {
    final platform = Theme.of(context).platform;
    if (platform == TargetPlatform.iOS) {
      return showCupertinoModalPopup<ImageSource>(
        context: context,
        builder: (dialogContext) {
          return CupertinoActionSheet(
            title: Text(
              t
                  .register_match
                  .ui_sheets_register_match_wizard_sheet
                  .selectSource,
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
                      .camera2,
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
                      .gallery2,
                ),
              ),
            ],
            cancelButton: CupertinoActionSheetAction(
              isDestructiveAction: true,
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
              child: Text(
                t.register_match.ui_sheets_register_match_wizard_sheet.cancel,
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
                  t.register_match.ui_sheets_register_match_wizard_sheet.camera,
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
                      .gallery,
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
    required this.filePath,
    required this.fileName,
    required this.contentType,
  });

  final Uint8List bytes;
  final String filePath;
  final String fileName;
  final String? contentType;
}

class _CompressedProofImageSelection {
  _CompressedProofImageSelection({
    required this.bytes,
    required this.filePath,
    required this.fileName,
    required this.contentType,
  });

  final Uint8List bytes;
  final String filePath;
  final String fileName;
  final String contentType;
}
