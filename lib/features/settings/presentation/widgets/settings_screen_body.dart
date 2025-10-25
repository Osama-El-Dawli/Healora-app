import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/core/widgets/custom_elevated_button.dart';
import 'package:healora/core/widgets/lang_toggle.dart';
import 'package:healora/features/settings/presentation/widgets/settings_list.dart';
import 'package:healora/features/settings/presentation/widgets/settings_screen_header.dart';

class SettingsScreenBody extends StatelessWidget {
  const SettingsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h, right: 20.w, left: 20.w),
      child: Column(
        children: [
          SettingsScreenHeader(),
          SizedBox(height: 12.h),
          SettingsList(),
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
            onPressed: () {},
            color: AppColors.red,
          ),
        ],
      ),
    );
  }
}
