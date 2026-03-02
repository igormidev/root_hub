import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:root_hub_flutter/src/features/shop/ui/widgets/shop_carousel_indicator_widget.dart';

class ShopProductImageCarouselWidget extends StatefulWidget {
  const ShopProductImageCarouselWidget({
    required this.images,
    required this.heroTagPrefix,
    required this.onImageTap,
    super.key,
  });

  final List<String> images;
  final String heroTagPrefix;
  final void Function(int index) onImageTap;

  @override
  State<ShopProductImageCarouselWidget> createState() =>
      _ShopProductImageCarouselWidgetState();
}

class _ShopProductImageCarouselWidgetState
    extends State<ShopProductImageCarouselWidget> {
  static const _autoSlideDuration = Duration(seconds: 5);
  static const _pageTransitionDuration = Duration(milliseconds: 420);

  late final PageController _pageController;
  Timer? _autoSlideTimer;
  int _activePage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _startAutoSlide();
  }

  @override
  void didUpdateWidget(covariant ShopProductImageCarouselWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.images == widget.images) {
      return;
    }

    _autoSlideTimer?.cancel();
    _activePage = 0;
    if (_pageController.hasClients) {
      _pageController.jumpToPage(0);
    }
    _startAutoSlide();
  }

  @override
  void dispose() {
    _autoSlideTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoSlide() {
    if (widget.images.length < 2) {
      return;
    }

    _autoSlideTimer = Timer.periodic(_autoSlideDuration, (timer) {
      if (!_pageController.hasClients || !mounted) {
        return;
      }

      final nextPage = (_activePage + 1) % widget.images.length;
      _pageController.animateToPage(
        nextPage,
        duration: _pageTransitionDuration,
        curve: Curves.easeInOutCubic,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: AspectRatio(
          aspectRatio: 16 / 10,
          child: Stack(
            children: [
              if (widget.images.isEmpty)
                Container(
                  color: colorScheme.surfaceContainerLow,
                  child: Center(
                    child: Icon(
                      Icons.image_not_supported_rounded,
                      size: 34,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                )
              else
                PageView.builder(
                  controller: _pageController,
                  physics: BouncingScrollPhysics(),
                  itemCount: widget.images.length,
                  onPageChanged: (index) {
                    setState(() {
                      _activePage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    final imageUrl = widget.images[index];

                    return Material(
                      color: colorScheme.surfaceContainerLow,
                      child: InkWell(
                        onTap: () {
                          widget.onImageTap(index);
                        },
                        child: Hero(
                          // ignore: feature_hardcoded_ui_string
                          tag: '${widget.heroTagPrefix}-$index',
                          child: CachedNetworkImage(
                            imageUrl: imageUrl,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                            fadeInDuration: Duration(milliseconds: 220),
                            fadeOutDuration: Duration(milliseconds: 180),
                            progressIndicatorBuilder: (context, _, progress) {
                              return Center(
                                child: CircularProgressIndicator(
                                  value: progress.progress,
                                  strokeWidth: 2.4,
                                ),
                              );
                            },
                            errorWidget: (context, _, _) {
                              return Container(
                                color: colorScheme.surfaceContainerLow,
                                child: Center(
                                  child: Icon(
                                    Icons.broken_image_rounded,
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              if (widget.images.length > 1)
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 6,
                  child: ShopCarouselIndicatorWidget(
                    itemCount: widget.images.length,
                    activeIndex: _activePage,
                    onTap: (index) {
                      _pageController.animateToPage(
                        index,
                        duration: Duration(milliseconds: 240),
                        curve: Curves.easeOutCubic,
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
