import 'package:healora/features/doctor_feature/data/data_sources/firebase_doctor_feature_remote_data_source.dart';
import 'package:healora/features/doctor_feature/data/models/patient_with_appointment.dart';
import 'package:healora/features/select_appointment/data/models/appointment_model.dart';

class DoctorFeatureRepo {
  final FirebaseDoctorFeatureRemoteDataSource _dataSource;

  DoctorFeatureRepo({required FirebaseDoctorFeatureRemoteDataSource dataSource})
    : _dataSource = dataSource;

  Future<List<PatientWithAppointment>> getBookedPatients({
    required String doctorId,
  }) async {
    final patientsWithAppointments = await _dataSource.getBookedPatients(
      doctorId: doctorId,
    );
    return patientsWithAppointments;
  }

  Future<void> updateAppointment({
    required AppointmentModel appointment,
  }) async {
    await _dataSource.updateAppointment(appointment: appointment);
  }

  Future<String?> getPatientToken({required String patientId}) async {
    return await _dataSource.getPatientToken(patientId: patientId);
  }
}
