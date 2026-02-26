import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' as http;

import 'fcm_credentials.dart';

class FcmAccessTokenProvider {
  const FcmAccessTokenProvider._();

  static const String firebaseMessagingScope =
      'https://www.googleapis.com/auth/firebase.messaging';

  static final http.Client _httpClient = http.Client();
  static _CachedAccessToken? _cachedToken;

  static Future<String> getAccessToken(FcmCredentials credentials) async {
    final now = DateTime.now().toUtc();
    final cachedToken = _cachedToken;
    if (cachedToken != null &&
        cachedToken.clientEmail ==
            credentials.serviceAccountCredentials.email &&
        cachedToken.expiresAt.isAfter(now.add(const Duration(minutes: 1)))) {
      return cachedToken.accessToken;
    }

    final accessCredentials = await obtainAccessCredentialsViaServiceAccount(
      credentials.serviceAccountCredentials,
      const [firebaseMessagingScope],
      _httpClient,
    );

    final accessToken = accessCredentials.accessToken;
    _cachedToken = _CachedAccessToken(
      clientEmail: credentials.serviceAccountCredentials.email,
      accessToken: accessToken.data,
      expiresAt: accessToken.expiry.toUtc(),
    );

    return accessToken.data;
  }
}

class _CachedAccessToken {
  _CachedAccessToken({
    required this.clientEmail,
    required this.accessToken,
    required this.expiresAt,
  });

  final String clientEmail;
  final String accessToken;
  final DateTime expiresAt;
}
