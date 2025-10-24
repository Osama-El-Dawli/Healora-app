import 'package:flutter/material.dart';
import 'package:healora/features/select_doctor/presentation/widgets/select_doctor_screen_body.dart';

class SelectDoctorScreen extends StatelessWidget {
  const SelectDoctorScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SelectDoctorScreenBody(),
    );
  }
}

