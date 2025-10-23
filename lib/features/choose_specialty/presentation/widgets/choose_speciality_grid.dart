import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/features/choose_specialty/presentation/widgets/choose_specialty_card.dart';

import '../../data/models/choose_spacialty_model.dart';

class ChooseSpecialityGrid extends StatelessWidget {
  const ChooseSpecialityGrid({super.key});
  static final List<ChooseSpacialityModel> Speciality=[

    ChooseSpacialityModel(
        spacialityName:"Cardiology".tr(),
        image:"assets/images/specialty/Cardiology.png"),
    ChooseSpacialityModel(
        spacialityName:"Pathology".tr(),
        image:"assets/images/specialty/Pathology.png"),
    ChooseSpacialityModel(
        spacialityName:"Hepatology".tr(),
        image:"assets/images/specialty/Hepatology.png"),
    ChooseSpacialityModel(
        spacialityName:"Pulmonology".tr(),
        image:"assets/images/specialty/Pulmonology.png"),
    ChooseSpacialityModel(
        spacialityName:"Ophthalmology".tr(),
        image:"assets/images/specialty/Ophthalmology.png"),
    ChooseSpacialityModel(
        spacialityName:"Nephrology".tr(),
        image:"assets/images/specialty/Nephrology.png"),
    ChooseSpacialityModel(
        spacialityName:"Radiology".tr(),
        image:"assets/images/specialty/Radiology.png"),
    ChooseSpacialityModel(
        spacialityName:"Physiotherapy".tr(),
        image:"assets/images/specialty/Physiotherapy.png"),
    ChooseSpacialityModel(
        spacialityName:"Gastroenterology".tr(),
        image:"assets/images/specialty/Gastroenterology.png"),
    ChooseSpacialityModel(
      spacialityName:'Psychiatry'.tr(),
      image:"assets/images/specialty/Psychiatry.png",),
    ChooseSpacialityModel(
        spacialityName:"General Internal Medicine".tr(),
        image:"assets/images/specialty/General Internal.png"),


  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.w,
          mainAxisSpacing: 10.h,
          childAspectRatio: 1.2,
      ),
        itemCount: Speciality.length,
    itemBuilder:
        (BuildContext context, int index) {
        return ChooseSpecialtyCard(choose: Speciality[index]);
    }
    );
  }
}
