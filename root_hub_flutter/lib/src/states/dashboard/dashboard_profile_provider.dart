import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/core/extension/serverpod_to_result.dart';
import 'package:root_hub_flutter/src/global_providers/server_supported_translation_provider.dart';
import 'package:root_hub_flutter/src/global_providers/session_provider.dart';
import 'package:root_hub_flutter/src/global_providers/shared_preferences_provider.dart';
import 'package:root_hub_flutter/src/states/account/account_provider.dart';
import 'package:root_hub_flutter/src/states/auth_flow/auth_flow_provider.dart';
import 'package:root_hub_flutter/src/states/dashboard/dashboard_profile_state.dart';

class DashboardProfileNotifier extends Notifier<DashboardProfileState> {
  static const _locationLabelCachePrefix =
      'dashboard_profile_location_label_cache_v1';

  int _locationLabelRunId = 0;

  @override
  DashboardProfileState build() {
    return const DashboardProfileState();
  }

  static String buildLocationLabelKey({
    required GeoLocation location,
    required ServerSupportedTranslation language,
  }) {
    return '${language.name}|'
        '${location.x.toStringAsFixed(6)}|'
        '${location.y.toStringAsFixed(6)}';
  }

  Future<void> ensureProfileImageLoaded() async {
    if (state.hasLoadedProfileImage || state.isLoadingProfileImage) {
      return;
    }

    state = state.copyWith(
      isLoadingProfileImage: true,
      lastError: null,
    );

    final result = await ref
        .read(clientProvider)
        .userProfileEdit
        .get()
        .toResult;
    result.fold(
      (profile) {
        state = state.copyWith(
          profileImageUrl: profile.imageUrl?.toString(),
          hasLoadedProfileImage: true,
          isLoadingProfileImage: false,
        );
      },
      (error) {
        state = state.copyWith(
          hasLoadedProfileImage: true,
          isLoadingProfileImage: false,
          lastError: error,
        );
      },
    );
  }

  Future<RootHubException?> updateProfileImage(Uint8List imageBytes) async {
    if (imageBytes.isEmpty) {
      return RootHubException(
        title: 'Invalid request',
        description: 'Selected image is empty.',
      );
    }

    state = state.copyWith(
      isUpdatingProfileImage: true,
      lastError: null,
    );

    final result = await ref
        .read(clientProvider)
        .userProfileEdit
        .setUserImage(ByteData.sublistView(imageBytes))
        .toResult;

    return result.fold(
      (profile) {
        state = state.copyWith(
          profileImageUrl: profile.imageUrl?.toString(),
          hasLoadedProfileImage: true,
          isUpdatingProfileImage: false,
        );
        return null;
      },
      (error) {
        state = state.copyWith(
          isUpdatingProfileImage: false,
          lastError: error,
        );
        return error;
      },
    );
  }

  Future<RootHubException?> updateDisplayName(String displayName) async {
    final normalizedDisplayName = displayName.trim();
    if (normalizedDisplayName.isEmpty) {
      return RootHubException(
        title: 'Invalid request',
        description: 'Display name cannot be empty.',
      );
    }

    state = state.copyWith(
      isUpdatingDisplayName: true,
      lastError: null,
    );

    final result = await ref
        .read(clientProvider)
        .updatePlayerData
        .v1(
          language: ref.read(serverSupportedTranslationProvider),
          displayName: normalizedDisplayName,
        )
        .toResult;

    return result.fold(
      (updatedPlayerData) {
        _setPlayerData(updatedPlayerData);
        state = state.copyWith(
          isUpdatingDisplayName: false,
        );
        return null;
      },
      (error) {
        state = state.copyWith(
          isUpdatingDisplayName: false,
          lastError: error,
        );
        return error;
      },
    );
  }

