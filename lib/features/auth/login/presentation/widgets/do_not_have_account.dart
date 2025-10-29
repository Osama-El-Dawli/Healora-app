import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:healora/core/routes/routes.dart';
import 'package:healora/core/theme/app_colors.dart';

class DoNotHaveAccount extends StatelessWidget {
  const DoNotHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'dont_have_an_account?'.tr(),
          style: textTheme.labelLarge?.copyWith(color: AppColors.darkGreen),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.registerScreen);
          },
          child: Text(
            'sign_up'.tr(),
            style: textTheme.labelLarge?.copyWith(color: AppColors.primary),
          ),
        ),
      ],
    );
  }
}
