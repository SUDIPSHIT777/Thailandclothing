import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:thailand_clothing/Globalwidget/profileappbar.dart';
import 'package:thailand_clothing/core/router/approute.dart';
import 'package:thailand_clothing/core/utils/appcolor.dart';

class ReturnReasonScreen extends StatelessWidget {
  const ReturnReasonScreen({super.key});

  static const List<String> _reasons = [
    'Size or fit issue',
    'Damaged / defective',
    'Different from description',
    'Wrong item received',
    'No longer needed',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: "Return Request",
        subtitle: "Select return reason",
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Header Section
              _buildHeader(),
              const SizedBox(height: 20),

              // 2. Reason Option Cards
              ..._reasons.map(
                (reason) => Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: _buildReasonCard(reason),
                ),
              ),
              const SizedBox(height: 20),

              // 3. Add Photos Section
              const Text(
                'Add photos (optional)',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 12),
              _buildAddPhotoBox(),
              const SizedBox(height: 24),

              // 4. Pickup Address Section
              _buildPickupAddress(),
              const SizedBox(height: 36),

              // 5. Submit Button
              _buildSubmitButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Text(
            "WE'RE HERE TO HELP",
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryPurple,
              letterSpacing: 0.6,
            ),
          ),
        ),
        const SizedBox(height: 4),
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
            const SizedBox(width: 11),
            const Expanded(
              child: Text(
                'Why are you returning this item?',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textDark,
                  letterSpacing: -0.3,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildReasonCard(String title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.ordersCardBorder, width: 1.2),
      ),
      child: Row(
        children: [
          Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.primaryPurple, width: 1.5),
            ),
          ),
          const SizedBox(width: 18),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 14.5,
                fontWeight: FontWeight.w700,
                color: AppColors.textDark,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddPhotoBox() {
    return Container(
      width: 112,
      height: 112,
      decoration: BoxDecoration(
        color: AppColors.ordersSearchBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.ordersCardBorder, width: 1.2),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.add, size: 32, color: AppColors.primaryPurple),
          SizedBox(height: 10),
          Text(
            'Add photo',
            style: TextStyle(
              fontSize: 12.5,
              fontWeight: FontWeight.w400,
              color: AppColors.greyText,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPickupAddress() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Pickup address',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: AppColors.textDark,
          ),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Text(
              '24 Green Avenue, Kolkata',
              style: TextStyle(
                fontSize: 13.5,
                fontWeight: FontWeight.w400,
                color: AppColors.greyText,
              ),
            ),
            SizedBox(width: 12),
            Text(
              'Change',
              style: TextStyle(
                fontSize: 13.5,
                fontWeight: FontWeight.w400,
                color: AppColors.greyText,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
        onPressed: () {
          context.push(AppRouter.returnprogressScreen);
        },
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
            'Submit Return Request',
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
