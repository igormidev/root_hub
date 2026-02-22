import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:root_hub_client/root_hub_client.dart';

class ProfileLocationEditorCard extends StatelessWidget {
  const ProfileLocationEditorCard({
    required this.currentLocation,
    required this.isResolvingLocation,
    required this.onResolveLocation,
    this.onClearLocation,
    this.onDecreaseRatio,
    this.onIncreaseRatio,
    this.statusMessage,
    this.statusIsError = false,
    this.enabled = true,
    this.showWarning = true,
    super.key,
  });

  final GeoLocation? currentLocation;
  final bool isResolvingLocation;
  final VoidCallback onResolveLocation;
  final VoidCallback? onClearLocation;
  final VoidCallback? onDecreaseRatio;
  final VoidCallback? onIncreaseRatio;
  final String? statusMessage;
  final bool statusIsError;
  final bool enabled;
  final bool showWarning;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final location = currentLocation;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: colorScheme.outlineVariant),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            colorScheme.surfaceContainerHighest.withValues(alpha: 0.78),
            colorScheme.surfaceContainer.withValues(alpha: 0.72),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.location_on_rounded,
                color: colorScheme.primary,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                'Current Location',
                style: GoogleFonts.nunitoSans(
                  fontWeight: FontWeight.w800,
                  fontSize: 15,
                  color: colorScheme.onSurface,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Required. We use your phone coordinates (x and y) to search nearby matches.',
            style: GoogleFonts.nunitoSans(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ElevatedButton.icon(
                onPressed: !enabled || isResolvingLocation
                    ? null
                    : onResolveLocation,
                icon: isResolvingLocation
                    ? SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: colorScheme.onPrimary,
                        ),
                      )
                    : const Icon(Icons.my_location_rounded),
                label: Text(
                  isResolvingLocation ? 'Capturing...' : 'Use Phone Location',
                  style: GoogleFonts.nunitoSans(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              if (location != null)
                OutlinedButton.icon(
                  onPressed: enabled ? onClearLocation : null,
                  icon: const Icon(Icons.clear_rounded),
                  label: Text(
                    'Clear',
                    style: GoogleFonts.nunitoSans(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
            ],
          ),
          if (location != null) ...[
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: colorScheme.surface.withValues(alpha: 0.72),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: colorScheme.outlineVariant),
              ),
              child: Text(
                'x: ${location.x.toStringAsFixed(6)}\n'
                'y: ${location.y.toStringAsFixed(6)}\n'
                'ratio: ${location.ratio.toStringAsFixed(2)}',
                style: GoogleFonts.nunitoSans(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: colorScheme.onSurface,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
              decoration: BoxDecoration(
                color: colorScheme.surface.withValues(alpha: 0.72),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: colorScheme.outlineVariant),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Search Ratio',
                    style: GoogleFonts.nunitoSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      IconButton.filledTonal(
                        onPressed: enabled ? onDecreaseRatio : null,
                        icon: const Icon(Icons.remove_rounded),
                      ),
                      Expanded(
                        child: Text(
                          '${location.ratio.toStringAsFixed(0)} km',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunitoSans(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: colorScheme.onSurface,
                          ),
                        ),
                      ),
                      IconButton.filledTonal(
                        onPressed: enabled ? onIncreaseRatio : null,
                        icon: const Icon(Icons.add_rounded),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '25 km is the recommended value.',
                    style: GoogleFonts.nunitoSans(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ],
          if (statusMessage != null) ...[
            const SizedBox(height: 10),
            Text(
              statusMessage!,
              style: GoogleFonts.nunitoSans(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: statusIsError ? colorScheme.error : colorScheme.primary,
              ),
            ),
          ],
          if (showWarning) ...[
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color(0xFFFFB300).withValues(alpha: 0.75),
                ),
                color: const Color(0xFFFFF5D9).withValues(alpha: 0.6),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.warning_amber_rounded,
                    color: Color(0xFFE07A00),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Disable VPN or proxy before capturing location. '
                      'Wrong coordinates may hide nearby matches.',
                      style: GoogleFonts.nunitoSans(
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFF8A4E00),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
