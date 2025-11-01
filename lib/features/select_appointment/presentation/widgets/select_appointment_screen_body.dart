import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:healora/core/routes/routes.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/core/widgets/custom_elevated_button.dart';
import 'package:healora/core/widgets/custom_info_card.dart';
import 'package:healora/features/auth/register/data/models/user_model.dart';
import 'package:healora/features/select_appointment/cubit/appointment_cubit/appointment_cubit.dart';
import 'package:healora/features/select_appointment/data/models/appointment_model.dart';
import 'package:healora/features/select_appointment/presentation/widgets/select_date_section.dart';
import 'package:healora/features/select_appointment/presentation/widgets/select_time_section.dart';
import 'package:healora/features/select_doctor/data/models/doctor_model.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SelectAppointmentScreenBody extends StatefulWidget {
  const SelectAppointmentScreenBody({
    super.key,
    required this.doctorModel,
    required this.patientModel,
  });

  final DoctorModel doctorModel;
  final UserModel patientModel;

  @override
  State<SelectAppointmentScreenBody> createState() =>
      _SelectAppointmentScreenBodyState();
}

class _SelectAppointmentScreenBodyState
    extends State<SelectAppointmentScreenBody> {
  DateTime? selectedDate;
  String? selectedTime;
  bool isCheckingBooking = true;

  @override
  void initState() {
    super.initState();
    _checkExistingAppointment();
  }

  Future<void> _checkExistingAppointment() async {
    final firstDate = _getWeekDates().first;
    selectedDate = firstDate;

    final cubit = context.read<AppointmentCubit>();

    final appointment = await cubit.isBookedBefore(
      docId: widget.doctorModel.uid,
      patientId: widget.patientModel.uid,
    );

    if (!mounted) return;

    if (appointment != null) {
      Navigator.pushReplacementNamed(
        context,
        AppRoutes.bookingDetailsScreen,
        arguments: {
          'appointment': appointment,
          'doctor': widget.doctorModel,
          'patient': widget.patientModel,
        },
      );
    } else {
      await cubit.getAvailableTimes(
        day: DateFormat('dd MMM').format(firstDate),
        docId: widget.doctorModel.uid,
      );
      setState(() => isCheckingBooking = false);
    }
  }

  List<DateTime> _getWeekDates() {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    List<DateTime> dates = [];
    DateTime current = tomorrow;

    while (dates.length < 6) {
      if (current.weekday != DateTime.friday) {
        dates.add(current);
      }
      current = current.add(const Duration(days: 1));
    }
    return dates;
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AppointmentCubit>();
    return Skeletonizer(
      effect: ShimmerEffect(
        baseColor: AppColors.lightGray,
        highlightColor: AppColors.primary.withValues(alpha: 0.3),
      ),
      enabled: isCheckingBooking,

      ignoreContainers: true,
      enableSwitchAnimation: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Hero(
              tag: widget.doctorModel.uid,
              child: CustomInfoCard(
                title:
                    '${widget.doctorModel.firstName} ${widget.doctorModel.lastName}',
                subTitle: widget.doctorModel.specialization,
                image: widget.doctorModel.imageUrl,
              ),
            ),
          ),
          SizedBox(height: 28.h),
          SelectDateSection(
            initialSelectedDate: selectedDate!,
            onDateSelected: (date) {
              setState(() => selectedDate = date);
              cubit.getAvailableTimes(
                day: DateFormat('dd MMM').format(date),
                docId: widget.doctorModel.uid,
              );
            },
          ),
          SizedBox(height: 28.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              "${'Available Times for'.tr()} ${DateFormat('dd MMM').format(selectedDate!)}"
                  .tr(),
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Theme.brightnessOf(context) == Brightness.dark
                    ? AppColors.darkTextSecondary
                    : AppColors.black,
              ),
            ),
          ),
          SizedBox(height: 15.h),
          Expanded(
            child: BlocBuilder<AppointmentCubit, AppointmentState>(
              builder: (context, state) {
                if (state is AppointmentLoading) {
                  return Skeletonizer(
                    effect: ShimmerEffect(
                      baseColor: AppColors.lightGray,
                      highlightColor: AppColors.primary.withValues(alpha: 0.3),
                    ),
                    enabled: true,
                    child: SelectTimeSection(
                      times: List.generate(6, (index) => 'loading'),
                      onSelect: (_) {},
                    ),
                  );
                } else if (state is AppointmentTimesLoaded) {
                  if (state.times.isEmpty) {
                    return const Center(
                      child: Text('No available times for this day'),
                    );
                  }
                  return SelectTimeSection(
                    times: state.times,
                    onSelect: (time) => selectedTime = time,
                  );
                } else if (state is AppointmentFailure) {
                  return Center(child: Text('Error: ${state.errorMessage}'));
                } else {
                  return Skeletonizer(
                    effect: ShimmerEffect(
                      baseColor: AppColors.lightGray,
                      highlightColor: AppColors.primary.withValues(alpha: 0.3),
                    ),
                    enabled: true,
                    enableSwitchAnimation: true,
                    child: SelectTimeSection(
                      times: List.generate(6, (index) => 'loading'),
                      onSelect: (_) {},
                    ),
                  );
                }
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: BlocListener<AppointmentCubit, AppointmentState>(
              listener: (context, state) {
                if (state is AppointmentSuccess) {
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(
                    context,
                    AppRoutes.bookingDetailsScreen,
                    arguments: {
                      'doctor': widget.doctorModel,
                      'appointment': state.appointmentModel,
                      'patient': widget.patientModel,
                    },
                  );
                } else if (state is AppointmentFailure) {
                  Navigator.pop(context);
                  Fluttertoast.showToast(
                    msg: 'Error: ${state.errorMessage}',
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                  );
                } else if (state is AppointmentBooking) {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) => Center(child: SizedBox.shrink()),
                  );
                }
              },
              child: CustomElevatedButton(
                label: 'Book'.tr(),
                onPressed: () {
                  if (selectedDate == null || selectedTime == null) {
                    Fluttertoast.showToast(
                      msg: 'Please select a date and time'.tr(),
                      backgroundColor: AppColors.darkSurface,
                      textColor: Colors.white,
                    );
                    return;
                  }

                  final appointment = AppointmentModel(
                    patientId: widget.patientModel.uid,
                    doctorId: widget.doctorModel.uid,
                    date: DateFormat('dd MMM').format(selectedDate!),
                    time: selectedTime!,
                  );

                  cubit.bookAppointment(appointment: appointment);
                },
              ),
            ),
          ),
          SizedBox(height: 32.h),
        ],
      ),
    );
  }
}
