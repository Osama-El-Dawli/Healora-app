import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/core/widgets/custom_elevated_button.dart';
import 'package:healora/features/doctor_feature/cubit/doctor_feature_cubit.dart';
import 'package:healora/features/select_appointment/cubit/appointment_cubit/appointment_cubit.dart';
import 'package:healora/features/select_appointment/data/models/appointment_model.dart';
import 'package:healora/features/select_appointment/presentation/widgets/select_date_section.dart';
import 'package:healora/features/select_appointment/presentation/widgets/select_time_section.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'package:healora/features/auth/register/data/models/user_model.dart';
import 'package:healora/core/widgets/custom_profile_avatar.dart';

class RescheduleAppointmentScreen extends StatefulWidget {
  const RescheduleAppointmentScreen({
    super.key,
    required this.appointment,
    required this.patient,
  });

  final AppointmentModel appointment;
  final UserModel patient;

  @override
  State<RescheduleAppointmentScreen> createState() =>
      _RescheduleAppointmentScreenState();
}

class _RescheduleAppointmentScreenState
    extends State<RescheduleAppointmentScreen> {
  late DateTime selectedDate;
  String? selectedTime;
  AppointmentModel? _pendingAppointment;

  @override
  void initState() {
    super.initState();
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    selectedDate = tomorrow;
    if (tomorrow.weekday == DateTime.friday) {
      selectedDate = tomorrow.add(const Duration(days: 1));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DoctorFeatureCubit, DoctorFeatureState>(
      listener: (context, state) {
        if (state is DoctorFeatureSuccess) {
          Fluttertoast.showToast(
            msg: 'Appointment rescheduled successfully'.tr(),
            backgroundColor: Colors.green,
            textColor: Colors.white,
          );
          if (context.mounted) {
            Navigator.pop(context, _pendingAppointment);
          }
        } else if (state is DoctorFeatureFailure) {
          Fluttertoast.showToast(
            msg: state.errorMessage,
            backgroundColor: Colors.red,
            textColor: Colors.white,
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Reschedule Appointment'.tr(),
            style: Theme.of(context).textTheme.titleMedium,
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: CustomProfileAvatar(
                  imageUrl: widget.patient.imageUrl,
                  radius1: 28.r,
                  radius2: 22.r,
                ),
                title: Text(
                  '${widget.patient.firstName} ${widget.patient.lastName}',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w700,
                    fontSize: 18.sp,
                  ),
                ),
                subtitle: Text(
                  widget.patient.phoneNumber,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: const Color(0xffA0A0A0),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              Builder(
                builder: (context) {
                  return SelectDateSection(
                    initialSelectedDate: selectedDate,
                    onDateSelected: (date) {
                      setState(() {
                        selectedDate = date;
                        selectedTime = null;
                      });
                      context.read<AppointmentCubit>().getAvailableTimes(
                        day: DateFormat('dd MMM').format(date),
                        docId: widget.appointment.doctorId,
                      );
                    },
                  );
                },
              ),
              SizedBox(height: 24.h),
              Text(
                "${'Available Times for'.tr()} ${DateFormat('dd MMM').format(selectedDate)}"
                    .tr(),
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.brightnessOf(context) == Brightness.dark
                      ? AppColors.darkTextSecondary
                      : AppColors.black,
                ),
              ),
              SizedBox(height: 16.h),
              Expanded(
                child: BlocBuilder<AppointmentCubit, AppointmentState>(
                  builder: (context, state) {
                    if (state is AppointmentLoading) {
                      return Skeletonizer(
                        enabled: true,
                        child: SelectTimeSection(
                          times: List.generate(6, (index) => '00:00'),
                          onSelect: (_) {},
                        ),
                      );
                    } else if (state is AppointmentTimesLoaded) {
                      if (state.times.isEmpty) {
                        return Center(child: Text('No available times'.tr()));
                      }
                      return SelectTimeSection(
                        times: state.times,
                        onSelect: (time) {
                          setState(() {
                            selectedTime = time;
                          });
                        },
                      );
                    } else if (state is AppointmentFailure) {
                      return Center(child: Text(state.errorMessage));
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
              BlocBuilder<DoctorFeatureCubit, DoctorFeatureState>(
                builder: (context, state) {
                  if (state is DoctorFeatureLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return CustomElevatedButton(
                    label: 'Confirm Reschedule'.tr(),
                    onPressed: () {
                      if (selectedTime == null) {
                        Fluttertoast.showToast(
                          msg: 'Please select a time'.tr(),
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                        );
                        return;
                      }

                      final newAppointment = AppointmentModel(
                        id: widget.appointment.id,
                        patientId: widget.appointment.patientId,
                        doctorId: widget.appointment.doctorId,
                        date: DateFormat('dd MMM').format(selectedDate),
                        time: selectedTime!,
                      );

                      _pendingAppointment = newAppointment;

                      context.read<DoctorFeatureCubit>().updateAppointment(
                        appointment: newAppointment,
                      );
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
