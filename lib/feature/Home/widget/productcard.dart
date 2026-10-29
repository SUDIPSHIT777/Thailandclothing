import 'package:flutter/material.dart';

class ProductCardCarousel extends StatelessWidget {
  const ProductCardCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      const ProductItem(
        brand: 'Beauty of Joseon',
        title: 'Aesthetic',
        price: '₹1,299',
        imageUrl: 'https://picsum.photos/id/1015/400/500',
        gradientColors: [Color(0xFF65418B), Color(0xFF281047)],
      ),
      const ProductItem(
        brand: 'Mae Ploy',
        title: 'Beach',
        price: '₹399',
        imageUrl: 'https://picsum.photos/id/1005/400/500',
        gradientColors: [Color(0xFFB87A16), Color(0xFF542006)],
      ),
      const ProductItem(
        brand: 'Mistine',
        title: 'Funky',
        price: '₹799',
        imageUrl: 'https://picsum.photos/id/1025/400/500',
        gradientColors: [Color(0xFF8E241A), Color(0xFF400900)],
      ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        // Increased outer padding & gap so cards take up less width
        const horizontalPadding = 26.0;
        const gap = 10.0;
        const cardHeight = 148.0; // Reduced from 170.0
        const centerLift = 22.0;

        final cardWidth =
            (constraints.maxWidth - (horizontalPadding * 2) - (gap * 2)) / 3;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: SizedBox(
            height: cardHeight + centerLift,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomCenter,
              children: [
                Positioned(
                  top: -10,
                  left: -10,
                  right: -10,
                  bottom: 16,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white.withValues(alpha: 0.90),
                          Colors.white.withValues(alpha: 0.50),
                          Colors.white.withValues(alpha: 0.0),
                        ],
                      ),
                    ),
                  ),
                ),

                // Product Cards Row
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: List.generate(items.length, (index) {
                    return Padding(
                      padding: EdgeInsets.only(
                        right: index < items.length - 1 ? gap : 0,
                      ),
                      child: Transform.translate(
                        offset: Offset(0, index == 1 ? -centerLift : 0),
                        child: ProductCard(
                          item: items[index],
                          width: cardWidth,
                          height: cardHeight,
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ProductItem {
  final String brand;
  final String title;
  final String price;
  final String imageUrl;
  final List<Color> gradientColors;

  const ProductItem({
    required this.brand,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.gradientColors,
  });
}

class ProductCard extends StatelessWidget {
  final ProductItem item;
  final double width;
  final double height;

  const ProductCard({
    super.key,
    required this.item,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.22),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Column(
          children: [
            // Product image
            Expanded(
              flex: 58,
              child: SizedBox.expand(
                child: Image.network(
                  item.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (_, _, _) => Container(
                    color: const Color(0xFFE8DAD0),
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.image_outlined,
                      color: Colors.black38,
                      size: 22,
                    ),
                  ),
                ),
              ),
            ),

            // Product details
            Expanded(
              flex: 42,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(6, 4, 6, 4),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: item.gradientColors,
                  ),
                ),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.brand,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 8.5,
                          ),
                        ),
                        const SizedBox(height: 1),
                        Text(
                          item.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10.5,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 24),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              item.price,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Compact Plus button
                    Positioned(
                      right: 2,
                      bottom: 5,
                      child: Material(
                        color: const Color(0xFF0066FF),
                        shape: const CircleBorder(),
                        child: InkWell(
                          customBorder: const CircleBorder(),
                          onTap: () {
                            // Add product to cart
                          },
                          child: const SizedBox(
                            width: 25,
                            height: 25,
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
