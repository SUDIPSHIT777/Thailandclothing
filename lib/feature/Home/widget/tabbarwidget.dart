import 'package:flutter/material.dart';
import 'package:thailand_clothing/core/utils/appcolor.dart';

class CustomTabHeader extends StatefulWidget {
  const CustomTabHeader({super.key});

  @override
  State<CustomTabHeader> createState() => _CustomTabHeaderState();
}

class _CustomTabHeaderState extends State<CustomTabHeader> {
  int selectedTab = 0;
  final List<String> tabs = ['ALL', 'H&M', 'KOLIVA', 'ORPIT', 'WOQ', 'ZARA'];

  final List<GlobalKey> _tabKeys = [];
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _tabKeys.addAll(List.generate(tabs.length, (_) => GlobalKey()));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: List.generate(tabs.length, (i) {
                      final selected = i == selectedTab;

                      return GestureDetector(
                        key: _tabKeys[i],
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          setState(() => selectedTab = i);
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOutCubic,
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          padding: const EdgeInsets.fromLTRB(16, 6, 16, 8),
                          child: AnimatedDefaultTextStyle(
                            duration: const Duration(milliseconds: 250),
                            style: TextStyle(
                              fontSize: 13.5,
                              fontWeight: selected
                                  ? FontWeight.bold
                                  : FontWeight.w500,
                              color: selected
                                  ? AppColors.maroon
                                  : Colors.black87,
                              letterSpacing: 0.5,
                            ),
                            child: Text(tabs[i]),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),

          // Dynamically repaint curve frame-by-frame on scroll
          Positioned.fill(
            child: IgnorePointer(
              child: AnimatedBuilder(
                animation: _scrollController,
                builder: (context, _) {
                  Rect? activeTabRect;

                  if (_tabKeys.length > selectedTab &&
                      _tabKeys[selectedTab].currentContext != null) {
                    final RenderBox box =
                        _tabKeys[selectedTab].currentContext!.findRenderObject()
                            as RenderBox;
                    final RenderBox? ancestor =
                        context.findRenderObject() as RenderBox?;
                    if (ancestor != null) {
                      final offset = box.localToGlobal(
                        Offset.zero,
                        ancestor: ancestor,
                      );
                      activeTabRect = offset & box.size;
                    }
                  }

                  return CustomPaint(
                    painter: SeamlessTabPainter(
                      activeRect: activeTabRect,
                      color: AppColors.maroon,
                      strokeWidth: 1.8,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Custom Painter with enhanced curves that dynamically tracks scroll movement
class SeamlessTabPainter extends CustomPainter {
  final Rect? activeRect;
  final Color color;
  final double strokeWidth;

  SeamlessTabPainter({
    required this.activeRect,
    required this.color,
    this.strokeWidth = 1.8,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final baseline = size.height - (strokeWidth / 2);
    final path = Path();

    if (activeRect == null) {
      path.moveTo(0, baseline);
      path.lineTo(size.width, baseline);
      canvas.drawPath(path, paint);
      return;
    }

    final double rectLeft = activeRect!.left;
    final double rectRight = activeRect!.right;
    final double rectTop = activeRect!.top;

    const double topRadius = 14.0;
    const double bottomRadius = 12.0;

    // Baseline start
    path.moveTo(0, baseline);
    path.lineTo(rectLeft - bottomRadius, baseline);

    // Left outward curve
    path.quadraticBezierTo(
      rectLeft,
      baseline,
      rectLeft,
      baseline - bottomRadius,
    );

    // Left wall
    path.lineTo(rectLeft, rectTop + topRadius);

    // Top-left corner curve
    path.quadraticBezierTo(rectLeft, rectTop, rectLeft + topRadius, rectTop);

    // Top border
    path.lineTo(rectRight - topRadius, rectTop);

    // Top-right corner curve
    path.quadraticBezierTo(rectRight, rectTop, rectRight, rectTop + topRadius);

    // Right wall
    path.lineTo(rectRight, baseline - bottomRadius);

    // Right outward curve
    path.quadraticBezierTo(
      rectRight,
      baseline,
      rectRight + bottomRadius,
      baseline,
    );

    // Baseline end
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
