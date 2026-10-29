import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:thailand_clothing/core/utils/appcolor.dart';
import 'package:thailand_clothing/feature/Profile/screen/Myorders/myordersScreen.dart';

PreferredSizeWidget buildAppBar(
  BuildContext context, {
  required String title,
  required String subtitle,
}) {
  return AppBar(
    backgroundColor: AppColors.lightPurpleBg,
    foregroundColor: AppColors.textDark,
    surfaceTintColor: Colors.transparent,
    elevation: 0,
    scrolledUnderElevation: 0,
    toolbarHeight: 80,
    centerTitle: false,
    automaticallyImplyLeading: false,

    flexibleSpace: const Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.only(right: 16),
        child: SizedBox(
          width: 65,
          height: 65,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.ordersHeaderCircle,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    ),

    leading: IconButton(
      onPressed: () => context.pop(),
      icon: const Icon(
        Icons.arrow_back_ios_new,
        size: 20,
        color: AppColors.textDark,
      ),
    ),

    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: AppColors.textDark,
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: const TextStyle(
            color: AppColors.greyText,
            fontSize: 11,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    ),

    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: AppColors.ordersHeaderBorder, width: 1),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'THAIKART',
                  style: TextStyle(
                    color: AppColors.primaryPurple,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.4,
                  ),
                ),
                SizedBox(width: 5),
                CustomStarIcon(size: 11, color: AppColors.primaryPurple),
              ],
            ),
          ),
        ),
      ),
    ],

    shape: const Border(
      bottom: BorderSide(color: AppColors.ordersHeaderBorder, width: 1),
    ),
  );
}
