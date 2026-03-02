import 'package:flutter/material.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';

class RegisterMatchPickerEmptySection extends StatelessWidget {
  const RegisterMatchPickerEmptySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ListView(
      physics: AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.fromLTRB(14, 12, 14, 16),
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(14, 14, 14, 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: colorScheme.outlineVariant),
            color: colorScheme.surfaceContainerLow,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                t
                    .register_match
                    .ui_sheets_register_match_picker_empty_section
                    .noPendingMatches,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: 6),
              Text(
                t
                    .register_match
                    .ui_sheets_register_match_picker_empty_section
                    .youDoNotHaveAnyHostedSubscribedMatchPendingResultRegistration,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
