import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:thailand_clothing/Globalwidget/profileappbar.dart';
import 'package:thailand_clothing/core/router/approute.dart';
import 'package:thailand_clothing/core/utils/appcolor.dart';

class Orderdetails extends StatelessWidget {
  const Orderdetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: buildAppBar(
        context,
        title: "Order Details",
        subtitle: "ORD-2048  •  11 Oct 2026",
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Top "Order at a glance" Header Section
              _buildTopGlanceHeader(),
              const SizedBox(height: 16),

              // 2. Product Card with Network Image
              _buildProductCard(),
              const SizedBox(height: 32),

              // 3. Delivery Address Section
              const Text(
                'Delivery address',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDark,
                  letterSpacing: -0.3,
                ),
              ),
              const SizedBox(height: 14),
              _buildAddressCard(),
              const SizedBox(height: 32),

              // 4. Payment Summary Section
              const Text(
                'Payment summary',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDark,
                  letterSpacing: -0.3,
                ),
              ),
              const SizedBox(height: 12),
              _buildPaymentSummary(),
              const SizedBox(height: 28),
              _buildTrackOrderButton(context),
              const SizedBox(height: 16),
              buildOrderActionButtons(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopGlanceHeader() {
    return Column(
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
              'ORDER AT A GLANCE',
              style: TextStyle(
                color: AppColors.primaryPurple,
                fontSize: 11.5,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.4,
              ),
            ),
          ],
        ),

        const SizedBox(height: 8),

        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(left: 0, top: 10, bottom: 10),
          decoration: BoxDecoration(
            color: AppColors.ordersSearchBg,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              const SizedBox(width: 12),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: AppColors.lightPurpleBg,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Text(
                  'In transit',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryPurple,
                  ),
                ),
              ),

              const SizedBox(width: 12),

              const Expanded(
                child: Text(
                  'Expected 16 Oct',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryPurple,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
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
          // Left Product Network Image
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              'https://images.unsplash.com/photo-1584917865442-de89df76afd3?w=400',
              width: 96,
              height: 116,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  width: 96,
                  height: 116,
                  color: AppColors.lightPurpleBg,
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
                  color: AppColors.lightPurpleBg,
                  child: const Icon(
                    Icons.auto_awesome,
                    color: AppColors.primaryPurple,
                    size: 32,
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
                  'Luna Classic Handbag',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Lilac • One size • Qty 1',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: AppColors.greyText,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  '₹2,499',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 14),
                // Status Pill
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.lightPurpleBg,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'In transit',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryPurple,
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

  Widget _buildAddressCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
      decoration: BoxDecoration(
        color: AppColors.ordersSearchBg,
        borderRadius: BorderRadius.circular(18),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Shravan Kumar',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: AppColors.textDark,
            ),
          ),
          SizedBox(height: 10),
          Text(
            '24 Green Avenue, Park Street',
            style: TextStyle(
              fontSize: 13.5,
              color: AppColors.greyText,
              height: 1.4,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'Kolkata, West Bengal 700016',
            style: TextStyle(
              fontSize: 13.5,
              color: AppColors.greyText,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentSummary() {
    return Column(
      children: [
        _buildPaymentRow('Subtotal', '₹2,499'),
        const Divider(
          color: AppColors.ordersCardBorder,
          height: 1,
          thickness: 0.9,
        ),
        _buildPaymentRow('Delivery', 'FREE'),
        const Divider(
          color: AppColors.ordersCardBorder,
          height: 1,
          thickness: 0.9,
        ),
        _buildPaymentRow('Total paid', '₹2,499'),
        const Divider(
          color: AppColors.ordersCardBorder,
          height: 1,
          thickness: 0.9,
        ),
      ],
    );
  }

  Widget _buildPaymentRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 2.0),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.greyText,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: AppColors.textDark,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTrackOrderButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
        onPressed: () {
          context.push(AppRouter.trackOrderScreen);
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
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Track Order',
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

Widget buildOrderActionButtons(BuildContext context) {
  return Column(
    children: [
      // Cancel Order Button
      SizedBox(
        width: double.infinity,
        height: 50,
        child: OutlinedButton(
          onPressed: () {
            context.push(AppRouter.cancelorderScreen);
          },
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.red,
            side: const BorderSide(color: Colors.red),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          child: const Text(
            'Cancel Order',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ),
      ),

      const SizedBox(height: 12),

      // Help Button
      SizedBox(
        width: double.infinity,
        height: 50,
        child: OutlinedButton(
          onPressed: () {
            // Help action
          },
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.primaryPurple,
            side: const BorderSide(color: AppColors.primaryPurple),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          child: const Text(
            'Help',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ),
      ),

      const SizedBox(height: 12),

      // Return & Exchange Button
      SizedBox(
        width: double.infinity,
        height: 50,
        child: OutlinedButton(
          onPressed: () {
            context.push(AppRouter.returnexchangeScreen);
          },
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.primaryPurple,
            side: const BorderSide(color: AppColors.primaryPurple),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          child: const Text(
            'Return & Exchange',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    ],
  );
}
