import 'package:flutter/material.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';

class MatchCreateTableLocationLoadingRecentWidget extends StatelessWidget {
  const MatchCreateTableLocationLoadingRecentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 14),
      child: Row(
        children: [
          SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(strokeWidth: 2.5),
          ),
          SizedBox(width: 10),
          Text(
            t
                .match
                .ui_screens_match_create_table_location_loading_recent_widget
                .l21c13,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}
