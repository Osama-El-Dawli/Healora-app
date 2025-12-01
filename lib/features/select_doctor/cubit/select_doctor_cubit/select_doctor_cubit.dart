import 'package:bloc/bloc.dart';
import 'package:healora/features/select_doctor/data/models/doctor_model.dart';
import 'package:healora/features/select_doctor/data/repositories/select_doctor_repo.dart';

part 'select_doctor_state.dart';

class SelectDoctorCubit extends Cubit<SelectDoctorState> {
  SelectDoctorCubit(this._selectDoctorRepo) : super(SelectDoctorInitial());
  final SelectDoctorRepo _selectDoctorRepo;

  Future<void> getDoctorsBySpecialty({required String specialty}) async {
    emit(SelectDoctorLoading());
    try {
      final doctors = await _selectDoctorRepo.getDoctorsBySpecialty(
        specialty: specialty,
      );
      emit(SelectDoctorSuccess(doctors: doctors));
    } catch (e) {
      emit(SelectDoctorFailure(errorMessage: e.toString()));
    }
  }
}
