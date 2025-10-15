import 'package:flutter/material.dart';
import 'package:healora/features/doctor_feature/presentation/widgets/doctor_screen_body.dart';

class DoctorScreen extends StatelessWidget {
  const DoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DoctorScreenBody(),
    );
  }
}
