import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:root_hub_flutter/src/core/navigation/app_routes.dart';
import 'package:root_hub_flutter/src/core/utils/talker.dart';
import 'package:root_hub_flutter/src/features/auth/auth_loading_screen.dart';
import 'package:root_hub_flutter/src/features/auth/auth_login_screen.dart';
import 'package:root_hub_flutter/src/features/auth/auth_onboarding_profile_screen.dart';
import 'package:root_hub_flutter/src/features/auth/auth_onboarding_screen.dart';
import 'package:root_hub_flutter/src/features/dashboard/ui/screens/dashboard_faction_editor_screen.dart';
import 'package:root_hub_flutter/src/features/dashboard/ui/screens/dashboard_screen.dart';
import 'package:root_hub_flutter/src/states/auth_flow/auth_flow_provider.dart';
import 'package:root_hub_flutter/src/states/auth_flow/auth_flow_state.dart';
import 'package:talker_flutter/talker_flutter.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

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
      initialLocation: loadingPath,
      redirect: (context, state) {
        return _resolveRedirect(authFlowState, state.matchedLocation);
      },
      routes: [
        GoRoute(
          path: loadingPath,
          builder: (context, state) => const AuthLoadingScreen(),
        ),
        GoRoute(
          path: onboardingPath,
          builder: (context, state) => const AuthOnboardingScreen(),
        ),
        GoRoute(
          path: onboardingProfilePath,
          builder: (context, state) => const AuthOnboardingProfileScreen(),
        ),
        GoRoute(
          path: loginPath,
          builder: (context, state) => const AuthLoginScreen(),
        ),
        GoRoute(
          path: dashboardPath,
          builder: (context, state) => const DashboardScreen(),
        ),
        GoRoute(
          path: dashboardFactionPath,
          builder: (context, state) => const DashboardFactionEditorScreen(),
        ),
      ],
    );
  }

  String? _resolveRedirect(
    AuthFlowState authFlowState,
    String currentPath,
  ) {
    return authFlowState.map(
      loading: (_) => currentPath == loadingPath ? null : loadingPath,
      requiresOnboarding: (_) =>
          currentPath == onboardingPath ? null : onboardingPath,
      requiresOnboardingProfile: (_) =>
          currentPath == onboardingProfilePath ? null : onboardingProfilePath,
      requiresLogin: (_) => currentPath == loginPath ? null : loginPath,
      authenticated: (_) {
        if (currentPath == dashboardPath ||
            currentPath.startsWith('$dashboardPath/')) {
          return null;
        }

        return dashboardPath;
      },
      error: (_) => currentPath == loginPath ? null : loginPath,
    );
  }
}

final routerProvider = NotifierProvider<RouterNotifier, GoRouter>(
  RouterNotifier.new,
);
