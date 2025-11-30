import 'package:flutter/material.dart';
import 'package:healora/features/diet_chart/constants.dart';

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
      appBar: AppBar(
        title: Text('RESULT', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Your BMI is', style: ResultTextStyle),
            Text(bmi.toStringAsFixed(1), style: ResultTextStyle),
            Text(
              getBMICategory(),
              style: TextStyle(fontSize: 22, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
