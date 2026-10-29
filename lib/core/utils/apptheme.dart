import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thailand_clothing/core/utils/appcolor.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,

      scaffoldBackgroundColor: AppColors.scaffoldBg,

      fontFamily: GoogleFonts.poppins().fontFamily,

      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.appBarBg,
        surfaceTintColor: AppColors.surfaceTint,
        elevation: 0,
        scrolledUnderElevation: 0,
        foregroundColor: AppColors.darkText,
      ),

      colorScheme: const ColorScheme.light(
        surface: AppColors.white,
        primary: AppColors.maroon,
      ),
    );
  }
}
