import 'package:bloc/bloc.dart';
import 'package:healora/features/lab_results/data/models/lab_results_card_model.dart';
import 'package:healora/features/lab_results/data/repositories/lab_results_repo.dart';
part 'lab_results_state.dart';

class LabResultsCubit extends Cubit<LabResultsState> {
  LabResultsCubit(this._repo) : super(LabResultsInitial());
  final LabResultsRepo _repo;

  Future<void> addLabResults({required LabResultsModel model}) async {
    emit(LabResultsLoading());
    try {
      await _repo.addLabResults(model: model);
      emit(LabResultsAdded());
    } catch (e) {
      emit(LabResultsFailure(errorMessage: e.toString()));
    }
  }

  Future<void> getLabResultsList({required String uid}) async {
    try {
      emit(LabResultsLoading());
      List<LabResultsModel> models = await _repo.getLabResultsList(
        uid: uid,
      );
      emit(LabResultsLoaded(LabResultsList: models));
    } catch (e) {
      emit(LabResultsFailure(errorMessage: e.toString()));
    }
  }

  Future<void> updateLabResults({
    required String docId,
    required LabResultsModel model,
  }) async {
    try {
      emit(LabResultsLoading());
      await _repo. updateLabResults(docId: docId, model: model);
      emit(LabResultsUpdated());
      List<LabResultsModel> models = await _repo.getLabResultsList(
        uid: model.uid,
      );
      emit(LabResultsLoaded(LabResultsList: models));
    } catch (e) {
      emit(LabResultsFailure(errorMessage: e.toString()));
    }
  }
}
