import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:thailand_clothing/core/utils/appcolor.dart';

class SelectDeliveryAddressScreen extends StatefulWidget {
  const SelectDeliveryAddressScreen({super.key});

  @override
  State<SelectDeliveryAddressScreen> createState() =>
      _SelectDeliveryAddressScreenState();
}

class _SelectDeliveryAddressScreenState
    extends State<SelectDeliveryAddressScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        surfaceTintColor: const Color(0xFFFFFFFF),
        elevation: 0,
        leadingWidth: 48,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.darkText,
            size: 26,
          ),
          onPressed: () {
            context.pop();
          },
        ),
        title: const Text(
          'Select Delivery Address',
          style: TextStyle(
            color: AppColors.darkText,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Important Info Banner
            Container(
              width: double.infinity,
              color: AppColors.warningBg,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 2),
                    child: Icon(
                      Icons.error_outline,
                      color: AppColors.warningText,
                      size: 16,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          color: AppColors.warningText,
                          fontSize: 13.5,
                          height: 1.35,
                        ),
                        children: [
                          TextSpan(
                            text: 'Important: ',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          TextSpan(
                            text: 'Use your current location or manually search on the map to guide delivery partners,',
                            style: TextStyle(fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Main Content Padding
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 2. Search Box
                  Container(
                    height: 46,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.borderGrey, width: 1),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 14),
                        const Icon(
                          Icons.search,
                          color: AppColors.darkText,
                          size: 22,
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: TextField(
                            controller: _searchController,
                            style: const TextStyle(
                              color: AppColors.darkText,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _searchController.clear();
                            setState(() {});
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 12),
                            width: 18,
                            height: 18,
                            decoration: const BoxDecoration(
                              color: AppColors.clearBtnGrey,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.close,
                              color: AppColors.white,
                              size: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // 3. Use my current Location Button
                  InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: AppColors.locationRed,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Icon(
                            Icons.my_location,
                            color: AppColors.white,
                            size: 13,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Use my current Location',
                          style: TextStyle(
                            color: AppColors.locationRed,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 14),
                  const Divider(
                    color: AppColors.dividerGrey,
                    thickness: 1,
                    height: 1,
                  ),
                  const SizedBox(height: 18),

                  // 4. Autocomplete / Search Suggestions List
                  _buildSearchResultItem(
                    title: 'Rxter, ',
                    regularEndText: '7214',
                    subtitle: 'Nearby Spencer Road, 142, Yun Road, Dumdum',
                  ),
                  const SizedBox(height: 20),
                  _buildSearchResultItem(
                    title: 'Rxter, rajendra',
                    subtitle: 'Nearby Spencer Road, 142, Yun Road, Dumdum',
                  ),

                  const SizedBox(height: 36),

                  // 5. Select Save Address Section
                  const Text(
                    'Select Save Address',
                    style: TextStyle(
                      color: AppColors.darkText,
                      fontSize: 13.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // 6. Saved Address Card
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: AppColors.borderGrey, width: 1),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on_outlined,
                                    color: AppColors.iconGrey,
                                    size: 16,
                                  ),
                                  const SizedBox(width: 4),
                                  const Text(
                                    'Sagar Das, 721134',
                                    style: TextStyle(
                                      color: AppColors.darkText,
                                      fontSize: 13.5,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 3,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.tagBg,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Text(
                                      'OFFICE',
                                      style: TextStyle(
                                        color: AppColors.tagText,
                                        fontSize: 9,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 0.3,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              const Padding(
                                padding: EdgeInsets.only(left: 14),
                                child: Text(
                                  'Nearby Spencer Road, 142, Yun Road, Dumdum',
                                  style: TextStyle(
                                    color: AppColors.subtitleGrey,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Icon(
                          Icons.check_circle_outline,
                          color: AppColors.iconGrey,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Helper widget for building the search suggestion rows
  Widget _buildSearchResultItem({
    required String title,
    String? regularEndText,
    required String subtitle,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: AppColors.iconGrey,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          color: AppColors.darkText,
                          fontSize: 13.5,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(text: title),
                          if (regularEndText != null)
                            TextSpan(
                              text: regularEndText,
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.only(left: 14),
                  child: Text(
                    subtitle,
                    style: const TextStyle(
                      color: AppColors.subtitleGrey,
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Top-left diagonal arrow matching the screenshot
          Transform.rotate(
            angle: -0.785398, // -45 degrees in radians
            child: const Icon(
              Icons.arrow_back,
              color: AppColors.subtitleGrey,
              size: 18,
            ),
          ),
        ],
      ),
    );
  }
}
