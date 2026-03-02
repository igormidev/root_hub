import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/core/extension/serverpod_to_result.dart';
import 'package:root_hub_flutter/src/core/utils/talker.dart';
import 'package:root_hub_flutter/src/global_providers/server_supported_translation_provider.dart';
import 'package:root_hub_flutter/src/global_providers/session_provider.dart';
import 'package:root_hub_flutter/src/states/deep_link/deep_link_provider.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';

final pushNotificationsSyncProvider = Provider<PushNotificationsSyncService>((
  ref,
) {
  final service = PushNotificationsSyncService(ref);
  ref.onDispose(service.dispose);
  return service;
});

class PushNotificationsSyncService {
  PushNotificationsSyncService(this._ref);

  final Ref _ref;

  StreamSubscription<String>? _tokenRefreshSubscription;
  StreamSubscription<RemoteMessage>? _messageOpenedAppSubscription;
  String? _currentToken;
  bool _isInitializing = false;
  bool _didInitialize = false;
  bool _isSyncingToken = false;

  void ensureInitializedForAuthenticatedUser() {
    if (_isInitializing) {
      return;
    }

    _isInitializing = true;
    unawaited(
      _initializeInternal().whenComplete(() {
        _isInitializing = false;
      }),
    );
  }

  Future<void> deactivateCurrentToken() async {
    if (!_isSupportedPlatform) {
      return;
    }

    if (!await _ensureFirebaseInitialized()) {
      return;
    }

    final tokenFromFirebase = await FirebaseMessaging.instance.getToken();
    final token = _normalizeToken(_currentToken ?? tokenFromFirebase);
    if (token == null || !_isAuthenticated) {
      _currentToken = null;
      return;
    }

    final deactivateRequest = _ref
        .read(clientProvider)
        .deactivatePushNotificationToken
        .v1(
          language: _ref.read(serverSupportedTranslationProvider),
          token: token,
        );
    final result = await FutureServerpodToResultVoidExt(
      deactivateRequest,
    ).toResult;

    result.fold(
      (_) {
        _currentToken = null;
      },
      (error) {
        talker.warning(
          '[PushNotifications] Failed to deactivate current token. '
          'title=${error.title} description=${error.description}',
        );
      },
    );
  }

  void dispose() {
    unawaited(_tokenRefreshSubscription?.cancel() ?? Future<void>.value());
    unawaited(_messageOpenedAppSubscription?.cancel() ?? Future<void>.value());
    _tokenRefreshSubscription = null;
    _messageOpenedAppSubscription = null;
  }

  Future<void> _initializeInternal() async {
    if (_didInitialize) {
      if (_isAuthenticated) {
        await _syncCurrentDeviceToken();
      }
      return;
    }

    if (!_isSupportedPlatform) {
      _didInitialize = true;
      return;
    }

    final firebaseInitialized = await _ensureFirebaseInitialized();
    if (!firebaseInitialized) {
      return;
    }

    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: false,
    );

    _messageOpenedAppSubscription ??= FirebaseMessaging.onMessageOpenedApp
        .listen(
          _handleNotificationTap,
          onError: (Object error, StackTrace stackTrace) {
            talker.handle(
              error,
              stackTrace,
              '[PushNotifications] Failed while handling notification tap.',
            );
          },
        );
    await _consumeInitialNotificationTap();

    _tokenRefreshSubscription ??= FirebaseMessaging.instance.onTokenRefresh
        .listen((nextToken) {
          unawaited(_syncToken(nextToken));
        });

    _didInitialize = true;
    if (_isAuthenticated) {
      await _syncCurrentDeviceToken();
    }
  }

  Future<void> _syncCurrentDeviceToken() async {
    final token = await FirebaseMessaging.instance.getToken();
    await _syncToken(token);
  }

  Future<void> _consumeInitialNotificationTap() async {
    try {
      final initialMessage = await FirebaseMessaging.instance
          .getInitialMessage();
      if (initialMessage == null) {
        return;
      }

      _handleNotificationTap(initialMessage);
    } catch (error, stackTrace) {
      talker.handle(
        error,
        stackTrace,
        '[PushNotifications] Failed to resolve initial notification tap.',
      );
    }
  }

  void _handleNotificationTap(RemoteMessage message) {
    final data = message.data;
    if (data.isEmpty) {
      return;
    }

    final scheduledMatchId = _parsePositiveInt(
      data['scheduledMatchId'] ?? data['matchId'],
    );
    if (scheduledMatchId == null) {
      return;
    }

    final type = (data['type']?.toString() ?? '').trim();
    final deepLinkNotifier = _ref.read(deepLinkProvider.notifier);
    if (type == 'match_chat_message' || data.containsKey('chatHistoryId')) {
      deepLinkNotifier.setPendingMatchChatNavigation(
        matchId: scheduledMatchId,
        messageId: _parsePositiveInt(data['messageId']),
      );
      return;
    }

    if (type == 'nearby_match_schedule_created' ||
        type == 'nearby_match_created') {
      deepLinkNotifier.setPendingMatchForJoinFlow(scheduledMatchId);
    }
  }

  Future<void> _syncToken(String? tokenCandidate) async {
    final token = _normalizeToken(tokenCandidate);
    if (token == null) {
      return;
    }

    _currentToken = token;

    if (!_isAuthenticated || _isSyncingToken) {
      return;
    }

    _isSyncingToken = true;
    final syncRequest = _ref
        .read(clientProvider)
        .syncPushNotificationToken
        .v1(
          language: _ref.read(serverSupportedTranslationProvider),
          token: token,
          platform: _resolvePlatform(),
        );
    final result = await FutureServerpodToResultVoidExt(syncRequest).toResult;
    _isSyncingToken = false;

    result.fold(
      (_) {},
      (error) {
        talker.warning(
          '[PushNotifications] Failed to sync token. '
          'title=${error.title} description=${error.description}',
        );
      },
    );
  }

  Future<bool> _ensureFirebaseInitialized() async {
    try {
      if (Firebase.apps.isEmpty) {
        await Firebase.initializeApp();
      }
      return true;
    } catch (error, stackTrace) {
      talker.handle(
        error,
        stackTrace,
        '[PushNotifications] Firebase initialization failed. '
        'Ensure GoogleService-Info.plist and google-services.json are configured.',
      );
      return false;
    }
  }

  bool get _isSupportedPlatform {
    if (kIsWeb) {
      return false;
    }

    return defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS;
  }

  bool get _isAuthenticated => _ref.read(clientProvider).auth.isAuthenticated;

  PushNotificationPlatform _resolvePlatform() {
    if (kIsWeb) {
      return PushNotificationPlatform.web;
    }

    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return PushNotificationPlatform.android;
      case TargetPlatform.iOS:
        return PushNotificationPlatform.ios;
      default:
        return PushNotificationPlatform.unknown;
    }
  }

  String? _normalizeToken(String? token) {
    final normalized = token?.trim();
    if (normalized == null || normalized.isEmpty) {
      return null;
    }
    return normalized;
  }

  int? _parsePositiveInt(Object? value) {
    final raw = value?.toString().trim();
    if (raw == null || raw.isEmpty) {
      return null;
    }

    final parsed = int.tryParse(raw);
    if (parsed == null || parsed <= 0) {
      return null;
    }

    return parsed;
  }
}
