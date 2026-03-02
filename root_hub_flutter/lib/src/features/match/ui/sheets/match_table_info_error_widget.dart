import 'package:flutter/material.dart';
import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/src/features/match/ui/sheets/match_table_info_drag_handle_widget.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';

class MatchTableInfoErrorWidget extends StatelessWidget {
  final RootHubException error;
  final VoidCallback onClose;
  final VoidCallback onRetry;

  const MatchTableInfoErrorWidget({
    super.key,
    required this.error,
    required this.onClose,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.fromLTRB(18, 16, 18, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: MatchTableInfoDragHandleWidget()),
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
                  onPressed: onClose,
                  child: Text(
                    t.match.ui_sheets_match_table_info_error_widget.close,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: FilledButton.icon(
                  onPressed: onRetry,
                  icon: Icon(Icons.refresh_rounded),
                  label: Text(
                    t.match.ui_sheets_match_table_info_error_widget.retry,
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
