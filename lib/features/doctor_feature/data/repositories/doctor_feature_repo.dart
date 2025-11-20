import 'package:healora/features/auth/register/data/models/user_model.dart';
import 'package:healora/features/doctor_feature/data/data_sources/firebase_doctor_feature_remote_data_source.dart';
import 'package:healora/features/select_appointment/data/models/appointment_model.dart';

class DoctorFeatureRepo {
  final FirebaseDoctorFeatureRemoteDataSource _dataSource;

  DoctorFeatureRepo({required FirebaseDoctorFeatureRemoteDataSource dataSource})
    : _dataSource = dataSource;

  Future<List<AppointmentModel>> getBookedAppointments({
    required String doctorId,
  }) {
    return _dataSource.getBookedAppointments(doctorId: doctorId);
  }

  Future<List<UserModel>> getBookedPatients({
    required String doctorId,
  }) {
    return _dataSource.getBookedPatients(doctorId: doctorId);
  }
}
