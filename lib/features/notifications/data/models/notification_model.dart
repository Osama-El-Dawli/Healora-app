import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationModel {
  final String? id;
  final String title;
  final String body;
  final DateTime timestamp;
  final Map<String, dynamic> data;

  const NotificationModel({
    this.id,
    required this.title,
    required this.body,
    required this.timestamp,
    required this.data,
  });

  factory NotificationModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return NotificationModel(
      id: doc.id,
      title: data['title'] ?? '',
      body: data['body'] ?? '',
      timestamp: (data['timestamp'] as Timestamp).toDate(),
      data: Map<String, dynamic>.from(data['data'] ?? {}),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'body': body,
      'timestamp': Timestamp.fromDate(timestamp),
      'data': data,
    };
  }
}
