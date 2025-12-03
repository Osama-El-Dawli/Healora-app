import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:healora/core/theme/app_colors.dart';
import 'package:healora/features/notifications/cubit/notification_cubit.dart';
import 'package:healora/features/notifications/data/models/notification_model.dart';
import 'package:healora/features/notifications/presentation/widgets/custom_notification_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
    return BlocBuilder<NotificationCubit, NotificationState>(
      builder: (context, state) {
        if (state is NotificationSuccess) {
          if (state.notifications.isEmpty) {
            return const Center(child: Text('No notifications'));
          }
          return ListView.builder(
            itemCount: state.notifications.length,
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
                      notificationModel: state.notifications[index],
                      pointColor: pointColors[index % pointColors.length],
                    ),
                  ),
                ),
              );
            },
          );
        } else if (state is NotificationFailure) {
          return const Center(child: Text('Failed to load notifications'));
        } else if (state is NotificationLoading) {
          return Skeletonizer(
            enabled: true,
            enableSwitchAnimation: true,
            effect: ShimmerEffect(
              baseColor: AppColors.lightGray,
              highlightColor: AppColors.primary.withValues(alpha: 0.3),
            ),
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return CustomNotificationItem(
                  notificationModel: NotificationModel(
                    title: 'title',
                    body: 'body',
                    timestamp: DateTime.now(),
                    data: const {},
                  ),
                  pointColor: pointColors[index % pointColors.length],
                );
              },
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
