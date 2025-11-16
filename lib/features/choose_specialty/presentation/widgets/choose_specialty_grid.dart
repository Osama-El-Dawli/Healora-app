import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:healora/core/routes/routes.dart';
import 'package:healora/core/utils/app_assets.dart';
import 'package:healora/features/auth/register/data/models/user_model.dart';
import 'package:healora/features/choose_specialty/data/models/choose_specialty_model.dart';
import 'package:healora/features/choose_specialty/presentation/widgets/choose_specialty_card.dart';

class ChooseSpecialtyGrid extends StatelessWidget {
  const ChooseSpecialtyGrid({super.key, required this.patient});
  final UserModel patient;
  static final List<ChooseSpecialtyModel> specialty = [
    ChooseSpecialtyModel(
      specialtyName: "Cardiology",
      image: Assets.imagesSpecialtyCardiology,
    ),
    ChooseSpecialtyModel(
      specialtyName: "Pathology",
      image: Assets.imagesSpecialtyPathology,
    ),
    ChooseSpecialtyModel(
      specialtyName: "Hepatology",
      image: Assets.imagesSpecialtyHepatology,
    ),
    ChooseSpecialtyModel(
      specialtyName: "Pulmonology",
      image: Assets.imagesSpecialtyPulmonology,
    ),
    ChooseSpecialtyModel(
      specialtyName: "Ophthalmology",
      image: Assets.imagesSpecialtyOphthalmology,
    ),
    ChooseSpecialtyModel(
      specialtyName: "Nephrology",
      image: Assets.imagesSpecialtyNephrology,
    ),
    ChooseSpecialtyModel(
      specialtyName: "Radiology",
      image: Assets.imagesSpecialtyRadiology,
    ),
    ChooseSpecialtyModel(
      specialtyName: "Physiotherapy",
      image: Assets.imagesSpecialtyPhysiotherapy,
    ),
    ChooseSpecialtyModel(
      specialtyName: "Gastroenterology",
      image: Assets.imagesSpecialtyGastroenterology,
    ),
    ChooseSpecialtyModel(
      specialtyName: 'Psychiatry',
      image: Assets.imagesSpecialtyPsychiatry,
    ),
    ChooseSpecialtyModel(
      specialtyName: "General Internal Medicine",
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
                child: InkWell(
                  borderRadius: BorderRadius.circular(12.r),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.selectDoctorScreen,
                      arguments: {
                        'specialty': specialty[index].specialtyName,
                        'patient': patient,
                      },
                    );
                  },
                  child: ChooseSpecialtyCard(
                    specialtyName: specialty[index].specialtyName.tr(),
                    image: specialty[index].image,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
