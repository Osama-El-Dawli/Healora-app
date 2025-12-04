import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:healora/core/routes/routes.dart';
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
    return BlocListener<NotificationCubit, NotificationState>(
      listener: (context, state) {
        if (state is NotificationNavigateToChat) {
          Navigator.pushNamed(
            context,
            AppRoutes.chatScreen,
            arguments: {
              'chatId': state.chatId,
              'otherUser': state.otherUser,
              'currentUser': state.currentUser,
            },
          );
        }
      },
      child: BlocBuilder<NotificationCubit, NotificationState>(
        builder: (context, state) {
          List<NotificationModel> notifications = [];
          if (state is NotificationSuccess) {
            notifications = state.notifications;
          } else if (state is NotificationNavigateToChat) {
            notifications = state.notifications;
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

          if (notifications.isEmpty &&
              (state is NotificationSuccess ||
                  state is NotificationNavigateToChat)) {
            return const Center(child: Text('No notifications'));
          }

          if (notifications.isNotEmpty) {
            return ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                return AnimationConfiguration.staggeredList(
                  duration: Duration(milliseconds: 500),
                  position: index,
                  delay: Duration(milliseconds: 100),
                  child: SlideAnimation(
                    verticalOffset: 100.0,
                    curve: Curves.easeOutCubic,
                    child: FadeInAnimation(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12.r),
                        onTap: () {
                          context
                              .read<NotificationCubit>()
                              .handleNotificationTap(notifications[index].data);
                        },
                        child: CustomNotificationItem(
                          notificationModel: notifications[index],
                          pointColor: pointColors[index % pointColors.length],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
