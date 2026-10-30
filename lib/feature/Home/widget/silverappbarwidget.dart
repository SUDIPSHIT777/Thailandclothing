import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:thailand_clothing/feature/Home/widget/tabbarwidget.dart';

const Color _ink = Color(0xFF1F1924);

// Fallback gradient while the festive video is loading.
const Color _topColor = Color(0xFFD4885C);
const Color _middleColor = Color(0xFFE8A47A);
const Color _bottomColor = Color(0xFFF0ACA4);
const Color _categoryColor = Color(0xFFF4B3A6);

const LinearGradient _homeGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [_topColor, _middleColor, _bottomColor],
  stops: [0.0, 0.55, 1.0],
);

// Replace with your real category data (keys: 'img', 'label').
const List<Map<String, String>> _defaultCategories = [
  {'img': 'https://picsum.photos/seed/c1/200', 'label': 'Women'},
  {'img': 'https://picsum.photos/seed/c2/200', 'label': 'Men'},
  {'img': 'https://picsum.photos/seed/c3/200', 'label': 'Kids'},
  {'img': 'https://picsum.photos/seed/c4/200', 'label': 'Festive'},
  {'img': 'https://picsum.photos/seed/c5/200', 'label': 'Western'},
  {'img': 'https://picsum.photos/seed/c6/200', 'label': 'Ethnic'},
  {'img': 'https://picsum.photos/seed/c7/200', 'label': 'Sale'},
];

const double _locationHeight = 36;
const double _searchHeight = 56;
const double _tabsHeight = 32;
const double _categoryHeight = 104;
const double _collapsibleHeight = _tabsHeight + _categoryHeight;

/// Pinned video app bar with a single scroll-linked tab/category section.
/// Configure the parent CustomScrollView physics for the desired feel.
class HomeSliverAppBar extends StatelessWidget {
  final List<Map<String, String>> categories;

  const HomeSliverAppBar({super.key, this.categories = _defaultCategories});

  @override
  Widget build(BuildContext context) {
    final double topPadding = MediaQuery.paddingOf(context).top;

    return SliverPersistentHeader(
      pinned: true,
      // Reveals progressively on reverse scroll; no snap animation is added.
      floating: true,
      delegate: _HomeAppBarDelegate(
        topPadding: topPadding,
        categories: categories,
      ),
    );
  }
}

class _HomeAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double topPadding;
  final List<Map<String, String>> categories;

  const _HomeAppBarDelegate({
    required this.topPadding,
    required this.categories,
  });

  double get _pinnedHeight => topPadding + _locationHeight + _searchHeight;

  @override
  double get minExtent => _pinnedHeight;

  @override
  double get maxExtent => _pinnedHeight + _collapsibleHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final double offset = shrinkOffset
        .clamp(0.0, _collapsibleHeight)
        .toDouble();

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: _HeaderBody(
        topPadding: topPadding,
        offset: offset,
        categories: categories,
      ),
    );
  }

  @override
  bool shouldRebuild(covariant _HomeAppBarDelegate oldDelegate) {
    return oldDelegate.topPadding != topPadding ||
        oldDelegate.categories != categories;
  }
}

class _HeaderBody extends StatefulWidget {
  final double topPadding;
  final double offset;
  final List<Map<String, String>> categories;

  const _HeaderBody({
    required this.topPadding,
    required this.offset,
    required this.categories,
  });

  @override
  State<_HeaderBody> createState() => _HeaderBodyState();
}

class _HeaderBodyState extends State<_HeaderBody> {
  late final VideoPlayerController _videoController;
  bool _videoReady = false;

  @override
  void initState() {
    super.initState();

    _videoController = VideoPlayerController.asset(
      'assets/Peach_Gold_Fireworks_Animated.mp4',
    );
    _initializeBackgroundVideo();
  }

  Future<void> _initializeBackgroundVideo() async {
    try {
      await _videoController.initialize();
      if (!mounted) return;

      await _videoController.setLooping(true);
      await _videoController.setVolume(0);
      if (!mounted) return;

      setState(() => _videoReady = true);

      // Keep the video running even after the collapsible section is hidden.
      // The pinned delivery/search area continues to show this video behind it.
      await _videoController.play();
    } catch (error) {
      debugPrint('Error initializing background video: $error');
    }
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double pinnedHeight =
        widget.topPadding + _locationHeight + _searchHeight;
    final double totalHeight = pinnedHeight + _collapsibleHeight;

    return ClipRect(
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Keep the festive video visible behind the pinned app bar at every
          // scroll position. No opaque white layer is placed above this video.
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            height: totalHeight,
            child: IgnorePointer(
              child: RepaintBoundary(
                child: _videoReady
                    ? FittedBox(
                        fit: BoxFit.cover,
                        clipBehavior: Clip.hardEdge,
                        child: SizedBox(
                          width: _videoController.value.size.width,
                          height: _videoController.value.size.height,
                          child: VideoPlayer(_videoController),
                        ),
                      )
                    : const DecoratedBox(
                        decoration: BoxDecoration(gradient: _homeGradient),
                        child: SizedBox.expand(),
                      ),
              ),
            ),
          ),

          // Subtle constant overlay for readability. It does not fade during
          // scrolling, so the pinned app bar never changes to a white fill.
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            height: totalHeight,
            child: IgnorePointer(
              child: const ColoredBox(color: Color(0x14000000)),
            ),
          ),

