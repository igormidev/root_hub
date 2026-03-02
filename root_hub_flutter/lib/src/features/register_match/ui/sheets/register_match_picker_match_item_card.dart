import 'package:flutter/material.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';

class RegisterMatchPickerMatchItemCard extends StatelessWidget {
  const RegisterMatchPickerMatchItemCard({
    super.key,
    required this.match,
    required this.canRegisterNow,
    required this.isProcessing,
    required this.onRegisterTap,
    required this.onCancelTap,
  });

  final MatchSchedulePairingAttempt match;
  final bool canRegisterNow;
  final bool isProcessing;
  final VoidCallback onRegisterTap;
  final VoidCallback onCancelTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final localizations = MaterialLocalizations.of(context);

    final startAt = match.attemptedAt.toLocal();
    final startAtLabel =
        '${localizations.formatMediumDate(startAt)} • ${localizations.formatTimeOfDay(TimeOfDay.fromDateTime(startAt))}';

    final location = match.location;
    final googlePlace = location?.googlePlaceLocation;
    final manualLocation = location?.manualInputLocation;
    final locationTitle =
        googlePlace?.name ?? manualLocation?.title ?? 'Unknown location';
    final locationSubtitle =
        googlePlace?.shortFormattedAddress ??
        googlePlace?.formattedAddress ??
        manualLocation?.cityName ??
        'Address unavailable';

    final actionBorderRadius = BorderRadius.circular(14);
    return Container(
      padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: colorScheme.outlineVariant,
        ),
        color: colorScheme.surfaceContainerLow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            match.title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          if (match.description?.trim().isNotEmpty == true) ...[
            SizedBox(height: 4),
            Text(
              match.description!.trim(),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
          SizedBox(height: 8),
          Row(
            children: [
              Icon(
                Icons.schedule_rounded,
                size: 18,
                color: colorScheme.primary,
              ),
              SizedBox(width: 6),
              Expanded(
                child: Text(
                  startAtLabel,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 6),
          Row(
            children: [
              Icon(
                Icons.location_on_rounded,
                size: 18,
                color: colorScheme.secondary,
              ),
              SizedBox(width: 6),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      locationTitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      locationSubtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          if (!canRegisterNow) ...[
            Text(
              t
                  .register_match
                  .ui_sheets_register_match_picker_match_item_card
                  .notAvailableYet,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 8),
          ],
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: isProcessing ? null : onCancelTap,
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: actionBorderRadius),
              ),
              child: Text(
                t
                    .register_match
                    .ui_sheets_register_match_picker_match_item_card
                    .cancelMatch,
              ),
            ),
          ),
          SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: isProcessing ? null : onRegisterTap,
              style: FilledButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: actionBorderRadius),
              ),
              child: isProcessing
                  ? SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.3,
                        color: colorScheme.onPrimary,
                      ),
                    )
                  : Text(
                      t
                          .register_match
                          .ui_sheets_register_match_picker_match_item_card
                          .registerMatchResult,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
