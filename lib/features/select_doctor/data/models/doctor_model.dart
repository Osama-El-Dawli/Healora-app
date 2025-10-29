import 'package:healora/features/auth/register/data/models/user_model.dart';

class DoctorModel extends UserModel {
  DoctorModel({
    required super.uid,
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.phoneNumber,
    required super.role,
    required super.specialization,
  });

  factory DoctorModel.fromMap(Map<String, dynamic> map) {
    return DoctorModel(
      uid: map['uid'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
      role: map['role'],
      specialization: map['specialization'],
    );
  }
}
