import 'package:flutter/material.dart';

class VipTicketBanner extends StatelessWidget {
  const VipTicketBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/vipticket.png', fit: BoxFit.fill),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Image.asset(
                'assets/Frame 57.png',
                width: double.infinity,
                height: 35,
                fit: BoxFit.contain,
                alignment: Alignment.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
