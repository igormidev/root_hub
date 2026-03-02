import 'package:root_hub_server/src/core/server_translations.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:root_hub_server/src/notifications/push_notification_dispatch_service.dart';
import 'package:root_hub_server/src/notifications/push_notification_recipient_language_resolver.dart';
import 'package:serverpod/serverpod.dart';

class NearbyMatchPushNotificationService {
  const NearbyMatchPushNotificationService._();

  static const double _kmPerDegreeLatitude = 110.574;
  static const double _kmPerDegreeLongitudeAtEquator = 111.320;
  static const double _minLongitudeKmPerDegree = 0.01;

  static Future<void> notifyPlayersForNewMatch(
    Session session, {
    required MatchSchedulePairingAttempt matchSchedule,
    required Location location,
    required PlayerData hostPlayerData,
  }) async {
    final scheduledMatchId = matchSchedule.id;
    final hostPlayerDataId = hostPlayerData.id;

    if (scheduledMatchId == null || hostPlayerDataId == null) {
      return;
    }

    final coordinates = await _resolveCoordinates(
      session,
      location: location,
    );
    if (coordinates == null) {
      session.log(
        '[PushNotifications] Nearby match dispatch skipped because the '
        'location has no coordinates. scheduledMatchId=$scheduledMatchId '
        'locationId=${location.id}',
        level: LogLevel.info,
      );
      return;
    }

    final nearbyPlayerIds = await _findNearbyInterestedPlayerDataIds(
      session,
      hostPlayerDataId: hostPlayerDataId,
      matchLatitude: coordinates.latitude,
      matchLongitude: coordinates.longitude,
    );
    if (nearbyPlayerIds.isEmpty) {
      return;
    }

    final recipientsByTranslation =
        await PushNotificationRecipientLanguageResolver.groupPlayerDataIds(
          session,
          playerDataIds: nearbyPlayerIds,
        );
    if (recipientsByTranslation.isEmpty) {
      return;
    }

    var attemptedCount = 0;
    var successCount = 0;
    var failureCount = 0;
    var invalidatedTokenCount = 0;

    for (final entry in recipientsByTranslation.entries) {
      final translation = entry.key;
      final translatedRecipients = entry.value;
      if (translatedRecipients.isEmpty) {
        continue;
      }

      final dispatchStats =
          await PushNotificationDispatchService.sendToPlayerDataIds(
            session,
            playerDataIds: translatedRecipients,
            title: _buildTitle(language: translation),
            body: _buildBody(
              language: translation,
              matchTitle: matchSchedule.title,
              locationName: coordinates.locationName,
            ),
            data: <String, String>{
              'type': 'nearby_match_schedule_created',
              'scheduledMatchId': '$scheduledMatchId',
            },
          );

      attemptedCount += dispatchStats.attemptedCount;
      successCount += dispatchStats.successCount;
      failureCount += dispatchStats.failureCount;
      invalidatedTokenCount += dispatchStats.invalidatedTokenCount;
    }

    if (attemptedCount == 0) {
      return;
    }

    session.log(
      '[PushNotifications] Nearby match dispatch completed. '
      'scheduledMatchId=$scheduledMatchId '
      'attempted=$attemptedCount '
      'success=$successCount '
      'failed=$failureCount '
      'invalidated=$invalidatedTokenCount',
      level: LogLevel.info,
    );
  }

  static Future<_LocationCoordinates?> _resolveCoordinates(
    Session session, {
    required Location location,
  }) async {
    final inlineGooglePlace = location.googlePlaceLocation;
    if (inlineGooglePlace != null) {
      return _LocationCoordinates.fromGooglePlace(inlineGooglePlace);
    }

    final locationId = location.id;
    if (locationId == null) {
      return null;
    }

    final hydratedLocation = await Location.db.findById(
      session,
      locationId,
      include: Location.include(
        googlePlaceLocation: GooglePlaceLocation.include(),
      ),
    );
    final hydratedGooglePlace = hydratedLocation?.googlePlaceLocation;
    if (hydratedGooglePlace == null) {
      return null;
    }

    return _LocationCoordinates.fromGooglePlace(hydratedGooglePlace);
  }