          // Tab bar + category avatars are one clipped, scroll-linked unit.
          // They cannot paint over the pinned delivery/search rows.
          Positioned(
            left: 0,
            right: 0,
            top: pinnedHeight,
            height: _collapsibleHeight,
            child: ClipRect(
              clipBehavior: Clip.hardEdge,
              child: Transform.translate(
                // Move tabs and category avatars together as one section.
                // The clip hides the complete section after full collapse.
                offset: Offset(0, -widget.offset),
                child: RepaintBoundary(
                  child: Column(
                    children: [
                      SizedBox(
                        height: _tabsHeight,
                        child: CustomTabHeader(backgroundOpacity: 0),
                      ),
                      SizedBox(
                        height: _categoryHeight,
                        child: CategoryAvatarSection(
                          categories: widget.categories,
                          backgroundOpacity: 0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Pinned area is painted last so the moving section stays behind it.
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            height: pinnedHeight,
            child: Column(
              children: [
                SizedBox(height: widget.topPadding),
                const SizedBox(height: _locationHeight, child: _LocationRow()),
                const SizedBox(height: _searchHeight, child: _SearchRow()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// =======================================================
// DELIVERY ROW
// Address + notification + favourite + profile + currency indicator.
// =======================================================

class _LocationRow extends StatelessWidget {
  const _LocationRow();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          const Icon(Icons.location_on_rounded, size: 19, color: _ink),
          const SizedBox(width: 4),
          Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                    text: 'Deliver to ',
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                  const TextSpan(
                    text: 'Add Delivery Address ',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      size: 19,
                      color: _ink,
                    ),
                  ),
                ],
              ),
              maxLines: 1,
              softWrap: false,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 12.5, color: _ink),
            ),
          ),
          const SizedBox(width: 3),
          _HeaderActionIcon(
            icon: Icons.notifications_none_rounded,
            tooltip: 'Notifications',
          ),
          _HeaderActionIcon(
            icon: Icons.favorite_border_rounded,
            tooltip: 'Favourites',
          ),
          _HeaderActionIcon(
            icon: Icons.person_outline_rounded,
            tooltip: 'Profile',
          ),
        ],
      ),
    );
  }
}

class _HeaderActionIcon extends StatelessWidget {
  final IconData icon;
  final String tooltip;

  const _HeaderActionIcon({required this.icon, required this.tooltip});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: SizedBox(
        width: 28,
        height: 32,
        child: Center(child: Icon(icon, size: 21, color: _ink)),
      ),
    );
  }
}

// =======================================================
// SEARCH ROW
// Brand logo is now placed INSIDE the search field.
// =======================================================

class _SearchRow extends StatelessWidget {
  const _SearchRow();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 5, 14, 5),
      child: Container(
        height: 42,
        padding: const EdgeInsets.symmetric(horizontal: 9),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.94),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: const Color(0xFFE8A47A).withValues(alpha: 0.4),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            // THAI ribbon T logo inside the search field.
            SizedBox(
              width: 30,
              height: 30,
              child: Image.asset(
                'assets/Glossy Rose-Gold Ribbon T Emblem.png',
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.image_not_supported_outlined,
                    size: 20,
                    color: _ink,
                  );
                },
              ),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: TextField(
                textInputAction: TextInputAction.search,
                maxLines: 1,
                onSubmitted: (value) {
                  // Connect the search API here.
                },
                decoration: const InputDecoration(
                  hintText: 'Search for brands & products',
                  hintStyle: TextStyle(
                    fontSize: 12.5,
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                  ),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                ),
                style: const TextStyle(fontSize: 13, color: _ink),
              ),
            ),
            IconButton(
              onPressed: () {},
              padding: EdgeInsets.zero,
              visualDensity: VisualDensity.compact,
              constraints: const BoxConstraints.tightFor(width: 28, height: 36),
              icon: const Icon(Icons.mic_none_rounded, size: 21, color: _ink),
            ),
            IconButton(
              onPressed: () {},
              padding: EdgeInsets.zero,
              visualDensity: VisualDensity.compact,
              constraints: const BoxConstraints.tightFor(width: 28, height: 36),
              icon: const Icon(
                Icons.photo_camera_outlined,
                size: 21,
                color: _ink,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// =======================================================
// CATEGORY AVATAR SECTION
// =======================================================

class CategoryAvatarSection extends StatelessWidget {
  final List<Map<String, String>> categories;

  /// 1 = original peach background, 0 = transparent.
  final double backgroundOpacity;

  const CategoryAvatarSection({
    super.key,
    required this.categories,
    this.backgroundOpacity = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 12, bottom: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            _bottomColor.withValues(alpha: backgroundOpacity),
            _categoryColor.withValues(alpha: backgroundOpacity),
          ],
        ),
      ),
      child: SizedBox(
        height: 82,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 14),
          itemCount: categories.length,
          separatorBuilder: (context, index) => const SizedBox(width: 12),
          itemBuilder: (context, index) {
            final category = categories[index];

            return SizedBox(
              width: 62,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.7),
                        width: 1.5,
                      ),
                    ),
                    child: ClipOval(
                      child: Image.network(
                        category['img']!,
                        width: 56,
                        height: 56,
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.medium,
                        loadingBuilder: (context, child, progress) {
                          if (progress == null) return child;

                          return Container(
                            width: 56,
                            height: 56,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0x33FFFFFF),
                            ),
                            child: const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: _ink,
                              ),
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 56,
                            height: 56,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0x33FFFFFF),
                            ),
                            child: const Icon(
                              Icons.image_not_supported_outlined,
                              size: 23,
                              color: _ink,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    width: 62,
                    child: Text(
                      category['label']!,
                      maxLines: 1,
                      softWrap: false,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 10,
                        height: 1.1,
                        fontWeight: FontWeight.w600,
                        color: _ink,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
