import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/features/notifications/data/models/notification_model.dart';

class CustomNotificationItem extends StatelessWidget {
  const CustomNotificationItem({
    super.key,
    required this.notificationModel,
    required this.pointColor,
  });
  final NotificationModel notificationModel;
  final Color pointColor;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.lightGray),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 12.w,
                height: 12.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: pointColor,
                ),
              ),
              SizedBox(width: 16.w),
              Text(
                notificationModel.title,
                style: textTheme.titleSmall?.copyWith(
                  color: Theme.of(context).brightness == Brightness.light
                      ? AppColors.primary
                      : AppColors.lightGray,
                ),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(width: 12.w + 16.w),
              Text(
                notificationModel.body,
                style: textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w400,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
