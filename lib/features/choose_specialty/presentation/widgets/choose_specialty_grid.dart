import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:healora/core/utils/app_assets.dart';
import 'package:healora/features/choose_specialty/presentation/widgets/choose_specialty_card.dart';

import '../../data/models/choose_specialty_model.dart';

class ChooseSpecialtyGrid extends StatelessWidget {
  const ChooseSpecialtyGrid({super.key});
  static final List<ChooseSpecialtyModel> specialty = [
    ChooseSpecialtyModel(
      specialtyName: "Cardiology".tr(),
      image: Assets.imagesSpecialtyCardiology,
    ),
    ChooseSpecialtyModel(
      specialtyName: "Pathology".tr(),
      image: Assets.imagesSpecialtyPathology,
    ),
    ChooseSpecialtyModel(
      specialtyName: "Hepatology".tr(),
      image: Assets.imagesSpecialtyHepatology,
    ),
    ChooseSpecialtyModel(
      specialtyName: "Pulmonology".tr(),
      image: Assets.imagesSpecialtyPulmonology,
    ),
    ChooseSpecialtyModel(
      specialtyName: "Ophthalmology".tr(),
      image: Assets.imagesSpecialtyOphthalmology,
    ),
    ChooseSpecialtyModel(
      specialtyName: "Nephrology".tr(),
      image: Assets.imagesSpecialtyNephrology,
    ),
    ChooseSpecialtyModel(
      specialtyName: "Radiology".tr(),
      image: Assets.imagesSpecialtyRadiology,
    ),
    ChooseSpecialtyModel(
      specialtyName: "Physiotherapy".tr(),
      image: Assets.imagesSpecialtyPhysiotherapy,
    ),
    ChooseSpecialtyModel(
      specialtyName: "Gastroenterology".tr(),
      image: Assets.imagesSpecialtyGastroenterology,
    ),
    ChooseSpecialtyModel(
      specialtyName: 'Psychiatry'.tr(),
      image: Assets.imagesSpecialtyPsychiatry,
    ),
    ChooseSpecialtyModel(
      specialtyName: "General Internal Medicine".tr(),
      image: Assets.imagesSpecialtyGeneralInternal,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.w,
          mainAxisSpacing: 8.h,
        ),
        itemCount: specialty.length,
        itemBuilder: (BuildContext context, int index) {
          return AnimationConfiguration.staggeredGrid(
            position: index,
            columnCount: 2,
            duration: const Duration(milliseconds: 500),
            delay: const Duration(milliseconds: 100),
            child: SlideAnimation(
              verticalOffset: 100.0,
              curve: Curves.easeOutCubic,
              child: FadeInAnimation(
                child: ChooseSpecialtyCard(choose: specialty[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}
