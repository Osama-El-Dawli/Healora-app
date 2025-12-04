import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/widgets/custom_elevated_button.dart';
import 'package:healora/features/diet_chart/presentation/screens/result_screen.dart';
import 'package:healora/features/diet_chart/presentation/widgets/gender_card.dart';
import 'package:healora/features/diet_chart/presentation/widgets/height_card.dart';
import 'package:healora/features/diet_chart/presentation/widgets/weight_age_card.dart';

class BMIScreenBody extends StatefulWidget {
  const BMIScreenBody({super.key});

  @override
  State<BMIScreenBody> createState() => _BMIScreenBodyState();
}

class _BMIScreenBodyState extends State<BMIScreenBody> {
  bool isMale = true;
  double height = 174;
  int weight = 60;
  int age = 29;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 16),
        Row(
          children: [
            GenderCard(
              icon: Icons.male,
              label: 'MALE'.tr(),
              isSelected: isMale,
              onTap: () => setState(() => isMale = true),
            ),

            SizedBox(width: 16.w),

            GenderCard(
              icon: Icons.female,
              label: 'FEMALE'.tr(),
              isSelected: !isMale,
              onTap: () => setState(() => isMale = false),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        HeightCard(
          height: height,
          onChanged: (value) => setState(() => height = value),
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            WeightAgeCard(
              label: 'WEIGHT'.tr(),
              value: weight,
              onIncrement: () => setState(() => weight++),
              onDecrement: () => setState(() => weight--),
            ),

            SizedBox(width: 16.w),

            WeightAgeCard(
              label: 'AGE'.tr(),
              value: age,
              onIncrement: () => setState(() => age++),
              onDecrement: () => setState(() => age--),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        CustomElevatedButton(
          label: 'CALCULATE'.tr(),
          onPressed: () {
            double bmi = weight / ((height / 100) * (height / 100));
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ResultSreen(bmi: bmi)),
            );
          },
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}
