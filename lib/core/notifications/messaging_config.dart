import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:healora/core/cache/hive_manager.dart';
import 'package:healora/core/routes/routes.dart';
import 'package:healora/features/auth/register/data/models/user_model.dart';
import 'package:healora/main.dart';

class MessagingConfig {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static String? currentChatId;

  static Future<void> createNotificationChannel() async {
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      description: 'This channel is used for important notifications.',
      importance: Importance.max,
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(channel);
  }

  static Future<void> initFirebaseMessaging() async {
    await createNotificationChannel();

    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
          requestSoundPermission: false,
          requestBadgePermission: false,
          requestAlertPermission: false,
        );

    const InitializationSettings initializationSettings =
        InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: initializationSettingsIOS,
        );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse payload) {
        log("payload1: ${payload.payload.toString()}");
        if (payload.payload != null) {
          try {
            final data = jsonDecode(payload.payload!);
            handleNotification(data);
          } catch (e) {
            log("Error decoding payload: $e");
          }
        }
        return;
      },
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      log('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      log('User granted provisional permission');
    } else {
      log('User declined or has not accepted permission');
    }

    FirebaseMessaging.onMessage.listen((RemoteMessage event) async {
      log("message received");
      try {
        if (event.data['chatId'] == currentChatId) {
          log(
            "Notification suppressed: User is in chat ${event.data['chatId']}",
          );
          return;
        }

        RemoteNotification? notification = event.notification;
        log(notification!.body.toString());
        log(notification.title.toString());

        var body = notification.body;
        AndroidBitmap<Object>? largeIcon;

        if (event.data['senderImage'] != null) {
          try {
            final String imageUrl = event.data['senderImage'];
            if (imageUrl.startsWith('http')) {
              final Response<List<int>> response = await Dio().get<List<int>>(
                imageUrl,
                options: Options(responseType: ResponseType.bytes),
              );
              if (response.data != null) {
                largeIcon = ByteArrayAndroidBitmap(
                  Uint8List.fromList(response.data!),
                );
              }
            }
          } catch (e) {
            log("Error downloading image: $e");
          }
        }

        await flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              'high_importance_channel',
              'High Importance Notifications',
              channelDescription:
                  'This channel is used for important notifications.',
              icon: '@mipmap/ic_launcher',
              largeIcon: largeIcon,
            ),
            iOS: const DarwinNotificationDetails(
              presentAlert: true,
              presentBadge: true,
              presentSound: true,
            ),
          ),
          payload: jsonEncode(event.data),
        );
      } catch (err) {
        log(err.toString());
      }
    });
  }

  static Future<void> setupInteractedMessage() async {
    FirebaseMessaging.instance.getInitialMessage().then((
      RemoteMessage? message,
    ) {
      if (message != null) {
        handleNotification(message.data);
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      handleNotification(message.data);
    });
  }

  @pragma('vm:entry-point')
  static Future<void> messageHandler(RemoteMessage message) async {
    log('background message ${message.notification!.body}');
  }

  static void handleNotification(Map<String, dynamic> data) {
    log("Handling notification: $data");
    if (data['type'] == 'chat') {
      final String chatId = data['chatId'];
      final String senderId = data['senderId'];
      final String senderName = data['senderName'];
      final String senderImage = data['senderImage'];

      final currentUser = HiveManager.getUser();

      if (currentUser != null) {
        final otherUser = UserModel(
          uid: senderId,
          firstName: senderName.split(' ').first,
          lastName: senderName.split(' ').length > 1
              ? senderName.split(' ').sublist(1).join(' ')
              : '',
          email: '', // Not needed for chat screen display
          phoneNumber: '', // Not needed
          role: '', // Not needed
          specialization: '', // Not needed
          imageUrl: senderImage,
        );

        navigatorKey.currentState?.pushNamed(
          AppRoutes.chatScreen,
          arguments: {
            'chatId': chatId,
            'otherUser': otherUser,
            'currentUser': currentUser,
          },
        );
      }
    }
  }
}
