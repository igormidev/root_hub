import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/core/match_share/match_share_link_builder.dart';
import 'package:root_hub_flutter/src/design_system/default_error_snackbar.dart';
import 'package:root_hub_flutter/src/features/match/ui/screens/match_actionable_info_row_widget.dart';
import 'package:root_hub_flutter/src/features/match/ui/screens/match_location_header_image_widget.dart';
import 'package:root_hub_flutter/src/features/match/ui/screens/match_location_meta_chip_widget.dart';
import 'package:root_hub_flutter/src/features/match/ui/sheets/match_share_sheet.dart';
import 'package:root_hub_flutter/src/features/match/ui/sheets/match_table_info_content_widget.dart';
import 'package:root_hub_flutter/src/features/match/ui/sheets/match_table_info_error_widget.dart';
import 'package:root_hub_flutter/src/features/match/ui/sheets/match_table_info_loading_widget.dart';
import 'package:root_hub_flutter/src/features/match/ui/sheets/match_table_info_remove_player_tile_widget.dart';
import 'package:root_hub_flutter/src/global_providers/session_provider.dart';
import 'package:root_hub_flutter/src/states/auth_flow/auth_flow_provider.dart';
import 'package:root_hub_flutter/src/states/auth_flow/auth_flow_state.dart';
import 'package:root_hub_flutter/src/states/match/match_chat_provider.dart';
import 'package:root_hub_flutter/src/states/match/match_tables_provider.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';
import 'package:url_launcher/url_launcher.dart';

class MatchTableInfoSheet extends ConsumerStatefulWidget {
  final int scheduledMatchId;

  const MatchTableInfoSheet({
    super.key,
    required this.scheduledMatchId,
  });

  @override
  ConsumerState<MatchTableInfoSheet> createState() =>
      _MatchTableInfoSheetState();
}

class _MatchTableInfoSheetState extends ConsumerState<MatchTableInfoSheet> {
  late Future<MatchScheduleInfo> _detailsFuture;
  bool _isUnsubscribing = false;
  bool _isRemovingPlayer = false;

  @override
  void initState() {
    super.initState();
    _detailsFuture = ref
        .read(matchTablesProvider.notifier)
        .getTableDetails(widget.scheduledMatchId, forceRefresh: true);
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authFlowProvider);
    final currentPlayer = authState.maybeWhen(
      authenticated: (playerData) => playerData,
      orElse: () => null,
    );

