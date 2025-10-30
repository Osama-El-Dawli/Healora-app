import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/features/medical_history/data/models/medical_history_card_model.dart';

class MedicalHistoryCard extends StatelessWidget {
  const MedicalHistoryCard({super.key, required this.model});
  final MedicalHistoryCardModel model;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 8.r,
            color: Theme.of(context).brightness == Brightness.dark
                ? AppColors.hintColor.withValues(alpha: 0.5)
                : Colors.black.withValues(alpha: 0.16),
            spreadRadius: 0,
          ),
        ],
        color: Theme.of(context).brightness == Brightness.dark
            ? AppColors.lightGray
            : AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Medical History Title",
            style: textTheme.titleSmall?.copyWith(color: AppColors.primary),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 8.h),
          Text(
            "Brief description of the medical history entry goes here.",
            style: textTheme.labelLarge?.copyWith(color: AppColors.hintColor),
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}
