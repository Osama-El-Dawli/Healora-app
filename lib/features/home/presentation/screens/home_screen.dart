import 'package:flutter/material.dart';
import 'package:healora/core/routes/routes.dart';
import 'package:healora/features/home/presentation/widgets/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = AppRoutes.homeScreen;
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeScreenBody()
    );
  }
}
