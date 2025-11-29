import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:healora/features/auth/register/data/models/user_model.dart';

class FirebaseLoginRemoteDatasource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    UserCredential credential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    final uid = credential.user!.uid;
    final doc  = await _firestore.collection('users').doc(uid).get();
    return UserModel.fromMap(doc.data()!);
  }

  Future<void> saveDeviceToken({required String userId}) async {
    final token = await FirebaseMessaging.instance.getToken();
    if(token != null) {
      await _firestore.collection('users').doc(userId).update({
        'fcm_token': token,
      });
    }
  }
}
