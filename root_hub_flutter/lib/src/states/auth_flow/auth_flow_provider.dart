import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:result_dart/result_dart.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/core/extension/serverpod_to_result.dart';
import 'package:root_hub_flutter/src/global_providers/session_provider.dart';
import 'package:root_hub_flutter/src/states/account/account_provider.dart';
import 'package:root_hub_flutter/src/states/auth_flow/auth_flow_state.dart';
import 'package:root_hub_flutter/src/states/onboarding/onboarding_provider.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';

class AuthFlowNotifier extends Notifier<AuthFlowState> {
  bool _hasBootstrapped = false;

  @override
  AuthFlowState build() {
    final sessionManager = ref.read(sessionManagerProvider);
    void handleSessionChanges() {
      unawaited(bootstrap());
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

  Future<void> bootstrap() async {
    state = const AuthFlowState.loading();
    await _resolveInitialFlow();
  }

  void moveToLoginAfterOnboarding() {
    state = const AuthFlowState.requiresLogin();
  }

  Future<void> completeLogin() async {
    state = const AuthFlowState.loading();

    final getPlayerResult = await _getPlayerData();
    await getPlayerResult.fold(
      (playerValue) async {
        final playerData = playerValue.value;
        if (playerData != null) {
          _setAuthenticated(playerData);
          return;
        }

        final selectedFaction = ref.read(onboardingProvider).selectedFaction;
        if (selectedFaction == null) {
          state = const AuthFlowState.requiresOnboarding();
          return;
        }

        final displayName = await _resolveDisplayName();
        final createPlayerResult = await ref
            .read(clientProvider)
            .createPlayerData
            .v1(
              displayName: displayName,
              favoriteFaction: selectedFaction,
            )
            .toResult;

        await createPlayerResult.fold(
          (createdPlayerData) async {
            await ref.read(onboardingProvider.notifier).clearSelection();
            _setAuthenticated(createdPlayerData);
          },
          (createError) async {
            final fallbackPlayerResult = await _getPlayerData();
            fallbackPlayerResult.fold(
              (fallbackPlayerValue) {
                final fallbackPlayerData = fallbackPlayerValue.value;
                if (fallbackPlayerData == null) {
                  state = AuthFlowState.error(
                    message: _extractErrorMessage(
                      createError,
                      fallback:
                          'Unable to finish account setup. Please try again.',
                    ),
                  );
                  return;
                }

                _setAuthenticated(fallbackPlayerData);
              },
              (_) {
                state = AuthFlowState.error(
                  message: _extractErrorMessage(
                    createError,
                    fallback:
                        'Unable to finish account setup. Please try again.',
                  ),
                );
              },
            );
          },
        );
      },
      (error) async {
        state = AuthFlowState.error(
          message: _extractErrorMessage(
            error,
            fallback: 'Unable to load account details. Please try again.',
          ),
        );
      },
    );
  }

  Future<void> _resolveInitialFlow() async {
    final client = ref.read(clientProvider);
    final selectedFaction = ref.read(onboardingProvider).selectedFaction;

    if (!client.auth.isAuthenticated) {
      state = selectedFaction == null
          ? const AuthFlowState.requiresOnboarding()
          : const AuthFlowState.requiresLogin();
      return;
    }

    final getPlayerResult = await _getPlayerData();
    getPlayerResult.fold(
      (playerValue) {
        final playerData = playerValue.value;
        if (playerData != null) {
          _setAuthenticated(playerData);
          return;
        }

        state = selectedFaction == null
            ? const AuthFlowState.requiresOnboarding()
            : const AuthFlowState.requiresLogin();
      },
      (error) {
        state = AuthFlowState.error(
          message: _extractErrorMessage(
            error,
            fallback: 'Unable to validate your session. Please try again.',
          ),
        );
      },
    );
  }

  AsyncResultDart<NullableServerpodValue<PlayerData>, RootHubException>
  _getPlayerData() {
    return ref.read(clientProvider).getPlayerData.v1().toResult;
  }

  Future<String> _resolveDisplayName() async {
    final profileResult = await ref
        .read(clientProvider)
        .modules
        .serverpod_auth_core
        .userProfileInfo
        .get()
        .toResult;

    return profileResult.fold(
      (profile) => _firstNonEmpty(
        [
          profile.fullName,
          profile.userName,
          _emailPrefix(profile.email),
        ],
        fallback: 'Root Player',
      ),
      (_) => 'Root Player',
    );
  }

  String _emailPrefix(String? email) {
    if (email == null || email.trim().isEmpty) {
      return '';
    }

    final atIndex = email.indexOf('@');
    if (atIndex <= 0) {
      return email.trim();
    }

    return email.substring(0, atIndex).trim();
  }

  String _firstNonEmpty(
    List<String?> candidates, {
    required String fallback,
  }) {
    for (final candidate in candidates) {
      final trimmed = candidate?.trim();
      if (trimmed != null && trimmed.isNotEmpty) {
        return trimmed;
      }
    }

    return fallback;
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

  void _setAuthenticated(PlayerData playerData) {
    ref.read(accountProvider.notifier).setUser(playerData);
    state = AuthFlowState.authenticated(playerData: playerData);
  }
}

final authFlowProvider = NotifierProvider<AuthFlowNotifier, AuthFlowState>(
  AuthFlowNotifier.new,
);
