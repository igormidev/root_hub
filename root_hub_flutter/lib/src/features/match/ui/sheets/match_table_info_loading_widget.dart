import 'package:flutter/material.dart';
import 'package:root_hub_flutter/src/features/match/ui/sheets/match_table_info_drag_handle_widget.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';

class MatchTableInfoLoadingWidget extends StatelessWidget {
  const MatchTableInfoLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        MatchTableInfoDragHandleWidget(),
        Expanded(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 36,
                  height: 36,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    color: colorScheme.primary,
                  ),
                ),
                SizedBox(height: 14),
                Text(
                  t
                      .match
                      .ui_sheets_match_table_info_loading_widget
                      .loadingTableDetails,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
