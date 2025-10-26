import 'package:healora/features/select_doctor/data/data_sources/firebase_select_doctor_remote_data_source.dart';
import 'package:healora/features/select_doctor/data/models/doctor_model.dart';

class SelectDoctorRepo {
  final FirebaseSelectDoctorRemoteDataSource _dataSource;

  SelectDoctorRepo({required FirebaseSelectDoctorRemoteDataSource dataSource})
    : _dataSource = dataSource;

  Future<List<DoctorModel>> getDoctorsBySpecialty({
    required String specialty,
  }) => _dataSource.getDoctorsBySpecialty(specialty: specialty);
}
