import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/features/lab_results/data/models/lab_results_card_model.dart';

class LabResultCard extends StatelessWidget {
  const LabResultCard({super.key, required this.model});
  final LabResultsModel model;
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 8.r,
            color: Theme.of(context).brightness == Brightness.dark
                ? AppColors.hintColor.withValues(alpha: 0.6)
                : Colors.black.withValues(alpha: 0.16),
          ),
        ],
        color: Theme.of(context).brightness == Brightness.dark
            ? AppColors.lightGray
            : AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (model.imageUrl != null) ...[
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Image.network(
                model.imageUrl!,
                height: 120.h,
                width: double.infinity,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    height: 120.h,
                    width: double.infinity,
                    color: Colors.grey[200],
                    child: Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 120.h,
                    width: double.infinity,
                    color: Colors.grey[200],
                    child: Icon(Icons.error, color: Colors.red),
                  );
                },
              ),
            ),
            SizedBox(height: 8.h),
          ],
          Text(
            model.title,
            style: textTheme.titleSmall?.copyWith(color: AppColors.primary),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 8.h),
          Text(
            model.description,
            style: textTheme.labelLarge?.copyWith(color: AppColors.hintColor),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