  Future<RootHubException?> updateLocation(GeoLocation location) async {
    if (location.ratio <= 0) {
      return RootHubException(
        title: 'Invalid request',
        description: 'Location ratio must be greater than zero.',
      );
    }

    state = state.copyWith(
      isUpdatingLocation: true,
      lastError: null,
    );

    final result = await ref
        .read(clientProvider)
        .updatePlayerData
        .v1(
          language: ref.read(serverSupportedTranslationProvider),
          currentLocation: location,
        )
        .toResult;

    return result.fold(
      (updatedPlayerData) {
        _setPlayerData(updatedPlayerData);
        state = state.copyWith(
          isUpdatingLocation: false,
        );
        unawaited(ensureLocationLabelLoaded(updatedPlayerData.currentLocation));
        return null;
      },
      (error) {
        state = state.copyWith(
          isUpdatingLocation: false,
          lastError: error,
        );
        return error;
      },
    );
  }

  Future<void> ensureLocationLabelLoaded(
    GeoLocation? location, {
    bool forceRefresh = false,
  }) async {
    if (location == null) {
      _locationLabelRunId += 1;
      state = state.copyWith(
        isResolvingLocationLabel: false,
        resolvingLocationLabelKey: null,
        resolvedLocationLabelKey: null,
        currentLocationCityName: null,
        currentLocationShortAddress: null,
        currentLocationFormattedAddress: null,
      );
      return;
    }

    final language = ref.read(serverSupportedTranslationProvider);
    final locationLabelKey = buildLocationLabelKey(
      location: location,
      language: language,
    );

    if (!forceRefresh &&
        state.resolvedLocationLabelKey == locationLabelKey &&
        !state.isResolvingLocationLabel) {
      return;
    }

    if (!forceRefresh &&
        state.isResolvingLocationLabel &&
        state.resolvingLocationLabelKey == locationLabelKey) {
      return;
    }

    if (!forceRefresh) {
      final cachedLocationLabel = _readLocationLabelCache(locationLabelKey);
      if (cachedLocationLabel != null) {
        _setResolvedLocationLabel(
          locationLabelKey: locationLabelKey,
          label: cachedLocationLabel,
        );
        return;
      }
    }

    final activeRunId = _locationLabelRunId + 1;
    _locationLabelRunId = activeRunId;
    state = state.copyWith(
      isResolvingLocationLabel: true,
      resolvingLocationLabelKey: locationLabelKey,
    );

    final result = await ref
        .read(clientProvider)
        .reverseGeocodeCity
        .v1(
          language: language,
          x: location.x,
          y: location.y,
        )
        .toResult;

    if (activeRunId != _locationLabelRunId) {
      return;
    }

    result.fold(
      (response) {
        final resolvedLabel = _normalizeLocationLabel(response.value);
        if (resolvedLabel != null) {
          unawaited(_saveLocationLabelCache(locationLabelKey, resolvedLabel));
        }
        _setResolvedLocationLabel(
          locationLabelKey: locationLabelKey,
          label: resolvedLabel,
        );
      },
      (_) {
        _setResolvedLocationLabel(
          locationLabelKey: locationLabelKey,
          label: null,
        );
      },
    );
  }

  Future<RootHubException?> updateFavoriteFaction(Faction faction) async {
    state = state.copyWith(
      isUpdatingFaction: true,
      lastError: null,
    );

    final result = await ref
        .read(clientProvider)
        .updatePlayerData
        .v1(
          language: ref.read(serverSupportedTranslationProvider),
          favoriteFaction: faction,
        )
        .toResult;

    return result.fold(
      (updatedPlayerData) {
        _setPlayerData(updatedPlayerData);
        state = state.copyWith(
          isUpdatingFaction: false,
        );
        return null;
      },
      (error) {
        state = state.copyWith(
          isUpdatingFaction: false,
          lastError: error,
        );
        return error;
      },
    );
  }

  Future<RootHubException?> updatePreferredLanguage({
    required Language preferredLanguage,
    required ServerSupportedTranslation requestLanguage,
  }) async {
    state = state.copyWith(
      isUpdatingPreferredLanguage: true,
      lastError: null,
    );

    final result = await ref
        .read(clientProvider)
        .updatePlayerData
        .v1(
          language: requestLanguage,
          preferredLanguage: preferredLanguage,
        )
        .toResult;

    return result.fold(
      (updatedPlayerData) {
        _setPlayerData(updatedPlayerData);
        state = state.copyWith(
          isUpdatingPreferredLanguage: false,
        );
        return null;
      },
      (error) {
        state = state.copyWith(
          isUpdatingPreferredLanguage: false,
          lastError: error,
        );
        return error;
      },
    );
  }

