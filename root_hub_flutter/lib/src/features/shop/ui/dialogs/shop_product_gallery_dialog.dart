import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';
import 'package:root_hub_flutter/src/features/shop/ui/widgets/shop_carousel_indicator_widget.dart';

class ShopProductGalleryDialog extends StatefulWidget {
  const ShopProductGalleryDialog({
    required this.images,
    required this.initialPage,
    required this.productTitle,
    required this.heroTagPrefix,
    super.key,
  });

  final List<String> images;
  final int initialPage;
  final String productTitle;
  final String heroTagPrefix;

  @override
  State<ShopProductGalleryDialog> createState() =>
      _ShopProductGalleryDialogState();
}

class _ShopProductGalleryDialogState extends State<ShopProductGalleryDialog> {
  late final PageController _pageController;
  late int _activePage;

  @override
  void initState() {
    super.initState();
    _activePage = widget.initialPage.clamp(
      0,
      widget.images.isNotEmpty ? widget.images.length - 1 : 0,
    );
    _pageController = PageController(initialPage: _activePage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Stack(
          children: [
            if (widget.images.isEmpty)
              Center(
                child: Icon(
                  Icons.image_not_supported_rounded,
                  color: Colors.white70,
                  size: 36,
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
                  return InteractiveViewer(
                    minScale: 1,
                    maxScale: 4,
                    child: Center(
                      child: Hero(
                        // ignore: feature_hardcoded_ui_string
                        tag: '${widget.heroTagPrefix}-$index',
                        child: CachedNetworkImage(
                          imageUrl: widget.images[index],
                          fit: BoxFit.contain,
                          progressIndicatorBuilder: (context, _, progress) {
                            return Center(
                              child: CircularProgressIndicator(
                                value: progress.progress,
                                color: Colors.white,
                                strokeWidth: 2.5,
                              ),
                            );
                          },
                          errorWidget: (context, _, _) {
                            return Icon(
                              Icons.broken_image_rounded,
                              color: Colors.white70,
                              size: 32,
                            );
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            Positioned(
              top: 8,
              left: 12,
              right: 12,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      widget.productTitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  IconButton.filledTonal(
                    tooltip: t.shop.ui_screens_shop_screen.closeGallery,
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.black.withValues(alpha: 0.45),
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.close_rounded,
                    ),
                  ),
                ],
              ),
            ),
            if (widget.images.length > 1)
              Positioned(
                left: 0,
                right: 0,
                bottom: 12,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(999),
                        color: Colors.black.withValues(alpha: 0.35),
                        border: Border.all(
                          color: colorScheme.outlineVariant.withValues(
                            alpha: 0.3,
                          ),
                        ),
                      ),
                      child: Text(
                        '${_activePage + 1}/${widget.images.length}',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    ShopCarouselIndicatorWidget(
                      itemCount: widget.images.length,
                      activeIndex: _activePage,
                      activeColor: Colors.white,
                      inactiveColor: Colors.white.withValues(alpha: 0.35),
                      onTap: (index) {
                        _pageController.animateToPage(
                          index,
                          duration: Duration(milliseconds: 260),
                          curve: Curves.easeOutCubic,
                        );
                      },
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
