import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:healora/features/onboarding/data/models/onboarding_model.dart';
import 'package:healora/features/onboarding/presentation/widgets/onboarding_page_item.dart';

class OnboardingPageView extends StatefulWidget {
  const OnboardingPageView({super.key});
  @override
  State<OnboardingPageView> createState() => _OnboardingPageViewState();
}

class _OnboardingPageViewState extends State<OnboardingPageView> {
  List<OnboardingModel> items = [
    OnboardingModel(
      image: 'assets/images/onboarding1.png',
      title: 'Discover Top Doctors.'.tr(),
      description:
          'Connect instantly with highly qualified and trusted medical professionals across all specialties. Whether you need quick advice, a detailed consultation, or ongoing care, Healora helps you find the right doctor—anytime, anywhere.'
              .tr(),
    ),
    OnboardingModel(
      image: 'assets/images/onboarding2.png',
      title: 'Ask a Doctor Online'.tr(),
      description:
          'Explore a wide network of skilled and verified healthcare professionals. Compare specialties, view profiles, and choose the right doctor with confidence.'
              .tr(),
    ),
    OnboardingModel(
      image: 'assets/images/onboarding3.png',
      title: 'Get Expert Advice'.tr(),
      description:
          'Receive expert medical advice tailored to your symptoms and health history. Our specialists guide you with accurate insights, helping you make informed decisions about your care.'
              .tr(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        return OnboardingPageItem(
          onboardingModel: items[index],
          currentIndex: index.toDouble(),
        );
      },
    );
  }
}
