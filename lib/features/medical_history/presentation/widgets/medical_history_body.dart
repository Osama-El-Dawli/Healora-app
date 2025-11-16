import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/core/utils/app_assets.dart';
import 'package:healora/core/widgets/custom_card.dart';
import 'package:healora/features/auth/register/data/models/user_model.dart';
import 'package:healora/features/medical_history/cubit/medical_history_cubit/medical_history_cubit.dart';
import 'package:healora/features/medical_history/data/models/medical_history_card_model.dart';
import 'package:healora/features/medical_history/presentation/widgets/medical_history_card.dart';
import 'package:healora/features/medical_history/presentation/widgets/medical_history_grid.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MedicalHistoryBody extends StatelessWidget {
  const MedicalHistoryBody({super.key, required this.userModel});
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 200.h,
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
                      padding: EdgeInsets.only(top: 10.h),
                      child: Text(
                        'Medical History'.tr(),
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
                    child: Hero(
                      tag: 'Medical History',
                      child: CustomCard(
                        title: 'Medical History'.tr(),
                        imageUrl: Assets.imagesHomePage1,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 16.h)),
          DecoratedSliver(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: Theme.of(context).brightness == Brightness.dark
                  ? AppColors.darkSurface
                  : AppColors.gray,
            ),
            sliver: SliverPadding(
              padding: EdgeInsets.all(16.r),
              sliver: BlocBuilder<MedicalHistoryCubit, MedicalHistoryState>(
                builder: (context, state) {
                  if (state is MedicalHistoryLoaded) {
                    return state.medicalHistoryList.isEmpty
                        ? SliverToBoxAdapter(
                            child: Center(
                              child: Text('No Medical History'.tr()),
                            ),
                          )
                        : MedicalHistoryGrid(
                            user: userModel,
                            items: state.medicalHistoryList,
                          );
                  } else if (state is MedicalHistoryFailure) {
                    return SliverToBoxAdapter(
                      child: Center(child: Text(state.errorMessage)),
                    );
                  } else if (state is MedicalHistoryLoading) {
                    return SliverToBoxAdapter(
                      child: Skeletonizer(
                        enabled: true,
                        effect: ShimmerEffect(
                          baseColor: AppColors.lightGray,
                          highlightColor: AppColors.primary.withValues(
                            alpha: 0.3,
                          ),
                          duration: const Duration(seconds: 2), // optional
                        ),
                        enableSwitchAnimation: true,
                        child: GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                childAspectRatio: 1.5,
                              ),
                          itemBuilder: (context, index) => MedicalHistoryCard(
                            model: MedicalHistoryModel(
                              description: 'loading',
                              title: 'loading',
                              uid: 'loading',
                            ),
                          ),
                          itemCount: 10,
                        ),
                      ),
                    );
                  } else {
                    return SliverToBoxAdapter(child: SizedBox.shrink());
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
