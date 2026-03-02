import 'package:flutter/material.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';

class RegisterMatchPickerErrorSection extends StatelessWidget {
  const RegisterMatchPickerErrorSection({
    super.key,
    required this.error,
    required this.onRetry,
  });

  final RootHubException error;
  final VoidCallback onRetry;

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
            border: Border.all(color: colorScheme.error.withValues(alpha: 0.5)),
            color: colorScheme.errorContainer.withValues(alpha: 0.32),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                error.title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w900,
                  color: colorScheme.onErrorContainer,
                ),
              ),
              SizedBox(height: 6),
              Text(
                error.description,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onErrorContainer,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 12),
              FilledButton.icon(
                onPressed: onRetry,
                icon: Icon(Icons.refresh_rounded),
                label: Text(
                  t
                      .register_match
                      .ui_sheets_register_match_picker_error_section
                      .retry,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
