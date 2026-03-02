import 'dart:convert';
import 'dart:io';

import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:root_hub_server/src/core/server_translations.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class ReverseGeocodeCity extends Endpoint {
  @override
  bool get requireLogin => false;

  static const _googleGeocodeHost = 'maps.googleapis.com';
  static const _googleGeocodePath = '/maps/api/geocode/json';

  Future<ReverseGeocodeCityResult?> v1(
    Session session, {
    required ServerSupportedTranslation language,
    required double x,
    required double y,
  }) async {
    final t = ServerTranslations.of(language);

    return guardRootHubEndpointErrors(
      () async {
        _validateCoordinates(
          language: language,
          x: x,
          y: y,
        );

        final geocodeResponse = await _fetchGeocodeResponse(
          language: language,
          session: session,
          x: x,
          y: y,
        );
        final status = _asTrimmedString(geocodeResponse['status']);
        if (status == 'ZERO_RESULTS') {
          return null;
        }
        if (status != 'OK') {
          final providerError = _asTrimmedString(
            geocodeResponse['error_message'],
          );
          throw RootHubEndpointError.unexpected(
            language: language,
            title: t.errors.locationProviderErrorTitle,
            description: providerError == null
                ? t.errors.failedToResolveCityFromCoordinates
                : t.errors.failedToResolveCityFromCoordinatesWithProviderError(
                    providerError: providerError,
                  ),
          );
        }

        final results = geocodeResponse['results'];
        if (results is! List || results.isEmpty) {
          return null;
        }

        final firstResultRaw = results.first;
        if (firstResultRaw is! Map) {
          return null;
        }
        final firstResult = firstResultRaw.cast<String, dynamic>();
        final components = _parseAddressComponents(
          firstResult['address_components'],
        );

        final cityName = _readComponentName(
          components,
          const [
            'locality',
            'postal_town',
            'administrative_area_level_2',
            'sublocality',
            'neighborhood',
          ],
        );
        final regionName = _readComponentShortName(
          components,
          const ['administrative_area_level_1'],
        );
        final countryName = _readComponentName(
          components,
          const ['country'],
        );
        final formattedAddress = _asTrimmedString(
          firstResult['formatted_address'],
        );

        return ReverseGeocodeCityResult(
          cityName: cityName,
          regionName: regionName,
          countryName: countryName,
          shortAddress: _buildShortAddress(
            cityName: cityName,
            regionName: regionName,
            countryName: countryName,
          ),
          formattedAddress: formattedAddress,
        );
      },
      language: language,
      fallbackDescription: t.fallback.unableToResolveLocationDetails,
    );
  }

  Future<Map<String, dynamic>> _fetchGeocodeResponse({
    required ServerSupportedTranslation language,
    required Session session,
    required double x,
    required double y,
  }) async {
    final t = ServerTranslations.of(language);

    final uri = Uri.https(
      _googleGeocodeHost,
      _googleGeocodePath,
      {
        'latlng': '${x.toStringAsFixed(7)},${y.toStringAsFixed(7)}',
        'key': _resolveGoogleMapsApiKey(
          session,
          language: language,
        ),
      },
    );

    final client = HttpClient();
    try {
      final request = await client.getUrl(uri);
      final response = await request.close();
      final body = await utf8.decodeStream(response);
      if (response.statusCode != HttpStatus.ok) {
        throw RootHubEndpointError.unexpected(
          language: language,
          title: t.errors.locationProviderErrorTitle,
          description: t.errors.geocodingRequestFailedWithHttp(
            statusCode: response.statusCode,
          ),
        );
      }

      final decodedBody = jsonDecode(body);
      if (decodedBody is! Map) {
        throw RootHubEndpointError.unexpected(
          language: language,
          title: t.errors.locationProviderErrorTitle,
          description: t.errors.geocodingResponseFormatInvalid,
        );
      }
      return decodedBody.cast<String, dynamic>();
    } finally {
      client.close(force: true);
    }
  }

  List<Map<String, dynamic>> _parseAddressComponents(Object? rawComponents) {
    if (rawComponents is! List) {
      return const <Map<String, dynamic>>[];
    }

    final parsed = <Map<String, dynamic>>[];
    for (final rawComponent in rawComponents) {
      if (rawComponent is! Map) {
        continue;
      }
      parsed.add(rawComponent.cast<String, dynamic>());
    }
    return parsed;
  }

  String? _readComponentName(
    List<Map<String, dynamic>> components,
    List<String> orderedTypes,
  ) {
    for (final type in orderedTypes) {
      for (final component in components) {
        if (!_componentContainsType(component, type)) {
          continue;
        }

        final name = _asTrimmedString(component['long_name']);
        if (name != null) {
          return name;
        }
      }
    }

    return null;
  }

  String? _readComponentShortName(
    List<Map<String, dynamic>> components,
    List<String> orderedTypes,
  ) {
    for (final type in orderedTypes) {
      for (final component in components) {
        if (!_componentContainsType(component, type)) {
          continue;
        }

        final shortName = _asTrimmedString(component['short_name']);
        if (shortName != null) {
          return shortName;
        }

        final name = _asTrimmedString(component['long_name']);
        if (name != null) {
          return name;
        }
      }
    }

    return null;
  }

  bool _componentContainsType(Map<String, dynamic> component, String type) {
    final componentTypes = component['types'];
    if (componentTypes is! List) {
      return false;
    }

    for (final rawType in componentTypes) {
      if (rawType == type) {
        return true;
      }
    }
    return false;
  }

  String _buildShortAddress({
    required String? cityName,
    required String? regionName,
    required String? countryName,
  }) {
    final parts = <String>[
      if (cityName != null && cityName.isNotEmpty) cityName,
      if (regionName != null && regionName.isNotEmpty) regionName,
      if (countryName != null && countryName.isNotEmpty) countryName,
    ];
    return parts.join(', ');
  }

  String? _asTrimmedString(Object? rawValue) {
    if (rawValue is! String) {
      return null;
    }

    final normalized = rawValue.trim();
    return normalized.isEmpty ? null : normalized;
  }

  void _validateCoordinates({
    required ServerSupportedTranslation language,
    required double x,
    required double y,
  }) {
    final t = ServerTranslations.of(language);

    if (x < -90 || x > 90) {
      throw RootHubEndpointError.invalidRequest(
        language: language,
        description: t.errors.latitudeMustBeBetween,
      );
    }
    if (y < -180 || y > 180) {
      throw RootHubEndpointError.invalidRequest(
        language: language,
        description: t.errors.longitudeMustBeBetween,
      );
    }
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
