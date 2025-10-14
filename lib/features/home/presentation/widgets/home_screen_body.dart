import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/features/home/presentation/widgets/home_screen_list_view.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: Column(
        children: [
          SizedBox(height: 24.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '👋🏻 Hi Julia!',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                ),
              ),
              CircleAvatar(
                radius: 23.r,
                backgroundColor: AppColors.lightGray,
                child: CircleAvatar(
                  radius: 15.r,
                  backgroundImage: AssetImage('assets/images/avatar.png'),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Expanded(child: HomeScreenListView()),
        ],
      ),
    );
  }
}
