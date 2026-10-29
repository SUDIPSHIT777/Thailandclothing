import 'package:flutter/material.dart';
import 'package:thailand_clothing/Globalwidget/profileappbar.dart';
import 'package:thailand_clothing/core/utils/appcolor.dart';

class FinalOrderCancelledScreen extends StatelessWidget {
  const FinalOrderCancelledScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: buildAppBar(
        context,
        title: "Order Cancelled",
        subtitle: "Refund processing",
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Top "ALL TAKEN CARE OF" Header with Accent Bar
              _buildTopHeader(),
              const SizedBox(height: 8),

              // 2. Centered Checkmark Circle & Cancelled Message
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 148,
                      height: 148,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.lightPurpleBg,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.check,
                          size: 64,
                          color: AppColors.primaryPurple,
                        ),
                      ),
                    ),
                    const SizedBox(height: 36),
                    const Text(
                      'Order cancelled',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                        color: AppColors.textDark,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 14),
                    const Text(
                      "Sorry this one didn't work out.",
                      style: TextStyle(
                        fontSize: 13.5,
                        fontWeight: FontWeight.w400,
                        color: AppColors.greyText,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),

              // 3. Order ID & Refund Summary Box
              _buildRefundSummaryCard(),
              const SizedBox(height: 60),

              // 4. Action Buttons
              _buildViewRefundButton(),
              const SizedBox(height: 12),
              _buildContinueShoppingButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopHeader() {
    return Row(
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
          'ALL TAKEN CARE OF',
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryPurple,
            letterSpacing: 0.6,
          ),
        ),
      ],
    );
  }

  Widget _buildRefundSummaryCard() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.ordersSearchBg,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSummaryRow('Order ID', 'ORD-2048'),
          const Divider(
            color: AppColors.ordersCardBorder,
            height: 1,
            thickness: 0.9,
          ),
          _buildSummaryRow('Refund', '₹2,499'),
          const Divider(
            color: AppColors.ordersCardBorder,
            height: 1,
            thickness: 0.9,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 18.0),
            child: Text(
              "We'll notify you as soon as it is refunded.",
              style: TextStyle(
                fontSize: 12.5,
                fontWeight: FontWeight.w400,
                color: AppColors.greyText,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 16.0),
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

  Widget _buildViewRefundButton() {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryPurple,
          foregroundColor: AppColors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'View Refund Status',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContinueShoppingButton() {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
        onPressed: () {},
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
            'Continue Shopping',
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
}
