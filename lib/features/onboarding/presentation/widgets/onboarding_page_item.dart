import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/features/onboarding/data/models/onboarding_model.dart';

class OnboardingPageItem extends StatelessWidget {
  const OnboardingPageItem({
    super.key,
    required this.onboardingModel,
    required this.currentIndex,
  });

  final OnboardingModel onboardingModel;
  final double currentIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(onboardingModel.image),
        SizedBox(height: 35.h),
        DotsIndicator(
          dotsCount: 3,
          decorator: DotsDecorator(
            activeColor: AppColors.secondary,
            color: AppColors.gray,
            size: Size(8.w, 8.h),
          ),
          position: currentIndex,
        ),
        SizedBox(height: 16.h),
        Text(
          onboardingModel.title,
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
            fontWeight: FontWeight.w700,
            color: AppColors.primary,
          ),
        ),
        SizedBox(height: 16.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Text(
            onboardingModel.description,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.darkGreen,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}
