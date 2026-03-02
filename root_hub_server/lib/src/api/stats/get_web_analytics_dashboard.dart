import 'package:root_hub_server/src/core/settings.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class GetWebAnalyticsDashboard extends Endpoint {
  static const _dashboardPassword = '4FdskJCMwu7%fExgh%s';

  Future<WebAnalyticsDashboard> v1(
    Session session, {
    required ServerSupportedTranslation language,
    required String password,
    required int page,
  }) async {
    // Endpoint contract requires language. The admin panel itself is currently
    // language-agnostic and renders labels client-side.
    if (language == ServerSupportedTranslation.english) {
      // no-op
    }

    final sanitizedPage = page < 1 ? 1 : page;
    if (!_isPasswordValid(password)) {
      return _emptyDashboard(sanitizedPage);
    }

    final pageSize = RootHubSettings.pageSizeWebAnalyticsClicks;
    final totalClicks = await WebAnalyticsClick.db.count(session);

    final paginatedClicks = await WebAnalyticsClick.db.find(
      session,
      orderBy: (t) => t.createdAt,
      orderDescending: true,
      limit: pageSize,
      offset: (sanitizedPage - 1) * pageSize,
    );

    final countryMetrics = await _loadCountryMetrics(session);
    final deviceMetrics = await _loadDeviceMetrics(session);
    final timeline = await _loadTimeline(session);

    final totalPages = totalClicks == 0 ? 0 : (totalClicks / pageSize).ceil();

    return WebAnalyticsDashboard(
      isAuthorized: true,
      totalClicks: totalClicks,
      uniqueCountries: countryMetrics.length,
      uniqueDevices: deviceMetrics.length,
      countryMetrics: countryMetrics,
      deviceMetrics: deviceMetrics,
      timeline: timeline,
      clicksPagination: WebAnalyticsClicksPagination(
        clicks: paginatedClicks.map(_mapClick).toList(),
        paginationMetadata: PaginationMetadata(
          currentPage: sanitizedPage,
          itemsInCurrentPageCount: paginatedClicks.length,
          totalItemsCount: totalClicks,
          totalPagesCount: totalPages,
          hasNextPage: totalPages > 0 && sanitizedPage < totalPages,
          hasPreviousPage: sanitizedPage > 1,
        ),
      ),
    );
  }

  bool _isPasswordValid(String password) {
    return password == _dashboardPassword;
  }

  WebAnalyticsDashboard _emptyDashboard(int page) {
    return WebAnalyticsDashboard(
      isAuthorized: false,
      totalClicks: 0,
      uniqueCountries: 0,
      uniqueDevices: 0,
      countryMetrics: const <WebAnalyticsMetricItem>[],
      deviceMetrics: const <WebAnalyticsMetricItem>[],
      timeline: const <WebAnalyticsTimelinePoint>[],
      clicksPagination: WebAnalyticsClicksPagination(
        clicks: const <WebAnalyticsClickItem>[],
        paginationMetadata: PaginationMetadata(
          currentPage: page,
          itemsInCurrentPageCount: 0,
          totalItemsCount: 0,
          totalPagesCount: 0,
          hasNextPage: false,
          hasPreviousPage: false,
        ),
      ),
    );
  }

  WebAnalyticsClickItem _mapClick(WebAnalyticsClick click) {
    return WebAnalyticsClickItem(
      clickId: click.id!,
      clickedAt: click.createdAt,
      matchId: click.matchId,
      countryCode: click.countryCode,
      countryName: click.countryName,
      city: click.city,
      deviceType: click.deviceType,
      osName: click.osName,
      browserName: click.browserName,
      requestPath: click.requestPath,
      requestQuery: click.requestQuery,
      ipAddress: click.ipAddress,
    );
  }

  Future<List<WebAnalyticsMetricItem>> _loadCountryMetrics(
    Session session,
  ) async {
    final queryResult = await session.db.unsafeQuery('''
      SELECT
        COALESCE(NULLIF("countryCode", ''), 'unknown') AS country_code,
        COALESCE(
          NULLIF(MAX("countryName"), ''),
          COALESCE(NULLIF(MAX("countryCode"), ''), 'unknown')
        ) AS country_name,
        COUNT(*)::bigint AS click_count
      FROM web_analytics_click
      GROUP BY COALESCE(NULLIF("countryCode", ''), 'unknown')
      ORDER BY click_count DESC
    ''');

    return queryResult.map((row) {
      final rowMap = row.toColumnMap();
      final key = rowMap['country_code']?.toString() ?? 'unknown';
      final label = rowMap['country_name']?.toString() ?? key;
      final count = _toInt(rowMap['click_count']);

      return WebAnalyticsMetricItem(
        key: key,
        label: label,
        count: count,
      );
    }).toList();
  }

  Future<List<WebAnalyticsMetricItem>> _loadDeviceMetrics(
    Session session,
  ) async {
    final queryResult = await session.db.unsafeQuery('''
      SELECT
        "deviceType"::text AS device_type,
        COUNT(*)::bigint AS click_count
      FROM web_analytics_click
      GROUP BY "deviceType"
      ORDER BY click_count DESC
    ''');

    return queryResult.map((row) {
      final rowMap = row.toColumnMap();
      final rawDeviceType = rowMap['device_type']?.toString() ?? 'other';
      final count = _toInt(rowMap['click_count']);

      return WebAnalyticsMetricItem(
        key: rawDeviceType,
        label: rawDeviceType,
        count: count,
      );
    }).toList();
  }

  Future<List<WebAnalyticsTimelinePoint>> _loadTimeline(
    Session session,
  ) async {
    final queryResult = await session.db.unsafeQuery('''
      SELECT
        date_trunc('hour', "createdAt") AS hour_bucket,
        COUNT(*)::bigint AS click_count
      FROM web_analytics_click
      WHERE "createdAt" >= (NOW() - INTERVAL '7 days')
      GROUP BY hour_bucket
      ORDER BY hour_bucket ASC
    ''');

    return queryResult.map((row) {
      final rowMap = row.toColumnMap();
      final rawBucket = rowMap['hour_bucket'];

      DateTime bucketStart;
      if (rawBucket is DateTime) {
        bucketStart = rawBucket;
      } else {
        bucketStart =
            DateTime.tryParse(rawBucket?.toString() ?? '') ??
            DateTime.fromMillisecondsSinceEpoch(0, isUtc: true);
      }

      return WebAnalyticsTimelinePoint(
        bucketStart: bucketStart,
        count: _toInt(rowMap['click_count']),
      );
    }).toList();
  }

  int _toInt(Object? value) {
    return switch (value) {
      int typedInt => typedInt,
      BigInt bigIntValue => bigIntValue.toInt(),
      num number => number.toInt(),
      String asString => int.tryParse(asString) ?? 0,
      _ => 0,
    };
  }
}
