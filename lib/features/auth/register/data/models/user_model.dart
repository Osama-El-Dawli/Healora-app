import 'package:firebase_auth/firebase_auth.dart';
import 'package:healora/core/utils/app_assets.dart';
import 'package:hive_ce/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  @HiveField(0)
  final String uid;
  @HiveField(1)
  String firstName;
  @HiveField(2)
  String lastName;
  @HiveField(3)
  final String email;
  @HiveField(4)
  String phoneNumber;
  @HiveField(5)
  final String role;
  @HiveField(6)
  final String specialization;
  @HiveField(7)
  String imageUrl;

  UserModel({
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.role,
    required this.specialization,
    this.imageUrl = Assets.imagesAvatar,
  });

  factory UserModel.fromFirebase(User firebaseUser) {
    return UserModel(
      uid: firebaseUser.uid,
      email: firebaseUser.email ?? '',
      firstName: '',
      lastName: '',
      phoneNumber: '',
      role: '',
      specialization: '',
      imageUrl: Assets.imagesAvatar,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'role': role,
      'specialization': specialization,
      'image': imageUrl,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      email: map['email'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      role: map['role'] ?? '',
      specialization: map['specialization'] ?? '',
      imageUrl: map['image'] ?? Assets.imagesAvatar,
    );
  }
}
