import 'package:bloc/bloc.dart';
import 'package:healora/features/medical_history/data/models/medical_history_card_model.dart';
import 'package:healora/features/medical_history/data/repositories/medical_history_repo.dart';
part 'medical_history_state.dart';

class MedicalHistoryCubit extends Cubit<MedicalHistoryState> {
  MedicalHistoryCubit(this._repo) : super(MedicalHistoryInitial());
  final MedicalHistoryRepo _repo;

  Future<void> addMedicalHistory({required MedicalHistoryModel model}) async {
    emit(MedicalHistoryLoading());
    try {
      await _repo.addMedicalHistory(model: model);
      emit(MedicalHistoryAdded());
    } catch (e) {
      emit(MedicalHistoryFailure(errorMessage: e.toString()));
    }
  }

  Future<void> getMedicalHistoryList({required String uid}) async {
    try {
      emit(MedicalHistoryLoading());
      List<MedicalHistoryModel> models = await _repo.getMedicalHistoryList(
        uid: uid,
      );
      emit(MedicalHistoryLoaded(medicalHistoryList: models));
    } catch (e) {
      emit(MedicalHistoryFailure(errorMessage: e.toString()));
    }
  }

  Future<void> updateMedicalHistory({
    required String docId,
    required MedicalHistoryModel model,
  }) async {
    try {
      emit(MedicalHistoryLoading());
      await _repo.updateMedicalHistory(docId: docId, model: model);
      emit(MedicalHistoryUpdated());
      List<MedicalHistoryModel> models = await _repo.getMedicalHistoryList(
        uid: model.uid,
      );
      emit(MedicalHistoryLoaded(medicalHistoryList: models));
    } catch (e) {
      emit(MedicalHistoryFailure(errorMessage: e.toString()));
    }
  }
}
