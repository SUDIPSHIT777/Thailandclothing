import 'package:flutter/material.dart';

class Bigbrandfashion extends StatelessWidget {
  const Bigbrandfashion({super.key});

  final List<String> bannerImages = const [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmgBZ7f_OzGBqRMcxCDeciLEZKNGCOL-l372DloDdJ7VN9EAPq',
    'https://i.pinimg.com/originals/17/51/d4/1751d4bcc04123a34bc349f2dfbb24ea.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ), // No top/bottom extra gap, no background color
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: bannerImages.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2 cards side by side
        crossAxisSpacing: 16.0, // Gap between the 2 cards
        mainAxisSpacing: 16.0,
        childAspectRatio: 0.72, // Tall portrait card ratio
      ),
      itemBuilder: (context, index) {
        return _BannerCard(imageUrl: bannerImages[index]);
      },
    );
  }
}

class _BannerCard extends StatelessWidget {
  final String imageUrl;

  const _BannerCard({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14.0),
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const Center(
            child: SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) =>
            const Center(child: Icon(Icons.broken_image, color: Colors.grey)),
      ),
    );
  }
}
