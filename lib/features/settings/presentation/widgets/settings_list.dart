import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/routes/routes.dart';
import 'package:healora/core/theme/app_colors.dart';

import 'package:healora/features/settings/presentation/widgets/settings_item.dart';

class SettingsList extends StatefulWidget {
  const SettingsList({super.key});

  @override
  State<SettingsList> createState() => _SettingsListState();
}

class _SettingsListState extends State<SettingsList> {
  bool isDark = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(24.r),
          splashColor: AppColors.suffixIconColor.withValues(alpha: 0.2),
          onTap: () =>
              Navigator.pushNamed(context, AppRoutes.editAccountScreen),
          child: Padding(
            padding: EdgeInsetsDirectional.only(start: 8.w),
            child: SettingsItem(
              onpressed: () {
                Navigator.pushNamed(context, AppRoutes.editAccountScreen);
              },
              icon: Icons.person,
              title: 'account',
              leading: Icon(Icons.arrow_forward_ios),
            ),
          ),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(24.r),
          splashColor: AppColors.suffixIconColor.withValues(alpha: 0.1),
          onTap: () =>
              Navigator.pushNamed(context, AppRoutes.notificationsScreen),
          child: Padding(
            padding: EdgeInsetsDirectional.only(start: 8.w),
            child: SettingsItem(
              onpressed: () {
                Navigator.pushNamed(context, AppRoutes.notificationsScreen);
              },
              icon: Icons.notifications,
              title: 'notifications',
              leading: Icon(Icons.arrow_forward_ios),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(start: 8.w),
          child: SettingsItem(
            onpressed: () {},
            icon: Icons.dark_mode,
            title: 'dark_mode',
            leading: Switch(
              value: isDark,
              onChanged: (bool value) {
                setState(() {
                  isDark = value;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
