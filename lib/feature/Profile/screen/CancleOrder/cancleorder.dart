import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:thailand_clothing/Globalwidget/profileappbar.dart';
import 'package:thailand_clothing/core/router/approute.dart';
import 'package:thailand_clothing/core/utils/appcolor.dart';

class CancelOrderScreen extends StatefulWidget {
  const CancelOrderScreen({super.key});

  @override
  State<CancelOrderScreen> createState() => _CancelOrderScreenState();
}

class _CancelOrderScreenState extends State<CancelOrderScreen> {
  int? _selectedReasonIndex;
  final TextEditingController _commentsController = TextEditingController();

  final List<String> _reasons = [
    'Ordered by mistake',
    'Changed my mind',
    'Found a better price',
    'Delivery taking too long',
    'Other reason',
  ];

  @override
  void dispose() {
    _commentsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: buildAppBar(context, title: "Cancel Order", subtitle: "ORD-2048"),
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
                    'STYLE IN MOTION',
                    style: TextStyle(
                      color: AppColors.primaryPurple,
                      fontSize: 11.5,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.4,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              _buildCancelBanner(),
              const SizedBox(height: 20),

              // 3. "Select a reason" Section Title
              const Text(
                'Select a reason',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDark,
                  letterSpacing: -0.3,
                ),
              ),
              const SizedBox(height: 20),

              // 4. Reason Radio Option Cards
              ...List.generate(_reasons.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: _buildReasonOptionCard(
                    index: index,
                    title: _reasons[index],
                    isSelected: _selectedReasonIndex == index,
                  ),
                );
              }),
              const SizedBox(height: 24),

              // 5. Additional Comments (optional) Section
              const Text(
                'Additional comments (optional)',
                style: TextStyle(
                  fontSize: 13.5,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 12),
              _buildCommentsField(),
              const SizedBox(height: 24),
              _buildContinueButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCancelBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 0, right: 20, top: 20, bottom: 24),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Before you cancel',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textDark,
                    letterSpacing: -0.3,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'Cancellation is available before dispatch.',
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

  Widget _buildReasonOptionCard({
    required int index,
    required String title,
    required bool isSelected,
  }) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedReasonIndex = index;
        });
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? AppColors.primaryPurple
                : AppColors.ordersCardBorder,
            width: 1.2,
          ),
        ),
        child: Row(
          children: [
            // Custom Radio Circle Indicator
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.primaryPurple, width: 1.5),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 9,
                        height: 9,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primaryPurple,
                        ),
                      ),
                    )
                  : null,
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
      ),
    );
  }

  Widget _buildCommentsField() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.ordersSearchBg,
        borderRadius: BorderRadius.circular(14),
      ),
      child: TextField(
        controller: _commentsController,
        style: const TextStyle(fontSize: 14, color: AppColors.textDark),
        decoration: const InputDecoration(
          hintText: 'Tell us more...',
          hintStyle: TextStyle(
            fontSize: 13.5,
            fontWeight: FontWeight.w400,
            color: AppColors.greyText,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 18, vertical: 16),
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
          context.push(AppRouter.confirmcancelOrderScreen);
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
        child: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Continue Cancellation',
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
