import 'dart:io';

import 'package:google_maps_apis/places_new.dart';
import 'package:root_hub_server/src/core/server_translations.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class GetMatchLocationPhoto extends Endpoint {
  @override
  bool get requireLogin => false;

  Future<String?> v1(
    Session session, {
    required ServerSupportedTranslation language,
    required String providerPlaceId,
    int maxWidthPx = 1200,
    int maxHeightPx = 420,
  }) async {
    // Keep locale resolution aligned with endpoint contracts even when
    // this endpoint returns a nullable value instead of localized errors.
    ServerTranslations.of(language);

    final normalizedPlaceId = providerPlaceId.trim();
    if (normalizedPlaceId.isEmpty) {
      return null;
    }

    final apiKey = _resolveGoogleMapsApiKey(session);
    if (apiKey == null || apiKey.isEmpty) {
      return null;
    }

    final normalizedMaxWidth = maxWidthPx.clamp(1, 4800);
    final normalizedMaxHeight = maxHeightPx.clamp(1, 4800);

    try {
      final placesApi = PlacesAPINew(apiKey: apiKey);
      final detailsResponse = await placesApi.getDetails(
        id: normalizedPlaceId,
        fields: const ['photos'],
      );

      if (!detailsResponse.isSuccessful || detailsResponse.body == null) {
        return null;
      }

      final photos = detailsResponse.body?.photos;
      if (photos == null || photos.isEmpty) {
        return null;
      }

      for (final photo in photos) {
        final photoName = photo.name?.trim();
        if (photoName == null || photoName.isEmpty) {
          continue;
        }

        final photoUriResponse = await placesApi.getPlainPhotoUrl(
          name: photoName,
          maxWidthPx: normalizedMaxWidth,
          maxHeightPx: normalizedMaxHeight,
        );

        final photoUri = photoUriResponse.body?.trim();
        if (photoUriResponse.isSuccessful &&
            photoUri != null &&
            photoUri.isNotEmpty) {
          return photoUri;
        }
      }
    } catch (_) {
      return null;
    }

    return null;
  }

  String? _resolveGoogleMapsApiKey(Session session) {
    final passwordValue = session.passwords['googleMapsApiKey'];
    final keyFromPasswords = passwordValue is String ? passwordValue : null;

    return (keyFromPasswords ?? Platform.environment['GOOGLE_MAPS_API_KEY'])
        ?.trim();
  }
}
