import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thailand_clothing/core/utils/appcolor.dart';
import 'package:thailand_clothing/feature/Home/widget/tabbarwidget.dart';

const Color _ink = Color(0xFF1F1924);

const LinearGradient _homeGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [Color(0xFF8671BC), Color(0xFFD397B4), Color(0xFFF0ACA4)],
  stops: [0.0, 0.55, 1.0],
);

class HomeSliverAppBar extends StatelessWidget {
  final List<Map<String, String>> categories;

  const HomeSliverAppBar({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    final double topPadding = MediaQuery.paddingOf(context).top;

    return SliverPersistentHeader(
      pinned: true,
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

  _HomeAppBarDelegate({required this.topPadding, required this.categories});

  static const double _locH = 36;
  static const double _searchH = 56;
  static const double _tabH = 34;
  static const double _tabGap = 10;

  @override
  double get maxExtent => topPadding + _locH + _searchH + _tabGap + _tabH;

  @override
  double get minExtent => topPadding + _locH + _searchH;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final double tabsH = (_tabH - shrinkOffset).clamp(0.0, _tabH).toDouble();

    final double locTop = topPadding;
    final double searchTop = locTop + _locH;
    final double tabTop = searchTop + _searchH + _tabGap;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: DecoratedBox(
        decoration: const BoxDecoration(gradient: _homeGradient),
        child: SizedBox.expand(
          child: Stack(
            clipBehavior: Clip.hardEdge,
            children: [
              Positioned(
                top: locTop,
                left: 0,
                right: 0,
                height: _locH,
                child: const _LocationRow(),
              ),
              Positioned(
                top: searchTop,
                left: 0,
                right: 0,
                height: _searchH,
                child: const _SearchRow(),
              ),
              if (tabsH > 0)
                Positioned(
                  top: tabTop,
                  left: 0,
                  right: 0,
                  height: tabsH,
                  child: ClipRect(
                    child: OverflowBox(
                      alignment: Alignment.topCenter,
                      minHeight: _tabH,
                      maxHeight: _tabH,
                      child: Opacity(
                        opacity: (tabsH / _tabH).clamp(0.0, 1.0),
                        child: const CustomTabHeader(),
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

  @override
  bool shouldRebuild(covariant _HomeAppBarDelegate oldDelegate) {
    return oldDelegate.topPadding != topPadding ||
        oldDelegate.categories != categories;
  }
}

class _LocationRow extends StatelessWidget {
  const _LocationRow();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        children: [
          Icon(Icons.location_on, size: 20, color: _ink),
          SizedBox(width: 6),
          Flexible(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Deliver to ',
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                  TextSpan(
                    text: 'Add Delivery Address',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              maxLines: 1,
              softWrap: false,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 12.5, color: _ink),
            ),
          ),
          SizedBox(width: 2),
          Icon(Icons.keyboard_arrow_down, size: 20, color: _ink),
        ],
      ),
    );
  }
}

class _SearchRow extends StatelessWidget {
  const _SearchRow();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 5, 10, 5),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 46,
              padding: const EdgeInsets.symmetric(horizontal: 9),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.95),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.search,
                    size: 21,
                    color: AppColors.bagPrimaryPink,
                  ),
                  const SizedBox(width: 7),
                  Expanded(
                    child: TextField(
                      textInputAction: TextInputAction.search,
                      maxLines: 1,
                      onSubmitted: (value) {
                        // Connect your search API here.
                      },
                      decoration: const InputDecoration(
                        hintText: 'Shoppe Your Favorite',
                        hintStyle: TextStyle(
                          fontSize: 12.5,
                          color: Colors.black45,
                          fontWeight: FontWeight.w500,
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
                    onPressed: () {
                      // Add voice search functionality here.
                    },
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(
                      minWidth: 27,
                      minHeight: 36,
                    ),
                    icon: const Icon(
                      Icons.mic_none_rounded,
                      size: 20,
                      color: _ink,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // Add image search functionality here.
                    },
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(
                      minWidth: 27,
                      minHeight: 36,
                    ),
                    icon: const Icon(
                      Icons.photo_camera_outlined,
                      size: 20,
                      color: _ink,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 9),
          const Icon(Icons.notifications_none_rounded, size: 25, color: _ink),
          const SizedBox(width: 9),
          const Icon(Icons.favorite_border_rounded, size: 25, color: _ink),
          const SizedBox(width: 9),
          const Icon(Icons.person_outline_rounded, size: 26, color: _ink),
        ],
      ),
    );
  }
}

class CategoryAvatarSection extends StatelessWidget {
  final List<Map<String, String>> categories;

  const CategoryAvatarSection({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 12, bottom: 10),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFF0ACA4), Color(0xFFF4B3A6)],
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
                  ClipOval(
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
