import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/core/utils/app_assets.dart';
import 'package:healora/features/auth/register/data/models/user_model.dart';

class SettingsScreenHeader extends StatelessWidget {
  const SettingsScreenHeader({super.key, required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                padding: EdgeInsets.all(10.r),
                margin: EdgeInsets.all(10.r),
                decoration: BoxDecoration(
                  color: AppColors.gray,
                  borderRadius: BorderRadius.circular(70.r),
                ),
                height: 150,
                width: 150,
                child: CircleAvatar(
                  radius: 28.r,
                  child: Image.asset(Assets.imagesAvatar),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(28.r)),
                  child: Container(
                    margin: EdgeInsets.all(8.r),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.black.withValues(alpha: 0.2),
                          blurRadius: 5,
                          offset: Offset(0, 4),
                        ),
                      ],
                      color: AppColors.backgroundColor,
                      borderRadius: BorderRadius.all(Radius.circular(28.r)),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.edit),
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            '${user.firstName} ${user.lastName}',
            style: textTheme.titleLarge!.copyWith(color: AppColors.primary),
          ),
          SizedBox(height: 12.h),
          Text(
            user.email,
            style: textTheme.labelSmall!.copyWith(color: AppColors.secondary),
          ),
        ],
      ),
    );
  }
}
