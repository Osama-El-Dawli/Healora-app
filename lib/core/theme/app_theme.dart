import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healora/core/theme/app_colors.dart';

class AppTheme {
  static ThemeData lightMode = ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundColor,

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(AppColors.backgroundColor),
        backgroundColor: WidgetStateProperty.all(AppColors.primary),
        minimumSize: WidgetStateProperty.all(const Size(double.infinity, 48)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        textStyle: WidgetStateProperty.all(
          GoogleFonts.raleway(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    ),

    dropdownMenuTheme: DropdownMenuThemeData(
      textStyle: TextStyle(
        color: AppColors.primary, // selected item text
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.backgroundColor,
        labelStyle: TextStyle(
          color: AppColors.hintColor,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
        hintStyle: TextStyle(
          color: AppColors.hintColor,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: AppColors.hintColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: AppColors.primary, width: 1.5.w),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      suffixIconColor: AppColors.hintColor,
      filled: true,
      fillColor: AppColors.backgroundColor,
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      hintStyle: TextStyle(
        color: AppColors.hintColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: AppColors.borderColor, width: 1.w),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: AppColors.borderColor, width: 1.w),
      ),

      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: AppColors.borderColor, width: 1.w),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: AppColors.primary, width: 1.5.w),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: AppColors.red, width: 1.5.w),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: AppColors.red, width: 2.w),
      ),

      labelStyle: TextStyle(color: AppColors.primary),
      helperStyle: TextStyle(color: AppColors.borderColor),
      errorStyle: TextStyle(color: AppColors.red, fontSize: 12.sp),
    ),
    textTheme: TextTheme(
      displaySmall: TextStyle(
        fontSize: 32.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.primary,
      ),
      titleLarge: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.primary,
      ),
      titleMedium: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.primary,
      ),
      titleSmall: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.borderColor,
      ),
      labelLarge: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.secondary,
      ),
      labelSmall: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.black,
      ),
    ),
    fontFamily: GoogleFonts.raleway().fontFamily,
  );
  static ThemeData darkMode = ThemeData(
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.backgroundColor,
      ),
      titleMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.backgroundColor,
      ),
      titleSmall: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.backgroundColor,
      ),
      labelLarge: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.black,
      ),
      labelSmall: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.gray,
      ),
      displaySmall: TextStyle(
        fontSize: 36.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.backgroundColor,
      ),
    ),
  );
}
