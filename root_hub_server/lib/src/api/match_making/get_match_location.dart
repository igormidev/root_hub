import 'dart:io';

import 'package:google_maps_apis/places_new.dart';
import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:root_hub_server/src/core/server_translations.dart';
import 'package:root_hub_server/src/core/settings.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class GetMatchLocation extends Endpoint {
  @override
  bool get requireLogin => false;

  static const List<String> _placesSearchFieldMask = [
    'places.id',
    'places.displayName',
    'places.formattedAddress',
    'places.shortFormattedAddress',
    'places.location',
    'places.googleMapsUri',
    'places.websiteUri',
    'places.internationalPhoneNumber',
    'places.nationalPhoneNumber',
    'places.types',
    'places.primaryType',
    'places.rating',
    'places.userRatingCount',
    'places.priceLevel',
    'places.utcOffsetMinutes',
    'places.photos',
    'nextPageToken',
  ];

  Future<List<Location>> v1(
    Session session, {
    required ServerSupportedTranslation language,
    required String query,
    required int page,
  }) async {
    final t = ServerTranslations.of(language);

    return guardRootHubEndpointErrors(
      () async {
        final normalizedQuery = query.trim();
        if (normalizedQuery.isEmpty) {
          throw RootHubEndpointError.invalidRequest(
            language: language,
            description: t.errors.queryMustNotBeEmpty,
          );
        }
        if (page < 1) {
          throw RootHubEndpointError.invalidRequest(
            language: language,
            description: t.errors.pageMustBeAtLeastOne,
          );
        }

        final placesApi = PlacesAPINew(
          apiKey: _resolveGoogleMapsApiKey(
            session,
            language: language,
          ),
        );

        String? nextPageToken;
        for (var currentPage = 1; currentPage <= page; currentPage++) {
          final response = await placesApi.searchText(
            fields: _placesSearchFieldMask,
            filter: TextSearchFilter(
              textQuery: normalizedQuery,
              pageSize: RootHubSettings.pageSizeLocations,
              pageToken: nextPageToken,
              includePureServiceAreaBusinesses: false,
            ),
          );

          final placesResponse = _parseSearchResponse(
            response,
            language: language,
            requestedPage: currentPage,
          );
          final persistedPageLocations = await _upsertPlaces(
            session,
            placesResponse.places,
          );

          if (currentPage == page) {
            return persistedPageLocations;
          }

          final token = placesResponse.nextPageToken?.trim();
          if (token == null || token.isEmpty) {
            throw RootHubEndpointError.invalidRequest(
              language: language,
              description: t.errors.placesPageOutOfRange(
                page: page,
                query: normalizedQuery,
              ),
            );
          }
          nextPageToken = token;
        }

        return const <Location>[];
      },
      language: language,
      fallbackDescription: t.fallback.unableToFetchLocations,
    );
  }

  PlacesResponse _parseSearchResponse(
    GoogleHTTPResponse<PlacesResponse?> response, {
    required ServerSupportedTranslation language,
    required int requestedPage,
  }) {
    final t = ServerTranslations.of(language);

    if (response.isSuccessful && response.body != null) {
      return response.body!;
    }

    final message = response.error?.error?.message?.trim().isNotEmpty == true
        ? response.error!.error!.message!
        : t.errors.googlePlacesRequestFailedWithHttp(
            statusCode: response.statusCode,
          );
    throw RootHubEndpointError.unexpected(
      language: language,
      title: t.errors.locationProviderErrorTitle,
      description: t.errors.failedToFetchMatchLocations(
        requestedPage: requestedPage,
        message: message,
      ),
    );
  }

  Future<List<Location>> _upsertPlaces(
    Session session,
    List<Place> places,
  ) async {
    final snapshots = <_LocationSnapshot>[];
    for (final place in places) {
      final snapshot = _LocationSnapshot.fromPlace(place);
      if (snapshot != null) {
        snapshots.add(snapshot);
      }
    }

    if (snapshots.isEmpty) {
      return const <Location>[];
    }

    final uniqueSnapshotsByPlaceId = <String, _LocationSnapshot>{};
    for (final snapshot in snapshots) {
      uniqueSnapshotsByPlaceId.putIfAbsent(
        snapshot.providerPlaceId,
        () => snapshot,
      );
    }

    final now = DateTime.now();
    final existingGoogleRows = await GooglePlaceLocation.db.find(
      session,
      where: (t) =>
          t.providerPlaceId.inSet(uniqueSnapshotsByPlaceId.keys.toSet()),
    );
    final existingGoogleByPlaceId = {
      for (final row in existingGoogleRows) row.providerPlaceId: row,
    };

    final googleRowsToInsert = <GooglePlaceLocation>[];
    final googleRowsToUpdate = <GooglePlaceLocation>[];

    for (final snapshot in uniqueSnapshotsByPlaceId.values) {
      final existingGoogle = existingGoogleByPlaceId[snapshot.providerPlaceId];
      if (existingGoogle == null) {
        googleRowsToInsert.add(
          GooglePlaceLocation(
            providerPlaceId: snapshot.providerPlaceId,
            name: snapshot.name,
            formattedAddress: snapshot.formattedAddress,
            shortFormattedAddress: snapshot.shortFormattedAddress,
            lat: snapshot.lat,
            lng: snapshot.lng,
            url: snapshot.url,
            websiteUri: snapshot.websiteUri,
            phoneNumber: snapshot.phoneNumber,
            types: snapshot.types,
            primaryType: snapshot.primaryType,
            rating: snapshot.rating,
            userRatingCount: snapshot.userRatingCount,
            priceLevel: snapshot.priceLevel,
            primaryPhotoName: snapshot.primaryPhotoName,
            timezone: snapshot.timezone,
            isPublicPlace: true,
            createdAt: now,
            updatedAt: now,
          ),
        );
      } else {
        googleRowsToUpdate.add(
          existingGoogle.copyWith(
            name: snapshot.name,
            formattedAddress: snapshot.formattedAddress,
            shortFormattedAddress: snapshot.shortFormattedAddress,
            lat: snapshot.lat,
            lng: snapshot.lng,
            url: snapshot.url,
            websiteUri: snapshot.websiteUri,
            phoneNumber: snapshot.phoneNumber,
            types: snapshot.types,
            primaryType: snapshot.primaryType,
            rating: snapshot.rating,
            userRatingCount: snapshot.userRatingCount,
            priceLevel: snapshot.priceLevel,
            primaryPhotoName: snapshot.primaryPhotoName,
            timezone: snapshot.timezone,
            updatedAt: now,
          ),
        );
      }
    }

    final persistedGoogleByPlaceId = <String, GooglePlaceLocation>{
      for (final row in existingGoogleRows) row.providerPlaceId: row,
    };
    if (googleRowsToInsert.isNotEmpty) {
      final insertedRows = await GooglePlaceLocation.db.insert(
        session,
        googleRowsToInsert,
      );
      for (final row in insertedRows) {
        persistedGoogleByPlaceId[row.providerPlaceId] = row;
      }
    }
    if (googleRowsToUpdate.isNotEmpty) {
      final updatedRows = await GooglePlaceLocation.db.update(
        session,
        googleRowsToUpdate,
      );
      for (final row in updatedRows) {
        persistedGoogleByPlaceId[row.providerPlaceId] = row;
      }
    }

    final googlePlaceLocationIds = persistedGoogleByPlaceId.values
        .map((row) => row.id)
        .whereType<int>()
        .toSet();

    final existingLocationRows = googlePlaceLocationIds.isEmpty
        ? const <Location>[]
        : await Location.db.find(
            session,
            where: (t) => t.googlePlaceLocationId.inSet(googlePlaceLocationIds),
          );
    final existingLocationByGoogleId = {
      for (final row in existingLocationRows)
        if (row.googlePlaceLocationId != null) row.googlePlaceLocationId!: row,
    };

    final googleRowsNeedingWrapper = <GooglePlaceLocation>[];
    for (final googleRow in persistedGoogleByPlaceId.values) {
      final googleId = googleRow.id;
      if (googleId == null) {
        continue;
      }
      if (existingLocationByGoogleId.containsKey(googleId)) {
        continue;
      }
      googleRowsNeedingWrapper.add(googleRow);
    }

    if (googleRowsNeedingWrapper.isNotEmpty) {
      await session.db.transaction((transaction) async {
        for (final googleRow in googleRowsNeedingWrapper) {
          final wrapperLocation = await Location.db.insertRow(
            session,
            Location(),
            transaction: transaction,
          );
          await Location.db.attachRow.googlePlaceLocation(
            session,
            wrapperLocation,
            googleRow,
            transaction: transaction,
          );
        }
      });
    }

    final allLocationsForGoogle = googlePlaceLocationIds.isEmpty
        ? const <Location>[]
        : await Location.db.find(
            session,
            where: (t) => t.googlePlaceLocationId.inSet(googlePlaceLocationIds),
            include: Location.include(
              googlePlaceLocation: GooglePlaceLocation.include(),
            ),
          );
    final locationByGoogleProviderPlaceId = <String, Location>{};
    for (final location in allLocationsForGoogle) {
      final placeId = location.googlePlaceLocation?.providerPlaceId;
      if (placeId != null && placeId.isNotEmpty) {
        locationByGoogleProviderPlaceId[placeId] = location;
      }
    }

    final orderedRows = <Location>[];
    final seen = <String>{};
    for (final snapshot in snapshots) {
      if (!seen.add(snapshot.providerPlaceId)) {
        continue;
      }
      final persisted =
          locationByGoogleProviderPlaceId[snapshot.providerPlaceId];
      if (persisted != null) {
        orderedRows.add(persisted);
      }
    }

    return orderedRows;
  }

  String _resolveGoogleMapsApiKey(
    Session session, {
    required ServerSupportedTranslation language,
  }) {
    final t = ServerTranslations.of(language);

    final passwordValue = session.passwords['googleMapsApiKey'];
    final keyFromPasswords = passwordValue is String ? passwordValue : null;
    final key =
        (keyFromPasswords ?? Platform.environment['GOOGLE_MAPS_API_KEY'])
            ?.trim();

    if (key == null || key.isEmpty) {
      throw RootHubEndpointError.configuration(
        language: language,
        description: t.errors.googleMapsApiKeyNotConfigured,
      );
    }

    return key;
  }
}

