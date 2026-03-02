import 'package:root_hub_server/src/core/ip_validation/ip_validation.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class WebAnalyticsClickTracker {
  const WebAnalyticsClickTracker();

  Future<void> track(Session session, Request request) async {
    try {
      final userAgent = request.headers.userAgent?.trim() ?? '';
      final deviceType = _parseDeviceType(userAgent);
      final osName = _parseOsName(userAgent);
      final browserName = _parseBrowserName(userAgent);
      final ipAddress = _extractIpAddress(request);
      final uri = request.url;
      final matchId = int.tryParse(uri.queryParameters['matchId'] ?? '');

      String? countryCode;
      String? countryName;
      String? city;
      if (ipAddress != null && ipAddress.isNotEmpty) {
        final ipLocation = await IpLocationService(
          apiKey: _readIpApiKey(session),
          onLog: (message) => session.log(message),
        ).resolveWithCache(session, ipAddress);

        countryCode = ipLocation.countryCode;
        countryName = ipLocation.countryName;
        city = ipLocation.city;
      }

      await WebAnalyticsClick.db.insertRow(
        session,
        WebAnalyticsClick(
          createdAt: DateTime.now(),
          requestPath: uri.path,
          requestQuery: uri.query.isEmpty ? null : uri.query,
          matchId: matchId,
          ipAddress: ipAddress,
          countryCode: countryCode,
          countryName: countryName,
          city: city,
          deviceType: deviceType,
          osName: osName,
          browserName: browserName,
          userAgent: userAgent.isEmpty ? null : userAgent,
        ),
      );
    } catch (error, stackTrace) {
      session.log(
        '[WebAnalyticsClickTracker] Failed to track click: $error',
        stackTrace: stackTrace,
      );
    }
  }

  String? _readIpApiKey(Session session) {
    final fromSession = session.passwords['ipApiIsKey'];
    if (fromSession is String && fromSession.trim().isNotEmpty) {
      return fromSession.trim();
    }
    return null;
  }

  String? _extractIpAddress(Request request) {
    final xForwardedFor = request.headers.xForwardedFor;
    if (xForwardedFor != null && xForwardedFor.addresses.isNotEmpty) {
      final firstAddress = xForwardedFor.addresses.first.trim();
      if (firstAddress.isNotEmpty && firstAddress.toLowerCase() != 'unknown') {
        return firstAddress;
      }
    }

    final remote = request.connectionInfo.remote.address.toString().trim();
    if (remote.isEmpty || remote == '::' || remote == '0.0.0.0') {
      return null;
    }

    return remote;
  }

  WebAnalyticsDeviceType _parseDeviceType(String userAgent) {
    final ua = userAgent.toLowerCase();

    if (ua.contains('android')) {
      return WebAnalyticsDeviceType.android;
    }

    if (ua.contains('iphone') || ua.contains('ipad') || ua.contains('ipod')) {
      return WebAnalyticsDeviceType.iphone;
    }

    if (ua.contains('macintosh') || ua.contains('mac os x')) {
      return WebAnalyticsDeviceType.macos;
    }

    if (ua.contains('windows')) {
      return WebAnalyticsDeviceType.windows;
    }

    if (ua.contains('linux') || ua.contains('x11')) {
      return WebAnalyticsDeviceType.linux;
    }

    return WebAnalyticsDeviceType.other;
  }

  String? _parseOsName(String userAgent) {
    final deviceType = _parseDeviceType(userAgent);

    return switch (deviceType) {
      WebAnalyticsDeviceType.android => 'Android',
      WebAnalyticsDeviceType.iphone => 'iOS',
      WebAnalyticsDeviceType.macos => 'macOS',
      WebAnalyticsDeviceType.windows => 'Windows',
      WebAnalyticsDeviceType.linux => 'Linux',
      WebAnalyticsDeviceType.other => null,
    };
  }

  String? _parseBrowserName(String userAgent) {
    final ua = userAgent.toLowerCase();
    if (ua.isEmpty) {
      return null;
    }

    if (ua.contains('edg/')) {
      return 'Edge';
    }
    if (ua.contains('opr/') || ua.contains('opera/')) {
      return 'Opera';
    }
    if (ua.contains('firefox/')) {
      return 'Firefox';
    }
    if (ua.contains('safari/') && !ua.contains('chrome/')) {
      return 'Safari';
    }
    if (ua.contains('chrome/')) {
      return 'Chrome';
    }

    return 'Other';
  }
}
