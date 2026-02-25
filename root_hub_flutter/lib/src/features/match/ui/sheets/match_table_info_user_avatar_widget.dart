import 'package:flutter/material.dart';

class MatchTableInfoUserAvatarWidget extends StatelessWidget {
  final String? imageUrl;

  const MatchTableInfoUserAvatarWidget({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: 38,
      height: 38,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: colorScheme.primary.withValues(alpha: 0.5),
          width: 1.4,
        ),
        color: colorScheme.surfaceContainerHighest,
      ),
      child: ClipOval(
        child: imageUrl == null || imageUrl!.isEmpty
            ? Icon(
                Icons.person_rounded,
                color: colorScheme.onSurfaceVariant,
              )
            : Image.network(
                imageUrl!,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) {
                  return Icon(
                    Icons.person_rounded,
                    color: colorScheme.onSurfaceVariant,
                  );
                },
              ),
      ),
    );
  }
}
