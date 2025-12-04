import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/features/diet_chart/presentation/widgets/bmi_screen_body.dart';

class BMIScreen extends StatelessWidget {
  const BMIScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI CALCULATOR'.tr())),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: BMIScreenBody(),
      ),
    );
  }
}
