import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/features/choose_specialty/data/models/choose_specialty_model.dart';

class ChooseSpecialtyCard extends StatelessWidget {
  const ChooseSpecialtyCard({super.key, required this.choose});
  final ChooseSpecialtyModel choose;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 8.r,
            color: Colors.black.withValues(alpha: 0.16),
            spreadRadius: 0,
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(choose.image, width: 120.w),
          SizedBox(height: 8.h),
          Center(
            child: Text(
              choose.specialtyName,
              textAlign: TextAlign.center,
              style: textTheme.titleSmall?.copyWith(color: AppColors.primary),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
