import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/routes/routes.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/features/auth/register/data/models/user_model.dart';
import 'package:healora/features/home/presentation/widgets/home_screen_list_view.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key, required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: Column(
          children: [
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '👋🏻 ${'Hi'.tr()} ${user.firstName}',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.pushNamed(
                    context,
                    AppRoutes.settingsScreen,
                    arguments: user,
                  ),
                  child: CircleAvatar(
                    radius: 23.r,
                    backgroundColor: AppColors.lightGray,
                    child: CircleAvatar(
                      radius: 15.r,
                      backgroundImage: AssetImage('assets/images/avatar.png'),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Expanded(child: HomeScreenListView(user: user)),
          ],
        ),
      ),
    );
  }
}
