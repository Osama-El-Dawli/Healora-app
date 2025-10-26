import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:healora/features/auth/register/data/models/user_model.dart';

class FirebaseRegisterRemoteDataSource {
  Future<UserModel> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String phoneNumber,
    required String role,
    required String specialization,
  }) async {
    try {
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (kDebugMode) {
        print("✅ Firebase registration completed");
      }

      if (credential.user == null) {
        if (kDebugMode) {
          print("❌ credential.user is NULL");
        }
        throw Exception(
          "User is null after registration — FirebaseAuth failed.",
        );
      }

      final uid = credential.user!.uid;
      if (kDebugMode) {
        print("✅ UID created: $uid");
      }

      final user = UserModel(
        uid: uid,
        firstName: firstName,
        lastName: lastName,
        email: email,
        phoneNumber: phoneNumber,
        role: role,
        specialization: specialization,
      );

      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'uid': user.uid,
        'firstName': user.firstName,
        'lastName': user.lastName,
        'email': user.email,
        'phoneNumber': user.phoneNumber,
        'role': user.role,
        'specialization': user.specialization,
      });
      if (kDebugMode) {
        print("✅ User data saved in Firestore successfully");
      }

      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw Exception("This email is already in use.".tr());
      } else if (e.code == 'weak-password') {
        throw Exception("Password is too weak.".tr());
      } else {
        throw Exception(e.message ?? "Firebase authentication error.".tr());
      }
    } catch (e) {
      throw Exception("Registration failed: $e");
    }
  }
}
