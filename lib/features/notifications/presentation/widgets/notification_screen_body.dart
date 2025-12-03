import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/features/notifications/presentation/widgets/custom_notification_list_view.dart';

class NotificationScreenBody extends StatelessWidget {
  const NotificationScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: Column(
        children: [
          SizedBox(height: 16.h),
          Expanded(child: CustomNotificationListView()),
        ],
      ),
    );
  }
}
