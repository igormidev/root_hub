import 'package:flutter/material.dart';
import 'package:root_hub_client/root_hub_client.dart';

class MatchJoinSheetLoadingWidget extends StatelessWidget {
  const MatchJoinSheetLoadingWidget({
    required this.fallbackTable,
    super.key,
  });

  final MatchSchedulePairingAttempt fallbackTable;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        Container(
          width: 50,
          height: 5,
          margin: EdgeInsets.only(top: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(999),
            color: colorScheme.outlineVariant,
          ),
        ),
        Expanded(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
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
                    'Loading table details for "${fallbackTable.title}"...',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
