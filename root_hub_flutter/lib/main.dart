import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';
import 'package:root_hub_flutter/src/core/app_config.dart';
import 'package:root_hub_flutter/src/core/theme/app_theme.dart';
import 'package:root_hub_flutter/src/core/utils/custom_talker_riverpod_observer.dart';
import 'package:root_hub_flutter/src/core/utils/talker.dart';
import 'package:root_hub_flutter/src/global_providers/go_router_providers.dart';
import 'package:root_hub_flutter/src/global_providers/session_provider.dart';
import 'package:root_hub_flutter/src/global_providers/shared_preferences_provider.dart';
import 'package:root_hub_flutter/src/states/deep_link/deep_link_provider.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_flutter/talker_flutter.dart';

const _defaultLocalServerUrl = 'http://localhost:8080/';
const _productionServerUrl = 'https://roothub.api.serverpod.space/';
const _preferredLocaleKey = 'preferred_locale';
const _deviceLocalePreferenceValue = 'device';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const serverUrlFromEnv = String.fromEnvironment('SERVER_URL');
  final config = await AppConfig.loadConfig();
  final serverUrl = _resolveServerUrl(
    serverUrlFromEnv: serverUrlFromEnv,
    serverUrlFromConfig: config.apiUrl,
  );

  final Client client =
      Client(
          serverUrl,
          connectionTimeout: Duration(minutes: 2),
        )
        ..connectivityMonitor = FlutterConnectivityMonitor()
        ..authSessionManager = FlutterAuthSessionManager();

  await client.auth.initialize();
  final pref = await SharedPreferences.getInstance();
  // await pref.clear();
  final preferredLocaleRaw = pref.getString(_preferredLocaleKey);
  if (preferredLocaleRaw == null ||
      preferredLocaleRaw == _deviceLocalePreferenceValue) {
    await LocaleSettings.useDeviceLocale();
  } else {
    await LocaleSettings.setLocaleRaw(preferredLocaleRaw);
  }

  // await pref.setString('preferred_locale', 'pt-BR'); // opcional (persistir)
  await LocaleSettings.setLocale(AppLocale.ptBr); // muda idioma imediatamente

  runApp(
    TranslationProvider(
      child: MyApp(
        client: client,
        sharedPreferences: pref,
      ),
    ),
  );
}

String _resolveServerUrl({
  required String serverUrlFromEnv,
  required String? serverUrlFromConfig,
}) {
  if (kReleaseMode) {
    return _productionServerUrl;
  }

  final normalizedServerUrlFromEnv = serverUrlFromEnv.trim();
  if (normalizedServerUrlFromEnv.isNotEmpty) {
    return normalizedServerUrlFromEnv;
  }

  final normalizedServerUrlFromConfig = serverUrlFromConfig?.trim();
  if (normalizedServerUrlFromConfig != null &&
      normalizedServerUrlFromConfig.isNotEmpty) {
    return normalizedServerUrlFromConfig;
  }

  return _defaultLocalServerUrl;
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
        enableErrorAlerts: false,
        enableExceptionAlerts: false,
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
/// This needs to be a separate consumer widget so it can access the ProviderScope.
class _RouterApp extends ConsumerStatefulWidget {
  const _RouterApp();

  @override
  ConsumerState<_RouterApp> createState() => _RouterAppState();
}

class _RouterAppState extends ConsumerState<_RouterApp> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      ref.read(deepLinkProvider.notifier).ensureInitialized();
    });
  }

  @override
  Widget build(BuildContext context) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: context.t.app.rootHub,
      theme: buildAppTheme(
        seedColor: const Color(0xFF6A3D1F),
        brightness: Brightness.light,
      ),
      darkTheme: buildAppTheme(
        seedColor: const Color(0xFF6A3D1F),
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
      locale: TranslationProvider.of(context).flutterLocale,
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      routerConfig: router,
    );
  }
}
