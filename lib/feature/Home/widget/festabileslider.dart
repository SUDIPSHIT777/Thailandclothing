import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class FestiveBannerSlider extends StatefulWidget {
  const FestiveBannerSlider({super.key});

  @override
  State<FestiveBannerSlider> createState() => _FestiveBannerSliderState();
}

class _FestiveBannerSliderState extends State<FestiveBannerSlider> {
  final CarouselSliderController _controller = CarouselSliderController();

  int _currentIndex = 0;

  final List<String> _banners = [
    'assets/Festive Dhamaka Golden Frame.png',
    'assets/Festive Aeres Haze Sneaker Sale.png',
    'assets/Festive Dhamaka Poolside Sale Banner.png',
    'assets/Festive Dhamaka Sale Banner.png',
    'assets/Thai Festival Fashion Banner Cutout.png',
  ];

  // Background blending colors

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFF2B2A5), Color(0xFFF5A69F), Color(0xFFFFB084)],
          stops: [0.0, 0.5, 1.0],
        ),
      ),

      padding: const EdgeInsets.only(bottom: 10),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CarouselSlider.builder(
            carouselController: _controller,
            itemCount: _banners.length,

            itemBuilder: (context, index, realIndex) {
              return SizedBox(
                width: screenWidth,
                child: Image.asset(
                  _banners[index],
                  width: screenWidth,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Icon(
                        Icons.image_not_supported,
                        size: 35,
                        color: Colors.white,
                      ),
                    );
                  },
                ),
              );
            },

            options: CarouselOptions(
              height: screenWidth * 0.62,

              viewportFraction: 1.0,
              initialPage: 0,

              enableInfiniteScroll: true,
              reverse: false,

              // Automatic sliding
              autoPlay: true,

              // Hold banner for 3 seconds
              autoPlayInterval: const Duration(seconds: 3),

              // Quick slide transition
              autoPlayAnimationDuration: const Duration(milliseconds: 350),

              autoPlayCurve: Curves.easeInOutCubic,

              enlargeCenterPage: false,
              scrollDirection: Axis.horizontal,

              pauseAutoPlayOnTouch: true,
              pauseAutoPlayOnManualNavigate: true,

              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),

          const SizedBox(height: 5),

          // Page indicators
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(_banners.length, (index) {
              final isActive = _currentIndex == index;

              return GestureDetector(
                onTap: () {
                  _controller.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 350),
                    curve: Curves.easeInOutCubic,
                  );
                },

                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),

                  margin: const EdgeInsets.symmetric(horizontal: 3),

                  width: isActive ? 7 : 5,
                  height: isActive ? 7 : 5,

                  decoration: BoxDecoration(
                    color: isActive
                        ? const Color(0xFF333333)
                        : const Color(0xFFCF8878),
                    shape: BoxShape.circle,
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
