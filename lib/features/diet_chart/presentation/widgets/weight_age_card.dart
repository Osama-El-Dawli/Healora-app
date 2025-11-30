import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/features/diet_chart/constants.dart';

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
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 8.h),
            Text(label, style: KLabelTextStyle),
            Text('$value', style: KNumberTextStyle),
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
                SizedBox(width: 10),
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
            SizedBox(height: 8.h),
          ],
        ),
      ),
    );
  }
}
