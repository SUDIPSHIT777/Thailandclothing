import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:thailand_clothing/Globalwidget/profileappbar.dart';
import 'package:thailand_clothing/core/router/approute.dart';
import 'package:thailand_clothing/core/utils/appcolor.dart';

class ReturnExchangeScreen extends StatefulWidget {
  const ReturnExchangeScreen({super.key});

  @override
  State<ReturnExchangeScreen> createState() => _ReturnExchangeScreenState();
}

class _ReturnExchangeScreenState extends State<ReturnExchangeScreen> {
  int _selectedOption = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: buildAppBar(
        context,
        title: "Return / Exchange",
        subtitle: "Delivered • ORD-2042",
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Top "EASY SHOPPING" Label with Left Accent Bar
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 5,
                    height: 28,
                    decoration: BoxDecoration(
                      color: AppColors.ordersAccentBar,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'EASY SHOPPING',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryPurple,
                      letterSpacing: 0.6,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // 2. Product Card with Left Accent Bar & Network Image
              _buildProductCard(),
              const SizedBox(height: 32),

              // 3. "What would you like to do?" Heading
              const Text(
                'What would you like to do?',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDark,
                  letterSpacing: -0.3,
                ),
              ),
              const SizedBox(height: 16),

              // 4. Option 1: Return for a refund
              _buildActionOptionCard(
                index: 0,
                icon: Icons.replay,
                title: 'Return for a refund',
                subtitle: 'Send item back for a refund',
              ),
              const SizedBox(height: 20),

              // 5. Option 2: Exchange item
              _buildActionOptionCard(
                index: 1,
                icon: Icons.swap_horiz,
                title: 'Exchange item',
                subtitle: 'Choose a different size or colour',
              ),
              const SizedBox(height: 12),

              // 6. Return Window Note
              const Text(
                'Return window closes 23 Oct 2026',
                style: TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w400,
                  color: AppColors.greyText,
                ),
              ),
              const SizedBox(height: 36),

              // 7. Centered Continue Button
              _buildContinueButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductCard() {
    return Container(
      padding: const EdgeInsets.only(left: 0, right: 20, top: 20, bottom: 20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.ordersCardBorder, width: 1.2),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 14),

          // Product Network Image (with Beige fallback background)
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              'https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?w=400',
              width: 96,
              height: 116,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  width: 96,
                  height: 116,
                  color: AppColors.ordersBeigeBg,
                  child: const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: AppColors.primaryPurple,
                    ),
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 96,
                  height: 116,
                  color: AppColors.ordersBeigeBg,
                  child: const Center(
                    child: Icon(
                      Icons.diamond,
                      color: AppColors.primaryPurple,
                      size: 32,
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(width: 20),

          // Right Product Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 2),
                const Text(
                  'Aster Linen Co-ord',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Beige • M • Qty 1',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: AppColors.greyText,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  '₹3,299',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 14),
                // Delivered Status Pill
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.ordersDeliveredBg,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Delivered',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.ordersDeliveredText,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionOptionCard({
    required int index,
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    final bool isSelected = _selectedOption == index;

    return InkWell(
      onTap: () {
        setState(() {
          _selectedOption = index;
        });
        context.push(AppRouter.refunddetailsScreen);
      },
      borderRadius: BorderRadius.circular(18),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 26),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.lightPurpleBg : AppColors.white,
          borderRadius: BorderRadius.circular(18),
          border: isSelected
              ? null
              : Border.all(color: AppColors.ordersCardBorder, width: 1.2),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, size: 30, color: AppColors.primaryPurple),
            const SizedBox(width: 24),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textDark,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: AppColors.greyText,
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

  Widget _buildContinueButton() {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
        onPressed: () {
          context.push(AppRouter.returnreasonScreen);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryPurple,
          foregroundColor: AppColors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Continue',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppColors.white,
              ),
            ),
            SizedBox(width: 8),
            Icon(Icons.arrow_forward, size: 18, color: AppColors.white),
          ],
        ),
      ),
    );
  }
}
