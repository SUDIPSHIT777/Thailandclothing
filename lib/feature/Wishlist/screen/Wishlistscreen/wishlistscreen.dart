import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:go_router/go_router.dart';
import 'package:thailand_clothing/Globalwidget/showdeliverybottomscreen.dart';
import 'package:thailand_clothing/core/router/approute.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  int _currentSlideIndex = 0;
  String selectedLocation = 'Nearby Spencer Mall, Kalikapur';

  final List<Map<String, dynamic>> _categories = [
    {
      'name': 'Shirts',
      'image': 'https://images.unsplash.com/photo-1596755094514-f87e34085b2c?w=200&q=80',
      'color': null,
    },
    {
      'name': 'Kurtas',
      'image': 'https://images.unsplash.com/photo-1583391733956-3750e0ff4e8b?w=200&q=80',
      'color': null,
    },
    {
      'name': 'Uni-sex',
      'image': 'https://images.unsplash.com/photo-1556821840-3a63f95609a7?w=200&q=80',
      'color': null,
    },
    {'name': 'Sharee', 'image': null, 'color': const Color(0xFFE5C697)},
    {'name': 'Jackets', 'image': null, 'color': const Color(0xFFC7B6AC)},
    {'name': 'Trousers', 'image': null, 'color': const Color(0xFFB3CCE6)},
  ];

  final List<Map<String, String>> _products = [
    {
      'title': 'StyleCast x Revolte',
      'price': '₹2,183',
      'rating': '4.4',
      'image': 'https://images.unsplash.com/photo-1610030469983-98e550d6193c?w=500&q=80',
      'isSaree': 'true',
    },
    {
      'title': 'StyleCast x Revolte',
      'price': '₹2,183',
      'rating': '4.4',
      'image': 'https://images.unsplash.com/photo-1602810318383-e386cc2a3ccf?w=500&q=80',
      'isSaree': 'false',
    },
    {
      'title': 'StyleCast x Revolte',
      'price': '₹2,183',
      'rating': '4.4',
      'image': 'https://images.unsplash.com/photo-1602810318383-e386cc2a3ccf?w=500&q=80',
      'isSaree': 'false',
    },
    {
      'title': 'StyleCast x Revolte',
      'price': '₹2,183',
      'rating': '4.4',
      'image': 'https://images.unsplash.com/photo-1610030469983-98e550d6193c?w=500&q=80',
      'isSaree': 'true',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSaleBanner(),
            const SizedBox(height: 12),
            _buildAddressBar(),
            const SizedBox(height: 12),
            _buildFilterButtons(context),
            const SizedBox(height: 16),
            _buildCategoriesRow(),
            const SizedBox(height: 16),
            _buildPromoCarouselSlider(),
            const SizedBox(height: 14),
            _buildProductGrid(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.black87,
          size: 20,
        ),
        onPressed: () {
          context.pop();
        },
      ),
      title: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Wishlist',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 2),
          Text(
            '42 items',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.shopping_bag_outlined,
            color: Colors.black,
            size: 24,
          ),
          onPressed: () {
            context.push(AppRouter.shoppingBagScreen);
          },
        ),
        const SizedBox(width: 6),
      ],
    );
  }

  Widget _buildSaleBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFC66B27), Color(0xFFD0752B)],
        ),
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/wishlistdiscount.png',
            fit: BoxFit.contain,
            height: 40,
            width: 40,
          ),
          const SizedBox(width: 10),
          const Text(
            '50-90% OFF',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 13.5,
            ),
          ),
          const SizedBox(width: 14),
          const Text(
            'SALE IS LIVE!',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 13.5,
            ),
          ),
          const SizedBox(width: 14),
          const Row(
            children: [
              Text(
                'Shop Now',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 13.5,
                ),
              ),
              SizedBox(width: 2),
              Icon(Icons.chevron_right, color: Colors.white, size: 16),
            ],
          ),
        ],
      ),
    );
  }

  // Updated: opens the reusable delivery-location bottom sheet.
  Widget _buildAddressBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          showDeliveryLocationBottomSheet(context);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
          decoration: BoxDecoration(
            color: const Color(0xFFF6F4FF),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              const Text(
                'Sagar Sunil Das',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  '• $selectedLocation',
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Icon(
                Icons.keyboard_arrow_down,
                size: 18,
                color: Colors.black87,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              // er notavilabe screen ache ok collectionnotavilablescreen
              onTap: () => context.push(AppRouter.collectionscreen),
              child: Container(
                height: 44,
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F4F6),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.grid_view_outlined,
                      size: 16,
                      color: Colors.black87,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Collections',
                      style: TextStyle(
                        fontSize: 13.5,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: GestureDetector(
              onTap: () {
                context.push(AppRouter.outOfstockScreen);
              },
              child: Container(
                height: 44,
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F4F6),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Transform.rotate(
                      angle: 0.785,
                      child: Container(
                        width: 9,
                        height: 9,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black87, width: 1.4),
                        ),
                      ),
                    ),
                    const SizedBox(width: 9),
                    const Text(
                      'Out of Stock',
                      style: TextStyle(
                        fontSize: 13.5,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoriesRow() {
    return SizedBox(
      height: 82,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        separatorBuilder: (_, _) => const SizedBox(width: 11),
        itemBuilder: (context, index) {
          final item = _categories[index];
          return Column(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: item['color'] ?? Colors.grey.shade200,
                  image: item['image'] != null
                      ? DecorationImage(
                          image: NetworkImage(item['image']),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                item['name'],
                style: const TextStyle(
                  fontSize: 11,
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildPromoCarouselSlider() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: CarouselSlider(
            options: CarouselOptions(
              height: 88,
              viewportFraction: 1.0,
              autoPlay: true,
              enableInfiniteScroll: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentSlideIndex = index;
                });
              },
            ),
            items: [0, 1].map((i) {
              return Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: const LinearGradient(
                    colors: [Color(0xFFC8377B), Color(0xFF911955)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      Transform.rotate(
                        angle: -0.08,
                        child: Container(
                          width: 58,
                          height: 44,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: const Color(0xFF141414),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 10,
                                height: 7,
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(1.5),
                                ),
                              ),
                              const Text(
                                'AXIS',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 6,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '₹0 Joining Fee',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 13.5,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'With Flipkart Axis Credit Card',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 7,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Apply Now',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 11,
                              ),
                            ),
                            SizedBox(width: 2),
                            Icon(
                              Icons.chevron_right,
                              color: Colors.black,
                              size: 14,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [0, 1].map((index) {
            bool isSelected = _currentSlideIndex == index;
            return Container(
              width: 5,
              height: 5,
              margin: const EdgeInsets.symmetric(horizontal: 2.5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected
                    ? const Color(0xFFD81B60)
                    : Colors.grey.shade300,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildProductGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 16,
          childAspectRatio: 0.62,
        ),
        itemBuilder: (context, index) {
          final product = _products[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        product['image']!,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      left: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.92),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              product['rating']!,
                              style: const TextStyle(
                                fontSize: 10.5,
                                fontWeight: FontWeight.w700,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(width: 2),
                            const Icon(
                              Icons.star,
                              size: 11,
                              color: Color(0xFF008C76),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 6,
                      right: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 9,
                          vertical: 4.5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: const Color(0xFFE91E63),
                            width: 1,
                          ),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.shopping_bag_outlined,
                              size: 12,
                              color: Color(0xFFE91E63),
                            ),
                            SizedBox(width: 3),
                            Text(
                              'Add',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFE91E63),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                product['title']!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product['price']!,
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  const Row(
                    children: [
                      Icon(
                        Icons.delete_outline,
                        size: 20,
                        color: Colors.black87,
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.share_outlined,
                        size: 19,
                        color: Colors.black87,
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.add_box_rounded,
                        size: 19,
                        color: Colors.black87,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
