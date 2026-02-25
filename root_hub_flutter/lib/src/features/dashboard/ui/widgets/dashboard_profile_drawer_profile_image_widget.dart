import 'package:flutter/material.dart';

class DashboardProfileDrawerProfileImageWidget extends StatelessWidget {
  const DashboardProfileDrawerProfileImageWidget({
    required this.isLoadingProfileImage,
    required this.profileImageUrl,
    super.key,
  });

  final bool isLoadingProfileImage;
  final String? profileImageUrl;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    if (isLoadingProfileImage) {
      return Center(
        child: SizedBox(
          width: 22,
          height: 22,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: colorScheme.primary,
          ),
        ),
      );
    }

    final imageUrl = profileImageUrl;
    if (imageUrl == null || imageUrl.isEmpty) {
      return Icon(
        Icons.person_rounded,
        size: 44,
        color: colorScheme.onSurfaceVariant,
      );
    }

    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
      errorBuilder: (_, _, _) {
        return Icon(
          Icons.person_rounded,
          size: 44,
          color: colorScheme.onSurfaceVariant,
        );
      },
    );
  }
}
