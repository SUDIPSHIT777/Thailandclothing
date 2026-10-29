import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:thailand_clothing/Globalwidget/profileappbar.dart';
import 'package:thailand_clothing/core/router/approute.dart';
import 'package:thailand_clothing/core/utils/appcolor.dart';

class ConfirmCancelOrderScreen extends StatelessWidget {
  const ConfirmCancelOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: "Confirm Cancellation",
        subtitle: "ORD-2048",
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
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

              const SizedBox(height: 24),

              // Alert Icon in soft circle
              Center(
                child: Container(
                  width: 140,
                  height: 140,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFDF0F1),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.error_outline_outlined,
                      size: 60,
                      color: Color(0xFFD34F68),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 36),

              // Title and Subtitle
              const Center(
                child: Text(
                  'Cancel this order?',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E1E2C),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  'This action cannot be undone.',
                  style: TextStyle(fontSize: 13, color: Color(0xFF8C8CA1)),
                ),
              ),
              const SizedBox(height: 40),

              // Refund Summary Card
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFF8F8FC),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Refund summary',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1E1E2C),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Refund amount',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Color(0xFF8C8CA1),
                                ),
                              ),
                              Text(
                                '₹2,499',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1E1E2C),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      height: 1,
                      thickness: 1,
                      color: Color(0xFFEBEBF5),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      child: Text(
                        'Refund to original payment in 5–7 business days.',
                        style: TextStyle(
                          fontSize: 11,
                          color: Color(0xFF8C8CA1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // Primary Action: Cancel Order
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () {
                    context.push(AppRouter.finalordercancel);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD65369),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    'Yes, Cancel Order',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 14),

              // Secondary Action: Keep Order
              SizedBox(
                width: double.infinity,
                height: 52,
                child: TextButton(
                  onPressed: () {
                    context.go(AppRouter.bottomnavbar);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFFF1EBF9),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    'Keep My Order',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF7A58AA),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
