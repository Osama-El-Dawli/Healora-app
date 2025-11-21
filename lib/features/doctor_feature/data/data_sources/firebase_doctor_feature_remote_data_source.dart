import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:healora/features/auth/register/data/models/user_model.dart';
import 'package:healora/features/doctor_feature/data/models/patient_with_appointment.dart';
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

  Future<List<PatientWithAppointment>> getBookedPatients({required String doctorId})async {
    try {
      List<AppointmentModel> appointments = await getBookedAppointments(
        doctorId: doctorId,
      );

      List<PatientWithAppointment> result = [];

      for (var appointment in appointments) {
        DocumentSnapshot userSnapshot = await _firebase
            .collection('users')
            .doc(appointment.patientId)
            .get();

        final patient = UserModel.fromMap(
          userSnapshot.data() as Map<String, dynamic>,
        );

        result.add(
          PatientWithAppointment(patient: patient, appointment: appointment),
        );
      }

      return result;
    } catch (e) {
      throw Exception('Error fetching booked patients: $e');
    }
  }
}
