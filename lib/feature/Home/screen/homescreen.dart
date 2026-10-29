// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:go_router/go_router.dart';
// import 'package:thailand_clothing/Globalwidget/showdeliverybottomscreen.dart';
// import 'package:thailand_clothing/core/router/approute.dart';
// import 'package:thailand_clothing/core/utils/appcolor.dart';
// import 'package:thailand_clothing/feature/Home/widget/bigbrandfashion.dart';
// import 'package:thailand_clothing/feature/Home/widget/brandbutton.dart';
// import 'package:thailand_clothing/feature/Home/widget/fashioncard.dart';
// import 'package:thailand_clothing/feature/Home/widget/offers.dart';
// import 'package:thailand_clothing/feature/Home/widget/productcard.dart';
// import 'package:thailand_clothing/feature/Home/widget/tabbarwidget.dart';
// import 'package:thailand_clothing/feature/Home/widget/thilendcard.dart';
// import 'package:thailand_clothing/feature/Home/widget/trandingbrand.dart';
// import 'package:thailand_clothing/feature/Home/widget/vipticket.dart';

// class HomeScreen extends StatefulWidget {
//   final VoidCallback? onProfileTap;
//   final VoidCallback? onWishlistTap;
//   const HomeScreen({super.key, this.onProfileTap, this.onWishlistTap});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   static const Color _ink = Color(0xFF2B2B3A);

//   final categories = const [
//     {
//       'label': 'Beauty of Bikini',
//       'img': 'https://picsum.photos/seed/bikini/200',
//     },
//     {
//       'label': 'Traditional',
//       'img': 'https://picsum.photos/seed/traditional/200',
//     },
//     {
//       'label': 'Couple Ware',
//       'img': 'https://picsum.photos/seed/coupleware/200',
//     },
//     {'label': 'Couple', 'img': 'https://picsum.photos/seed/couple/200'},
//     {'label': 'Hot', 'img': 'https://picsum.photos/seed/hot/200'},
//     {'label': 'Sharee', 'img': 'https://picsum.photos/seed/sharee/200'},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final topPad = MediaQuery.of(context).padding.top;

