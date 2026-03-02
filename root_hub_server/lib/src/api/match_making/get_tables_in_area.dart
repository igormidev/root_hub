import 'dart:math' as math;

import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:root_hub_server/src/core/server_translations.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class GetTablesInArea extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<List<MatchSchedulePairingAttempt>> v1(
    Session session, {
    required ServerSupportedTranslation language,
  }) async {
    final t = ServerTranslations.of(language);

    return guardRootHubEndpointErrors(
      () async {
        final userIdentifier = session.authenticated!.userIdentifier;
        final authUserId = UuidValue.fromString(userIdentifier);

        final playerData = await PlayerData.db.findFirstRow(
          session,
          where: (t) => t.authUserId.equals(authUserId),
          include: PlayerData.include(
            currentLocation: GeoLocation.include(),
          ),
        );

        if (playerData == null) {
          throw RootHubEndpointError.notFound(
            language: language,
            title: t.errors.playerProfileMissingTitle,
            description: t.errors.playerProfileNotFoundForAuthenticatedUser,
          );
        }

        final currentLocation = playerData.currentLocation;
        if (currentLocation == null) {
          throw RootHubEndpointError.invalidRequest(
            language: language,
            description: t.errors.currentLocationRequiredToFetchNearby,
          );
        }

        if (currentLocation.ratio <= 0) {
          throw RootHubEndpointError.invalidRequest(
            language: language,
            description: t.errors.locationRatioMustBeGreaterThanZero,
          );
        }

        final bounds = _GeoBoundingBox.fromCenter(
          centerLatitude: currentLocation.x,
          centerLongitude: currentLocation.y,
          radiusKm: currentLocation.ratio,
        );

        final googleLocationRows = await GooglePlaceLocation.db.find(
          session,
          where: (t) =>
              t.lat.between(bounds.minLatitude, bounds.maxLatitude) &
              bounds.longitudeExpression(t.lng),
        );

        final googlePlaceLocationIds = googleLocationRows
            .map((row) => row.id)
            .whereType<int>()
            .toSet();

        if (googlePlaceLocationIds.isEmpty) {
          return const <MatchSchedulePairingAttempt>[];
        }

        final locationRows = await Location.db.find(
          session,
          where: (t) => t.googlePlaceLocationId.inSet(googlePlaceLocationIds),
        );

        final locationIds = locationRows
            .map((row) => row.id)
            .whereType<int>()
            .toSet();

        if (locationIds.isEmpty) {
          return const <MatchSchedulePairingAttempt>[];
        }

        final oldestAllowedScheduleStart = DateTime.now().subtract(
          const Duration(hours: 2),
        );

        final candidateSchedules = await MatchSchedulePairingAttempt.db.find(
          session,
          where: (t) =>
              t.locationId.inSet(locationIds) &
              t.status.equals(MatchScheduleStatus.scheduled) &
              (t.attemptedAt >= oldestAllowedScheduleStart),
          orderBy: (t) => t.attemptedAt,
          include: MatchSchedulePairingAttempt.include(
            location: Location.include(
              googlePlaceLocation: GooglePlaceLocation.include(),
              manualInputLocation: ManualInputLocation.include(),
            ),
            host: PlayerData.include(),
            subscriptions: MatchSubscription.includeList(),
          ),
        );

        if (candidateSchedules.isEmpty) {
          return const <MatchSchedulePairingAttempt>[];
        }

        return candidateSchedules;
      },
      language: language,
      fallbackDescription: t.fallback.unableToLoadNearbyMatchSchedules,
    );
  }
}

class _GeoBoundingBox {
  _GeoBoundingBox({
    required this.minLatitude,
    required this.maxLatitude,
    required this.minLongitude,
    required this.maxLongitude,
    required this.crossesDateLine,
  });

  static const double _kmPerDegreeLatitude = 110.574;
  static const double _kmPerDegreeLongitudeAtEquator = 111.320;

  final double minLatitude;
  final double maxLatitude;
  final double minLongitude;
  final double maxLongitude;
  final bool crossesDateLine;

  Expression<dynamic> longitudeExpression(ColumnDouble longitudeColumn) {
    if (!crossesDateLine) {
      return longitudeColumn.between(minLongitude, maxLongitude);
    }

    return (longitudeColumn >= minLongitude) |
        (longitudeColumn <= maxLongitude);
  }

  static _GeoBoundingBox fromCenter({
    required double centerLatitude,
    required double centerLongitude,
    required double radiusKm,
  }) {
    final normalizedCenterLongitude = _normalizeLongitude(centerLongitude);
    final latitudeDelta = radiusKm / _kmPerDegreeLatitude;

    final minLatitude = (centerLatitude - latitudeDelta).clamp(-90.0, 90.0);
    final maxLatitude = (centerLatitude + latitudeDelta).clamp(-90.0, 90.0);

    final cosLatitude = math.cos(_degreesToRadians(centerLatitude)).abs();
    final kmPerDegreeLongitude = _kmPerDegreeLongitudeAtEquator * cosLatitude;

    if (kmPerDegreeLongitude < 1e-9) {
      return _GeoBoundingBox(
        minLatitude: minLatitude,
        maxLatitude: maxLatitude,
        minLongitude: -180.0,
        maxLongitude: 180.0,
        crossesDateLine: false,
      );
    }

    final longitudeDelta = radiusKm / kmPerDegreeLongitude;
    final rawMinLongitude = normalizedCenterLongitude - longitudeDelta;
    final rawMaxLongitude = normalizedCenterLongitude + longitudeDelta;

    final crossesDateLine = rawMinLongitude < -180.0 || rawMaxLongitude > 180.0;

    return _GeoBoundingBox(
      minLatitude: minLatitude,
      maxLatitude: maxLatitude,
      minLongitude: _normalizeLongitude(rawMinLongitude),
      maxLongitude: _normalizeLongitude(rawMaxLongitude),
      crossesDateLine: crossesDateLine,
    );
  }

  static double _degreesToRadians(double degrees) {
    return degrees * (math.pi / 180.0);
  }

  static double _normalizeLongitude(double longitude) {
    var normalized = longitude;
    while (normalized < -180.0) {
      normalized += 360.0;
    }
    while (normalized > 180.0) {
      normalized -= 360.0;
    }
    return normalized;
  }
}
