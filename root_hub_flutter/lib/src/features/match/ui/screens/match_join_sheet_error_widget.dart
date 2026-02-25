import 'package:flutter/material.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';

class MatchJoinSheetErrorWidget extends StatelessWidget {
  const MatchJoinSheetErrorWidget({
    required this.error,
    required this.onRetry,
    super.key,
  });

  final RootHubException error;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.fromLTRB(18, 16, 18, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 50,
              height: 5,
              margin: EdgeInsets.only(bottom: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(999),
                color: colorScheme.outlineVariant,
              ),
            ),
          ),
          Text(
            error.title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: 6),
          Text(
            error.description,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w700,
            ),
          ),
          Spacer(),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text(
                    t.match.ui_screens_match_join_sheet_error_widget.close,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: FilledButton.icon(
                  onPressed: onRetry,
                  icon: Icon(Icons.refresh_rounded),
                  label: Text(
                    t.match.ui_screens_match_join_sheet_error_widget.retry,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
