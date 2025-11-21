import 'package:healora/features/doctor_feature/data/data_sources/firebase_doctor_feature_remote_data_source.dart';
import 'package:healora/features/doctor_feature/data/models/patient_with_appointment.dart';

class DoctorFeatureRepo {
  final FirebaseDoctorFeatureRemoteDataSource _dataSource;

  DoctorFeatureRepo({required FirebaseDoctorFeatureRemoteDataSource dataSource})
    : _dataSource = dataSource;

  Future<List<PatientWithAppointment>> getBookedPatients({required String doctorId}) async {
    final patientsWithAppointments = await _dataSource.getBookedPatients(doctorId: doctorId);
    return patientsWithAppointments;
  }
}
