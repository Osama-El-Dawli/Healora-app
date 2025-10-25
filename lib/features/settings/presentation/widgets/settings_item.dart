import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/theme/app_colors.dart';

// ignore: must_be_immutable
class SettingsItem extends StatelessWidget {
  IconData icon;
  String title;
  Widget leading;
  VoidCallback onpressed;
  SettingsItem({
    super.key,
    required this.icon,
    required this.title,
    required this.leading,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return SizedBox(
      height: 50.h,
      child: Row(
        children: [
          Icon(icon, color: AppColors.suffixIconColor),
          SizedBox(width: 16.w),
          Text(
            title.tr(),
            style: textTheme.titleSmall!.copyWith(
              color: AppColors.settingsTextColor,
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: onpressed,
            icon: leading,
            color: AppColors.suffixIconColor,
            padding: EdgeInsets.all(0),
          ),
        ],
      ),
    );
  }
}
