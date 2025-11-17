import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseUpdateUserInfoRemoteDataSource {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  FirebaseUpdateUserInfoRemoteDataSource({
    required FirebaseFirestore firestore,
    required FirebaseAuth auth,
  }) : _firestore = firestore,
       _auth = auth;

  Future<Map<String, dynamic>> updateUserData({
    String? firstName,
    String? lastName,
    String? phone,
    String? image,
  }) async {
    final userId = _auth.currentUser?.uid;
    if (userId == null) {
      throw Exception("No logged-in user found");
    }

    final Map<String, dynamic> data = {};
    if (firstName != null) data["firstName"] = firstName;
    if (lastName != null) data["lastName"] = lastName;
    if (phone != null) data["phoneNumber"] = phone;
    if (image != null) data["image"] = image;

    await _firestore.collection("users").doc(userId).update(data);

    final doc = await _firestore.collection("users").doc(userId).get();
    return doc.data() ?? {};
  }
}
