import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widgets/app_setup/themes/app_colors.dart';

class AppTextTheme {
  static final bodyMedium = TextStyle(
    color: AppColors.greyColor,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    fontFamily: "Poppins",
  );
  static final titleMedium = TextStyle(
    color: AppColors.greyColor,
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    fontFamily: "Poppins",
  );

  final textTheme = TextTheme(
    titleLarge: TextStyle(
      fontSize: 20.sp,
      fontFamily: "Poppins",
      color: AppColors.textBlackColor,
      fontWeight: FontWeight.w700,
    ),
    titleMedium: TextStyle(
      fontSize: 14.sp,
      fontFamily: "Poppins",
      color: AppColors.textBlackColor,
      fontWeight: FontWeight.w700,
    ),
    titleSmall: TextStyle(
      fontSize: 12.sp,
      fontFamily: "Poppins",
      color: AppColors.textBlackColor,
      fontWeight: FontWeight.w700,
    ),
    headlineLarge: TextStyle(
      fontSize: 26.sp,
      fontFamily: "Poppins",
      color: AppColors.textBlackColor,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: TextStyle(
      fontSize: 20.sp,
      fontFamily: "Poppins",
      color: AppColors.textBlackColor,
      fontWeight: FontWeight.bold,
    ),
    headlineSmall: TextStyle(
      fontSize: 18.sp,
      fontFamily: "Poppins",
      color: AppColors.textBlackColor,
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: TextStyle(
      fontSize: 16.sp,
      fontFamily: "Poppins",
      color: AppColors.textBlackColor,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      fontSize: 14.sp,
      fontFamily: "Poppins",
      color: AppColors.textBlackColor,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      fontSize: 12.sp,
      fontFamily: "Poppins",
      color: AppColors.textBlackColor,
      fontWeight: FontWeight.w400,
    ),
    labelLarge: TextStyle(
      fontSize: 16.sp,
      fontFamily: "Poppins",
      color: AppColors.textBlackColor.withOpacity(0.8),
      fontWeight: FontWeight.w400,
    ),
    labelMedium: TextStyle(
      fontSize: 14.sp,
      fontFamily: "Poppins",
      color: AppColors.textBlackColor.withOpacity(0.8),
      fontWeight: FontWeight.w400,
    ),
    labelSmall: TextStyle(
      fontSize: 12.sp,
      fontFamily: "Poppins",
      color: AppColors.textBlackColor.withOpacity(0.8),
      fontWeight: FontWeight.w400,
    ),
  );
}
