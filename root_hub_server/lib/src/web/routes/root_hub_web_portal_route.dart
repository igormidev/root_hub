import 'dart:async';
import 'dart:io';

import 'package:root_hub_server/src/web/services/web_analytics_click_tracker.dart';
import 'package:serverpod/serverpod.dart';

class RootHubWebPortalRoute extends Route {
  RootHubWebPortalRoute(
    this.directory, {
    File? fallback,
    WebAnalyticsClickTracker? clickTracker,
    this.cacheControlFactory,
    this.cacheBustingConfig,
  }) : fallback = fallback ?? File('${directory.path}/index.html'),
       _clickTracker = clickTracker ?? const WebAnalyticsClickTracker(),
       super(methods: const {Method.get, Method.head});

  final Directory directory;
  final File fallback;
  final CacheControlFactory? cacheControlFactory;
  final CacheBustingConfig? cacheBustingConfig;
  final WebAnalyticsClickTracker _clickTracker;

  @override
  void injectIn(RelicRouter router) {
    final subRouter = Router<Handler>();

    subRouter.use('/', _trackingMiddleware);
    subRouter.use(
      '/',
      FallbackMiddleware(
        fallback: StaticRoute.file(fallback),
        on: (response) => response.statusCode == 404,
      ).call,
    );

    StaticRoute.directory(
      directory,
      cacheBustingConfig: cacheBustingConfig,
      cacheControlFactory: cacheControlFactory ?? (_, _) => null,
    ).injectIn(subRouter);

    router.attach('/', subRouter);
  }

  @override
  FutureOr<Result> handleCall(Session session, Request request) {
    throw UnimplementedError(
      'RootHubWebPortalRoute handles routing via injectIn and should not be called directly',
    );
  }

  Handler _trackingMiddleware(Handler next) {
    return (request) async {
      if (_shouldTrackRequest(request)) {
        try {
          final session = await request.session;
          await _clickTracker.track(session, request);
        } catch (_) {
          // Ignore analytics tracking errors to keep the redirect path resilient.
        }
      }

      return next(request);
    };
  }

  bool _shouldTrackRequest(Request request) {
    if (request.method != Method.get) {
      return false;
    }

    final path = request.url.path.toLowerCase();
    if (path.contains('/analytics')) {
      return false;
    }

    const staticExtensions = <String>{
      '.js',
      '.css',
      '.ico',
      '.svg',
      '.png',
      '.jpg',
      '.jpeg',
      '.gif',
      '.webp',
      '.map',
      '.json',
      '.txt',
      '.woff',
      '.woff2',
      '.ttf',
      '.otf',
    };

    for (final extension in staticExtensions) {
      if (path.endsWith(extension)) {
        return false;
      }
    }

    return true;
  }
}
