import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/core/utils/app_assets.dart';
import 'package:healora/features/lab_results/cubit/lab_results_cubit.dart';
import 'package:healora/features/lab_results/data/models/lab_results_card_model.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/widgets/custom_card.dart';
import '../../../auth/register/data/models/user_model.dart';
import 'lab_results_card.dart';
import 'lab_results_grid.dart';

class LabResultsBody extends StatelessWidget {
  const LabResultsBody({super.key, required this.userModel});
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
                        'Lab Results'.tr(),
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
                      tag: 'Lab Results',
                      child: CustomCard(
                        title: 'Lab Results'.tr(),
                        imageUrl: Assets.imagesHomePage2,
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
              sliver: BlocBuilder<LabResultsCubit, LabResultsState>(
                builder: (context, state) {
                  if (state is LabResultsLoaded) {
                    return state.LabResultsList.isEmpty
                        ? SliverToBoxAdapter(
                      child: Center(
                        child: Text('No Lab Results'.tr()),
                      ),
                    )
                        : LabCardGrid(
                      user: userModel,
                      items: state.LabResultsList,
                    );
                  } else if (state is LabResultsFailure) {
                    return SliverToBoxAdapter(
                      child: Center(child: Text(state.errorMessage)),
                    );
                  } else if (state is   LabResultsLoading) {
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
                          itemBuilder: (context, index) => LabResultCard(
                            model: LabResultsModel(
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
