import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/widgets/custom_elevated_button.dart';
import 'package:healora/core/widgets/custom_info_card.dart';
import 'package:healora/features/select_appointment/presentation/widgets/select_date_section.dart';
import 'package:healora/features/select_appointment/presentation/widgets/select_time_section.dart';
import 'package:healora/features/select_doctor/data/models/doctor_model.dart';

class SelectAppointmentScreenBody extends StatelessWidget {
  const SelectAppointmentScreenBody({super.key, required this.doctorModel});
  final DoctorModel doctorModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Hero(
            tag: doctorModel.uid,
            child: CustomInfoCard(
              title: '${doctorModel.firstName} ${doctorModel.lastName}',
              subTitle: doctorModel.specialization,
              image: doctorModel.imageUrl,
            ),
          ),
        ),
        SizedBox(height: 28.h),
        SelectDateSection(),
        SizedBox(height: 28.h),
        Expanded(child: SelectTimeSection()),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: CustomElevatedButton(label: 'Book'.tr(), onPressed: () {}),
        ),
        SizedBox(height: 32.h),
      ],
    );
  }
}
