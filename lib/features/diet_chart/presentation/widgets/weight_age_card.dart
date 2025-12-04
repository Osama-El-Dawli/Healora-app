import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/theme/app_colors.dart';

class WeightAgeCard extends StatelessWidget {
  final String label;
  final int value;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const WeightAgeCard({
    super.key,
    required this.label,
    required this.value,
    required this.onIncrement,
    required this.onDecrement,
  });

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
            SizedBox(height: 10.h),
            Text(
              label,
              style: TextStyle(fontSize: 18.sp, color: Colors.white),
            ),
            Text(
              '$value',
              style: TextStyle(
                fontSize: 50.sp,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  shape: CircleBorder(),
                  heroTag: '$label-',
                  mini: true,
                  onPressed: onDecrement,
                  backgroundColor: AppColors.darkBorder,
                  child: Icon(Icons.remove, color: Colors.white),
                ),
                SizedBox(width: 10.w),
                FloatingActionButton(
                  shape: CircleBorder(),
                  heroTag: '$label+',
                  mini: true,
                  onPressed: onIncrement,
                  backgroundColor: AppColors.darkBorder,
                  child: Icon(Icons.add, color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
