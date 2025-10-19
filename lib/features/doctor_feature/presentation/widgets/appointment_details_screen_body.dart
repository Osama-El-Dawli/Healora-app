import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/core/utils/app_assets.dart';
import 'package:healora/features/doctor_feature/presentation/widgets/appointment_details_card.dart';

class AppointmentDetailsScreenBody extends StatelessWidget {
  const AppointmentDetailsScreenBody({super.key, required this.avatarTag});
  final String avatarTag;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: AnimationLimiter(
          child: SingleChildScrollView(
            child: Column(
              children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 500),
                delay: const Duration(milliseconds: 100),
                childAnimationBuilder: (widget) => SlideAnimation(
                  verticalOffset: 100.0,
                  curve: Curves.easeOutCubic,
                  child: FadeInAnimation(child: widget),
                ),
                children: [
                  SizedBox(height: 16.h),
                  ListTile(
                    leading: Hero(
                      tag: avatarTag,
                      child: CircleAvatar(
                        radius: 28.r,
                        child: Image.asset(Assets.imagesAvatar),
                      ),
                    ),
                    title: Hero(
                      tag: 'name$avatarTag',
                      child: Text(
                        'Patient Name',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w700,
                              fontSize: 18.sp,
                            ),
                      ),
                    ),
                    subtitle: Text(
                      '011 2345 6789',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Color(0xffA0A0A0),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  AppointmentDetailsCard(
                    isDate: true,
                    leadingIcon: Icons.calendar_month_rounded,
                    title: 'Appointment Date'.tr(),
                    subTitle: '12 Oct, 2025 | 10:00 AM',
                  ),
                  SizedBox(height: 24.h),
                  Row(
                    children: [
                      Expanded(
                        child: AppointmentDetailsCard(
                          title: '011 2345 6789',
                          leadingIcon: Icons.phone_rounded,
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Container(
                        padding: EdgeInsets.all(8.r),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: AppColors.primary.withValues(alpha: 0.1),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.chat,
                            color: AppColors.secondary,
                            size: 28.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  AppointmentDetailsCard(
                    isDate: true,
                    leadingIcon: Icons.calendar_month_rounded,
                    title: 'Follow-up Date'.tr(),
                    subTitle: '20 Oct, 2025 | 11:30 AM',
                    trailingIcon: Icons.edit_rounded,
                  ),
                  SizedBox(height: 24.h),
                  AppointmentDetailsCard(
                    leadingIcon: Icons.history_rounded,
                    title: 'Medical History'.tr(),
                    subTitle: 'Blood type, Medications, etc.',
                    trailingIcon: Icons.arrow_forward_ios_rounded,
                  ),
                  SizedBox(height: 24.h),
                  AppointmentDetailsCard(
                    leadingIcon: Icons.science_rounded,
                    title: 'Lab Results'.tr(),
                    subTitle: 'Blood test, X-ray, etc.',
                    trailingIcon: Icons.arrow_forward_ios_rounded,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
