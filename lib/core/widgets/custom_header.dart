import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/routes/routes.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/core/widgets/custom_profile_avatar.dart';
import 'package:healora/features/auth/register/data/models/user_model.dart';
import 'package:healora/features/edit_account/cubit/update_account_info_cubit.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({
    super.key,
    required this.user,
    required this.updateUserCubit,
  });

  final UserModel user;
  final UpdateAccountCubit updateUserCubit;

  @override
  Widget build(BuildContext context) {
    return Row(
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
          borderRadius: BorderRadius.circular(23.r),
          onTap: () => Navigator.pushNamed(
            context,
            AppRoutes.settingsScreen,
            arguments: {'user': user, 'cubit': updateUserCubit},
          ),
          child: CustomProfileAvatar(imageUrl: user.imageUrl),
        ),
      ],
    );
  }
}
