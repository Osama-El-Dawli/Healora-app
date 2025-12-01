import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/theme/app_colors.dart';

class DateItem extends StatelessWidget {
  const DateItem({
    super.key,
    this.isSelected = false,
    required this.dayName,
    required this.dayNumber,
  });
  final bool isSelected;
  final String dayName;
  final String dayNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.w,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary : AppColors.lightGray,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Center(
        child: Column(
          children: [
            Text(
              dayName,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: isSelected ? Colors.white : AppColors.primary,
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              dayNumber,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: isSelected ? Colors.white : AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
