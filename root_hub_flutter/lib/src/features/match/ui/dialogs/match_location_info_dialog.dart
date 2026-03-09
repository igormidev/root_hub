import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';
import 'package:root_hub_flutter/src/features/match/ui/screens/match_actionable_info_row_widget.dart';
import 'package:root_hub_flutter/src/features/match/ui/screens/match_location_header_image_widget.dart';
import 'package:root_hub_flutter/src/features/match/ui/screens/match_location_meta_chip_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class MatchLocationInfoDialog extends StatefulWidget {
  const MatchLocationInfoDialog({
    required this.location,
    this.locationAdditionalInfo,
    super.key,
  });

  final Location? location;
  final String? locationAdditionalInfo;

  static Future<void> show(
    BuildContext context, {
    required Location? location,
    String? locationAdditionalInfo,
  }) {
    return showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return MatchLocationInfoDialog(
          location: location,
          locationAdditionalInfo: locationAdditionalInfo,
        );
      },
    );
  }

  @override
  State<MatchLocationInfoDialog> createState() =>
      _MatchLocationInfoDialogState();
}

class _MatchLocationInfoDialogState extends State<MatchLocationInfoDialog> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final google = widget.location?.googlePlaceLocation;
    final manual = widget.location?.manualInputLocation;
    final locationTitle =
        google?.name ??
        manual?.title ??
        t.match.ui_screens_match_table_card_widget.unknownLocation;
    final locationSubtitle =
        google?.shortFormattedAddress ??
        google?.formattedAddress ??
        manual?.cityName ??
        t.match.ui_screens_match_table_card_widget.addressUnavailable;
    final playedMatchesCount = widget.location?.playedMatches?.length ?? 0;
    final types = google?.types ?? <String>[];
    final normalizedLocationAdditionalInfo = widget.locationAdditionalInfo
        ?.trim();
    final hasLocationAdditionalInfo =
        normalizedLocationAdditionalInfo != null &&
        normalizedLocationAdditionalInfo.isNotEmpty;
    final maxDialogHeight = MediaQuery.of(context).size.height * 0.86;

    return Dialog(
      insetPadding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 16,
      ),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: maxDialogHeight,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MatchLocationHeaderImageWidget(
              locationTitle: locationTitle,
              locationSubtitle: locationSubtitle,
              google: google,
            ),
            Flexible(
              fit: FlexFit.loose,
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.fromLTRB(14, 14, 14, 10),
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(
                            12,
                            10,
                            12,
                            10,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: colorScheme.primaryContainer.withValues(
                              alpha: 0.62,
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.sports_esports_rounded,
                                color: colorScheme.primary,
                              ),
                              const SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '$playedMatchesCount',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(
                                          fontWeight: FontWeight.w900,
                                        ),
                                  ),
                                  Text(
                                    playedMatchesCount == 1
                                        ? t
                                              .match
                                              .ui_screens_match_screen
                                              .matchPlayedHere
                                        : t
                                              .match
                                              .ui_screens_match_screen
                                              .matchesPlayedHere,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge
                                        ?.copyWith(
                                          fontWeight: FontWeight.w700,
                                          color: colorScheme.onSurfaceVariant,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: google?.isPublicPlace == false
                              ? colorScheme.tertiaryContainer
                              : colorScheme.secondaryContainer,
                        ),
                        child: Column(
                          children: [
                            Icon(
                              google?.isPublicPlace == false
                                  ? Icons.lock_rounded
                                  : Icons.public_rounded,
                              size: 18,
                              color: google?.isPublicPlace == false
                                  ? colorScheme.onTertiaryContainer
                                  : colorScheme.onSecondaryContainer,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              google?.isPublicPlace == false
                                  ? t.match.ui_screens_match_screen.private
                                  : t.match.ui_screens_match_screen.public,
                              style: Theme.of(context).textTheme.labelMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w900,
                                    color: google?.isPublicPlace == false
                                        ? colorScheme.onTertiaryContainer
                                        : colorScheme.onSecondaryContainer,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  if (hasLocationAdditionalInfo) ...[
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: colorScheme.primary.withValues(alpha: 0.18),
                        ),
                        color: colorScheme.primaryContainer.withValues(
                          alpha: 0.24,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            t
                                .match
                                .ui_screens_match_screen
                                .locationAdditionalInfo,
                            style: Theme.of(context).textTheme.titleSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.w900,
                                ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            normalizedLocationAdditionalInfo,
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: colorScheme.onSurfaceVariant,
                                  height: 1.35,
                                ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                  ],
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: [
                      if (google?.rating != null)
                        MatchLocationMetaChipWidget(
                          icon: Icons.star_rounded,
                          label: t.match.ui_sheets_match_table_info_sheet
                              .ratingValue(
                                value: google!.rating!.toStringAsFixed(1),
                              ),
                        ),
                      if (google?.userRatingCount != null)
                        MatchLocationMetaChipWidget(
                          icon: Icons.groups_2_rounded,
                          label: t.match.ui_sheets_match_table_info_sheet
                              .ratingsCount(
                                count: google!.userRatingCount!,
                              ),
                        ),
                      if (google?.timezone != null &&
                          google!.timezone!.trim().isNotEmpty)
                        MatchLocationMetaChipWidget(
                          icon: Icons.schedule_rounded,
                          label: google.timezone!,
                        ),
                      for (final type in types)
                        MatchLocationMetaChipWidget(
                          icon: Icons.sell_rounded,
                          label: type,
                        ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  if (google?.url != null && google!.url!.trim().isNotEmpty)
                    MatchActionableInfoRowWidget(
                      icon: Icons.map_rounded,
                      label: t.match.ui_screens_match_screen.mapLink2,
                      value: google.url!.trim(),
                      onCopyTap: () {
                        _copyValue(
                          value: google.url!.trim(),
                          label: t.match.ui_screens_match_screen.mapLink,
                        );
                      },
                      onActionTap: () {
                        _launchExternalUrl(google.url!.trim());
                      },
                    ),
                  if (google?.websiteUri != null &&
                      google!.websiteUri!.trim().isNotEmpty)
                    MatchActionableInfoRowWidget(
                      icon: Icons.language_rounded,
                      label: t.match.ui_screens_match_screen.website2,
                      value: google.websiteUri!.trim(),
                      onCopyTap: () {
                        _copyValue(
                          value: google.websiteUri!.trim(),
                          label: t.match.ui_screens_match_screen.website,
                        );
                      },
                      onActionTap: () {
                        _launchExternalUrl(google.websiteUri!.trim());
                      },
                    ),
                  if (google?.phoneNumber != null &&
                      google!.phoneNumber!.trim().isNotEmpty)
                    MatchActionableInfoRowWidget(
                      icon: Icons.phone_rounded,
                      label: t.match.ui_screens_match_screen.phone2,
                      value: google.phoneNumber!.trim(),
                      onCopyTap: () {
                        _copyValue(
                          value: google.phoneNumber!.trim(),
                          label: t.match.ui_screens_match_screen.phone,
                        );
                      },
                      onActionTap: () {
                        _launchPhone(google.phoneNumber!.trim());
                      },
                    ),
                  if (manual != null) ...[
                    const SizedBox(height: 8),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: colorScheme.surfaceContainerHighest.withValues(
                          alpha: 0.55,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            t.match.ui_screens_match_screen.manualLocationNotes,
                            style: Theme.of(context).textTheme.titleSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.w900,
                                ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            '${manual.title} • ${manual.cityName}, ${manual.country.toJson()}',
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: colorScheme.onSurfaceVariant,
                                ),
                          ),
                          if (manual.description?.trim().isNotEmpty == true)
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Text(
                                manual.description!.trim(),
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
            SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                child: SizedBox(
                  width: double.infinity,
                  child: FilledButton.tonal(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(
                      t.match.ui_screens_match_screen.close,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _copyValue({
    required String value,
    required String label,
  }) async {
    await Clipboard.setData(ClipboardData(text: value));
    if (!mounted) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          t.match.ui_screens_match_screen.copiedLabel(label: label),
        ),
      ),
    );
  }

  Future<void> _launchExternalUrl(String rawUrl) async {
    final parsedUri = Uri.tryParse(rawUrl);
    if (parsedUri == null) {
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            t.match.ui_screens_match_screen.invalidUrlFormat,
          ),
        ),
      );
      return;
    }

    final launched = await launchUrl(
      parsedUri,
      mode: LaunchMode.externalApplication,
    );
    if (launched || !mounted) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          t.match.ui_screens_match_screen.unableToOpenTheLinkRightNow,
        ),
      ),
    );
  }

  Future<void> _launchPhone(String rawPhone) async {
    final normalizedPhone = _normalizePhoneNumber(rawPhone);
    if (normalizedPhone.isEmpty) {
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            t.match.ui_screens_match_screen.invalidPhoneNumberFormat,
          ),
        ),
      );
      return;
    }

    final telUri = Uri(
      scheme: 'tel',
      path: normalizedPhone,
    );
    final launched = await launchUrl(
      telUri,
      mode: LaunchMode.externalApplication,
    );
    if (launched || !mounted) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          t.match.ui_screens_match_screen.unableToOpenTheDialerRightNow,
        ),
      ),
    );
  }

  String _normalizePhoneNumber(String rawPhone) {
    final trimmed = rawPhone.trim();
    if (trimmed.isEmpty) {
      return '';
    }

    final hasLeadingPlus = trimmed.startsWith('+');
    final digitsOnly = trimmed.replaceAll(RegExp(r'[^0-9]'), '');
    if (digitsOnly.isEmpty) {
      return '';
    }

    return hasLeadingPlus ? '+$digitsOnly' : digitsOnly;
  }
}
