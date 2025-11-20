import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:healora/features/auth/register/data/models/user_model.dart';
import 'package:healora/features/select_appointment/data/models/appointment_model.dart';

class FirebaseDoctorFeatureRemoteDataSource {
  final FirebaseFirestore _firebase = FirebaseFirestore.instance;

  Future<List<AppointmentModel>> getBookedAppointments({
    required String doctorId,
  }) async {
    try {
      final querySnapshot = await _firebase
          .collection('appointments')
          .where('doctorId', isEqualTo: doctorId)
          .get();

      return querySnapshot.docs
          .map((doc) => AppointmentModel.fromFirebase(doc.data()))
          .toList();
    } catch (e) {
      throw Exception('Error fetching booked appointments: $e');
    }
  }

  Future<List<UserModel>> getBookedPatients({
    required String doctorId,
  }) async {
    try {
      List<AppointmentModel> appointments = await getBookedAppointments(
        doctorId: doctorId,
      );
      Set<String> patientIds = appointments
          .map((appointment) => appointment.patientId)
          .toSet();

      List<UserModel> patients = [];
      for (String patientId in patientIds) {
        DocumentSnapshot patientSnapshot = await _firebase
            .collection('users')
            .doc(patientId)
            .get();
        patients.add(UserModel.fromMap(patientSnapshot.data() as Map<String, dynamic>));
      }
      return patients;
    } catch (e) {
      throw Exception('Error fetching booked patients: $e');
    }
  }
}
