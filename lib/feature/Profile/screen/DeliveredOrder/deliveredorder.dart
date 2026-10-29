import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:thailand_clothing/Globalwidget/profileappbar.dart';
import 'package:thailand_clothing/core/router/approute.dart';
import 'package:thailand_clothing/core/utils/appcolor.dart';

class DeliveredOrderScreen extends StatelessWidget {
  const DeliveredOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: buildAppBar(
        context,
        title: "Delivered Order",
        subtitle: "ORD-2042",
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 5,
                    height: 26,
                    decoration: BoxDecoration(
                      color: AppColors.ordersAccentBar,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'DELIVERED WITH LOVE',
                    style: TextStyle(
                      color: AppColors.primaryPurple,
                      fontSize: 11.5,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.4,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 4),

              // 2. Green Delivered Banner Card
              _buildDeliveredBanner(),
              const SizedBox(height: 24),

              // 3. Product Card with Network Image
              _buildProductCard(),
              const SizedBox(height: 32),

              // 4. "Enjoying your purchase?" Section
              const Text(
                'Enjoying your purchase?',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDark,
                  letterSpacing: -0.3,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Share your thoughts and help others shop.',
                style: TextStyle(
                  fontSize: 13.5,
                  fontWeight: FontWeight.w400,
                  color: AppColors.greyText,
                ),
              ),
              const SizedBox(height: 24),

              // 5. Rate & Review and Buy Again Buttons
              _buildRateReviewButton(context),
              const SizedBox(height: 12),
              _buildBuyAgainButton(context),
              const SizedBox(height: 44),

              // 6. Need Assistance Section
              const Text(
                'Need assistance?',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 10),
              _buildReturnExchangeLink(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDeliveredBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 0, right: 20, top: 20, bottom: 24),
      decoration: BoxDecoration(
        color: AppColors.ordersDeliveredBg,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Icon(
                      Icons.check,
                      size: 20,
                      color: AppColors.ordersDeliveredText,
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Delivered successfully',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w800,
                          color: AppColors.ordersDeliveredText,
                          letterSpacing: -0.3,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Text(
                  'Delivered on 09 October 2026',
                  style: TextStyle(
                    fontSize: 13.5,
                    fontWeight: FontWeight.w400,
                    color: AppColors.ordersDeliveredText,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.ordersCardBorder, width: 1.2),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left Product Network Image (with Beige fallback background)
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

  Widget _buildRateReviewButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
        onPressed: () {
          context.push(AppRouter.ratereviewScreen);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryPurple,
          foregroundColor: AppColors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Icon(Icons.star_border, size: 18, color: AppColors.white),
            SizedBox(width: 8),
            Text(
              'Rate & Review',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBuyAgainButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
        onPressed: () {
          context.go(AppRouter.bottomnavbar);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.lightPurpleBg,
          foregroundColor: AppColors.primaryPurple,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Buy Again',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryPurple,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildReturnExchangeLink(BuildContext contetx) {
    return InkWell(
      onTap: () {
        contetx.push(AppRouter.returnexchangeScreen);
      },
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              'Return or exchange',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryPurple,
              ),
            ),
            SizedBox(width: 6),
            Icon(Icons.arrow_forward, size: 16, color: AppColors.primaryPurple),
          ],
        ),
      ),
    );
  }
}
