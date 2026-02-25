import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/design_system/default_error_snackbar.dart';
import 'package:root_hub_flutter/src/features/match/ui/sheets/match_table_info_content_widget.dart';
import 'package:root_hub_flutter/src/features/match/ui/sheets/match_table_info_error_widget.dart';
import 'package:root_hub_flutter/src/features/match/ui/sheets/match_table_info_loading_widget.dart';
import 'package:root_hub_flutter/src/features/match/ui/sheets/match_table_info_remove_player_tile_widget.dart';
import 'package:root_hub_flutter/src/states/auth_flow/auth_flow_provider.dart';
import 'package:root_hub_flutter/src/states/auth_flow/auth_flow_state.dart';
import 'package:root_hub_flutter/src/states/match/match_chat_provider.dart';
import 'package:root_hub_flutter/src/states/match/match_tables_provider.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';

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
                  title: t.match.ui_sheets_match_table_info_sheet.l91c26,
                  description: t.match.ui_sheets_match_table_info_sheet.l92c32,
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
              onShowRemovePlayerDialog: _showRemovePlayerDialog,
            );
          },
        ),
      ),
    );
  }

  Future<void> _confirmUnsubscribe() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: Text(
            t.match.ui_sheets_match_table_info_sheet.l132c29,
          ),
          content: Text(
            t.match.ui_sheets_match_table_info_sheet.l134c13 +
                t.match.ui_sheets_match_table_info_sheet.l135c13,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(false),
              child: Text(
                t.match.ui_sheets_match_table_info_sheet.l140c33,
              ),
            ),
            FilledButton(
              onPressed: () => Navigator.of(dialogContext).pop(true),
              style: FilledButton.styleFrom(
                backgroundColor: Theme.of(dialogContext).colorScheme.error,
                foregroundColor: Theme.of(dialogContext).colorScheme.onError,
              ),
              child: Text(
                t.match.ui_sheets_match_table_info_sheet.l148c33,
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
            t.match.ui_sheets_match_table_info_sheet.l191c29,
          ),
          content: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  t.match.ui_sheets_match_table_info_sheet.l199c19,
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
                t.match.ui_sheets_match_table_info_sheet.l217c33,
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
            '$playerName will be removed from the table and will need to ${t.match.ui_sheets_match_table_info_sheet.l243c13}',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(false),
              child: Text(
                t.match.ui_sheets_match_table_info_sheet.l248c33,
              ),
            ),
            FilledButton(
              onPressed: () => Navigator.of(dialogContext).pop(true),
              style: FilledButton.styleFrom(
                backgroundColor: Theme.of(dialogContext).colorScheme.error,
                foregroundColor: Theme.of(dialogContext).colorScheme.onError,
              ),
              child: Text(
                t.match.ui_sheets_match_table_info_sheet.l256c33,
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
