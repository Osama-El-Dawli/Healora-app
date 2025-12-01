import 'package:flutter/material.dart';
import 'package:healora/features/auth/register/data/models/user_model.dart';
import 'package:healora/features/doctor_feature/presentation/widgets/doctor_screen_body.dart';

class DoctorScreen extends StatelessWidget {
  final UserModel user;

  const DoctorScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: DoctorScreenBody(user: user));
  }
}
