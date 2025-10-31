import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/core/utils/app_assets.dart';
import 'package:healora/core/widgets/custom_card.dart';
import 'package:healora/features/medical_history/presentation/widgets/medical_history_grid.dart';

class MedicalHistoryBody extends StatelessWidget {
  const MedicalHistoryBody({super.key});

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
              color: Theme.of(context).brightness == Brightness.dark
                  ? AppColors.darkBackground
                  : AppColors.backgroundColor,
              borderRadius: BorderRadius.circular(16.r),
            ),
            sliver: DecoratedSliver(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: Theme.of(context).brightness == Brightness.dark
                    ? AppColors.darkSurface
                    : AppColors.gray,
              ),
              sliver: SliverPadding(
                padding: EdgeInsets.all(16.r),
                sliver: const MedicalHistoryGrid(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
