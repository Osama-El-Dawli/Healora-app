import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/features/auth/register/data/models/user_model.dart';
import 'package:healora/features/edit_account/cubit/update_account_info_cubit.dart';
import 'package:healora/features/edit_account/cubit/update_account_info_state.dart';

class SettingsScreenHeader extends StatelessWidget {
  const SettingsScreenHeader({super.key, required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: double.infinity,
      child: BlocBuilder<UpdateAccountCubit, UpdateAccountState>(
        builder: (context, state) {
          return Column(
            children: [
              Container(
                padding: EdgeInsets.all(10.r),
                margin: EdgeInsets.all(10.r),
                decoration: BoxDecoration(
                  color: AppColors.gray,
                  borderRadius: BorderRadius.circular(80.r),
                ),
                height: 150,
                width: 150,
                child: CircleAvatar(
                  radius: 28.r,
                  backgroundImage:
                      (user.imageUrl.startsWith('http')
                              ? NetworkImage(user.imageUrl)
                              : AssetImage(user.imageUrl))
                          as ImageProvider,
                ),
              ),

              SizedBox(height: 12.h),
              Text(
                '${user.firstName} ${user.lastName}',
                style: textTheme.titleLarge!.copyWith(color: AppColors.primary),
              ),
              SizedBox(height: 12.h),
              Text(
                user.email,
                style: textTheme.labelSmall!.copyWith(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? AppColors.darkTextSecondary
                      : AppColors.secondary,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
