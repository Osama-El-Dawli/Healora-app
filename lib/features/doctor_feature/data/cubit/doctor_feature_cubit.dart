import 'package:bloc/bloc.dart';
import 'package:healora/features/auth/register/data/models/user_model.dart';
import 'package:healora/features/doctor_feature/data/repositories/doctor_feature_repo.dart';

part 'doctor_feature_state.dart';

class DoctorFeatureCubit extends Cubit<DoctorFeatureState> {
  DoctorFeatureCubit(this._repo) : super(DoctorFeatureInitial());
  final DoctorFeatureRepo _repo;
  Future<void> fetchBookedPatients({required String doctorId}) async {
    emit(DoctorFeatureLoading());
    try {
      final patients = await _repo.getBookedPatients(doctorId: doctorId);
      emit(DoctorFeatureSuccess(patients: patients));
    } catch (e) {
      emit(DoctorFeatureFailure(errorMessage: e.toString()));
    }
  }
}
