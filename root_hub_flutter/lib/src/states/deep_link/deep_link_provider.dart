import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:root_hub_flutter/src/core/utils/talker.dart';
import 'package:root_hub_flutter/src/states/deep_link/deep_link_state.dart';

class DeepLinkNotifier extends Notifier<DeepLinkState> {
  AppLinks? _appLinks;
  StreamSubscription<Uri>? _uriLinkSubscription;
  bool _isInitializing = false;

  @override
  DeepLinkState build() {
    ref.onDispose(() {
      unawaited(_uriLinkSubscription?.cancel());
    });
    return const DeepLinkState();
  }

  Future<void> ensureInitialized() async {
    if (state.isInitialized || _isInitializing) {
      return;
    }

    _isInitializing = true;
    _appLinks ??= AppLinks();

    try {
      final initialUri = await _appLinks!.getInitialLink();
      if (initialUri != null) {
        _processDeepLinkUri(initialUri);
      }

      _uriLinkSubscription ??= _appLinks!.uriLinkStream.listen(
        _processDeepLinkUri,
        onError: (Object error, StackTrace stackTrace) {
          talker.handle(error, stackTrace, '[DeepLink] Failed to parse URI');
        },
      );

      state = state.copyWith(isInitialized: true);
    } catch (error, stackTrace) {
      talker.handle(error, stackTrace, '[DeepLink] Initialization failed');
      state = state.copyWith(isInitialized: true);
    } finally {
      _isInitializing = false;
    }
  }

  void consumePendingMatchId(int matchId) {
    if (state.pendingMatchId != matchId) {
      return;
    }

    state = state.copyWith(pendingMatchId: null);
  }

  void _processDeepLinkUri(Uri uri) {
    final matchId = _extractMatchId(uri);
    if (matchId == null || matchId <= 0) {
      return;
    }

    state = state.copyWith(
      pendingMatchId: matchId,
      lastReceivedUri: uri,
    );
  }

  int? _extractMatchId(Uri uri) {
    final queryKeys = <String>[
      'matchId',
      'match',
      'm',
    ];

    for (final key in queryKeys) {
      final queryValue = int.tryParse(uri.queryParameters[key] ?? '');
      if (queryValue != null && queryValue > 0) {
        return queryValue;
      }
    }

    final pathSegments = uri.pathSegments
        .where((segment) => segment.isNotEmpty)
        .toList();
    if (uri.scheme == 'roothub' && pathSegments.isNotEmpty) {
      final firstSegmentId = int.tryParse(pathSegments.first);
      if (firstSegmentId != null && firstSegmentId > 0) {
        return firstSegmentId;
      }
    }

    final joinIndex = pathSegments.indexOf('join');
    if (joinIndex >= 0 && pathSegments.length > joinIndex + 1) {
      final nextSegmentId = int.tryParse(pathSegments[joinIndex + 1]);
      if (nextSegmentId != null && nextSegmentId > 0) {
        return nextSegmentId;
      }
    }

    return null;
  }
}

final deepLinkProvider = NotifierProvider<DeepLinkNotifier, DeepLinkState>(
  DeepLinkNotifier.new,
);
