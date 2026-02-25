import 'package:flutter/material.dart';

class MatchCreateTableCounterColumnWidget extends StatelessWidget {
  const MatchCreateTableCounterColumnWidget({
    super.key,
    required this.title,
    required this.value,
    required this.onDecrease,
    required this.onIncrease,
  });

  final String title;
  final int value;
  final VoidCallback? onDecrease;
  final VoidCallback? onIncrease;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: 6),
          Row(
            children: [
              IconButton.filledTonal(
                onPressed: onDecrease,
                icon: Icon(Icons.remove_rounded),
              ),
              Expanded(
                child: Text(
                  '$value',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              IconButton.filledTonal(
                onPressed: onIncrease,
                icon: Icon(Icons.add_rounded),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
