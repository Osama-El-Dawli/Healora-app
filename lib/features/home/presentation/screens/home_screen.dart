import 'package:flutter/material.dart';
import 'package:healora/core/routes/routes.dart';
import 'package:healora/features/auth/register/data/models/user_model.dart';
import 'package:healora/features/home/presentation/widgets/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = AppRoutes.homeScreen;
  const HomeScreen({super.key, required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: HomeScreenBody());
  }
}
