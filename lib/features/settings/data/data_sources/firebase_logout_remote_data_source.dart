import 'package:firebase_auth/firebase_auth.dart';
import 'package:healora/core/cache/hive_manager.dart';

class FirebaseLogoutRemoteDataSource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future<void> logout({required String uid}) async {
    await _firebaseAuth.signOut();
    HiveManager.removeUser(uid);
  }
}
