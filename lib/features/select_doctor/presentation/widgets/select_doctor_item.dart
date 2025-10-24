import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/features/select_doctor/data/models/select_doctor_model.dart';

class SelectDoctorItem extends StatelessWidget {
  final SelectDoctorModel model;
  const SelectDoctorItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightGray,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: ListTile(
        leading: CircleAvatar(radius: 28.r, backgroundImage: AssetImage(model.image)),
        title: Text(
          model.name,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          model.specialty,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
            color: AppColors.hintColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(Icons.chat, color: AppColors.secondary, size: 24.sp),
        ),
      ),
    );
  }
}