  static Future<Set<int>> _findNearbyInterestedPlayerDataIds(
    Session session, {
    required int hostPlayerDataId,
    required double matchLatitude,
    required double matchLongitude,
  }) async {
    final result = await session.db.unsafeQuery(
      '''
      SELECT pd.id AS player_data_id
      FROM player_data pd
      INNER JOIN geo_locations gl ON gl.id = pd."currentLocationId"
      WHERE pd.id IS NOT NULL
        AND pd.id <> @hostPlayerDataId
        AND gl."ratio" > 0
        AND gl."x" BETWEEN -90 AND 90
        AND gl."y" BETWEEN -180 AND 180
        AND ABS(gl."x" - @matchLatitude) <= (gl."ratio" / @kmPerDegreeLatitude)
        AND (
          CASE
            WHEN ABS(gl."y" - @matchLongitude) <= 180
              THEN ABS(gl."y" - @matchLongitude)
            ELSE 360 - ABS(gl."y" - @matchLongitude)
          END
        ) <= (
          gl."ratio" / GREATEST(
            @kmPerDegreeLongitudeAtEquator * ABS(COS(RADIANS(gl."x"))),
            @minLongitudeKmPerDegree
          )
        )
        AND EXISTS (
          SELECT 1
          FROM player_push_notification_token token
          WHERE token."playerDataId" = pd.id
            AND token."isActive" = true
        )
      ''',
      parameters: QueryParameters.named(
        <String, Object?>{
          'hostPlayerDataId': hostPlayerDataId,
          'matchLatitude': matchLatitude,
          'matchLongitude': matchLongitude,
          'kmPerDegreeLatitude': _kmPerDegreeLatitude,
          'kmPerDegreeLongitudeAtEquator': _kmPerDegreeLongitudeAtEquator,
          'minLongitudeKmPerDegree': _minLongitudeKmPerDegree,
        },
      ),
    );

    final playerIds = <int>{};
    for (final row in result) {
      final rawValue = row.toColumnMap()['player_data_id'];
      if (rawValue is int && rawValue > 0) {
        playerIds.add(rawValue);
      } else if (rawValue is BigInt && rawValue > BigInt.zero) {
        playerIds.add(rawValue.toInt());
      } else if (rawValue is num && rawValue > 0) {
        playerIds.add(rawValue.toInt());
      }
    }
    return playerIds;
  }

  static String _buildTitle({
    required ServerSupportedTranslation language,
  }) {
    final t = ServerTranslations.of(language);
    return t.pushNotifications.nearbyMatch.newTableNearYouTitle;
  }

  static String _buildBody({
    required ServerSupportedTranslation language,
    required String matchTitle,
    required String locationName,
  }) {
    final t = ServerTranslations.of(language);
    final normalizedTitle = matchTitle.trim();
    final normalizedLocation = locationName.trim();

    if (normalizedTitle.isNotEmpty && normalizedLocation.isNotEmpty) {
      return t.pushNotifications.nearbyMatch.tableScheduledAtLocation(
        matchTitle: normalizedTitle,
        locationName: normalizedLocation,
      );
    }

    if (normalizedTitle.isNotEmpty) {
      return t.pushNotifications.nearbyMatch.tableScheduledNearby(
        matchTitle: normalizedTitle,
      );
    }

    if (normalizedLocation.isNotEmpty) {
      return t.pushNotifications.nearbyMatch.newTableScheduledNearLocation(
        locationName: normalizedLocation,
      );
    }

    return t.pushNotifications.nearbyMatch.newTableScheduledInSearchArea;
  }
}

class _LocationCoordinates {
  const _LocationCoordinates({
    required this.latitude,
    required this.longitude,
    required this.locationName,
  });

  final double latitude;
  final double longitude;
  final String locationName;

  static _LocationCoordinates? fromGooglePlace(
    GooglePlaceLocation googlePlace,
  ) {
    final latitude = googlePlace.lat;
    final longitude = googlePlace.lng;

    if (!latitude.isFinite || !longitude.isFinite) {
      return null;
    }

    return _LocationCoordinates(
      latitude: latitude,
      longitude: longitude,
      locationName: googlePlace.name,
    );
  }
}
