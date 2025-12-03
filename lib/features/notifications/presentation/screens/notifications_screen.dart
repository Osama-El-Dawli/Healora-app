import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:healora/features/notifications/presentation/widgets/notification_screen_body.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notifications'.tr())),
      body: NotificationScreenBody(),
    );
  }
}
