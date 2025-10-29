import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:healora/core/theme/app_colors.dart';

class HaveAccount extends StatelessWidget {
  const HaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'already_have_an_account?'.tr(),
          style: Theme.of(
            context,
          ).textTheme.labelLarge!.copyWith(color: AppColors.darkGreen),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'login'.tr(),
            style: Theme.of(
              context,
            ).textTheme.labelLarge!.copyWith(color: AppColors.primary),
          ),
        ),
      ],
    );
  }
}
