import 'package:flutter/material.dart';
import 'package:thailand_clothing/feature/Home/screen/mainhomescreen.dart';
import 'package:thailand_clothing/feature/Profile/screen/ProfileScreen/profilescreen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 0;
  // void _openProfile() {
  //   setState(() {
  //     selectedIndex = 4;
  //   });
  // }

  // void _openWishlistTap() {
  //   setState(() {
  //     selectedIndex = 4;
  //   });
  // }

  late final List<Widget> pages = [
    Mainhomescreen(),
    const SizedBox(),
    const SizedBox(),
    const SizedBox(),
    const Profilescreen(),
  ];

  final List<IconData> icons = const [
    Icons.home_outlined,
    Icons.grid_view_rounded,
    Icons.shopping_cart_outlined,
    Icons.inventory_2_outlined,
    Icons.person_outline_rounded,
  ];

  final List<String> labels = const [
    'Home',
    'Categories',
    'Cart',
    'Orders',
    'Account',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: selectedIndex, children: pages),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(14)),
          boxShadow: [
            BoxShadow(
              color: Color(0x18000000),
              blurRadius: 8,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          top: false,
          child: SizedBox(
            height: 60,
            child: Row(
              children: List.generate(icons.length, (index) {
                final bool isSelected = selectedIndex == index;

                return Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          icons[index],
                          size: 23,
                          color: isSelected
                              ? const Color(0xFF087BFF)
                              : const Color(0xFF9CA3AF),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          labels[index],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: isSelected
                                ? FontWeight.w600
                                : FontWeight.w500,
                            color: isSelected
                                ? const Color(0xFF087BFF)
                                : const Color(0xFF9CA3AF),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
