import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationModel {
  final String? id;
  final String title;
  final String body;

  const NotificationModel({this.id, required this.title, required this.body});

  factory NotificationModel.fromFirestore(DocumentSnapshot doc) {
    return NotificationModel(
      id: doc.id,
      title: doc['title'],
      body: doc['body'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {'title': title, 'body': body};
  }
}
