import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:healora/core/routes/routes.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/features/doctor_feature/data/cubit/doctor_feature_cubit.dart';
import 'package:healora/features/doctor_feature/presentation/widgets/loading_placeholder.dart';
import 'package:healora/features/doctor_feature/presentation/widgets/patients_list_view_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PatientListView extends StatelessWidget {
  const PatientListView({super.key});

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
                ignoreContainers: true,
                enableSwitchAnimation: true,
                child: LoadingPlaceholder(),
              )
            : (state is DoctorFeatureSuccess)
            ? ListView.builder(
                itemCount: state.patients.length,
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
                                arguments: 'avatar$index',
                              );
                            },
                            child: PatientsListViewItem(
                              patient: state.patients[index],
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
