import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/utils/app_assets.dart';
import 'package:healora/core/widgets/custom_elevated_button.dart';
import 'package:healora/core/widgets/custom_info_card.dart';
import 'package:healora/features/select_appointment/presentation/widgets/select_date_section.dart';
import 'package:healora/features/select_appointment/presentation/widgets/select_time_section.dart';

class SelectAppointmentScreenBody extends StatelessWidget {
  const SelectAppointmentScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Hero(
            tag: 'osama',
            child: CustomInfoCard(
              title: 'osama',
              subTitle: 'teeth',
              image: Assets.imagesAvatar,
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
