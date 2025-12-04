import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/theme/app_colors.dart';

class ResultSreen extends StatelessWidget {
  final double bmi;
  const ResultSreen({super.key, required this.bmi});

  String getBMICategory() {
    if (bmi < 18.5) return 'Underweight';
    if (bmi < 24.9) return 'Normal';
    if (bmi < 29.9) return 'Overweight';
    return 'Obese';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Result'.tr())),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your BMI is'.tr(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40.sp,
                fontWeight: FontWeight.w900,
                color: Brightness.light == Theme.of(context).brightness
                    ? AppColors.primary
                    : AppColors.suffixIconColor,
              ),
            ),
            Text(
              bmi.toStringAsFixed(1),
              style: TextStyle(
                fontSize: 50.sp,
                fontWeight: FontWeight.w900,
                color: Brightness.light == Theme.of(context).brightness
                    ? AppColors.darkBorder
                    : AppColors.lightGray,
              ),
            ),
            Text(
              getBMICategory(),
              style: TextStyle(
                fontSize: 22,
                color: getBMICategory() == 'Normal'
                    ? (Theme.of(context).brightness == Brightness.light
                          ? AppColors.secondary
                          : AppColors.primary)
                    : AppColors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