class _LocationSnapshot {
  _LocationSnapshot({
    required this.providerPlaceId,
    required this.name,
    this.formattedAddress,
    this.shortFormattedAddress,
    required this.lat,
    required this.lng,
    this.url,
    this.websiteUri,
    this.phoneNumber,
    this.types,
    this.primaryType,
    this.rating,
    this.userRatingCount,
    this.priceLevel,
    this.primaryPhotoName,
    this.timezone,
  });

  final String providerPlaceId;
  final String name;
  final String? formattedAddress;
  final String? shortFormattedAddress;
  final double lat;
  final double lng;
  final String? url;
  final String? websiteUri;
  final String? phoneNumber;
  final List<String>? types;
  final String? primaryType;
  final double? rating;
  final int? userRatingCount;
  final String? priceLevel;
  final String? primaryPhotoName;
  final String? timezone;

  static _LocationSnapshot? fromPlace(Place place) {
    final placeId = place.id?.trim();
    final lat = place.location?.latitude;
    final lng = place.location?.longitude;

    if (placeId == null || placeId.isEmpty || lat == null || lng == null) {
      return null;
    }

    final displayName = place.displayName?.text?.trim();
    final name = (displayName?.isNotEmpty == true)
        ? displayName!
        : (place.shortFormattedAddress?.trim().isNotEmpty == true
              ? place.shortFormattedAddress!.trim()
              : (place.formattedAddress?.trim().isNotEmpty == true
                    ? place.formattedAddress!.trim()
                    : placeId));

    final types = place.types
        ?.map((e) => e.name)
        .where((e) => e.isNotEmpty)
        .toSet()
        .toList();

    String? primaryPhotoName;
    final photos = place.photos;
    if (photos != null) {
      for (final photo in photos) {
        final candidate = photo.name?.trim();
        if (candidate != null && candidate.isNotEmpty) {
          primaryPhotoName = candidate;
          break;
        }
      }
    }

    return _LocationSnapshot(
      providerPlaceId: placeId,
      name: name,
      formattedAddress: place.formattedAddress?.trim(),
      shortFormattedAddress: place.shortFormattedAddress?.trim(),
      lat: lat,
      lng: lng,
      url: place.googleMapsUri?.trim(),
      websiteUri: place.websiteUri?.trim(),
      phoneNumber:
          place.internationalPhoneNumber?.trim() ??
          place.nationalPhoneNumber?.trim(),
      types: types == null || types.isEmpty ? null : types,
      primaryType: place.primaryType?.name,
      rating: place.rating,
      userRatingCount: place.userRatingCount,
      priceLevel: place.priceLevel?.name,
      primaryPhotoName: primaryPhotoName,
      timezone: _toUtcOffsetString(place.utcOffsetMinutes),
    );
  }

  static String? _toUtcOffsetString(int? utcOffsetMinutes) {
    if (utcOffsetMinutes == null) {
      return null;
    }

    final isNegative = utcOffsetMinutes.isNegative;
    final absolute = utcOffsetMinutes.abs();
    final hours = (absolute ~/ 60).toString().padLeft(2, '0');
    final minutes = (absolute % 60).toString().padLeft(2, '0');
    final sign = isNegative ? '-' : '+';
    return 'UTC$sign$hours:$minutes';
  }
}
