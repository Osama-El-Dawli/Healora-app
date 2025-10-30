import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/cache/hive_manager.dart';
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
          SizedBox(height: 40.h),
          Expanded(child: OnboardingPageView()),
          TextButton(
            onPressed: () {
              HiveManager.setOnboardingVisited();
              Navigator.pushReplacementNamed(context, AppRoutes.loginScreen);
            },
            child: Text(
              'Skip Tour',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontSize: 14.sp,
                color: Theme.of(context).brightness == Brightness.dark
                    ? AppColors.primary
                    : AppColors.darkGreen,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          SizedBox(height: 40.h),
        ],
      ),
    );
  }
}
