import 'package:flutter/material.dart';
import 'package:flutter_chat_core/flutter_chat_core.dart';

class MatchChatSystemEventMessageWidget extends StatelessWidget {
  final CustomMessage message;

  const MatchChatSystemEventMessageWidget({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final metadata = message.metadata ?? const <String, dynamic>{};
    final type = metadata['type'] as String?;
    final content = metadata['content'] as String? ?? '';
    final isJoin = type == 'systemJoin';

    final localizations = MaterialLocalizations.of(context);
    final sentAt = message.sentAt;
    final timeLabel = sentAt != null
        ? localizations.formatTimeOfDay(
            TimeOfDay.fromDateTime(sentAt.toLocal()),
          )
        : null;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 24),
      child: Center(
        child: Container(
          padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(999),
            color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.7),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                isJoin ? Icons.person_add_rounded : Icons.person_remove_rounded,
                size: 14,
                color: colorScheme.onSurfaceVariant,
              ),
              const SizedBox(width: 6),
              Flexible(
                child: Text(
                  content,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              if (timeLabel != null) ...[
                const SizedBox(width: 8),
                Text(
                  timeLabel,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
