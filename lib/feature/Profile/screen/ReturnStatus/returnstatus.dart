import 'package:flutter/material.dart';
import 'package:thailand_clothing/Globalwidget/profileappbar.dart';
import 'package:thailand_clothing/core/utils/appcolor.dart';

class ReturnProgressScreen extends StatelessWidget {
  const ReturnProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: "Return Status",
        subtitle: "Return #RET-1048",
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
                    'YOUR RETURN JOURNEY',
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

              // 2. Green "Return requested" Banner Card
              _buildReturnBanner(),
              const SizedBox(height: 28),

              // 3. "Return progress" Section Title
              const Text(
                'Return progress',
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
                title: 'Request submitted',
                subtitle: '13 Oct, 11:22 AM',
                isCompleted: true,
                isLineActive: true,
                isLast: false,
              ),
              _buildTimelineItem(
                title: 'Pickup scheduled',
                subtitle: '16 Oct, 10 AM – 6 PM',
                isCompleted: true,
                isLineActive: false,
                isLast: false,
              ),
              _buildTimelineItem(
                title: 'Item picked up',
                subtitle: 'Pending',
                isCompleted: false,
                isLineActive: false,
                isLast: false,
              ),
              _buildTimelineItem(
                title: 'Quality check',
                subtitle: 'Pending',
                isCompleted: false,
                isLineActive: false,
                isLast: false,
              ),
              _buildTimelineItem(
                title: 'Refund initiated',
                subtitle: 'Pending',
                isCompleted: false,
                isLineActive: false,
                isLast: true,
              ),

              const SizedBox(height: 52),

              // 5. Contact Support Button
              _buildContactSupportButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReturnBanner() {
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
                        'Return requested',
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
                  'Pickup expected 16 October 2026',
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
        SizedBox(
          width: 44,
          child: Column(
            children: [
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

  Widget _buildContactSupportButton() {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryPurple,
          foregroundColor: AppColors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: const Center(
          child: Text(
            'Contact Support',
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
