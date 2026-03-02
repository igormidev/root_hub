import 'package:flutter/material.dart';

class MatchTableInfoDragHandleWidget extends StatelessWidget {
  const MatchTableInfoDragHandleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: 50,
      height: 5,
      margin: EdgeInsets.only(top: 12, bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        color: colorScheme.outlineVariant,
      ),
    );
  }
}
