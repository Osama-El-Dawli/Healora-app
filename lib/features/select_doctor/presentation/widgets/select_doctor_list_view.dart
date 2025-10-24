import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:healora/core/utils/app_assets.dart';
import 'package:healora/features/select_doctor/data/models/select_doctor_model.dart';
import 'package:healora/features/select_doctor/presentation/widgets/select_doctor_item.dart';

class SelectDoctorListView extends StatelessWidget {
  const SelectDoctorListView({super.key});
  static final List<SelectDoctorModel> doctors = [
    SelectDoctorModel(
      name: 'Osama',
      image: Assets.imagesAvatar,
      specialty: 'teeth',
    ),
    SelectDoctorModel(
      name: 'Osama',
      image: Assets.imagesAvatar,
      specialty: 'teeth',
    ),
    SelectDoctorModel(
      name: 'Osama',
      image: Assets.imagesAvatar,
      specialty: 'teeth',
    ),
    SelectDoctorModel(
      name: 'Osama',
      image: Assets.imagesAvatar,
      specialty: 'teeth',
    ),
    SelectDoctorModel(
      name: 'Osama',
      image: Assets.imagesAvatar,
      specialty: 'teeth',
    ),
    SelectDoctorModel(
      name: 'Osama',
      image: Assets.imagesAvatar,
      specialty: 'teeth',
    ),
    SelectDoctorModel(
      name: 'Osama',
      image: Assets.imagesAvatar,
      specialty: 'teeth',
    ),
    SelectDoctorModel(
      name: 'Osama',
      image: Assets.imagesAvatar,
      specialty: 'teeth',
    ),
    SelectDoctorModel(
      name: 'Osama',
      image: Assets.imagesAvatar,
      specialty: 'teeth',
    ),
    SelectDoctorModel(
      name: 'Osama',
      image: Assets.imagesAvatar,
      specialty: 'teeth',
    ),
    SelectDoctorModel(
      name: 'Osama',
      image: Assets.imagesAvatar,
      specialty: 'teeth',
    ),
    SelectDoctorModel(
      name: 'Osama',
      image: Assets.imagesAvatar,
      specialty: 'teeth',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder: (_, index) => SizedBox(height: 12.h),
      itemBuilder: (_, index) => AnimationConfiguration.staggeredList(
        position: index,
        duration: const Duration(milliseconds: 500),
        delay: const Duration(milliseconds: 100),
        child: SlideAnimation(
          verticalOffset: 100.0,
          curve: Curves.easeOutCubic,
          child: FadeInAnimation(
            child: SelectDoctorItem(model: doctors[index]),
          ),
        ),
      ),
      itemCount: doctors.length,
    );
  }
}
