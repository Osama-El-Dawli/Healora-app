import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:healora/core/routes/routes.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/core/widgets/custom_elevated_button.dart';
import 'package:healora/core/widgets/lang_toggle.dart';
import 'package:healora/core/widgets/loading_indicator.dart';
import 'package:healora/features/auth/register/data/models/user_model.dart';
import 'package:healora/features/settings/cubits/logout_cubit/logout_cubit.dart';
import 'package:healora/features/settings/presentation/widgets/settings_list.dart';
import 'package:healora/features/settings/presentation/widgets/settings_screen_header.dart';

class SettingsScreenBody extends StatelessWidget {
  const SettingsScreenBody({super.key, required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LogoutCubit, LogoutState>(
      listener: (context, state) {
        if (state is LogoutSuccess) {
          Navigator.pop(context);
          Navigator.of(
            context,
          ).pushNamedAndRemoveUntil(AppRoutes.loginScreen, (route) => false);
          Fluttertoast.showToast(
            msg: "logout_successfully".tr(),
            textColor: Colors.white,
            backgroundColor: AppColors.secondary,
          );
        } else if (state is LogoutFailure) {
          Navigator.pop(context);
          Fluttertoast.showToast(
            msg: state.errorMessage,
            textColor: Colors.white,
            backgroundColor: AppColors.red,
          );
        } else if (state is LogoutLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const LoadingIndicator(),
          );
        }
      },
      child: Padding(
        padding: EdgeInsets.only(top: 20.h, right: 20.w, left: 20.w),
        child: Column(
          children: [
            SettingsScreenHeader(user: user),
            SizedBox(height: 12.h),
            SettingsList(user: user),
            Spacer(),
            LanguageSwitchRow(
              currentLang: context.locale.languageCode,
              onSelect: (lang) async {
                await context.setLocale(Locale(lang));
              },
            ),
            SizedBox(height: 12.h),

            CustomElevatedButton(
              label: 'logout'.tr(),
              onPressed: () {
                context.read<LogoutCubit>().logout(uid: user.uid);
              },
              color: AppColors.red,
            ),
            SizedBox(height: 12.h),
          ],
        ),
      ),
    );
  }
}
