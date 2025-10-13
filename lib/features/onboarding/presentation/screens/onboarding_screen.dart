import 'package:flutter/material.dart';
import 'package:healora/features/onboarding/presentation/widgets/onboarding_screen_body.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingScreenBody(),
    );
  }
}
