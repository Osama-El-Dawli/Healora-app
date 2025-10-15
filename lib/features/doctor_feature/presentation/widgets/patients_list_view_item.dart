import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/core/utils/app_assets.dart';

class PatientsListViewItem extends StatelessWidget {
  const PatientsListViewItem({super.key, required this.avatarTag});
  final String avatarTag;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: Color(0xffEAF2F7),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
        subtitle: Text(
          '12 Oct, 2025 | 10:00 AM',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: Color(0xff6FA4C8),
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: Hero(
          tag: avatarTag,
          child: CircleAvatar(
            radius: 28.r,
            child: Image.asset(Assets.imagesAvatar),
          ),
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(Icons.chat, color: AppColors.secondary),
        ),
        title: Hero(
          tag: 'name$avatarTag',
          child: Text(
            'Patient',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontSize: 18.sp,
              color: AppColors.primary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
