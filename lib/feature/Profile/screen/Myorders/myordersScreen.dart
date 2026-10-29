// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:thailand_clothing/Globalwidget/profileappbar.dart';
import 'package:thailand_clothing/core/router/approute.dart';
import 'package:thailand_clothing/core/utils/appcolor.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  int _selectedFilterIndex = 0;
  final List<String> _filters = ['All (12)', 'Ongoing (3)', 'Delivered (8)'];
  final List<Map<String, dynamic>> _orders = [
    {
      'title': 'Luna Classic Handbag',
      'subtitle': 'Lilac • Qty 1 • ORD-2048',
      'price': '₹2,499',
      'statusText': 'In transit',
      'isDelivered': false,
      'imageUrl': 'https://images.unsplash.com/photo-1584917865442-de89df76afd3?w=400&h=400&fit=crop',
      'thumbnailBg': AppColors.lightPurple,
    },
    {
      'title': 'Aster Linen Co-ord',
      'subtitle': 'Beige • M • ORD-2042',
      'price': '₹3,299',
      'statusText': 'Delivered',
      'isDelivered': true,
      'imageUrl': 'https://images.unsplash.com/photo-1594633312681-425c7b97ccd1?w=400&h=400&fit=crop',
      'thumbnailBg': AppColors.ordersBeigeBg,
    },
    {
      'title': 'Pearl Drop Earrings',
      'subtitle': 'White • ORD-2035',
      'price': '₹899',
      'statusText': 'Delivered',
      'isDelivered': true,
      'imageUrl': 'https://images.unsplash.com/photo-1535632066927-ab7c9ab60908?w=400&h=400&fit=crop',
      'thumbnailBg': AppColors.lightPurple,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.lightPurpleBg,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: AppColors.scaffoldBg,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBg,
        appBar: buildAppBar(
          context,
          title: "My Orders",
          subtitle: "View and manage your purchase",
        ),
        body: SafeArea(
          top: false,
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 14, 20, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 5,
                      height: 26,
                      decoration: BoxDecoration(
                        color: AppColors.ordersAccentBar,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'STYLE IN MOTION',
                      style: TextStyle(
                        color: AppColors.primaryPurple,
                        fontSize: 11.5,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.4,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),

                _buildSearchBar(),

                const SizedBox(height: 18),

                // Filter chips
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      _filters.length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: _buildFilterChip(index),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: _orders.length,
                    itemBuilder: (context, index) {
                      final order = _orders[index];

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: GestureDetector(
                          onTap: () {
                            if (order['statusText'] == 'In transit') {
                              context.push(AppRouter.orderdetails);
                            } else {
                              context.push(AppRouter.deliveredorderScreen);
                            }
                          },
                          child: _buildOrderCard(
                            title: order['title'],
                            subtitle: order['subtitle'],
                            price: order['price'],
                            statusText: order['statusText'],
                            isDelivered: order['isDelivered'],
                            imageUrl: order['imageUrl'],
                            thumbnailBg: order['thumbnailBg'],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Search bar
  Widget _buildSearchBar() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.ordersSearchBg,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          const SizedBox(width: 10),
          Expanded(
            child: TextFormField(
              style: TextStyle(color: AppColors.textDark, fontSize: 14),
              decoration: InputDecoration(
                icon: Icon(Icons.search, size: 18, color: AppColors.greyText),
                hintText: 'Search orders or products',
                hintStyle: TextStyle(
                  color: AppColors.greyText,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }

  // Filter chip
  Widget _buildFilterChip(int index) {
    final bool isSelected = _selectedFilterIndex == index;

    const List<double> chipWidths = [96, 118, 126];

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedFilterIndex = index;
        });
      },
      child: Container(
        width: chipWidths[index],
        height: 36,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryPurple : AppColors.lightPurple,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          _filters[index],
          style: TextStyle(
            color: isSelected ? AppColors.white : AppColors.primaryPurple,
            fontSize: 12.5,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  // Order card
  Widget _buildOrderCard({
    required String title,
    required String subtitle,
    required String price,
    required String statusText,
    required bool isDelivered,
    required String imageUrl,
    required Color thumbnailBg,
  }) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.ordersCardBorder, width: 1.2),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Container(
              width: 90,
              height: 100,
              color: thumbnailBg,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, progress) {
                  if (progress == null) {
                    return child;
                  }

                  return const Center(
                    child: SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: AppColors.primaryPurple,
                      ),
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Icon(
                      Icons.image_not_supported_outlined,
                      color: AppColors.purple,
                      size: 30,
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.textDark,
                    fontSize: 15.5,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: AppColors.greyText,
                    fontSize: 12.5,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  price,
                  style: const TextStyle(
                    color: AppColors.textDark,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    color: isDelivered
                        ? AppColors.ordersDeliveredBg
                        : AppColors.lightPurple,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    statusText,
                    style: TextStyle(
                      color: isDelivered
                          ? AppColors.ordersDeliveredText
                          : AppColors.primaryPurple,
                      fontSize: 11.5,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Custom four-point star icon
class CustomStarIcon extends StatelessWidget {
  final double size;
  final Color color;

  const CustomStarIcon({super.key, required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: _StarPainter(color));
  }
}

class _StarPainter extends CustomPainter {
  final Color color;

  _StarPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final double w = size.width;
    final double h = size.height;
    final double cx = w / 2;
    final double cy = h / 2;

    final path = Path()
      ..moveTo(cx, 0)
      ..quadraticBezierTo(cx, cy, w, cy)
      ..quadraticBezierTo(cx, cy, cx, h)
      ..quadraticBezierTo(cx, cy, 0, cy)
      ..quadraticBezierTo(cx, cy, cx, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _StarPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