//     return AnnotatedRegion<SystemUiOverlayStyle>(
//       value: const SystemUiOverlayStyle(
//         statusBarColor: Colors.transparent,
//         statusBarIconBrightness: Brightness.dark,
//         statusBarBrightness: Brightness.light,
//       ),
//       child: Scaffold(
//         backgroundColor: AppColors.gradBottom,
//         body: Container(
//           width: double.infinity,
//           height: double.infinity,
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: [
//                 Color(0xFF8671BC), // 0% - Purple
//                 Color(0xFFD397B4), // 8% - Pink
//                 Color(0xFFF0ACA4), // 13% - Soft coral
//                 Color(0xFFEFAC65), // 25% - Peach
//                 Color(0xFFDC9D40), // 41% - Golden brown
//                 Color(0xFFF9AC33), // 55% - Orange
//                 Color(0xFFFFFFFF), // 76% - White
//                 Color(0xFF3D3456), // 100% - Dark purple
//               ],
//               stops: [0.0, 0.08, 0.13, 0.25, 0.41, 0.55, 0.76, 1.0],
//             ),
//           ),
//           child: SingleChildScrollView(
//             padding: EdgeInsets.only(top: topPad + 10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 _buildHeader(),
//                 const SizedBox(height: 15),
//                 const CustomTabHeader(),
//                 const SizedBox(height: 15),
//                 _buildCategories(),
//                 const SizedBox(height: 14),
//                 _buildBanner(context),
//                 Transform.translate(
//                   offset: const Offset(0, -12),
//                   child: const ThailandPromoCard(height: 180),
//                 ),
//                 Transform.translate(
//                   offset: Offset(0, -15),
//                   child: const MegaFashionDealsBanner(),
//                 ),
//                 Transform.translate(
//                   offset: Offset(0, -10),
//                   child: const ProductCardCarousel(),
//                 ),
//                 const VipTicketBanner(),
//                 const Fashioncard(),
//                 const SizedBox(height: 7),
//                 const BrandButtons(),
//                 const Fashioncard(),
//                 const TrendingThailandSection(),
//                 const Bigbrandfashion(),
//                 const SizedBox(height: 40),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   /// Banner section
//   Widget _buildBanner(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         final w = constraints.maxWidth;
//         final bannerH = w * (799 / 1967);

//         return SizedBox(
//           width: w,
//           height: bannerH,
//           child: Stack(
//             clipBehavior: Clip.none,
//             children: [
//               Positioned.fill(
//                 child: Image.asset(
//                   'assets/Thailand Festival Fashion Promotion.png',
//                   fit: BoxFit.fill,
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   /// Header implementation
//   Widget _buildHeader() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               const Icon(Icons.location_on, size: 26, color: _ink),
//               const SizedBox(width: 6),
//               Flexible(
//                 child: GestureDetector(
//                   onTap: () => showDeliveryLocationBottomSheet(context),
//                   child: Text(
//                     'Add Delivery Address',
//                     overflow: TextOverflow.ellipsis,
//                     style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w600,
//                       color: _ink,
//                     ),
//                   ),
//                 ),
//               ),
//               const Icon(
//                 Icons.keyboard_arrow_down_rounded,
//                 size: 20,
//                 color: _ink,
//               ),
//               const Spacer(),
//               GestureDetector(
//                 onTap: () => context.push(AppRouter.notification),
//                 child: Icon(
//                   Icons.notifications_none_rounded,
//                   size: 26,
//                   color: _ink,
//                 ),
//               ),
//               const SizedBox(width: 12),
//               GestureDetector(
//                 onTap: widget.onWishlistTap,
//                 child: const Icon(
//                   Icons.favorite_border_rounded,
//                   size: 26,
//                   color: _ink,
//                 ),
//               ),
//               const SizedBox(width: 12),
//               GestureDetector(
//                 onTap: widget.onProfileTap,
//                 child: const Icon(
//                   Icons.person_outline_rounded,
//                   size: 28,
//                   color: _ink,
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 12),
//           Container(
//             width: double.infinity,
//             height: 40,
//             padding: const EdgeInsets.symmetric(horizontal: 12),
//             decoration: BoxDecoration(
//               color: const Color(0xFFE9DCE6),
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: const Row(
//               children: [
//                 Icon(Icons.search, size: 20, color: Color(0xFFB23A3A)),
//                 SizedBox(width: 8),
//                 Expanded(
//                   child: Text(
//                     'Shoppe Your Favorite',
//                     overflow: TextOverflow.ellipsis,
//                     style: TextStyle(fontSize: 13, color: Colors.black45),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   /// Categories List implementation
//   Widget _buildCategories() {
//     return SizedBox(
//       height: 104,
//       child: ListView.separated(
//         scrollDirection: Axis.horizontal,
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         itemCount: categories.length,
//         separatorBuilder: (_, _) => const SizedBox(width: 14),
//         itemBuilder: (_, i) {
//           final c = categories[i];
//           return SizedBox(
//             width: 70,
//             child: Column(
//               children: [
//                 Container(
//                   width: 60,
//                   height: 60,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     border: Border.all(color: Colors.white, width: 1.5),
//                   ),
//                   child: ClipOval(
//                     child: Image.network(
//                       c['img']!,
//                       fit: BoxFit.cover,
//                       loadingBuilder: (context, child, progress) {
//                         if (progress == null) return child;
//                         return Container(
//                           color: Colors.white54,
//                           child: const Center(
//                             child: SizedBox(
//                               width: 18,
//                               height: 18,
//                               child: CircularProgressIndicator(
//                                 strokeWidth: 2,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                       errorBuilder: (context, error, stackTrace) => Container(
//                         color: Colors.white54,
//                         child: const Icon(Icons.person, color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 6),
//                 Text(
//                   c['label']!,
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(
//                     fontSize: 10.5,
//                     fontWeight: FontWeight.w600,
//                     color: _ink,
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }