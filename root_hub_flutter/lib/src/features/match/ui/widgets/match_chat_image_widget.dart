import 'dart:typed_data';

import 'package:blurhash_dart/blurhash_dart.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_chat_core/flutter_chat_core.dart';
import 'package:image/image.dart' as img;

final _chatImageCacheManager = CacheManager(
  Config(
    'matchChatImageCache',
    stalePeriod: const Duration(days: 5),
    maxNrOfCacheObjects: 200,
  ),
);

class MatchChatImageWidget extends StatefulWidget {
  final ImageMessage message;
  final int index;

  const MatchChatImageWidget({
    super.key,
    required this.message,
    required this.index,
  });

  @override
  State<MatchChatImageWidget> createState() => _MatchChatImageWidgetState();
}

class _MatchChatImageWidgetState extends State<MatchChatImageWidget> {
  MemoryImage? _blurhashImage;

  @override
  void initState() {
    super.initState();
    _decodeBlurhash();
  }

  @override
  void didUpdateWidget(covariant MatchChatImageWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.message.blurhash != widget.message.blurhash) {
      _decodeBlurhash();
    }
  }

  void _decodeBlurhash() {
    final blurhash = widget.message.blurhash;
    if (blurhash == null || blurhash.isEmpty) {
      _blurhashImage = null;
      return;
    }

    try {
      final decoded = BlurHash.decode(blurhash);
      final blurImage = decoded.toImage(35, 20);
      final jpg = img.encodeJpg(blurImage);
      _blurhashImage = MemoryImage(Uint8List.fromList(jpg));
    } catch (_) {
      _blurhashImage = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final width = widget.message.width;
    final height = widget.message.height;
    final aspectRatio = (width != null && height != null && height > 0)
        ? width / height
        : 1.0;

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 300, maxHeight: 400),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: AspectRatio(
          aspectRatio: aspectRatio,
          child: CachedNetworkImage(
            imageUrl: widget.message.source,
            cacheManager: _chatImageCacheManager,
            fit: BoxFit.cover,
            fadeInDuration: const Duration(milliseconds: 250),
            fadeOutDuration: const Duration(milliseconds: 250),
            placeholder: (context, url) {
              if (_blurhashImage != null) {
                return Image(
                  image: _blurhashImage!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                );
              }
              return Container(color: colorScheme.surfaceContainerLow);
            },
            errorWidget: (context, url, error) => Container(
              color: colorScheme.surfaceContainerLow,
              child: Center(
                child: Icon(
                  Icons.broken_image_rounded,
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
