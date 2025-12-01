import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healora/features/auth/register/data/models/user_model.dart';

class UpdateUserInfoRepository {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<UserModel> updateUserData({
    String? firstName,
    String? lastName,
    String? phone,
    String? image,
  }) async {
    final userId = auth.currentUser!.uid;

    final Map<String, dynamic> data = {};
    if (firstName != null) data["firstName"] = firstName;
    if (lastName != null) data["lastName"] = lastName;
    if (phone != null) data["phoneNumber"] = phone;
    if (image != null) data["image"] = image;

    await firestore.collection("users").doc(userId).update(data);

    final doc = await firestore.collection("users").doc(userId).get();

    return UserModel.fromMap(doc.data()!);
  }
}
