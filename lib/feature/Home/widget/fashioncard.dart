import 'package:flutter/material.dart';

class Fashioncard extends StatelessWidget {
  const Fashioncard({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> fashionCards = [
      {
        'title': 'SAREE',
        'image': 'https://images.unsplash.com/photo-1583391733956-3750e0ff4e8b?w=500',
      },
      {
        'title': 'ANIRA',
        'image': 'https://images.unsplash.com/photo-1595777457583-95e059d581b8?w=500',
      },
      {
        'title': 'LEHER',
        'image': 'https://images.unsplash.com/photo-1617627143750-d86bc21e42bb?w=500',
      },
      {
        'title': 'ANIRA',
        'image': 'https://images.unsplash.com/photo-1595777457583-95e059d581b8?w=500',
      },
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: fashionCards.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          childAspectRatio: 0.70,
        ),
        itemBuilder: (context, index) {
          final card = fashionCards[index];

          return GestureDetector(
            onTap: () => debugPrint('Tapped ${card['title']}'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    card['image']!,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, progress) {
                      if (progress == null) return child;
                      return const Center(
                        child: SizedBox(
                          height: 18,
                          width: 18,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return const ColoredBox(
                        color: Colors.transparent,
                        child: Icon(
                          Icons.image_not_supported_outlined,
                          color: Colors.grey,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
