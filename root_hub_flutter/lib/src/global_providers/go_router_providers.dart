import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:root_hub_flutter/src/features/auth/auth_loading_screen.dart';
import 'package:root_hub_flutter/src/features/auth/auth_login_screen.dart';
import 'package:root_hub_flutter/src/features/auth/auth_onboarding_screen.dart';
import 'package:root_hub_flutter/src/features/matches/match_lobby_screen.dart';
import 'package:root_hub_flutter/src/core/utils/talker.dart';
import 'package:root_hub_flutter/src/states/auth_flow/auth_flow_provider.dart';
import 'package:root_hub_flutter/src/states/auth_flow/auth_flow_state.dart';
import 'package:talker_flutter/talker_flutter.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
const _loadingPath = '/';
const _onboardingPath = '/auth/onboarding';
const _loginPath = '/auth/login';
const _matchesPath = '/matches';

/// Notifier for managing GoRouter configuration.
class RouterNotifier extends Notifier<GoRouter> {
  @override
  GoRouter build() {
    final authFlowState = ref.watch(authFlowProvider);

    return GoRouter(
      navigatorKey: _rootNavigatorKey,
      observers: <NavigatorObserver>[
        if (kDebugMode) TalkerRouteObserver(talker),
      ],
      initialLocation: _loadingPath,
      redirect: (context, state) {
        return _resolveRedirect(authFlowState, state.matchedLocation);
      },
      routes: [
        GoRoute(
          path: _loadingPath,
          builder: (context, state) => const AuthLoadingScreen(),
        ),
        GoRoute(
          path: _onboardingPath,
          builder: (context, state) => const AuthOnboardingScreen(),
        ),
        GoRoute(
          path: _loginPath,
          builder: (context, state) => const AuthLoginScreen(),
        ),
        GoRoute(
          path: _matchesPath,
          builder: (context, state) => const MatchLobbyScreen(),
        ),
      ],
    );
  }

  String? _resolveRedirect(
    AuthFlowState authFlowState,
    String currentPath,
  ) {
    final target = authFlowState.map(
      loading: (_) => _loadingPath,
      requiresOnboarding: (_) => _onboardingPath,
      requiresLogin: (_) => _loginPath,
      authenticated: (_) => _matchesPath,
      error: (_) => _loginPath,
    );

    if (target == currentPath) {
      return null;
    }

    return target;
  }
}

final routerProvider = NotifierProvider<RouterNotifier, GoRouter>(
  RouterNotifier.new,
);
