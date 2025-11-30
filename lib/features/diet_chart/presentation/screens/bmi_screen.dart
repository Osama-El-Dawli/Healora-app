import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/widgets/custom_elevated_button.dart';
import 'package:healora/features/diet_chart/presentation/screens/result_screen.dart';
import 'package:healora/features/diet_chart/presentation/widgets/gender_card.dart';
import 'package:healora/features/diet_chart/presentation/widgets/height_card.dart';
import 'package:healora/features/diet_chart/presentation/widgets/weight_age_card.dart';

class BMIScreen extends StatefulWidget {
  const BMIScreen({super.key});

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  bool isMale = true;
  double height = 174;
  int weight = 60;
  int age = 29;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('BMI CALCULATOR', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 16),
            Row(
              children: [
                GenderCard(
                  icon: Icons.male,
                  label: 'MALE',
                  isSelected: isMale,
                  onTap: () => setState(() => isMale = true),
                ),

                GenderCard(
                  icon: Icons.female,
                  label: 'FEMALE',
                  isSelected: !isMale,
                  onTap: () => setState(() => isMale = false),
                ),
              ],
            ),
            HeightCard(
              height: height,
              onChanged: (value) => setState(() => height = value),
            ),
            Row(
              children: [
                WeightAgeCard(
                  label: 'WEIGHT',
                  value: weight,
                  onIncrement: () => setState(() => weight++),
                  onDecrement: () => setState(() => weight--),
                ),
                WeightAgeCard(
                  label: 'AGE',
                  value: age,
                  onIncrement: () => setState(() => age++),
                  onDecrement: () => setState(() => age--),
                ),
              ],
            ),
            CustomElevatedButton(
              label: 'CALCULATE',
              onPressed: () {
                double bmi = weight / ((height / 100) * (height / 100));
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultSreen(bmi: bmi),
                  ),
                );
              },
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}
