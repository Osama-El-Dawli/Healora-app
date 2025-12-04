import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healora/features/auth/register/data/models/user_model.dart';
import 'package:healora/features/notifications/data/models/notification_model.dart';
import 'package:healora/features/select_appointment/data/models/appointment_model.dart';

class NotificationRemoteDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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

  Future<List<NotificationModel>> getNotifications() async {
    final user = _auth.currentUser;
    if (user != null) {
      final snapshot = await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('notifications')
          .get();
      return snapshot.docs
          .map((doc) => NotificationModel.fromFirestore(doc))
          .toList();
    }
    return [];
  }

  Future<UserModel?> getUser(String uid) async {
    final doc = await _firestore.collection('users').doc(uid).get();
    if (doc.exists) {
      return UserModel.fromMap(doc.data()!);
    }
    return null;
  }

  Future<AppointmentModel?> getAppointment(String appointmentId) async {
    final doc = await _firestore
        .collection('appointments')
        .doc(appointmentId)
        .get();
    if (doc.exists) {
      return AppointmentModel.fromFirebase(doc.data()!, doc.id);
    }
    return null;
  }
}
