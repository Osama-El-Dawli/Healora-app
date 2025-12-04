import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:healora/core/helper/generate_chat_id.dart';
import 'package:healora/core/routes/routes.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/core/widgets/custom_profile_avatar.dart';
import 'package:healora/features/auth/register/data/models/user_model.dart';
import 'package:healora/features/doctor_feature/data/models/patient_with_appointment.dart';
import 'package:healora/features/doctor_feature/presentation/widgets/appointment_details_card.dart';

class AppointmentDetailsScreenBody extends StatelessWidget {
  const AppointmentDetailsScreenBody({
    super.key,
    required this.patientWithAppointment,
    required this.doctor,
  });
  final PatientWithAppointment patientWithAppointment;
  final UserModel doctor;

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
                      tag: 'avatar${patientWithAppointment.patient.uid}',
                      child: CustomProfileAvatar(
                        imageUrl: patientWithAppointment.patient.imageUrl,
                        radius1: 28.r,
                        radius2: 22.r,
                      ),
                    ),
                    title: Hero(
                      tag: 'name${patientWithAppointment.patient.uid}',
                      child: Text(
                        '${patientWithAppointment.patient.firstName} ${patientWithAppointment.patient.lastName}',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w700,
                              fontSize: 18.sp,
                            ),
                      ),
                    ),
                    subtitle: Text(
                      patientWithAppointment.patient.phoneNumber,
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
                    subTitle:
                        '${patientWithAppointment.appointment.date}, ${DateTime.now().year} | ${patientWithAppointment.appointment.time} AM',
                  ),
                  SizedBox(height: 24.h),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12.r),
                          onTap: () {
                            Clipboard.setData(
                              ClipboardData(
                                text:
                                    patientWithAppointment.patient.phoneNumber,
                              ),
                            );
                            Fluttertoast.showToast(
                              msg: 'Phone number copied to clipboard'.tr(),
                              backgroundColor: Colors.black54,
                              textColor: Colors.white,
                            );
                          },
                          child: AppointmentDetailsCard(
                            title: patientWithAppointment.patient.phoneNumber,
                            leadingIcon: Icons.phone_rounded,
                          ),
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
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                              AppRoutes.chatScreen,
                              arguments: {
                                'chatId': generateChatId(
                                  doctorId: doctor.uid,
                                  patientId: patientWithAppointment.patient.uid,
                                ),
                                'otherUser': patientWithAppointment.patient,
                                'currentUser': doctor,
                              },
                            );
                          },
                          icon: Icon(
                            Icons.chat,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                ? AppColors.primary
                                : AppColors.darkGreen,
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
                    subTitle:
                        '${patientWithAppointment.appointment.date}, ${DateTime.now().year} | ${patientWithAppointment.appointment.time} AM',
                    trailingIcon: Icons.edit_rounded,
                  ),
                  SizedBox(height: 24.h),
                  InkWell(
                    borderRadius: BorderRadius.circular(12.r),
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        AppRoutes.medicalHistoryScreen,
                        arguments: patientWithAppointment.patient,
                      );
                    },
                    child: AppointmentDetailsCard(
                      leadingIcon: Icons.history_rounded,
                      title: 'Medical History'.tr(),
                      subTitle: 'medical_history_subtitle'.tr(),
                      trailingIcon: Icons.arrow_forward_ios_rounded,
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          AppRoutes.medicalHistoryScreen,
                          arguments: patientWithAppointment.patient,
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 24.h),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        AppRoutes.labResultsScreen,
                        arguments: patientWithAppointment.patient,
                      );
                    },
                    child: AppointmentDetailsCard(
                      leadingIcon: Icons.science_rounded,
                      title: 'Lab Results'.tr(),
                      subTitle: 'lab_results_subtitle'.tr(),
                      trailingIcon: Icons.arrow_forward_ios_rounded,
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          AppRoutes.labResultsScreen,
                          arguments: patientWithAppointment.patient,
                        );
                      },
                    ),
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
