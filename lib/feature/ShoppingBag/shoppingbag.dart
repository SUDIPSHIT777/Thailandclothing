import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:thailand_clothing/core/utils/appcolor.dart';

// import 'app_colors.dart'; // Uncomment if AppColors is in a separate file

class ShoppingBagScreen extends StatefulWidget {
  const ShoppingBagScreen({super.key});

  @override
  State<ShoppingBagScreen> createState() => _ShoppingBagScreenState();
}

class _ShoppingBagScreenState extends State<ShoppingBagScreen> {
  // Interactive State Variables
  int selectedTopTabIndex = 0;
  int selectedDealTabIndex = 0;
  bool isItemSelected = false;
  int selectedCategoryIndex = 0;
  int? selectedDonationIndex;

  final GlobalKey _itemsKey = GlobalKey();
  final GlobalKey _couponsKey = GlobalKey();
  final GlobalKey _priceDetailsKey = GlobalKey();

  final List<String> topTabs = [
    'Items',
    'Coupons & Bank Offers',
    'Price Details',
  ];

  final List<String> categories = [
    'All',
    'Water Bottle',
    'Sunglasses',
    'Handkerchief',
  ];

  final List<String> donations = ['₹10', '₹20', '₹50', '₹80', '₹100'];

  void _onTopTabTapped(int index) {
    setState(() {
      selectedTopTabIndex = index;
    });

    GlobalKey? targetKey;
    if (index == 0) targetKey = _itemsKey;
    if (index == 1) targetKey = _couponsKey;
    if (index == 2) targetKey = _priceDetailsKey;

    if (targetKey?.currentContext != null) {
      Scrollable.ensureVisible(
        targetKey!.currentContext!,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bagScaffoldBg,
      appBar: _buildAppBar(),
      body: Column(
        children: [
          // 1. Interactive Top Tab Bar (Items | Coupons & Bank Offers | Price Details)
          _buildTopTabs(),

          // 2. Main Scrollable Content
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),

                  // Deal Unlock Section (Interactive Deal Tabs + Larger Cards)
                  _buildDealUnlockSection(),
                  const SizedBox(height: 16),

                  // Items Section
                  Container(
                    key: _itemsKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildYourBagHeader(),
                        const SizedBox(height: 8),
                        _buildBagItemCard(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Get Festive Ready Horizontal List
                  _buildGetFestiveReadySection(),
                  const SizedBox(height: 20),

                  // Coupons & Bank Offers Section
                  Container(key: _couponsKey, child: _buildCouponsSection()),
                  const SizedBox(height: 16),

                  // Donate & Support Section
                  _buildDonateSection(),
                  const SizedBox(height: 20),

                  // Price Details Section
                  Container(
                    key: _priceDetailsKey,
                    child: _buildPriceDetailsSection(),
                  ),
                  const SizedBox(height: 24),

                  // Trust Badges & Terms
                  _buildTrustBadges(),
                  const SizedBox(height: 20),
                  _buildTermsText(),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),

          // 3. Sticky Bottom Warning + Place Order Button
          _buildBottomBar(),
        ],
      ),
    );
  }

  // App Bar with Delivery Address
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_new,
          color: AppColors.darkText,
          size: 20,
        ),
        onPressed: () {
          context.pop();
        },
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Sagar Sunil Das (700124)',
            style: TextStyle(
              color: AppColors.darkText,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 2),
          Text(
            'Nearby Spencer Mall, 147, Tanki Road, Kalikapur',
            style: TextStyle(
              color: AppColors.tagText,
              fontSize: 11,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  // Interactive Top Navigation Tabs (Items | Coupons & Bank Offers | Price Details)
  Widget _buildTopTabs() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: const BoxDecoration(
        color: AppColors.white,
        border: Border(
          top: BorderSide(color: AppColors.dividerGrey),
          bottom: BorderSide(color: AppColors.dividerGrey),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(topTabs.length, (index) {
          final bool isSelected = selectedTopTabIndex == index;
          return GestureDetector(
            onTap: () => _onTopTabTapped(index),
            behavior: HitTestBehavior.opaque,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                border: Border.all(
                  color: isSelected
                      ? AppColors.bagPrimaryPink
                      : AppColors.white,
                  width: 1.2,
                ),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                topTabs[index],
                style: TextStyle(
                  color: isSelected
                      ? AppColors.bagPrimaryPink
                      : AppColors.textDark,
                  fontSize: 13,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  // Deal Unlock Banner & Larger Horizontal Cards
  Widget _buildDealUnlockSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.bagDealBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.bagPrimaryPink.withValues(alpha: 0.45),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Interactive Top Deal Tabs (DEAL 1 | DEAL 1 | DEAL 1)
          Container(
            padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
            decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: _buildDealTab(
                    index: index,
                    isSelected: selectedDealTabIndex == index,
                  ),
                );
              }),
            ),
          ),

          // Shop for ₹500 more prompt
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
            child: Row(
              children: [
                RichText(
                  text: const TextSpan(
                    style: TextStyle(color: AppColors.textDark, fontSize: 11.5),
                    children: [
                      TextSpan(text: 'Shop for '),
                      TextSpan(
                        text: '₹500',
                        style: TextStyle(
                          color: AppColors.bagPrimaryPink,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      TextSpan(text: ' more to unlock special prices '),
                    ],
                  ),
                ),
                const Icon(
                  Icons.info_outline,
                  size: 14,
                  color: AppColors.iconGrey,
                ),
              ],
            ),
          ),

          // Larger Horizontal Deal Cards (Increased height to 118 and rounded Add button)
          SizedBox(
            height: 118,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  width: 260,
                  margin: const EdgeInsets.only(right: 10, bottom: 12),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: AppColors.dividerGrey),
                  ),
                  child: Row(
                    children: [
                      // Product Thumbnail
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          'https://images.unsplash.com/photo-1586350977771-b3b0abd50c82?w=300&auto=format&fit=crop&q=60',
                          width: 68,
                          height: 86,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 10),
                      // Product Details + Rounded Lock Add Button
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              text: const TextSpan(
                                style: TextStyle(
                                  color: AppColors.darkText,
                                  fontSize: 11,
                                  height: 1.2,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'MJE ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Men Pack of Ankle Length Socks',
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                const Text(
                                  '₹70 ',
                                  style: TextStyle(
                                    color: AppColors.bagGreenPrice,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                                const Text(
                                  '₹599',
                                  style: TextStyle(
                                    color: AppColors.subtitleGrey,
                                    fontSize: 10.5,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 5,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.bagSpecialTagBg,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: const Text(
                                    'Special Price 🏷️',
                                    style: TextStyle(
                                      color: AppColors.bagGreenPrice,
                                      fontSize: 8,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            // Enhanced Add Button with Rounded Radius
                            InkWell(
                              onTap: () {},
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                height: 24,
                                width: 84,
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  border: Border.all(
                                    color: AppColors.borderGrey,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.lock,
                                      size: 11,
                                      color: AppColors.iconGrey,
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      'Add',
                                      style: TextStyle(
                                        fontSize: 10.5,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.textDark,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Interactive Deal Tab Builder
  Widget _buildDealTab({required int index, required bool isSelected}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedDealTabIndex = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.bagDealTabActive : AppColors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
        ),
        child: Row(
          children: [
            Icon(
              Icons.lock,
              size: 12,
              color: isSelected ? AppColors.bagPrimaryPink : AppColors.iconGrey,
            ),
            const SizedBox(width: 4),
            const Text(
              'DEAL 1',
              style: TextStyle(
                color: AppColors.bagPrimaryPink,
                fontSize: 10.5,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Your Bag Section Header
  Widget _buildYourBagHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Your Bag',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.tagText,
            ),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              SizedBox(
                width: 20,
                height: 20,
                child: Checkbox(
                  value: isItemSelected,
                  activeColor: AppColors.bagPrimaryPink,
                  side: const BorderSide(color: AppColors.iconGrey, width: 1.2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  onChanged: (val) {
                    setState(() {
                      isItemSelected = val ?? false;
                    });
                  },
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '${isItemSelected ? 1 : 0}/1 Items Selected',
                style: const TextStyle(fontSize: 13, color: AppColors.textDark),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Main Bag Item Card (Powerlook Shirt)
  Widget _buildBagItemCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              'https://images.unsplash.com/photo-1602810318383-e386cc2a3ccf?w=400&auto=format&fit=crop&q=60',
              width: 110,
              height: 145,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                const Text(
                  'Powerlook',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppColors.darkText,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Tartan Checked Long Sleeves Cotton Shirt',
                  style: TextStyle(fontSize: 11.5, color: AppColors.textDark),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    _buildSelectorChip('Size: 42'),
                    const SizedBox(width: 8),
                    _buildSelectorChip('Qty: 1'),
                    const SizedBox(width: 8),
                    const Text(
                      '1 left',
                      style: TextStyle(
                        color: AppColors.bagUrgentRed,
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                Row(
                  children: const [
                    Text(
                      '₹1,199 ',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: AppColors.darkText,
                      ),
                    ),
                    Text(
                      '₹2,699 ',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.textDark,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    Text(
                      '₹1,500 Off',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectorChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.tagBg,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 12,
          color: AppColors.textDark,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  // Get Festive Ready Horizontal Section
  Widget _buildGetFestiveReadySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Get Festive Ready',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.tagText,
            ),
          ),
        ),
        const SizedBox(height: 12),
        // Category Filter Pills
        SizedBox(
          height: 36,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final isSelected = selectedCategoryIndex == index;
              return GestureDetector(
                onTap: () => setState(() => selectedCategoryIndex = index),
                child: Container(
                  margin: const EdgeInsets.only(right: 8),
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isSelected
                          ? AppColors.bagPrimaryPink
                          : AppColors.white,
                    ),
                  ),
                  child: Text(
                    categories[index],
                    style: TextStyle(
                      fontSize: 12,
                      color: isSelected
                          ? AppColors.bagPrimaryPink
                          : AppColors.textDark,
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.normal,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        // Horizontal Product Cards
        Container(
          color: AppColors.white,
          padding: const EdgeInsets.symmetric(vertical: 14),
          height: 265,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            children: [
              _buildFestiveProductCard(
                brand: 'SPADEACES',
                title: 'Men Square Sunglasses',
                price: '₹332',
                mrp: '₹999',
                discount: '(66% OFF)',
                bgColor: AppColors.bagScaffoldBg,
                imageUrl: 'https://images.unsplash.com/photo-1511499767150-a48a237f0083?w=400&auto=format&fit=crop&q=60',
              ),
              _buildFestiveProductCard(
                brand: 'FUNGLASSES',
                title: 'Unisex Rectangle Sunglasses',
                price: '₹299',
                mrp: '₹1999',
                discount: '(85% OFF)',
                bgColor: AppColors.bagFestiveCardGrey,
                imageUrl: 'https://images.unsplash.com/photo-1572635196237-14b3f281503f?w=400&auto=format&fit=crop&q=60',
              ),
              _buildFestiveProductCard(
                brand: 'FUNGLASSES',
                title: 'Unisex Rectangle Sunglasses',
                price: '₹299',
                mrp: '₹1999',
                discount: '(85% OFF)',
                bgColor: AppColors.textDark,
                imageUrl: 'https://images.unsplash.com/photo-1508296695146-257a814070b4?w=400&auto=format&fit=crop&q=60',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFestiveProductCard({
    required String brand,
    required String title,
    required String price,
    required String mrp,
    required String discount,
    required Color bgColor,
    required String imageUrl,
  }) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.network(imageUrl, fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.bagPrimaryPink),
                      ),
                      child: const Text(
                        'Add',
                        style: TextStyle(
                          color: AppColors.bagPrimaryPink,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            brand,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: AppColors.darkText,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 10.5,
              color: AppColors.subtitleGrey,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Text(
                '$price ',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                  color: AppColors.darkText,
                ),
              ),
              Text(
                '$mrp ',
                style: const TextStyle(
                  fontSize: 9.5,
                  color: AppColors.subtitleGrey,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              Text(
                discount,
                style: const TextStyle(
                  fontSize: 10,
                  color: AppColors.bagDiscountGold,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Coupons & Bank Offers Section
  Widget _buildCouponsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Coupons & Bank Offers',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: AppColors.tagText,
                  ),
                ),
                Column(
                  children: [
                    const Text(
                      'View All Offers',
                      style: TextStyle(fontSize: 11, color: AppColors.textDark),
                    ),
                    Container(width: 72, height: 1, color: AppColors.iconGrey),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              children: [
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: AppColors.bagCoinGold,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.bagCoinBorder,
                      width: 1.5,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    '₹',
                    style: TextStyle(
                      color: AppColors.textDark,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Coupons and Offers may be available',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textDark,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Select at least one item to view',
                      style: TextStyle(
                        fontSize: 11,
                        color: AppColors.subtitleGrey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Donate & Support Section
  Widget _buildDonateSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Donate & Support Transformative',
                style: TextStyle(fontSize: 12, color: AppColors.textDark),
              ),
              Text(
                'Know More',
                style: TextStyle(
                  fontSize: 11,
                  color: AppColors.textDark,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          const Text(
            'Social Work In India',
            style: TextStyle(fontSize: 12, color: AppColors.textDark),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(donations.length, (index) {
              final isSelected = selectedDonationIndex == index;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedDonationIndex = isSelected ? null : index;
                  });
                },
                child: Container(
                  width: 58,
                  height: 32,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: isSelected
                          ? AppColors.bagPrimaryPink
                          : AppColors.borderGrey,
                    ),
                  ),
                  child: Text(
                    donations[index],
                    style: TextStyle(
                      fontSize: 12,
                      color: isSelected
                          ? AppColors.bagPrimaryPink
                          : AppColors.textDark,
                      fontWeight: isSelected
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  // Price Details Section
  Widget _buildPriceDetailsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              'Price Details',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.tagText,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total MRP',
                      style: TextStyle(fontSize: 13, color: AppColors.textDark),
                    ),
                    Text(
                      isItemSelected ? '₹2,699' : '₹0',
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppColors.textDark,
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Divider(height: 1, color: AppColors.dividerGrey),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total Amount',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                    ),
                    Text(
                      isItemSelected ? '₹1,199' : '₹0',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Trust Badges (Genuine Products | Contactless Delivery | Secure Payments)
  Widget _buildTrustBadges() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildBadgeItem(Icons.verified_outlined, 'Genuine Products'),
        _buildBadgeItem(Icons.sync_alt, 'Contactless Delivery'),
        _buildBadgeItem(Icons.shield_outlined, 'Secure Payments'),
      ],
    );
  }

  Widget _buildBadgeItem(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: AppColors.iconGrey, size: 24),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(fontSize: 10, color: AppColors.iconGrey),
        ),
      ],
    );
  }

  // Terms of Use Text
  Widget _buildTermsText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: RichText(
        text: const TextSpan(
          style: TextStyle(
            fontSize: 11,
            color: AppColors.textDark,
            height: 1.5,
          ),
          children: [
            TextSpan(text: "By placing the order, you agree to Myntra's "),
            TextSpan(
              text: 'Terms of Use',
              style: TextStyle(
                color: AppColors.bagPrimaryPink,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(text: ' and '),
            TextSpan(
              text: 'Privacy Policy',
              style: TextStyle(
                color: AppColors.bagPrimaryPink,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Bottom Warning + Place Order Button
  Widget _buildBottomBar() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (!isItemSelected)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: AppColors.bagWarningPinkBg,
            child: const Text(
              'No item selected, select at least one item to place order.',
              style: TextStyle(fontSize: 11, color: AppColors.textDark),
            ),
          ),
        Container(
          color: AppColors.white,
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          child: SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.bagPrimaryPink,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Place Order',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
