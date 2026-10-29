import 'package:flutter/material.dart';
import 'package:thailand_clothing/Globalwidget/profileappbar.dart';
import 'package:thailand_clothing/core/utils/appcolor.dart';

class TrackOrderScreen extends StatelessWidget {
  const TrackOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: buildAppBar(context, title: "Track Order", subtitle: "ORD-2048"),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left vertical purple accent bar on the edge
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
                    'FOLLOW THE JOURNEY',
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

              // 2. Cream Banner Card with Accent Bar
              _buildStatusBanner(),
              const SizedBox(height: 36),

              // 3. Shipment Progress Section Title
              const Text(
                'Shipment progress',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDark,
                  letterSpacing: -0.3,
                ),
              ),
              const SizedBox(height: 24),

              // 4. Vertical Timeline Stepper
              _buildTimelineItem(
                title: 'Order confirmed',
                subtitle: '11 Oct, 10:32 AM',
                isCompleted: true,
                isLineActive: true,
                isLast: false,
              ),
              _buildTimelineItem(
                title: 'Packed and ready',
                subtitle: '12 Oct, 09:15 AM',
                isCompleted: true,
                isLineActive: true,
                isLast: false,
              ),
              _buildTimelineItem(
                title: 'Shipped',
                subtitle: '13 Oct, 08:40 AM',
                isCompleted: true,
                isLineActive: false,
                isLast: false,
              ),
              _buildTimelineItem(
                title: 'Out for delivery',
                subtitle: 'Pending',
                isCompleted: false,
                isLineActive: false,
                isLast: false,
              ),
              _buildTimelineItem(
                title: 'Delivered',
                subtitle: 'Pending',
                isCompleted: false,
                isLineActive: false,
                isLast: true,
              ),

              const SizedBox(height: 48),

              // 5. Contact Delivery Support Button
              _buildSupportButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 10, right: 20, top: 20, bottom: 24),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Your order is on its way!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textDark,
                    letterSpacing: -0.4,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'Estimated delivery • 16 Oct 2026',
                  style: TextStyle(
                    fontSize: 13.5,
                    fontWeight: FontWeight.w400,
                    color: AppColors.greyText,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineItem({
    required String title,
    required String subtitle,
    required bool isCompleted,
    required bool isLineActive,
    required bool isLast,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left Indicator & Connecting Line Column
        SizedBox(
          width: 44,
          child: Column(
            children: [
              // Circle Indicator (Completed vs Pending)
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isCompleted
                      ? AppColors.primaryPurple
                      : AppColors.white,
                  border: isCompleted
                      ? null
                      : Border.all(
                          color: AppColors.ordersCardBorder,
                          width: 1.4,
                        ),
                ),
                child: isCompleted
                    ? const Center(
                        child: Icon(
                          Icons.check,
                          size: 14,
                          color: AppColors.white,
                        ),
                      )
                    : null,
              ),
              // Vertical Line between steps
              if (!isLast)
                Container(
                  width: 1.5,
                  height: 48,
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  color: isLineActive
                      ? AppColors.primaryPurple
                      : AppColors.ordersCardBorder,
                ),
            ],
          ),
        ),
        const SizedBox(width: 8),

        // Right Step Text Details
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 2.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: isCompleted
                        ? AppColors.textDark
                        : AppColors.greyText,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w400,
                    color: AppColors.greyText,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSupportButton() {
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
            'Contact Delivery Support',
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
}
