import 'package:flutter/material.dart';
import 'package:thailand_clothing/feature/Home/widget/festabileslider.dart';
import 'package:thailand_clothing/feature/Home/widget/productcard.dart';
import 'package:thailand_clothing/feature/Home/widget/silverappbarwidget.dart';
import 'package:thailand_clothing/feature/Home/widget/thilendcard.dart';

class Mainhomescreen extends StatelessWidget {
  const Mainhomescreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          HomeSliverAppBar(),
          SliverToBoxAdapter(child: const FestiveBannerSlider()),
          SliverToBoxAdapter(child: const ThailandPromoCard()),
          SliverToBoxAdapter(child: const ProductCardCarousel()),
        ],
      ),
    );
  }
}
