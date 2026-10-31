import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class FestiveColors {
  FestiveColors._();

  static const Color gold = Color(0xFFF1CF72);

  static const LinearGradient navGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFFF5D882), gold],
  );
}

class FestiveBannerSlider extends StatefulWidget {
  const FestiveBannerSlider({super.key});

  @override
  State<FestiveBannerSlider> createState() => _FestiveBannerSliderState();
}

class _FestiveBannerSliderState extends State<FestiveBannerSlider> {
  final CarouselSliderController _controller = CarouselSliderController();

  int _currentIndex = 0;

  static const double _topFadeHeight = 20;

  final List<String> _banners = [
    'assets/Festive Dhamaka Golden Frame.png',
    'assets/Festive Aeres Haze Sneaker Sale.png',
    'assets/Festive Dhamaka Poolside Sale Banner.png',
    'assets/Festive Dhamaka Sale Banner.png',
    'assets/Thai Festival Fashion Banner Cutout.png',
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,

      // Premium festive golden gradient
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFF6B88A), // Warm peach gold
            Color(0xFFF7C47D), // Champagne gold
            Color(0xFFF5D17A), // Festive golden yellow
            Color(0xFFF3BD79), // Soft golden orange
          ],
          stops: [0.0, 0.18, 0.38, 0.58],
        ),
      ),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(9),
            child: SizedBox(
              width: double.infinity,
              height: screenWidth * 0.125,
              child: Image.asset(
                'assets/Festive Flat ₹300 Off Myntra Banner.png',
                width: double.infinity,
                fit: BoxFit.fill,
                errorBuilder: (context, error, stackTrace) {
                  return const SizedBox.shrink();
                },
              ),
            ),
          ),

          // FESTIVE IMAGE CAROUSEL
          Stack(
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
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
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

              // TOP GOLDEN COLOUR BLENDING
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: _topFadeHeight,
                child: const IgnorePointer(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFFF1CF72),
                          Color(0xBFF1CF72),
                          Color(0x66F1CF72),
                          Color(0x26F1CF72),
                          Color(0x00F1CF72),
                        ],
                        stops: [0.0, 0.3, 0.55, 0.8, 1.0],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 5),

          // PAGE INDICATORS
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

          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
