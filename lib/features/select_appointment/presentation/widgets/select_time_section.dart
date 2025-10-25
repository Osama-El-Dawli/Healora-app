import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/features/select_appointment/presentation/widgets/time_item.dart';

class SelectTimeSection extends StatefulWidget {
  const SelectTimeSection({super.key});
  @override
  State<SelectTimeSection> createState() => _SelectTimeSectionState();
}

class _SelectTimeSectionState extends State<SelectTimeSection> {
  int selectedIndex = -1;
  final List<String> times = ['8:00', '8:30', '9:00', '9:30', '10:00', '10:30'];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Available Times on Oct 27,2025",
            style: Theme.of(
              context,
            ).textTheme.titleSmall!.copyWith(color: AppColors.black),
          ),
          SizedBox(height: 15.h),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 3,
              ),
              itemBuilder: (_, index) => AnimationConfiguration.staggeredGrid(
                position: index,
                columnCount: 2,
                duration: const Duration(milliseconds: 500),
                delay: const Duration(milliseconds: 100),
                child: SlideAnimation(
                  verticalOffset: 100.0,
                  curve: Curves.easeOutCubic,
                  child: FadeInAnimation(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12.r),
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: TimeItem(
                        isSelected: index == selectedIndex,
                        text: times[index],
                      ),
                    ),
                  ),
                ),
              ),
              itemCount: times.length,
            ),
          ),
        ],
      ),
    );
  }
}
