import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healora/features/notifications/data/models/notification_model.dart';

abstract class NotificationRemoteDataSource {
  Future<void> saveNotification(NotificationModel notification);
}

class NotificationRemoteDataSourceImpl implements NotificationRemoteDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<void> saveNotification(NotificationModel notification) async {
    final user = _auth.currentUser;
    if (user != null) {
      await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('notifications')
          .add(notification.toFirestore());
    }
  }
}
