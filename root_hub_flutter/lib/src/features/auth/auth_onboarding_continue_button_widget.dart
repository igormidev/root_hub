import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/core/extension/faction_ui_extension.dart';
import 'package:root_hub_flutter/src/states/auth_flow/auth_flow_provider.dart';
import 'package:root_hub_flutter/src/states/onboarding/onboarding_provider.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';

class AuthOnboardingContinueButtonWidget extends ConsumerWidget {
  const AuthOnboardingContinueButtonWidget({
    required this.faction,
    super.key,
  });

  final Faction faction;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final useDarkForeground =
        faction == Faction.riverfolkCompany || faction == Faction.keepersInIron;
    final foregroundColor = useDarkForeground ? Colors.black : Colors.white;

    return SizedBox(
          key: ValueKey(faction.toJson()),
          height: 58,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () async {
              await ref
                  .read(onboardingProvider.notifier)
                  .persistSelectedFaction();
              ref.read(authFlowProvider.notifier).moveToOnboardingProfile();
            },
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: faction.factionColor,
              foregroundColor: foregroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Text(
              t.auth.auth_onboarding_continue_button_widget.continueButton,
              style: GoogleFonts.getFont(
                'MedievalSharp',
                fontSize: 22,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.7,
                color: foregroundColor,
              ),
            ),
          ),
        )
        .animate()
        .fadeIn(duration: 240.ms)
        .slideY(begin: 0.25, end: 0, duration: 240.ms);
  }
}
