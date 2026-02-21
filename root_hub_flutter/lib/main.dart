import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/core/app_config.dart';
import 'package:root_hub_flutter/src/core/theme/app_theme.dart';
import 'package:root_hub_flutter/src/core/utils/custom_talker_riverpod_observer.dart';
import 'package:root_hub_flutter/src/core/utils/talker.dart';
import 'package:root_hub_flutter/src/global_providers/go_router_providers.dart';
import 'package:root_hub_flutter/src/global_providers/session_provider.dart';
import 'package:root_hub_flutter/src/global_providers/shared_preferences_provider.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_flutter/talker_flutter.dart';

late String serverUrl;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const serverUrlFromEnv = String.fromEnvironment('SERVER_URL');
  final config = await AppConfig.loadConfig();
  final serverUrl = serverUrlFromEnv.isEmpty
      ? config.apiUrl ?? 'http://localhost:8080/'
      : serverUrlFromEnv;

  final Client client =
      Client(
          serverUrl,
          connectionTimeout: Duration(minutes: 2),
        )
        ..connectivityMonitor = FlutterConnectivityMonitor()
        ..authSessionManager = FlutterAuthSessionManager();

  await client.auth.initialize();
  final pref = await SharedPreferences.getInstance();

  runApp(
    MyApp(
      client: client,
      sharedPreferences: pref,
    ),
  );
}

class MyApp extends StatelessWidget {
  final Client client;
  final SharedPreferences sharedPreferences;
  const MyApp({
    super.key,
    required this.client,
    required this.sharedPreferences,
  });

  @override
  Widget build(BuildContext context) {
    return TalkerWrapper(
      talker: talker,
      options: const TalkerWrapperOptions(
        enableErrorAlerts: kDebugMode,
        enableExceptionAlerts: kDebugMode,
      ),
      child: ProviderScope(
        observers: [
          if (kDebugMode)
            CustomTalkerRiverpodObserver(talker: talker, maxStateLength: 500),
        ],
        overrides: [
          clientProvider.overrideWithValue(client),
          sharedPreferencesProvider.overrideWithValue(sharedPreferences),
        ],
        child: const _RouterApp(),
      ),
    );
  }
}

/// Inner widget that consumes the router provider.
/// This needs to be a separate ConsumerWidget so it can access the ProviderScope.
class _RouterApp extends ConsumerWidget {
  const _RouterApp();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'Root Hub',
      theme: buildAppTheme(
        seedColor: const Color(0xFF6A3D1F),
        brightness: Brightness.light,
      ),
      darkTheme: buildAppTheme(
        seedColor: const Color(0xFF6A3D1F),
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
      // localizationsDelegates: S.localizationsDelegates,
      // supportedLocales: S.supportedLocales,
      routerConfig: router,
    );
  }
}
