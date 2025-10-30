import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/theme/app_colors.dart';

class LanguageSwitchRow extends StatelessWidget {
  final String currentLang;
  final Function(String) onSelect;

  const LanguageSwitchRow({
    super.key,
    required this.currentLang,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark
        ? AppColors.darkBackground
        : AppColors.backgroundColor;

    return Container(
      padding: EdgeInsets.all(5),
      width: 110.w,
      height: 50.h,
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkBackground : AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(40.r),
        border: Border.all(color: AppColors.primary, width: 3.w),
      ),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => onSelect("en"),
              child: Container(
                width: 35.w,
                height: 35.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: currentLang == "en"
                        ? AppColors.primary
                        : backgroundColor,
                    width: 3.w,
                  ),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/LR.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => onSelect("ar"),
              child: Container(
                width: 35.w,
                height: 35.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: currentLang == "ar"
                        ? AppColors.primary
                        : backgroundColor,
                    width: 3.w,
                  ),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/EG.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