  void clearError() {
    state = state.copyWith(lastError: null);
  }

  void _setPlayerData(PlayerData updatedPlayerData) {
    ref.read(accountProvider.notifier).setUser(updatedPlayerData);
    ref
        .read(authFlowProvider.notifier)
        .replaceAuthenticatedPlayerData(updatedPlayerData);
  }

  void _setResolvedLocationLabel({
    required String locationLabelKey,
    required _LocationLabelCacheEntry? label,
  }) {
    state = state.copyWith(
      isResolvingLocationLabel: false,
      resolvingLocationLabelKey: null,
      resolvedLocationLabelKey: locationLabelKey,
      currentLocationCityName: label?.cityName,
      currentLocationShortAddress: label?.shortAddress,
      currentLocationFormattedAddress: label?.formattedAddress,
    );
  }

  Future<void> _saveLocationLabelCache(
    String locationLabelKey,
    _LocationLabelCacheEntry label,
  ) async {
    final cacheValue = jsonEncode(label.toJson());
    await ref
        .read(sharedPreferencesProvider)
        .setString(
          _cacheKey(locationLabelKey),
          cacheValue,
        );
  }

  _LocationLabelCacheEntry? _readLocationLabelCache(String locationLabelKey) {
    final cacheValue = ref
        .read(sharedPreferencesProvider)
        .getString(_cacheKey(locationLabelKey));
    if (cacheValue == null || cacheValue.isEmpty) {
      return null;
    }

    try {
      final decodedCacheValue = jsonDecode(cacheValue);
      if (decodedCacheValue is! Map) {
        return null;
      }

      return _LocationLabelCacheEntry.fromJson(
        decodedCacheValue.cast<String, dynamic>(),
      );
    } catch (_) {
      return null;
    }
  }

  String _cacheKey(String locationLabelKey) {
    return '${_locationLabelCachePrefix}_$locationLabelKey';
  }

  _LocationLabelCacheEntry? _normalizeLocationLabel(
    ReverseGeocodeCityResult? label,
  ) {
    final cityName = _normalizeLabelValue(label?.cityName);
    final shortAddress = _normalizeLabelValue(label?.shortAddress);
    final formattedAddress = _normalizeLabelValue(label?.formattedAddress);

    if (cityName == null && shortAddress == null && formattedAddress == null) {
      return null;
    }

    return _LocationLabelCacheEntry(
      cityName: cityName,
      shortAddress: shortAddress,
      formattedAddress: formattedAddress,
    );
  }

  String? _normalizeLabelValue(String? value) {
    final trimmed = value?.trim();
    if (trimmed == null || trimmed.isEmpty) {
      return null;
    }
    return trimmed;
  }
}

final dashboardProfileProvider =
    NotifierProvider<DashboardProfileNotifier, DashboardProfileState>(
      DashboardProfileNotifier.new,
    );

final class _LocationLabelCacheEntry {
  const _LocationLabelCacheEntry({
    this.cityName,
    this.shortAddress,
    this.formattedAddress,
  });

  factory _LocationLabelCacheEntry.fromJson(Map<String, dynamic> json) {
    return _LocationLabelCacheEntry(
      cityName: _normalizeCacheString(json['cityName']),
      shortAddress: _normalizeCacheString(json['shortAddress']),
      formattedAddress: _normalizeCacheString(json['formattedAddress']),
    );
  }

  final String? cityName;
  final String? shortAddress;
  final String? formattedAddress;

  Map<String, dynamic> toJson() {
    return {
      'cityName': cityName,
      'shortAddress': shortAddress,
      'formattedAddress': formattedAddress,
    };
  }

  static String? _normalizeCacheString(Object? value) {
    if (value is! String) {
      return null;
    }

    final trimmedValue = value.trim();
    if (trimmedValue.isEmpty) {
      return null;
    }

    return trimmedValue;
  }
}
