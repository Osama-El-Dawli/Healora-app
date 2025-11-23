import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService {
  Future<void> configNotification() async {
    final notificationSettings = await FirebaseMessaging.instance
        .requestPermission(provisional: true);
    if (notificationSettings.authorizationStatus ==
        AuthorizationStatus.authorized) {
      log('Authorization Status: ${notificationSettings.authorizationStatus}');
      FirebaseMessaging.instance.getToken().then((token) {
        log('Firebase Messaging Token: $token');
      });

      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        log(message.notification!.title.toString());
        log(message.notification!.body.toString());
      });

      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        log('Background: ${message.notification!.title}');
        log('Background: ${message.notification!.body}');
      });
    }
  }
}
