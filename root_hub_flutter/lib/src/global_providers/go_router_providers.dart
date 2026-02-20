import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:root_hub_flutter/src/core/utils/talker.dart';
import 'package:talker_flutter/talker_flutter.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

/// Notifier for managing GoRouter configuration.
class RouterNotifier extends Notifier<GoRouter> {
  @override
  GoRouter build() {
    return GoRouter(
      navigatorKey: _rootNavigatorKey,
      observers: <NavigatorObserver>[
        if (kDebugMode) TalkerRouteObserver(talker),
      ],
      initialLocation: '/',
      routes: [
      ],
    );
  }
}

final routerProvider = NotifierProvider<RouterNotifier, GoRouter>(
  RouterNotifier.new,
);
