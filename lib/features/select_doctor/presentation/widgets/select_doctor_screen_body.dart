import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/core/utils/app_assets.dart';
import 'package:healora/core/widgets/custom_card.dart';
import 'package:healora/core/widgets/custom_info_card.dart';
import 'package:healora/features/auth/register/data/models/user_model.dart';
import 'package:healora/features/select_doctor/cubit/select_doctor_cubit/select_doctor_cubit.dart';
import 'package:healora/features/select_doctor/presentation/widgets/select_doctor_list_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SelectDoctorScreenBody extends StatelessWidget {
  const SelectDoctorScreenBody({super.key, required this.patient});
  final UserModel patient;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return BlocBuilder<SelectDoctorCubit, SelectDoctorState>(
      builder: (context, state) {
        return SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                expandedHeight: 180.h,
                flexibleSpace: LayoutBuilder(
                  builder: (context, constraints) {
                    final double top = constraints.biggest.height;
                    final double collapsedHeight =
                        kToolbarHeight + MediaQuery.of(context).padding.top;
                    final double expandedHeight =
                        200.h + MediaQuery.of(context).padding.top;

                    double scrollRatio =
                        ((top - collapsedHeight) /
                                (expandedHeight - collapsedHeight))
                            .clamp(0.0, 1.0);

                    double opacity = scrollRatio > 0.7
                        ? 0.0
                        : (1 - (scrollRatio / 0.7)).clamp(0.0, 1.0);

                    return FlexibleSpaceBar(
                      title: Opacity(
                        opacity: opacity,
                        child: Padding(
                          padding: EdgeInsets.only(top: 12.h),
                          child: Text(
                            'Choose a Doctor'.tr(),
                            style: textTheme.titleMedium,
                          ),
                        ),
                      ),
                      background: Padding(
                        padding: EdgeInsets.only(
                          left: 16.w,
                          right: 16.w,
                          top: kToolbarHeight + 16.h,
                        ),
                        child: CustomCard(
                          title: 'Choose a Doctor'.tr(),
                          imageUrl: Assets.imagesHomePage3,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 24.h)),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                sliver: Builder(
                  builder: (context) {
                    if (state is SelectDoctorLoading) {
                      return SliverToBoxAdapter(
                        child: Skeletonizer(
                          containersColor: AppColors.lightGray.withValues(
                            alpha: 0.5,
                          ),
                          enableSwitchAnimation: true,
                          enabled: true,
                          child: Column(
                            children: List.generate(
                              5,
                              (index) => Padding(
                                padding: EdgeInsets.only(bottom: 12.h),
                                child: CustomInfoCard(
                                  title: 'Loading...',
                                  image: Assets.imagesAvatar,
                                  subTitle: 'Loading...',
                                  trailing: Icon(
                                    Icons.chat,
                                    color: AppColors.secondary.withValues(
                                      alpha: 0.3,
                                    ),
                                    size: 28.sp,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    } else if (state is SelectDoctorSuccess) {
                      return SelectDoctorListView(
                        patient: patient,
                        doctors: state.doctors,
                      );
                    } else if (state is SelectDoctorFailure) {
                      return SliverToBoxAdapter(
                        child: Center(
                          child: Text(
                            state.errorMessage.tr(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    } else {
                      return const SliverToBoxAdapter(child: SizedBox.shrink());
                    }
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
