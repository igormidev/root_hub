import 'dart:io';
import 'dart:typed_data';
import 'dart:math';

import 'package:blurhash_dart/blurhash_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image/image.dart' as img;
import 'package:root_hub_flutter/src/states/match/match_tables_provider.dart';

final _locationAvatarCacheManager = CacheManager(
  Config(
    'locationPhotoAvatarCache',
    stalePeriod: Duration(days: 7),
    maxNrOfCacheObjects: 300,
  ),
);

final _locationAvatarResolvedPhotoCache = <String, _ResolvedLocationPhoto>{};

class LocationPhotoAvatarWidget extends ConsumerStatefulWidget {
  const LocationPhotoAvatarWidget({
    required this.providerPlaceId,
    required this.latitude,
    required this.longitude,
    this.size = 56,
    this.placeholderIcon,
    this.borderColor,
    this.backgroundColor,
    super.key,
  });

  final String? providerPlaceId;
  final double? latitude;
  final double? longitude;
  final double size;
  final Widget? placeholderIcon;
  final Color? borderColor;
  final Color? backgroundColor;

  @override
  ConsumerState<LocationPhotoAvatarWidget> createState() =>
      _LocationPhotoAvatarWidgetState();
}

class _LocationPhotoAvatarWidgetState
    extends ConsumerState<LocationPhotoAvatarWidget> {
  late Future<_ResolvedLocationPhoto?> _photoFuture;

  @override
  void initState() {
    super.initState();
    _photoFuture = _resolvePhoto();
  }

  @override
  void didUpdateWidget(covariant LocationPhotoAvatarWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.providerPlaceId != widget.providerPlaceId ||
        oldWidget.latitude != widget.latitude ||
        oldWidget.longitude != widget.longitude) {
      _photoFuture = _resolvePhoto();
    }
  }

  Future<_ResolvedLocationPhoto?> _resolvePhoto() async {
    final photoUrl = await _resolvePhotoUrl();
    if (photoUrl == null) {
      return null;
    }

    final cachedResolvedPhoto = _locationAvatarResolvedPhotoCache[photoUrl];
    if (cachedResolvedPhoto != null) {
      return cachedResolvedPhoto;
    }

    try {
      final localFile = await _locationAvatarCacheManager.getSingleFile(
        photoUrl,
      );
      final resolvedPhoto = _ResolvedLocationPhoto(
        imageFile: localFile,
        blurImage: await _buildBlurImage(localFile),
      );
      _locationAvatarResolvedPhotoCache[photoUrl] = resolvedPhoto;
      return resolvedPhoto;
    } catch (_) {
      return null;
    }
  }

  Future<String?> _resolvePhotoUrl() async {
    final providerPlaceId = widget.providerPlaceId?.trim();
    if (providerPlaceId != null && providerPlaceId.isNotEmpty) {
      final resolvedPhotoUrl = await ref
          .read(matchTablesProvider.notifier)
          .resolveLocationHeaderPhotoUrl(providerPlaceId: providerPlaceId);
      final normalizedPhotoUrl = resolvedPhotoUrl?.trim();
      if (normalizedPhotoUrl != null && normalizedPhotoUrl.isNotEmpty) {
        return normalizedPhotoUrl;
      }
    }

    return _buildFallbackMapTileUrl();
  }

  String? _buildFallbackMapTileUrl() {
    final latitude = widget.latitude;
    final longitude = widget.longitude;
    if (latitude == null || longitude == null) {
      return null;
    }

    final normalizedLatitude = latitude.clamp(-85.05112878, 85.05112878);
    final normalizedLongitude =
        ((longitude + 180.0) % 360.0 + 360.0) % 360.0 - 180.0;
    const zoom = 15;
    final tilesPerAxis = 1 << zoom;
    final tileX = (((normalizedLongitude + 180.0) / 360.0) * tilesPerAxis)
        .floor()
        .clamp(0, tilesPerAxis - 1);

    final latitudeRadians = normalizedLatitude * 3.141592653589793 / 180.0;
    final tileY =
        ((1 -
                    (log(tan(latitudeRadians) + 1 / cos(latitudeRadians)) /
                        3.141592653589793)) /
                2 *
                tilesPerAxis)
            .floor()
            .clamp(0, tilesPerAxis - 1);

    return Uri.https(
      'tile.openstreetmap.org',
      '/$zoom/$tileX/$tileY.png',
    ).toString();
  }

  Future<MemoryImage?> _buildBlurImage(File file) async {
    try {
      final bytes = await file.readAsBytes();
      final decodedImage = img.decodeImage(bytes);
      if (decodedImage == null) {
        return null;
      }

      final resized = img.copyResize(
        decodedImage,
        width: decodedImage.width >= decodedImage.height ? 80 : null,
        height: decodedImage.height > decodedImage.width ? 80 : null,
        interpolation: img.Interpolation.average,
      );
      final blurhash = BlurHash.encode(
        resized,
        numCompX: 4,
        numCompY: 3,
      ).hash;
      final placeholder = BlurHash.decode(blurhash).toImage(36, 36);
      return MemoryImage(Uint8List.fromList(img.encodeJpg(placeholder)));
    } catch (_) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final placeholderIcon =
        widget.placeholderIcon ??
        Icon(
          Icons.location_on_rounded,
          size: widget.size * 0.42,
          color: colorScheme.onSurfaceVariant,
        );

    return Container(
      width: widget.size,
      height: widget.size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: widget.backgroundColor ?? colorScheme.surfaceContainerHighest,
        border: Border.all(
          color: widget.borderColor ?? colorScheme.outlineVariant,
        ),
      ),
      child: ClipOval(
        child: FutureBuilder<_ResolvedLocationPhoto?>(
          future: _photoFuture,
          builder: (context, snapshot) {
            final resolvedPhoto = snapshot.data;
            if (resolvedPhoto == null) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      colorScheme.primaryContainer,
                      colorScheme.surfaceContainerHighest,
                    ],
                  ),
                ),
                child: Center(child: placeholderIcon),
              );
            }

            return Stack(
              fit: StackFit.expand,
              children: [
                if (resolvedPhoto.blurImage != null)
                  Image(
                    image: resolvedPhoto.blurImage!,
                    fit: BoxFit.cover,
                  )
                else
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceContainerHighest,
                    ),
                  ),
                TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: 0, end: 1),
                  duration: Duration(milliseconds: 280),
                  curve: Curves.easeOutCubic,
                  builder: (context, opacity, child) {
                    return Opacity(
                      opacity: opacity,
                      child: child,
                    );
                  },
                  child: Image.file(
                    resolvedPhoto.imageFile,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _ResolvedLocationPhoto {
  const _ResolvedLocationPhoto({
    required this.imageFile,
    required this.blurImage,
  });

  final File imageFile;
  final MemoryImage? blurImage;
}
