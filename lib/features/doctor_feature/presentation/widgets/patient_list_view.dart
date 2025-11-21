import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:healora/core/routes/routes.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/features/auth/register/data/models/user_model.dart';
import 'package:healora/features/doctor_feature/cubit/doctor_feature_cubit.dart';
import 'package:healora/features/doctor_feature/presentation/widgets/loading_placeholder.dart';
import 'package:healora/features/doctor_feature/presentation/widgets/patients_list_view_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PatientListView extends StatelessWidget {
  const PatientListView({super.key, required this.doctor});
  final UserModel doctor;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorFeatureCubit, DoctorFeatureState>(
      builder: (context, state) {
        return state is DoctorFeatureLoading
            ? Skeletonizer(
                effect: ShimmerEffect(
                  baseColor: AppColors.lightGray,
                  highlightColor: AppColors.primary.withValues(alpha: 0.3),
                ),
                enabled: true,
                enableSwitchAnimation: true,
                child: LoadingPlaceholder(),
              )
            : (state is DoctorFeatureSuccess)
            ? ListView.builder(
                itemCount: state.appointments.length,
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 500),
                    delay: const Duration(milliseconds: 100),
                    child: SlideAnimation(
                      verticalOffset: 100.0,
                      curve: Curves.easeOutCubic,
                      child: FadeInAnimation(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(12.r),
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                AppRoutes.appointmentDetailsScreen,
                                arguments: {
                                  'doctor': doctor,
                                  'patientWithAppointment':
                                      state.appointments[index],
                                },
                              );
                            },
                            child: PatientsListViewItem(
                              doctor: doctor,
                              appointment:
                                  '${state.appointments[index].appointment.date} ${DateTime.now().year} | ${state.appointments[index].appointment.time} AM',
                              patient: state.appointments[index].patient,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )
            : (state is DoctorFeatureFailure)
            ? Center(
                child: Text(
                  state.errorMessage,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              )
            : const SizedBox.shrink();
      },
    );
  }
}
