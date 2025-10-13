import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/core/utils/app_assets.dart';

class PatientsListViewItem extends StatelessWidget {
  const PatientsListViewItem({super.key});

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
          '+2 011 2182 3522',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: Color(0xff6FA4C8),
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: Image.asset(Assets.imagesAvatar),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(Icons.chat, color: AppColors.secondary),
        ),
        title: Text(
          'Patient',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
