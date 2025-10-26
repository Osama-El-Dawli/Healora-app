import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/routes/routes.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/core/widgets/custom_profile_avatar.dart';
import 'package:healora/features/auth/register/data/models/user_model.dart';

class DoctorHeader extends StatelessWidget {
  final UserModel user;

  const DoctorHeader({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '👋🏻 ${'Hi'.tr()} ${user.firstName}',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.w700,
          ),
        ),
        Spacer(),
        InkWell(
          borderRadius: BorderRadius.circular(23.r),
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRoutes.settingsScreen,
              arguments: user,
            );
          },
          child: CustomProfileAvatar(imageUrl: user.imageUrl),
        ),
      ],
    );
  }
}
