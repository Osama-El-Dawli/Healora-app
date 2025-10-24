import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/theme/app_colors.dart';

class TimeItem extends StatelessWidget {
  final String text;
  final bool isSelected;
  const TimeItem({super.key, required this.text, this.isSelected = false});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary : AppColors.lightGray,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Center(
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: isSelected ? Colors.white : AppColors.primary,
          ),
        ),
      ),
    );
  }
}
