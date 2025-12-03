import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/features/notifications/data/models/notification_model.dart';
import 'package:healora/features/notifications/presentation/widgets/custom_notification_item.dart';

class CustomNotificationListView extends StatelessWidget {
  const CustomNotificationListView({super.key});

  static const List<Color> pointColors = [
    Colors.purple,
    AppColors.secondary,
    Colors.blueAccent,
    Colors.redAccent,
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return AnimationConfiguration.staggeredList(
          duration: Duration(milliseconds: 500),
          position: index,
          delay: Duration(milliseconds: 100),
          child: SlideAnimation(
            verticalOffset: 100.0,
            curve: Curves.easeOutCubic,
            child: FadeInAnimation(
              child: CustomNotificationItem(
                notificationModel: NotificationModel(
                  title: 'title',
                  body: 'body',
                ),
                pointColor: pointColors[index % pointColors.length],
              ),
            ),
          ),
        );
      },
    );
  }
}
