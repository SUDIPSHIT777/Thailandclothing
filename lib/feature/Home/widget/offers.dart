import 'package:flutter/material.dart';

class MegaFashionDealsBanner extends StatelessWidget {
  const MegaFashionDealsBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: AspectRatio(
        aspectRatio: 1967 / 600,
        child: Image.asset('assets/offers.png', fit: BoxFit.contain),
      ),
    );
  }
}
