import 'package:firebase_auth/firebase_auth.dart';

class FirebaseLoginRemoteDatasource {
  Future<String> login({
    required String email,
    required String password,
  }) async {
    UserCredential credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return credential.user!.uid;
  }
}
