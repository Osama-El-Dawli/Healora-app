import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/core/utils/app_assets.dart';
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
        CustomProfileAvatar(imageUrl: Assets.imagesAvatar),
      ],
    );
  }
}
