import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:healora/core/helper/generate_chat_id.dart';
import 'package:healora/core/routes/routes.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/core/utils/app_assets.dart';
import 'package:healora/core/widgets/custom_elevated_button.dart';
import 'package:healora/core/widgets/custom_info_card.dart';
import 'package:healora/features/auth/register/data/models/user_model.dart';
import 'package:healora/features/select_appointment/cubit/appointment_cubit/appointment_cubit.dart';
import 'package:healora/features/select_appointment/data/models/appointment_model.dart';
import 'package:healora/features/select_doctor/data/models/doctor_model.dart';

class BookingDetailsScreenBody extends StatelessWidget {
  const BookingDetailsScreenBody({
    super.key,
    required this.appointment,
    required this.doctor,
    required this.patient,
  });
  final AppointmentModel appointment;
  final DoctorModel doctor;
  final UserModel patient;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppointmentCubit, AppointmentState>(
      listener: (context, state) {
        if (state is AppointmentLoading) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) =>
                Center(child: CircularProgressIndicator(color: AppColors.red)),
          );
        } else if (state is AppointmentCancelled) {
          Navigator.pop(context);
          Navigator.pushNamedAndRemoveUntil(
            context,
            arguments: patient,
            AppRoutes.homeScreen,
            (route) {
              return false;
            },
          );
        } else if (state is AppointmentFailure) {
          Navigator.pop(context);
          Fluttertoast.showToast(
            msg: state.errorMessage,
            backgroundColor: AppColors.red,
            textColor: Colors.white,
          );
        }
      },
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    SvgPicture.asset(
                      Assets.iconsConfirmed,
                      width: 80.w,
                      colorFilter: ColorFilter.mode(
                        Theme.of(context).brightness == Brightness.dark
                            ? AppColors.darkTextSecondary
                            : AppColors.darkGreen,
                        BlendMode.srcIn,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      'Booking Confirmed'.tr(),
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? AppColors.primary
                            : AppColors.darkGreen,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 56.h),
              Text(
                'Booking Information'.tr(),
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                ),
              ),
              SizedBox(height: 12.h),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(8.r),
                    decoration: BoxDecoration(
                      color: AppColors.lightGray,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: SvgPicture.asset(Assets.iconsCalendar, width: 24.w),
                  ),
                  SizedBox(width: 16.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Date & Time'.tr(),
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'Date: ${appointment.date}',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        'Time: ${appointment.time} AM',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      context.read<AppointmentCubit>().cancelAppointment(
                        patientId: appointment.patientId,
                        docId: appointment.doctorId,
                      );
                    },
                    child: Text(
                      'Cancel'.tr(),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 28.h),
              Text(
                'Doctor Information'.tr(),
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                ),
              ),

              SizedBox(height: 16.h),

              Hero(
                tag: doctor.uid,
                child: CustomInfoCard(
                  title: '${doctor.firstName} ${doctor.lastName}',
                  subTitle: doctor.specialization,
                  image: doctor.imageUrl,
                  trailing: IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        AppRoutes.chatScreen,
                        arguments: {
                          'chatId': generateChatId(
                            doctorId: doctor.uid,
                            patientId: patient.uid,
                          ),
                          'user': patient,
                        },
                      );
                    },
                    icon: Icon(
                      Icons.chat,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? AppColors.primary
                          : AppColors.darkGreen,
                      size: 30.sp,
                    ),
                  ),
                ),
              ),
              Spacer(flex: 5),
              CustomElevatedButton(
                label: 'Done'.tr(),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoutes.homeScreen,
                    arguments: patient,
                    (route) {
                      return false;
                    },
                  );
                },
              ),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}
