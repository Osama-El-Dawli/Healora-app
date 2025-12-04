import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/theme/app_colors.dart';

class HeightCard extends StatelessWidget {
  final double height;
  final ValueChanged<double> onChanged;

  const HeightCard({super.key, required this.height, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'HEIGHT'.tr(),
              style: TextStyle(fontSize: 18.sp, color: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  height.toInt().toString(),
                  style: TextStyle(
                    fontSize: 50.sp,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'cm'.tr(),
                  style: TextStyle(fontSize: 18.sp, color: Colors.white),
                ),
              ],
            ),
            Slider(
              value: height,
              min: 120,
              max: 220,
              activeColor: AppColors.darkCard,
              inactiveColor: AppColors.gray,
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }
}
