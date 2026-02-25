import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:root_hub_client/root_hub_client.dart';

class MatchLocationHeaderImageWidget extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final lat = google?.lat;
    final lng = google?.lng;
    final canBuildStaticMap = lat != null && lng != null;
    final headerImageUrl = canBuildStaticMap
        ? _buildStaticMapUrl(lat, lng)
        : null;

    return SizedBox(
      height: 188,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (headerImageUrl != null)
            Image.network(
              headerImageUrl,
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) {
                return Container(
                  color: colorScheme.primaryContainer,
                );
              },
            )
          else
            Container(
              color: colorScheme.primaryContainer,
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
                  'Location Details',
                  style: GoogleFonts.cinzel(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  locationTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  locationSubtitle,
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

  String _buildStaticMapUrl(double latitude, double longitude) {
    final normalizedLatitude = latitude.toStringAsFixed(6);
    final normalizedLongitude = longitude.toStringAsFixed(6);

    return Uri.https(
      'staticmap.openstreetmap.de',
      '/staticmap.php',
      {
        'center': '$normalizedLatitude,$normalizedLongitude',
        'zoom': '14',
        'size': '1200x420',
        'markers': '$normalizedLatitude,$normalizedLongitude,lightblue1',
      },
    ).toString();
  }
}
