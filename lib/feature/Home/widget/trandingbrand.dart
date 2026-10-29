import 'package:flutter/material.dart';

class TrendingThailandSection extends StatelessWidget {
  const TrendingThailandSection({super.key});

  final List<String> imageUrls = const [
    'https://images.unsplash.com/photo-1599643478518-a784e5dc4c8f?w=500&auto=format&fit=crop&q=80',
    'https://cdn.shopify.com/s/files/1/0727/0062/5086/files/slider_mobile_april_jpg_d32f663b-aa0a-43e4-b02b-1b7903762860.jpg?v=1789126380&width=600',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzbExWEWFFTTLUFqwt-HeuO2Y3PZffjpbhKpFphqT6WsTpuRHQI1OLHUtQ&s=10',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 14.0),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 1. Yellow Pill Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFFFCC00),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Text(
                        'Trending in Thailand ',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                          letterSpacing: -0.3,
                        ),
                      ),
                      Text('🇹🇭', style: TextStyle(fontSize: 16.0)),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle "See All" tap
                    },
                    child: const Text(
                      'See All',
                      style: TextStyle(
                        fontSize: 13.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(
            height: 10.0,
          ), // Exact tight spacing between header and grid
          // 2. GridView.builder with zero internal top padding
          GridView.builder(
            padding: const EdgeInsets.symmetric(
              horizontal: 14.0,
            ), // Overrides default top padding to 0
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: imageUrls.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: 0.68,
            ),
            itemBuilder: (context, index) {
              return _ImageCard(imageUrl: imageUrls[index]);
            },
          ),
        ],
      ),
    );
  }
}

class _ImageCard extends StatelessWidget {
  final String imageUrl;

  const _ImageCard({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            color: Colors.grey.shade200,
            child: const Center(
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) => Container(
          color: Colors.grey.shade300,
          child: const Icon(Icons.broken_image, color: Colors.grey),
        ),
      ),
    );
  }
}
