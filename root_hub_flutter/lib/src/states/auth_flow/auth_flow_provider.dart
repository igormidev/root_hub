import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:result_dart/result_dart.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/core/extension/serverpod_to_result.dart';
import 'package:root_hub_flutter/src/core/utils/talker.dart';
import 'package:root_hub_flutter/src/global_providers/session_provider.dart';
import 'package:root_hub_flutter/src/states/account/account_provider.dart';
import 'package:root_hub_flutter/src/states/auth_flow/auth_flow_state.dart';
import 'package:root_hub_flutter/src/states/onboarding/onboarding_provider.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';

class AuthFlowNotifier extends Notifier<AuthFlowState> {
  static const _authValidationTimeout = Duration(seconds: 6);
  static const _playerDataTimeout = Duration(seconds: 10);

  bool _hasBootstrapped = false;
  int _activeRunId = 0;

  @override
  AuthFlowState build() {
    final sessionManager = ref.read(sessionManagerProvider);
    void handleSessionChanges() {
      unawaited(bootstrap(showLoading: false));
    }

    sessionManager.authInfoListenable.addListener(handleSessionChanges);
    ref.onDispose(() {
      sessionManager.authInfoListenable.removeListener(handleSessionChanges);
    });

    if (!_hasBootstrapped) {
      _hasBootstrapped = true;
      unawaited(bootstrap());
    }

    return const AuthFlowState.loading();
  }

  Future<void> bootstrap({bool showLoading = true}) async {
    final runId = _nextRunId();
    if (showLoading) {
      _setStateIfCurrent(runId, const AuthFlowState.loading());
    }

    try {
      await _resolveInitialFlow(runId);
    } catch (error, stackTrace) {
      talker.handle(error, stackTrace);
      _setFallbackUnauthenticatedState(runId);
    }
  }

  void moveToLoginAfterOnboarding() {
    state = const AuthFlowState.requiresLogin();
  }

  void moveToOnboardingProfile() {
    state = const AuthFlowState.requiresOnboardingProfile();
  }

  Future<void> completeLogin() async {
    await bootstrap();
  }

  Future<void> _resolveInitialFlow(int runId) async {
    final hasValidSession = await _hasValidSession();

    if (!hasValidSession) {
      _setFallbackUnauthenticatedState(runId);
      return;
    }

    await _ensureAuthenticatedPlayer(runId);
  }

  Future<bool> _hasValidSession() async {
    final client = ref.read(clientProvider);
    if (!client.auth.isAuthenticated) {
      return false;
    }

    try {
      final isValid = await client.auth.validateAuthentication(
        timeout: _authValidationTimeout,
      );
      return isValid && client.auth.isAuthenticated;
    } catch (error, stackTrace) {
      talker.handle(error, stackTrace);
      await client.auth.updateSignedInUser(null);
      return false;
    }
  }

  Future<void> _ensureAuthenticatedPlayer(int runId) async {
    final getPlayerResult = await _getPlayerData();
    await getPlayerResult.fold(
      (playerValue) async {
        if (!_isCurrent(runId)) {
          return;
        }

        final playerData = playerValue.value;
        if (playerData != null) {
          _setAuthenticated(runId, playerData);
          return;
        }

        final onboardingState = ref.read(onboardingProvider);
        final selectedFaction = onboardingState.selectedFaction;
        if (selectedFaction == null) {
          _setStateIfCurrent(runId, const AuthFlowState.requiresOnboarding());
          return;
        }

        final displayName = onboardingState.displayName.trim();
        final currentLocation = onboardingState.currentLocation;
        if (displayName.isEmpty || currentLocation == null) {
          _setStateIfCurrent(
            runId,
            const AuthFlowState.requiresOnboardingProfile(),
          );
          return;
        }

        final createPlayerResult = await ref
            .read(clientProvider)
            .createPlayerData
            .v1(
              displayName: displayName,
              favoriteFaction: selectedFaction,
              currentLocation: currentLocation,
            )
            .toResult;

        await createPlayerResult.fold(
          (createdPlayerData) async {
            if (!_isCurrent(runId)) {
              return;
            }

            await ref.read(onboardingProvider.notifier).clearSelection();
            _setAuthenticated(runId, createdPlayerData);
          },
          (createError) async {
            final fallbackPlayerResult = await _getPlayerData();
            await fallbackPlayerResult.fold(
              (fallbackPlayerValue) {
                if (!_isCurrent(runId)) {
                  return;
                }

                final fallbackPlayerData = fallbackPlayerValue.value;
                if (fallbackPlayerData == null) {
                  _setStateIfCurrent(
                    runId,
                    AuthFlowState.error(
                      message: _extractErrorMessage(
                        createError,
                        fallback:
                            'Unable to finish account setup. Please try again.',
                      ),
                    ),
                  );
                  return;
                }

                _setAuthenticated(runId, fallbackPlayerData);
              },
              (_) async {
                _setStateIfCurrent(
                  runId,
                  AuthFlowState.error(
                    message: _extractErrorMessage(
                      createError,
                      fallback:
                          'Unable to finish account setup. Please try again.',
                    ),
                  ),
                );
              },
            );
          },
        );
      },
      (error) async {
        _setStateIfCurrent(
          runId,
          AuthFlowState.error(
            message: _extractErrorMessage(
              error,
              fallback: 'Unable to load account details. Please try again.',
            ),
          ),
        );
      },
    );
  }

  AsyncResultDart<NullableServerpodValue<PlayerData>, RootHubException>
  _getPlayerData() {
    return ref
        .read(clientProvider)
        .getPlayerData
        .v1()
        .timeout(_playerDataTimeout)
        .toResult;
  }

  String _extractErrorMessage(
    RootHubException error, {
    required String fallback,
  }) {
    final title = error.title.trim();
    final description = error.description.trim();
    if (description.isNotEmpty) {
      return description;
    }
    if (title.isNotEmpty) {
      return title;
    }
    return fallback;
  }

  int _nextRunId() {
    _activeRunId += 1;
    return _activeRunId;
  }

  bool _isCurrent(int runId) => runId == _activeRunId;

  void _setStateIfCurrent(int runId, AuthFlowState nextState) {
    if (!_isCurrent(runId)) {
      return;
    }
    state = nextState;
  }

  void _setAuthenticated(int runId, PlayerData playerData) {
    ref.read(accountProvider.notifier).setUser(playerData);
    _setStateIfCurrent(
      runId,
      AuthFlowState.authenticated(playerData: playerData),
    );
  }

  void _setFallbackUnauthenticatedState(int runId) {
    final onboardingState = ref.read(onboardingProvider);
    final selectedFaction = onboardingState.selectedFaction;
    final hasDisplayName = onboardingState.displayName.trim().isNotEmpty;
    final hasCurrentLocation = onboardingState.currentLocation != null;
    _setStateIfCurrent(
      runId,
      selectedFaction == null
          ? const AuthFlowState.requiresOnboarding()
          : hasDisplayName && hasCurrentLocation
          ? const AuthFlowState.requiresLogin()
          : const AuthFlowState.requiresOnboardingProfile(),
    );
  }
}

final authFlowProvider = NotifierProvider<AuthFlowNotifier, AuthFlowState>(
  AuthFlowNotifier.new,
);
