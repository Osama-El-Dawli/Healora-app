import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:healora/features/auth/register/data/models/user_model.dart';

class FirebaseRegisterRemoteDataSource {
  Future<UserModel> register({
    required String firstname,
    required String lastName,
    required String email,
    required String password,
    required String phoneNumber,
    required String role,
  }) async {
    try {
      print('🔹 Register started for $email');

      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      final uid = credential.user?.uid;
      if (uid == null) throw Exception("User ID is null after registration.");

      final user = UserModel(
        uid: uid,
        firstName: firstname,
        lastName: lastName,
        email: email,
        phoneNumber: phoneNumber,
        role: role,
      );

      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'uid': user.uid,
        'firstName': user.firstName,
        'lastName': user.lastName,
        'email': user.email,
        'phoneNumber': user.phoneNumber,
        'role': user.role,
      });

      if (kDebugMode) {
        print('✅ User registered successfully: $uid');
      }
      return user;
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print('❌ FirebaseAuth error: ${e.code} - ${e.message}');
      }
      throw Exception('FirebaseAuth error: ${e.message}');
    } catch (e) {
      if (kDebugMode) {
        print('❌ General registration error: $e');
      }
      throw Exception('Registration failed: $e');
    }
  }
}
