import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/theme/app_colors.dart';

class CustomInfoCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String image;
  final Widget? trailing;
  const CustomInfoCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.lightGray,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
          leading: CircleAvatar(
            radius: 28.r,
            backgroundImage: AssetImage(image),
          ),
          title: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: Text(
            subTitle,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: AppColors.hintColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: trailing,
        ),
      ),
    );
  }
}
