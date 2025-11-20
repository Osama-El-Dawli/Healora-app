import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/core/utils/app_assets.dart';
import 'package:healora/features/auth/register/data/models/user_model.dart';

class PatientsListViewItem extends StatelessWidget {
  const PatientsListViewItem({super.key, required this.patient});
  final UserModel patient;

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
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: AppColors.hintColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: Hero(
          tag: patient.uid,
          child: CircleAvatar(
            radius: 28.r,
            child: patient.imageUrl.startsWith('http')
                ? Image.network(patient.imageUrl)
                : Image.asset(Assets.imagesAvatar),
          ),
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.chat,
            color: Theme.of(context).brightness == Brightness.dark
                ? AppColors.primary
                : AppColors.darkGreen,
          ),
        ),
        title: Hero(
          tag: 'name${patient.uid}',
          child: Text(
            '${patient.firstName} ${patient.lastName}',
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
