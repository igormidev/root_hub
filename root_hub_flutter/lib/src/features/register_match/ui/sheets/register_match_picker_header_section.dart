import 'package:flutter/material.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';

class RegisterMatchPickerHeaderSection extends StatelessWidget {
  const RegisterMatchPickerHeaderSection({
    super.key,
    required this.pendingMatchesCount,
  });

  final int pendingMatchesCount;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.fromLTRB(14, 10, 14, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(999),
                color: colorScheme.outlineVariant,
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Text(
                  t
                      .register_match
                      .ui_sheets_register_match_picker_header_section
                      .registerMatchResult,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(999),
                  color: colorScheme.primaryContainer,
                ),
                child: Text(
                  '$pendingMatchesCount pending',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.w900,
                    color: colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 4),
          Text(
            t
                .register_match
                .ui_sheets_register_match_picker_header_section
                .selectAMatchYouParticipatedInYouCanRegisterAResultFrom2HoursBeforeSchedu,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w700,
              height: 1.35,
            ),
          ),
        ],
      ),
    );
  }
}
