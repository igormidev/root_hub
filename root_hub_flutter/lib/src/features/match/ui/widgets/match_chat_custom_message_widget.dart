import 'dart:typed_data';

import 'package:blurhash_dart/blurhash_dart.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatview/chatview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart'
    as cache_manager;
import 'package:image/image.dart' as img;
import 'package:root_hub_flutter/src/core/chat/match_chat_view_message_metadata.dart';

final _matchChatImageCacheManager = cache_manager.CacheManager(
  cache_manager.Config(
    'matchChatImageCache',
    stalePeriod: Duration(days: 5),
    maxNrOfCacheObjects: 200,
  ),
);

class MatchChatCustomMessageWidget extends StatefulWidget {
  const MatchChatCustomMessageWidget({
    required this.message,
    super.key,
  });

  final Message message;

  @override
  State<MatchChatCustomMessageWidget> createState() =>
      _MatchChatCustomMessageWidgetState();
}

class _MatchChatCustomMessageWidgetState
    extends State<MatchChatCustomMessageWidget> {
  MemoryImage? _blurhashImage;

  @override
  void initState() {
    super.initState();
    _decodeBlurhash();
  }

  @override
  void didUpdateWidget(covariant MatchChatCustomMessageWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.message.customBlurhash != widget.message.customBlurhash) {
      _decodeBlurhash();
    }
  }

  void _decodeBlurhash() {
    final blurhash = widget.message.customBlurhash;
    if (blurhash == null || blurhash.isEmpty) {
      _blurhashImage = null;
      return;
    }

    try {
      final decoded = BlurHash.decode(blurhash);
      final blurImage = decoded.toImage(36, 22);
      _blurhashImage = MemoryImage(
        Uint8List.fromList(img.encodeJpg(blurImage)),
      );
    } catch (_) {
      _blurhashImage = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    if (widget.message.isCustomSystemMessage) {
      final isJoin = widget.message.customSystemType == 'systemJoin';
      final sentAt = widget.message.createdAt.toLocal();
      final timeLabel = MaterialLocalizations.of(context).formatTimeOfDay(
        TimeOfDay.fromDateTime(sentAt),
      );

      return SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: Center(
            child: Container(
              padding: EdgeInsets.fromLTRB(12, 7, 12, 7),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(999),
                color: colorScheme.surfaceContainerHighest.withValues(
                  alpha: 0.78,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    isJoin
                        ? Icons.person_add_rounded
                        : Icons.person_remove_rounded,
                    size: 14,
                    color: colorScheme.onSurfaceVariant,
                  ),
                  SizedBox(width: 6),
                  Flexible(
                    child: Text(
                      widget.message.message,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    timeLabel,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: colorScheme.onSurfaceVariant.withValues(
                        alpha: 0.72,
                      ),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    final width = widget.message.customImageWidth;
    final height = widget.message.customImageHeight;
    final aspectRatio = width != null && height != null && height > 0
        ? width / height
        : 1.0;
    final caption = widget.message.message.trim();
    final hasCaption = caption.isNotEmpty;
    final localPreviewBytes = widget.message.customLocalPreviewBytes;
    final imageUrl = widget.message.customImageUrl;

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 300, maxHeight: 400),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: AspectRatio(
          aspectRatio: aspectRatio,
          child: Stack(
            fit: StackFit.expand,
            children: [
              if (localPreviewBytes != null)
                if (_blurhashImage != null)
                  Stack(
                    fit: StackFit.expand,
                    children: [
                      Image(
                        image: _blurhashImage!,
                        fit: BoxFit.cover,
                      ),
                      TweenAnimationBuilder<double>(
                        tween: Tween<double>(begin: 0, end: 1),
                        duration: Duration(milliseconds: 320),
                        curve: Curves.easeOutCubic,
                        builder: (context, opacity, child) {
                          return Opacity(
                            opacity: opacity,
                            child: child,
                          );
                        },
                        child: Image.memory(
                          localPreviewBytes,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  )
                else
                  Image.memory(
                    localPreviewBytes,
                    fit: BoxFit.cover,
                  )
              else if (imageUrl != null && imageUrl.isNotEmpty)
                CachedNetworkImage(
                  imageUrl: imageUrl,
                  cacheManager: _matchChatImageCacheManager,
                  fit: BoxFit.cover,
                  fadeInDuration: Duration(milliseconds: 250),
                  placeholder: (context, _) {
                    if (_blurhashImage != null) {
                      return Image(
                        image: _blurhashImage!,
                        fit: BoxFit.cover,
                      );
                    }

                    return DecoratedBox(
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainerHighest,
                      ),
                    );
                  },
                  errorWidget: (context, _, __) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainerHighest,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.broken_image_rounded,
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    );
                  },
                )
              else
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerHighest,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.photo_rounded,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              if (hasCaption)
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(10, 18, 10, 10),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withValues(alpha: 0.28),
                          Colors.black.withValues(alpha: 0.62),
                        ],
                      ),
                    ),
                    child: Text(
                      caption,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
