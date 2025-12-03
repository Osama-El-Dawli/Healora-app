import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:googleapis_auth/auth_io.dart' as auth;

Future<String> getAccessToken() async {
  final jsonString = await rootBundle.loadString(
    'assets/keys/healora-32e1e-526d13230635.json',
  );

  final accountCredentials = auth.ServiceAccountCredentials.fromJson(
    jsonString,
  );

  final scopes = ['https://www.googleapis.com/auth/firebase.messaging'];
  final client = await auth.clientViaServiceAccount(accountCredentials, scopes);

  return client.credentials.accessToken.data;
}

Future<void> sendNotification({
  required String token,
  required String title,
  required String body,
  required Map<String, String> data,
}) async {
  final String accessToken = await getAccessToken();
  final String fcmUrl =
      'https://fcm.googleapis.com/v1/projects/healora-32e1e/messages:send';
  final Dio dio = Dio();
  final String? imageUrl = data['senderImage'];

  final response = await dio.post(
    fcmUrl,
    options: Options(
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
    ),
    data: {
      'message': {
        'token': token,
        'notification': {'title': title, 'body': body, 'image': imageUrl},
        'data': data,

        'android': {
          'notification': {
            'click_action': 'FLUTTER_NOTIFICATION_CLICK',
            'channel_id': 'high_importance_channel',
            'image': imageUrl,
            'visibility': 'public',
            'priority': 'max',
          },
        },
        'apns': {
          'payload': {
            'aps': {'content-available': 1},
          },
        },
      },
    },
  );

  if (response.statusCode == 200) {
    debugPrint('Notification sent successfully');
  } else {
    debugPrint('Failed to send notification: ${response.data}');
  }
}
