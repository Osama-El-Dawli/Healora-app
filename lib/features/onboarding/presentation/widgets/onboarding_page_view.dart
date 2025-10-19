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
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus lacinia libero ut metus convallis tempor. Vestibulum consequat, tortor mattis consequat'.tr(),
    ),
    OnboardingModel(
      image: 'assets/images/onboarding2.png',
      title: 'Ask a Doctor Online'.tr(),
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus lacinia libero ut metus convallis tempor. Vestibulum consequat, tortor mattis consequat'.tr(),
    ),
    OnboardingModel(
      image: 'assets/images/onboarding3.png',
      title: 'Get Expert Advice'.tr(),
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus lacinia libero ut metus convallis tempor. Vestibulum consequat, tortor mattis consequat'.tr(),
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
