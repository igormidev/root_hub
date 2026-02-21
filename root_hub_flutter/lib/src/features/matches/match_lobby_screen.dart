import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/core/extension/faction_ui_extension.dart';
import 'package:root_hub_flutter/src/global_providers/session_provider.dart';
import 'package:root_hub_flutter/src/states/auth_flow/auth_flow_provider.dart';
import 'package:root_hub_flutter/src/states/auth_flow/auth_flow_state.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';

class MatchLobbyScreen extends ConsumerWidget {
  const MatchLobbyScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final authFlowState = ref.watch(authFlowProvider);

    final playerData = authFlowState.maybeMap(
      authenticated: (authenticatedState) => authenticatedState.playerData,
      orElse: () => null,
    );

    if (playerData == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              colorScheme.primaryContainer.withValues(alpha: 0.45),
              colorScheme.surface,
              colorScheme.secondaryContainer.withValues(alpha: 0.28),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Welcome, ${playerData.displayName}',
                        style: GoogleFonts.cinzel(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: colorScheme.onSurface,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        await ref.read(clientProvider).auth.signOutDevice();
                      },
                      icon: const Icon(Icons.logout),
                      tooltip: 'Sign out',
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Your favorite faction is ${_formatFactionName(playerData.favoriteFaction)}.',
                  style: GoogleFonts.nunitoSans(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 22),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(color: colorScheme.outlineVariant),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          colorScheme.surfaceContainerHighest.withValues(
                            alpha: 0.7,
                          ),
                          colorScheme.surfaceContainer.withValues(alpha: 0.74),
                        ],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 240,
                          child: Image.asset(
                            playerData.favoriteFaction.getFactionImage,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Match listing module is the next step.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunitoSans(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Authentication and onboarding are now fully connected.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunitoSans(
                            fontSize: 14,
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _formatFactionName(Faction faction) {
    final raw = faction.toJson();
    final withSpaces = raw.replaceAllMapped(
      RegExp(r'([a-z])([A-Z])'),
      (match) => '${match.group(1)} ${match.group(2)}',
    );
    return withSpaces
        .split(' ')
        .where((word) => word.isNotEmpty)
        .map((word) => '${word[0].toUpperCase()}${word.substring(1)}')
        .join(' ');
  }
}
