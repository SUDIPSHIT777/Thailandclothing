import 'package:flutter/material.dart';
import 'package:thailand_clothing/Globalwidget/profileappbar.dart';
import 'package:thailand_clothing/core/utils/appcolor.dart';

class RateReviewScreen extends StatelessWidget {
  const RateReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: "Write a Review",
        subtitle: 'Aster Linen Co-ord',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Top "SHARE YOUR STYLE" Label
              const Text(
                'SHARE YOUR STYLE',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryPurple,
                  letterSpacing: 0.6,
                ),
              ),
              const SizedBox(height: 4),

              // 2. Centered Product Thumbnail & Star Rating Section
              Center(
                child: Column(
                  children: [
                    // Product Network Image Box
                    ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Image.network(
                        'https://images.unsplash.com/photo-1584917865442-de89df76afd3?w=400',
                        width: 104,
                        height: 116,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Container(
                            width: 104,
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
                            width: 104,
                            height: 116,
                            color: AppColors.lightPurpleBg,
                            child: const Center(
                              child: Icon(
                                Icons.auto_awesome,
                                color: AppColors.primaryPurple,
                                size: 36,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 60),
                    const Text(
                      'How was your purchase?',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: AppColors.textDark,
                        letterSpacing: -0.4,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // 5 Star Icons Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Icon(
                            Icons.star_border_rounded,
                            size: 36,
                            color: AppColors.primaryPurple,
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              // "Tap a star to rate" Subtext
              const Padding(
                padding: EdgeInsets.only(left: 56.0),
                child: Text(
                  'Tap a star to rate',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.greyText,
                  ),
                ),
              ),
              const SizedBox(height: 44),

              // 3. "Your review" Input Section
              const Text(
                'Your review',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 14),
              _buildReviewTextField(),
              const SizedBox(height: 36),

              // 4. "Add photos (optional)" Section
              const Text(
                'Add photos (optional)',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 12),
              _buildAddPhotoBox(),
              const SizedBox(height: 16),

              // 5. Submit Review Button
              _buildSubmitReviewButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReviewTextField() {
    return Container(
      height: 136,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.ordersSearchBg,
        borderRadius: BorderRadius.circular(18),
      ),
      child: const TextField(
        maxLines: 5,
        style: TextStyle(fontSize: 14, color: AppColors.textDark),
        decoration: InputDecoration(
          hintText: 'What did you love? How was the fit,\n\nquality and overall experience?',
          hintStyle: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: AppColors.greyText,
            height: 1.3,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildAddPhotoBox() {
    return Container(
      width: 84,
      height: 76,
      decoration: BoxDecoration(
        color: AppColors.lightPurpleBg,
        borderRadius: BorderRadius.circular(14),
      ),
      child: const Center(
        child: Text(
          '+ Add',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryPurple,
          ),
        ),
      ),
    );
  }

  Widget _buildSubmitReviewButton() {
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
          alignment: Alignment.center,
          child: Text(
            'Submit Review',
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
