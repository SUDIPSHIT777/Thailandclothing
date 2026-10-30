import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductCardCarousel extends StatefulWidget {
  const ProductCardCarousel({super.key});

  @override
  State<ProductCardCarousel> createState() => _ProductCardCarouselState();
}

class _ProductCardCarouselState extends State<ProductCardCarousel> {
  int _currentIndex = 0;

  final List<ProductItem> _products = [
    ProductItem(
      brand: 'Beauty of Joseon',
      title: 'Aesthetic',
      price: '₹1,299',
      image: 'https://picsum.photos/id/1015/400/500',
      colors: const [Color(0xFFB9A3E3), Color(0xFF8E76C8)],
    ),
    ProductItem(
      brand: 'Mae Ploy',
      title: 'Beach',
      price: '₹399',
      image: 'https://picsum.photos/id/1005/400/500',
      colors: const [Color(0xFFD4A17A), Color(0xFF986342)],
    ),
    ProductItem(
      brand: 'Mistine',
      title: 'Funky',
      price: '₹799',
      image: 'https://picsum.photos/id/1025/400/500',
      colors: const [Color(0xFFE78B91), Color(0xFFC94E5C)],
    ),
  ];

  // Background color matched with Mega Fashion banner
  static const Color backgroundColor = Color(0xFFE6A84A);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    final carouselHeight = (screenWidth * 0.46).clamp(160.0, 200.0);

    final cardWidth = screenWidth * 0.35;

    return Container(
      width: double.infinity,

      // Exact background color
      color: backgroundColor,

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Top spacing
          const SizedBox(height: 15),

          // Product carousel
          CarouselSlider.builder(
            itemCount: _products.length,

            itemBuilder: (context, index, realIndex) {
              final product = _products[index];
              final isActive = index == _currentIndex;

              return Center(
                child: SizedBox(
                  width: cardWidth,
                  height: carouselHeight - (isActive ? 0 : 12),

                  child: AnimatedScale(
                    scale: isActive ? 1.0 : 0.96,
                    duration: const Duration(milliseconds: 350),
                    curve: Curves.easeOutCubic,

                    child: ProductCard(product: product, isActive: isActive),
                  ),
                ),
              );
            },

            options: CarouselOptions(
              height: carouselHeight,
              viewportFraction: 0.35,
              initialPage: 0,
              enableInfiniteScroll: true,
              enlargeCenterPage: false,
              padEnds: true,
              scrollDirection: Axis.horizontal,
              scrollPhysics: const BouncingScrollPhysics(),
              pageSnapping: true,
              autoPlay: false,

              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index % _products.length;
                });
              },
            ),
          ),

          const SizedBox(height: 8),

          // Pagination indicators
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(_products.length, (index) {
              final isActive = index == _currentIndex;

              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: isActive ? 20 : 7,
                height: 7,

                decoration: BoxDecoration(
                  color: isActive ? const Color(0xFF252525) : Colors.white70,
                  borderRadius: BorderRadius.circular(20),
                ),
              );
            }),
          ),

          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

// Product model
class ProductItem {
  final String brand;
  final String title;
  final String price;
  final String image;
  final List<Color> colors;

  const ProductItem({
    required this.brand,
    required this.title,
    required this.price,
    required this.image,
    required this.colors,
  });
}

// Individual product card
class ProductCard extends StatelessWidget {
  final ProductItem product;
  final bool isActive;

  const ProductCard({super.key, required this.product, required this.isActive});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    final scale = (screenWidth / 400).clamp(0.85, 1.15);

    final padding = 8.0 * scale;
    final brandFont = 10.0 * scale;
    final titleFont = 9.0 * scale;
    final priceFont = 12.0 * scale;
    final buttonSize = 27.0 * scale;

    return Container(
      clipBehavior: Clip.antiAlias,

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isActive ? 0.12 : 0.05),
            blurRadius: isActive ? 14 : 7,
            offset: Offset(0, isActive ? 5 : 3),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Product image
          Expanded(
            flex: 5,
            child: ClipRect(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  AnimatedScale(
                    scale: isActive ? 1.0 : 1.04,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeOutCubic,

                    child: Image.network(
                      product.image,
                      fit: BoxFit.cover,

                      loadingBuilder: (context, child, progress) {
                        if (progress == null) return child;

                        return Container(
                          color: Colors.grey.shade100,
                          alignment: Alignment.center,

                          child: SizedBox(
                            width: 18 * scale,
                            height: 18 * scale,
                            child: const CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                          ),
                        );
                      },

                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey.shade100,
                          alignment: Alignment.center,

                          child: Icon(
                            Icons.image_not_supported_outlined,
                            color: Colors.grey.shade500,
                            size: 24 * scale,
                          ),
                        );
                      },
                    ),
                  ),

                  // Image overlay
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 350),

                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withValues(
                            alpha: isActive ? 0.10 : 0.03,
                          ),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),

                  // Favorite icon
                  Positioned(
                    top: 6 * scale,
                    right: 6 * scale,

                    child: AnimatedOpacity(
                      opacity: isActive ? 1 : 0.7,
                      duration: const Duration(milliseconds: 300),

                      child: Container(
                        padding: EdgeInsets.all(5 * scale),

                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.92),
                          shape: BoxShape.circle,
                        ),

                        child: Icon(
                          Icons.favorite_border,
                          size: 13 * scale,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Product details
          Expanded(
            flex: 6,

            child: Container(
              padding: EdgeInsets.fromLTRB(
                padding,
                7 * scale,
                padding,
                6 * scale,
              ),

              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: product.colors,
                ),
              ),

              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.brand,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,

                        style: TextStyle(
                          fontSize: brandFont,
                          height: 1.15,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),

                      SizedBox(height: 3 * scale),

                      Text(
                        product.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,

                        style: TextStyle(
                          fontSize: titleFont,
                          height: 1.1,
                          color: Colors.white.withValues(alpha: 0.9),
                        ),
                      ),

                      SizedBox(height: 4 * scale),

                      Text(
                        product.price,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,

                        style: TextStyle(
                          fontSize: priceFont,
                          height: 1.1,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),

                      const Spacer(),

                      Align(
                        alignment: Alignment.bottomRight,

                        child: AnimatedScale(
                          scale: isActive ? 1.0 : 0.92,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOutCubic,

                          child: Material(
                            color: const Color(0xFF0878F9),
                            shape: const CircleBorder(),

                            child: InkWell(
                              customBorder: const CircleBorder(),

                              onTap: () {
                                // Add your product action here.
                              },

                              child: SizedBox(
                                width: buttonSize,
                                height: buttonSize,

                                child: Icon(
                                  Icons.add,
                                  size: 17 * scale,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
