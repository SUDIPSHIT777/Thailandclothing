import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thailand_clothing/core/utils/appcolor.dart';

class CustomTabHeader extends StatefulWidget {
  final double backgroundOpacity;

  const CustomTabHeader({super.key, this.backgroundOpacity = 1.0});

  @override
  State<CustomTabHeader> createState() => _CustomTabHeaderState();
}

class _CustomTabHeaderState extends State<CustomTabHeader>
    with SingleTickerProviderStateMixin {
  final List<String> tabs = ['ALL', 'H&M', 'KOLIVA', 'ORPIT', 'WOQ'];

  int selectedTab = 0;

  late final AnimationController _controller;
  Animation<Rect?>? _rectAnimation;

  Rect? _currentRect;
  List<Rect> _tabRects = [];

  static const double _tabHeight = 20;
  static const double _horizontalPadding = 12;
  static const double _sidePadding = 12;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 450),
    );
  }

  Rect? get _displayRect => _rectAnimation?.value ?? _currentRect;

  void _selectTab(int index) {
    if (selectedTab == index || index < 0 || index >= _tabRects.length) {
      return;
    }

    final targetRect = _tabRects[index];
    final currentRect = _displayRect ?? _tabRects[selectedTab];

    _controller.stop();

    setState(() {
      selectedTab = index;
      _currentRect = currentRect;

      _rectAnimation = RectTween(begin: currentRect, end: targetRect).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeInOutCubic),
      );
    });

    _controller.forward(from: 0).then((_) {
      if (!mounted) return;

      setState(() {
        _currentRect = targetRect;
        _rectAnimation = AlwaysStoppedAnimation<Rect?>(targetRect);
      });
    });
  }

  // RESPONSIVE TAB WIDTH CALCULATION
  List<Rect> _calculateTabRects(double availableWidth) {
    final safeWidth = availableWidth > 0 ? availableWidth : 0.0;

    final usableWidth = (safeWidth - (_sidePadding * 2)).clamp(
      0.0,
      double.infinity,
    );

    final cellWidth = usableWidth / tabs.length;

    final rects = <Rect>[];

    for (var i = 0; i < tabs.length; i++) {
      final textPainter = TextPainter(
        text: TextSpan(
          text: tabs[i],
          style: GoogleFonts.figtree(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
        textDirection: Directionality.of(context),
        maxLines: 1,
      )..layout();

      // Prevent tab width from exceeding its available cell.
      final desiredWidth = textPainter.width + (_horizontalPadding * 2);

      final tabWidth = desiredWidth > cellWidth ? cellWidth : desiredWidth;

      // Center each tab inside its responsive cell.
      final cellLeft = _sidePadding + (i * cellWidth);

      final left = cellLeft + ((cellWidth - tabWidth) / 2);

      rects.add(Rect.fromLTWH(left, 0, tabWidth, _tabHeight));
    }

    return rects;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xFFF0ACA4).withValues(alpha: widget.backgroundOpacity),
            const Color(0xFFF4B3A6).withValues(alpha: widget.backgroundOpacity),
          ],
        ),
      ),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // TOP SPACING
          const SizedBox(height: 5),

          // TAB BAR
          SizedBox(
            width: double.infinity,
            height: _tabHeight,
            child: LayoutBuilder(
              builder: (context, constraints) {
                _tabRects = _calculateTabRects(constraints.maxWidth);

                if (_currentRect == null && _tabRects.isNotEmpty) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (!mounted || _currentRect != null) {
                      return;
                    }

                    if (_tabRects.isEmpty) return;

                    final rect = _tabRects[selectedTab];

                    setState(() {
                      _currentRect = rect;
                      _rectAnimation = AlwaysStoppedAnimation<Rect?>(rect);
                    });
                  });
                }

                return Stack(
                  clipBehavior: Clip.hardEdge,
                  children: [
                    // TAB LABELS
                    for (var i = 0; i < tabs.length; i++)
                      Positioned(
                        left:
                            _sidePadding +
                            (i *
                                (constraints.maxWidth - (_sidePadding * 2)) /
                                tabs.length),
                        width:
                            (constraints.maxWidth - (_sidePadding * 2)) /
                            tabs.length,
                        top: 0,
                        bottom: 0,
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () => _selectTab(i),
                          child: Center(
                            child: AnimatedDefaultTextStyle(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeInOut,
                              style: GoogleFonts.figtree(
                                fontSize: 13,
                                fontWeight: selectedTab == i
                                    ? FontWeight.w600
                                    : FontWeight.w500,
                                color: selectedTab == i
                                    ? AppColors.maroon
                                    : Colors.black87,
                                letterSpacing: 0.5,
                              ),
                              child: Text(
                                tabs[i],
                                maxLines: 1,
                                softWrap: false,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                      ),

                    // ANIMATED TAB OUTLINE
                    Positioned.fill(
                      child: IgnorePointer(
                        child: AnimatedBuilder(
                          animation: _controller,
                          builder: (context, child) {
                            return CustomPaint(
                              painter: SeamlessTabPainter(
                                activeRect: _displayRect,
                                color: AppColors.bagPrimaryPink,
                                strokeWidth: 1,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ================================================
// SEAMLESS TAB PAINTER
// ================================================

class SeamlessTabPainter extends CustomPainter {
  final Rect? activeRect;
  final Color color;
  final double strokeWidth;

  const SeamlessTabPainter({
    required this.activeRect,
    required this.color,
    this.strokeWidth = 1,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final baseline = size.height - strokeWidth / 2;
    final rect = activeRect;
    final path = Path();

    if (rect == null) {
      path
        ..moveTo(0, baseline)
        ..lineTo(size.width, baseline);

      canvas.drawPath(path, paint);
      return;
    }

    final left = rect.left;
    final right = rect.right;

    const top = 0.5;
    const topRadius = 10.0;
    const bottomRadius = 8.0;

    path.moveTo(0, baseline);
    path.lineTo(left - bottomRadius, baseline);

    path.quadraticBezierTo(left, baseline, left, baseline - bottomRadius);

    path.lineTo(left, top + topRadius);

    path.quadraticBezierTo(left, top, left + topRadius, top);

    path.lineTo(right - topRadius, top);

    path.quadraticBezierTo(right, top, right, top + topRadius);

    path.lineTo(right, baseline - bottomRadius);

    path.quadraticBezierTo(right, baseline, right + bottomRadius, baseline);

    path.lineTo(size.width, baseline);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant SeamlessTabPainter oldDelegate) {
    return oldDelegate.activeRect != activeRect ||
        oldDelegate.color != color ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
