
import 'dart:async';

class AppConfig {
  final String? apiUrl;

  AppConfig({
    required this.apiUrl,
  });

  static FutureOr<AppConfig> loadConfig() async {
    final String apiUrl = const String.fromEnvironment('API_URL');

    return AppConfig(apiUrl: apiUrl);
  }
}
