import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/features/choose_specialty/presentation/widgets/choose_specialty_grid.dart';

class ChooseSpecialityBody extends StatelessWidget {
  const ChooseSpecialityBody({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppColors.gray,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 50.h,
            flexibleSpace: LayoutBuilder(
              builder: (context, constraints) {
                final double top = constraints.biggest.height;
                final double collapsedHeight =
                    kToolbarHeight + MediaQuery.of(context).padding.top;
                final double expandedHeight =
                    50.h + MediaQuery.of(context).padding.top;

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
                        'speciality'.tr(),
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
                    child: Center(child: Text("speciality".tr(),style:
                    TextStyle(fontWeight: FontWeight.bold,fontSize: 30),))
                    ),
                );
              },
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 16.h)),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: AppColors.gray,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: const ChooseSpecialtyGrid(
              ),
            ),
          ),
        ],
      ),
    );
  }
}
