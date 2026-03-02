import 'package:flutter/material.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/features/register_match/ui/sheets/register_match_picker_empty_section.dart';
import 'package:root_hub_flutter/src/features/register_match/ui/sheets/register_match_picker_error_section.dart';
import 'package:root_hub_flutter/src/features/register_match/ui/sheets/register_match_picker_match_item_card.dart';
import 'package:root_hub_flutter/src/states/register_match/register_match_state.dart';

class RegisterMatchPickerBodySection extends StatelessWidget {
  const RegisterMatchPickerBodySection({
    super.key,
    required this.registerState,
    required this.onRetry,
    required this.onRegisterMatchTap,
    required this.onCancelMatchTap,
    required this.isTooEarlyToRegister,
    required this.processingMatchId,
  });

  final RegisterMatchState registerState;
  final VoidCallback onRetry;
  final Future<void> Function(MatchSchedulePairingAttempt match)
  onRegisterMatchTap;
  final Future<void> Function(MatchSchedulePairingAttempt match)
  onCancelMatchTap;
  final bool Function(MatchSchedulePairingAttempt match) isTooEarlyToRegister;
  final int? processingMatchId;

  @override
  Widget build(BuildContext context) {
    if (registerState.isLoadingPendingMatches &&
        registerState.pendingMatches.isEmpty) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    if (registerState.pendingMatchesError != null &&
        registerState.pendingMatches.isEmpty) {
      return RegisterMatchPickerErrorSection(
        error: registerState.pendingMatchesError!,
        onRetry: onRetry,
      );
    }

    if (registerState.pendingMatches.isEmpty) {
      return RegisterMatchPickerEmptySection();
    }

    return ListView.builder(
      physics: AlwaysScrollableScrollPhysics(
        parent: BouncingScrollPhysics(),
      ),
      padding: EdgeInsets.fromLTRB(14, 4, 14, 16),
      itemCount: registerState.pendingMatches.length,
      itemBuilder: (context, index) {
        final match = registerState.pendingMatches[index];
        return Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: RegisterMatchPickerMatchItemCard(
            match: match,
            canRegisterNow: !isTooEarlyToRegister(match),
            isProcessing:
                processingMatchId != null && processingMatchId == match.id,
            onRegisterTap: () => onRegisterMatchTap(match),
            onCancelTap: () => onCancelMatchTap(match),
          ),
        );
      },
    );
  }
}
