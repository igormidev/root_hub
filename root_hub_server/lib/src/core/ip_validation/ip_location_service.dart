import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:root_hub_server/src/core/ip_validation/ip_location_result.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

const Duration kWebIpLocationCacheDuration = Duration(hours: 72);

class IpLocationService {
  IpLocationService({
    this.apiKey,
    http.Client? client,
    this.onLog,
  }) : _client = client ?? http.Client();

  final String? apiKey;
  final http.Client _client;
  final void Function(String message)? onLog;

  Future<IpLocationResult> resolveWithCache(
    Session session,
    String ipAddress,
  ) async {
    final normalizedIp = ipAddress.trim();
    if (normalizedIp.isEmpty || _isPrivateIp(normalizedIp)) {
      return IpLocationResult.unknown(ipAddress: normalizedIp);
    }

    try {
      final cachedEntry = await WebIpLocationCache.db.findFirstRow(
        session,
        where: (t) => t.ipAddress.equals(normalizedIp),
      );

      if (cachedEntry != null) {
        final cacheAge = DateTime.now().difference(cachedEntry.updatedAt);
        if (cacheAge < kWebIpLocationCacheDuration) {
          return IpLocationResult(
            ipAddress: normalizedIp,
            countryCode: cachedEntry.countryCode,
            countryName: cachedEntry.countryName,
            city: cachedEntry.city,
          );
        }
      }

      final locationResult = await _resolveFromIpApi(normalizedIp);
      if (locationResult.hasLocation) {
        await _upsertCache(session, cachedEntry, locationResult);
      }

      return locationResult;
    } catch (error) {
      onLog?.call(
        '[IpLocationService] Failed to resolve location for $normalizedIp: $error',
      );

      return IpLocationResult.unknown(ipAddress: normalizedIp);
    }
  }

  Future<IpLocationResult> _resolveFromIpApi(String ipAddress) async {
    try {
      final queryParameters = <String, String>{'q': ipAddress};
      final key = apiKey?.trim();
      if (key != null && key.isNotEmpty) {
        queryParameters['key'] = key;
      }

      final uri = Uri.https('api.ipapi.is', '/', queryParameters);
      final response = await _client
          .get(uri)
          .timeout(const Duration(seconds: 2));

      if (response.statusCode != 200 || response.body.isEmpty) {
        return IpLocationResult.unknown(ipAddress: ipAddress);
      }

      final decoded = jsonDecode(response.body);
      if (decoded is! Map<String, dynamic>) {
        return IpLocationResult.unknown(ipAddress: ipAddress);
      }

      final locationData = decoded['location'];
      final locationMap = locationData is Map<String, dynamic>
          ? locationData
          : const <String, dynamic>{};

      final countryCode = _normalizeText(
        locationMap['country_code'] ?? decoded['country_code'],
      );
      final countryName = _normalizeText(
        locationMap['country'] ?? decoded['country'],
      );
      final city = _normalizeText(locationMap['city'] ?? decoded['city']);

      return IpLocationResult(
        ipAddress: ipAddress,
        countryCode: countryCode,
        countryName: countryName,
        city: city,
      );
    } catch (error) {
      onLog?.call(
        '[IpLocationService] ipapi lookup failed for $ipAddress: $error',
      );
      return IpLocationResult.unknown(ipAddress: ipAddress);
    }
  }

  Future<void> _upsertCache(
    Session session,
    WebIpLocationCache? existing,
    IpLocationResult result,
  ) async {
    try {
      final cacheEntry = WebIpLocationCache(
        ipAddress: result.ipAddress,
        updatedAt: DateTime.now(),
        countryCode: result.countryCode,
        countryName: result.countryName,
        city: result.city,
      );

      if (existing != null) {
        await WebIpLocationCache.db.updateRow(
          session,
          cacheEntry.copyWith(id: existing.id),
        );
      } else {
        await WebIpLocationCache.db.insertRow(session, cacheEntry);
      }
    } catch (error) {
      onLog?.call(
        '[IpLocationService] Failed to upsert cache for ${result.ipAddress}: $error',
      );
    }
  }

  String? _normalizeText(Object? value) {
    if (value is! String) {
      return null;
    }

    final trimmed = value.trim();
    if (trimmed.isEmpty) {
      return null;
    }

    return trimmed;
  }

  bool _isPrivateIp(String ipAddress) {
    final normalized = ipAddress.toLowerCase();

    if (normalized == '::1' || normalized == 'localhost') {
      return true;
    }

    if (normalized.startsWith('10.') ||
        normalized.startsWith('127.') ||
        normalized.startsWith('192.168.') ||
        normalized.startsWith('169.254.')) {
      return true;
    }

    if (normalized.startsWith('172.')) {
      final octets = normalized.split('.');
      if (octets.length >= 2) {
        final secondOctet = int.tryParse(octets[1]);
        if (secondOctet != null && secondOctet >= 16 && secondOctet <= 31) {
          return true;
        }
      }
    }

    return false;
  }
}
