import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/routes/routes.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/core/widgets/auth_header.dart';
import 'package:healora/core/widgets/custome_elevated_button.dart';
import 'package:healora/core/widgets/custome_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = AppRoutes.loginScreen;

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                AuthHeader(message: 'welcome_back'.tr(), action: 'login'.tr()),
                CustomeTextFormField(hintText: 'email'.tr()),
                CustomeTextFormField(
                  hintText: 'password'.tr(),
                  isPassword: true,
                ),
                SizedBox(height: 12.h),
                SizedBox(
                  width: double.infinity,
                  child: CustomeElevatedButton(
                    onPressed: () {},
                    label: 'login'.tr(),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'dont_have_an_account?'.tr(),
                      style: textTheme.labelLarge?.copyWith(
                        color: AppColors.darkGreen,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          AppRoutes.registerScreen,
                        );
                      },
                      child: Text(
                        'sign_up'.tr(),
                        style: textTheme.labelLarge?.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
