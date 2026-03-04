import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';
import 'package:root_hub_flutter/src/states/match/match_tables_provider.dart';

class MatchLocationHeaderImageWidget extends ConsumerStatefulWidget {
  const MatchLocationHeaderImageWidget({
    required this.locationTitle,
    required this.locationSubtitle,
    required this.google,
    super.key,
  });

  final String locationTitle;
  final String locationSubtitle;
  final GooglePlaceLocation? google;

  @override
  ConsumerState<MatchLocationHeaderImageWidget> createState() =>
      _MatchLocationHeaderImageWidgetState();
}

class _MatchLocationHeaderImageWidgetState
    extends ConsumerState<MatchLocationHeaderImageWidget> {
  late Future<String?> _headerImageUrlFuture;

  @override
  void initState() {
    super.initState();
    _headerImageUrlFuture = _resolveHeaderImageUrl();
  }

  @override
  void didUpdateWidget(covariant MatchLocationHeaderImageWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.google?.providerPlaceId != widget.google?.providerPlaceId ||
        oldWidget.google?.lat != widget.google?.lat ||
        oldWidget.google?.lng != widget.google?.lng) {
      _headerImageUrlFuture = _resolveHeaderImageUrl();
    }
  }

  Future<String?> _resolveHeaderImageUrl() async {
    final providerPlaceId = widget.google?.providerPlaceId.trim();
    if (providerPlaceId != null && providerPlaceId.isNotEmpty) {
      final resolvedPhotoUrl = await ref
          .read(matchTablesProvider.notifier)
          .resolveLocationHeaderPhotoUrl(providerPlaceId: providerPlaceId);
      if (resolvedPhotoUrl != null && resolvedPhotoUrl.isNotEmpty) {
        return resolvedPhotoUrl;
      }
    }

    return _buildFallbackMapTileUrl();
  }

  String? _buildFallbackMapTileUrl() {
    final latitude = widget.google?.lat;
    final longitude = widget.google?.lng;
    if (latitude == null || longitude == null) {
      return null;
    }

    const zoom = 14;
    final normalizedLatitude = latitude.clamp(-85.05112878, 85.05112878);
    final normalizedLongitude =
        ((longitude + 180.0) % 360.0 + 360.0) % 360.0 - 180.0;

    final tilesPerAxis = math.pow(2, zoom).toDouble();
    final maxTileIndex = tilesPerAxis.toInt() - 1;

    final tileX = (((normalizedLongitude + 180.0) / 360.0) * tilesPerAxis)
        .floor()
        .clamp(0, maxTileIndex);

    final latitudeRad = normalizedLatitude * math.pi / 180.0;
    final tileY =
        ((1 -
                    math.log(
                          math.tan(latitudeRad) + 1 / math.cos(latitudeRad),
                        ) /
                        math.pi) /
                2 *
                tilesPerAxis)
            .floor()
            .clamp(0, maxTileIndex);

    return Uri.https(
      'tile.openstreetmap.org',
      '/$zoom/$tileX/$tileY.png',
    ).toString();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      height: 188,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          FutureBuilder<String?>(
            future: _headerImageUrlFuture,
            initialData: _buildFallbackMapTileUrl(),
            builder: (context, snapshot) {
              final headerImageUrl = snapshot.data?.trim();

              if (headerImageUrl != null && headerImageUrl.isNotEmpty) {
                return Image.network(
                  headerImageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (_, _, _) {
                    return Container(
                      color: colorScheme.primaryContainer,
                    );
                  },
                );
              }

              return Container(
                color: colorScheme.primaryContainer,
              );
            },
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withValues(alpha: 0.08),
                  Colors.black.withValues(alpha: 0.6),
                ],
              ),
            ),
          ),
          Positioned(
            left: 14,
            right: 14,
            bottom: 12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  t
                      .match
                      .ui_screens_match_location_header_image_widget
                      .locationDetails,
                  style: GoogleFonts.cinzel(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  widget.locationTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  widget.locationSubtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white.withValues(alpha: 0.92),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
