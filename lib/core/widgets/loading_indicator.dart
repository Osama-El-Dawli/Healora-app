import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/theme/app_colors.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 150.h,
        width: 150.w,
        decoration: BoxDecoration(
          color: AppColors.suffixIconColor.withValues(alpha: 0.8),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: const Center(
          child: CircularProgressIndicator(color: AppColors.backgroundColor),
        ),
      ),
    );
  }
}
