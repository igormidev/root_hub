import 'package:flutter/material.dart';

class MatchChatSenderAvatarWidget extends StatelessWidget {
  final String? imageUrl;

  const MatchChatSenderAvatarWidget(
    this.imageUrl, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final normalizedImageUrl = imageUrl?.trim();

    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: colorScheme.surfaceContainerHighest,
        border: Border.all(
          color: colorScheme.outlineVariant,
        ),
      ),
      child: ClipOval(
        child: normalizedImageUrl != null && normalizedImageUrl.isNotEmpty
            ? Image.network(
                normalizedImageUrl,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) {
                  return Icon(
                    Icons.person_rounded,
                    size: 16,
                    color: colorScheme.onSurfaceVariant,
                  );
                },
              )
            : Icon(
                Icons.person_rounded,
                size: 16,
                color: colorScheme.onSurfaceVariant,
              ),
      ),
    );
  }
}
