import 'package:flutter/material.dart';
import 'package:root_hub_client/root_hub_client.dart';

class MatchTableInfoBottomActionsWidget extends StatelessWidget {
  final MatchSchedulePairingAttempt table;
  final List<MatchSchedulePlayerSnapshot> participatingPlayers;
  final int? currentPlayerId;
  final bool isUnsubscribing;
  final bool isRemovingPlayer;
  final VoidCallback onClose;
  final VoidCallback onUnsubscribe;
  final Future<void> Function(List<MatchSchedulePlayerSnapshot>)
  onShowRemovePlayerDialog;

  const MatchTableInfoBottomActionsWidget({
    super.key,
    required this.table,
    required this.participatingPlayers,
    required this.currentPlayerId,
    required this.isUnsubscribing,
    required this.isRemovingPlayer,
    required this.onClose,
    required this.onUnsubscribe,
    required this.onShowRemovePlayerDialog,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isHost =
        currentPlayerId != null && table.playerDataId == currentPlayerId;

    final removablePlayers = participatingPlayers
        .where((p) => p.playerData.id != currentPlayerId)
        .toList();

    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(18, 10, 18, 14),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: onClose,
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 52),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Close'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: FilledButton.icon(
                    onPressed: isUnsubscribing ? null : onUnsubscribe,
                    style: FilledButton.styleFrom(
                      minimumSize: const Size(double.infinity, 52),
                      maximumSize: const Size(double.infinity, 52),
                      backgroundColor: colorScheme.error,
                      foregroundColor: colorScheme.onError,
                    ),
                    icon: isUnsubscribing
                        ? SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: colorScheme.onError,
                            ),
                          )
                        : const Icon(Icons.person_remove_rounded),
                    label: Text(
                      isUnsubscribing ? 'Leaving...' : 'Leave Table',
                    ),
                  ),
                ),
              ],
            ),
            if (isHost && removablePlayers.isNotEmpty) ...[
              const SizedBox(height: 10),
              OutlinedButton.icon(
                onPressed: isRemovingPlayer
                    ? null
                    : () => onShowRemovePlayerDialog(removablePlayers),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 52),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  side: BorderSide(
                    color: colorScheme.error.withValues(alpha: 0.5),
                  ),
                  foregroundColor: colorScheme.error,
                ),
                icon: isRemovingPlayer
                    ? SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: colorScheme.error,
                        ),
                      )
                    : const Icon(Icons.group_remove_rounded),
                label: Text(
                  isRemovingPlayer ? 'Removing...' : 'Remove Player',
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
