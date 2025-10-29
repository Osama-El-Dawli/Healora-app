import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:healora/features/select_doctor/data/models/doctor_model.dart';

class FirebaseSelectDoctorRemoteDataSource {
  final FirebaseFirestore _firebase = FirebaseFirestore.instance;

  Future<List<DoctorModel>> getDoctorsBySpecialty({
    required String specialty,
  }) async {
    final snapshot = await _firebase
        .collection('users')
        .where('role', isEqualTo: 'doctor')
        .where('specialization', isEqualTo: specialty)
        .get();
    return snapshot.docs.map((doc) => DoctorModel.fromMap(doc.data())).toList();
  }
}
