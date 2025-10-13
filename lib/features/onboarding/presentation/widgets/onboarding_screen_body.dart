import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/routes/routes.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/features/onboarding/presentation/widgets/onboarding_page_view.dart';

class OnboardingScreenBody extends StatelessWidget {
  const OnboardingScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          Spacer(flex: 1),
          Expanded(
            flex: 7,
            child: OnboardingPageView(),
          ),
          TextButton(
            onPressed: () {Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);},
            child: Text(
              'Skip Tour',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColors.darkGreen,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Spacer(flex: 1),
        ],
      ),
    );
  }
}