    return FractionallySizedBox(
      heightFactor: 0.8,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(28),
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: FutureBuilder<MatchScheduleInfo>(
          future: _detailsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return MatchTableInfoLoadingWidget();
            }

            if (snapshot.hasError) {
              final error = snapshot.error is RootHubException
                  ? snapshot.error! as RootHubException
                  : defaultException;
              return MatchTableInfoErrorWidget(
                error: error,
                onClose: () => Navigator.of(context).pop(false),
                onRetry: () {
                  setState(() {
                    _detailsFuture = ref
                        .read(matchTablesProvider.notifier)
                        .getTableDetails(
                          widget.scheduledMatchId,
                          forceRefresh: true,
                        );
                  });
                },
              );
            }

            final tableInfo = snapshot.data;
            final table = tableInfo?.matchSchedule;

            if (table == null) {
              return MatchTableInfoErrorWidget(
                error: RootHubException(
                  title: t.match.ui_sheets_match_table_info_sheet.tableNotFound,
                  description: t
                      .match
                      .ui_sheets_match_table_info_sheet
                      .unableToLoadTableDetails,
                ),
                onClose: () => Navigator.of(context).pop(false),
                onRetry: () {
                  setState(() {
                    _detailsFuture = ref
                        .read(matchTablesProvider.notifier)
                        .getTableDetails(
                          widget.scheduledMatchId,
                          forceRefresh: true,
                        );
                  });
                },
              );
            }

            final participatingPlayers =
                tableInfo?.players ?? <MatchSchedulePlayerSnapshot>[];

            return MatchTableInfoContentWidget(
              table: table,
              participatingPlayers: participatingPlayers,
              currentPlayerId: currentPlayer?.id,
              isUnsubscribing: _isUnsubscribing,
              isRemovingPlayer: _isRemovingPlayer,
              onClose: () => Navigator.of(context).pop(false),
              onUnsubscribe: _confirmUnsubscribe,
              onOpenLocationInfo: _showLocationInfoDialog,
              onShareTable: _openShareSheet,
              onShowRemovePlayerDialog: _showRemovePlayerDialog,
            );
          },
        ),
      ),
    );
  }

  Future<void> _openShareSheet(MatchSchedulePairingAttempt table) async {
    final tableId = table.id;
    if (tableId == null || tableId <= 0) {
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            t.match.ui_screens_match_screen.unableToShareThisMatch,
          ),
        ),
      );
      return;
    }

    final localizations = MaterialLocalizations.of(context);
    final attemptedAtLocal = table.attemptedAt.toLocal();
    final dayLabel = localizations.formatMediumDate(attemptedAtLocal);
    final hourLabel = localizations.formatTimeOfDay(
      TimeOfDay.fromDateTime(attemptedAtLocal),
    );

    final location = table.location;
    final locationName =
        location?.googlePlaceLocation?.name ??
        location?.manualInputLocation?.title ??
        t.match.ui_screens_match_table_card_widget.unknownLocation;

    final shareLink = MatchShareLinkBuilder.buildLandingUri(
      serverHost: ref.read(clientProvider).host,
      matchId: tableId,
      location: locationName,
      day: dayLabel,
      hour: hourLabel,
    );

    final shareMessage = t.match.ui_screens_match_screen.shareMessage(
      location: locationName,
      hour: hourLabel,
      day: dayLabel,
      link: shareLink.toString(),
    );

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: false,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return MatchShareSheet(
          rawLink: shareLink,
          shareMessage: shareMessage,
        );
      },
    );
  }

  Future<void> _showLocationInfoDialog(Location? location) async {
    final google = location?.googlePlaceLocation;
    final manual = location?.manualInputLocation;
    final locationTitle = google?.name ?? manual?.title ?? 'Unknown location';
    final locationSubtitle =
        google?.shortFormattedAddress ??
        google?.formattedAddress ??
        manual?.cityName ??
        'Address unavailable';
    final playedMatchesCount = location?.playedMatches?.length ?? 0;
    final types = google?.types ?? <String>[];

    await showDialog<void>(
      context: context,
      builder: (dialogContext) {
        final colorScheme = Theme.of(dialogContext).colorScheme;
        final maxDialogHeight = MediaQuery.of(dialogContext).size.height * 0.86;

        return Dialog(
          insetPadding: EdgeInsets.symmetric(
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
                    padding: EdgeInsets.fromLTRB(14, 14, 14, 10),
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.fromLTRB(
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
                                  SizedBox(width: 8),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '$playedMatchesCount',
                                        style: Theme.of(dialogContext)
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
                                        style: Theme.of(dialogContext)
                                            .textTheme
                                            .labelLarge
                                            ?.copyWith(
                                              fontWeight: FontWeight.w700,
                                              color:
                                                  colorScheme.onSurfaceVariant,
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Container(
                            padding: EdgeInsets.symmetric(
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
                                SizedBox(height: 4),
                                Text(
                                  google?.isPublicPlace == false
                                      ? t.match.ui_screens_match_screen.private
                                      : t.match.ui_screens_match_screen.public,
                                  style: Theme.of(dialogContext)
                                      .textTheme
                                      .labelMedium
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
                      SizedBox(height: 10),
                      Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: [
                          if (google?.rating != null)
                            MatchLocationMetaChipWidget(
                              icon: Icons.star_rounded,
                              label:
                                  'Rating ${google!.rating!.toStringAsFixed(1)}',
                            ),
                          if (google?.userRatingCount != null)
                            MatchLocationMetaChipWidget(
                              icon: Icons.groups_2_rounded,
                              label: '${google!.userRatingCount} ratings',
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
                      SizedBox(height: 12),
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
                        SizedBox(height: 8),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.fromLTRB(12, 10, 12, 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: colorScheme.surfaceContainerHighest
                                .withValues(
                                  alpha: 0.55,
                                ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                t
                                    .match
                                    .ui_screens_match_screen
                                    .manualLocationNotes,
                                style: Theme.of(dialogContext)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                      fontWeight: FontWeight.w900,
                                    ),
                              ),
                              SizedBox(height: 3),
                              Text(
                                '${manual.title} • ${manual.cityName}, ${manual.country.toJson()}',
                                style: Theme.of(dialogContext)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: colorScheme.onSurfaceVariant,
                                    ),
                              ),
                              if (manual.description?.trim().isNotEmpty == true)
                                Padding(
                                  padding: EdgeInsets.only(top: 4),
                                  child: Text(
                                    manual.description!.trim(),
                                    style: Theme.of(dialogContext)
                                        .textTheme
                                        .bodyMedium
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
                    padding: EdgeInsets.fromLTRB(12, 0, 12, 12),
                    child: SizedBox(
                      width: double.infinity,
                      child: FilledButton.tonal(
                        onPressed: () => Navigator.of(dialogContext).pop(),
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
      },
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
        content: Text('$label copied'),
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

  Future<void> _confirmUnsubscribe() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: Text(
            t.match.ui_sheets_match_table_info_sheet.leaveThisTable,
          ),
          content: Text(
            t
                    .match
                    .ui_sheets_match_table_info_sheet
                    .youWillBeUnsubscribedFromThisMatchAndRemovedFromThe +
                t
                    .match
                    .ui_sheets_match_table_info_sheet
                    .playersListYouCanRejoinLaterIfSeatsAreStillAvailable,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(false),
              child: Text(
                t.match.ui_sheets_match_table_info_sheet.cancel3,
              ),
            ),
            FilledButton(
              onPressed: () => Navigator.of(dialogContext).pop(true),
              style: FilledButton.styleFrom(
                backgroundColor: Theme.of(dialogContext).colorScheme.error,
                foregroundColor: Theme.of(dialogContext).colorScheme.onError,
              ),
              child: Text(
                t.match.ui_sheets_match_table_info_sheet.leave,
              ),
            ),
          ],
        );
      },
    );

    if (confirmed != true || !mounted) {
      return;
    }

    setState(() => _isUnsubscribing = true);

    final error = await ref
        .read(matchChatProvider.notifier)
        .unsubscribeFromTable();

    if (!mounted) {
      return;
    }

    if (error != null) {
      setState(() => _isUnsubscribing = false);
      await showErrorDialog(
        context,
        title: error.title,
        description: error.description,
      );
      return;
    }

    Navigator.of(context).pop(true);
  }

  Future<void> _showRemovePlayerDialog(
    List<MatchSchedulePlayerSnapshot> removablePlayers,
  ) async {
    final colorScheme = Theme.of(context).colorScheme;

    final selectedPlayer = await showDialog<MatchSchedulePlayerSnapshot>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: Text(
            t.match.ui_sheets_match_table_info_sheet.removeAPlayer,
          ),
          content: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  t
                      .match
                      .ui_sheets_match_table_info_sheet
                      .selectAPlayerToRemoveFromTheTable,
                  style: Theme.of(dialogContext).textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                SizedBox(height: 16),
                ...removablePlayers.map(
                  (player) => MatchTableInfoRemovePlayerTileWidget(
                    player: player,
                    onTap: () => Navigator.of(dialogContext).pop(player),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: Text(
                t.match.ui_sheets_match_table_info_sheet.cancel2,
              ),
            ),
          ],
        );
      },
    );

    if (selectedPlayer == null || !mounted) {
      return;
    }

    await _confirmRemovePlayer(player: selectedPlayer);
  }

  Future<void> _confirmRemovePlayer({
    required MatchSchedulePlayerSnapshot player,
  }) async {
    final playerName = player.playerData.displayName;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: Text('Remove $playerName?'),
          content: Text(
            '$playerName will be removed from the table and will need to ${t.match.ui_sheets_match_table_info_sheet.rejoinIfSeatsAreStillAvailable}',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(false),
              child: Text(
                t.match.ui_sheets_match_table_info_sheet.cancel,
              ),
            ),
            FilledButton(
              onPressed: () => Navigator.of(dialogContext).pop(true),
              style: FilledButton.styleFrom(
                backgroundColor: Theme.of(dialogContext).colorScheme.error,
                foregroundColor: Theme.of(dialogContext).colorScheme.onError,
              ),
              child: Text(
                t.match.ui_sheets_match_table_info_sheet.remove,
              ),
            ),
          ],
        );
      },
    );

    if (confirmed != true || !mounted) {
      return;
    }

    final playerDataId = player.playerData.id;
    if (playerDataId == null) {
      return;
    }

    setState(() => _isRemovingPlayer = true);

    final error = await ref
        .read(matchChatProvider.notifier)
        .removePlayerFromTable(playerDataId: playerDataId);

    if (!mounted) {
      return;
    }

    if (error != null) {
      setState(() => _isRemovingPlayer = false);
      await showErrorDialog(
        context,
        title: error.title,
        description: error.description,
      );
      return;
    }

    setState(() {
      _isRemovingPlayer = false;
      _detailsFuture = ref
          .read(matchTablesProvider.notifier)
          .getTableDetails(widget.scheduledMatchId, forceRefresh: true);
    });
  }
}
