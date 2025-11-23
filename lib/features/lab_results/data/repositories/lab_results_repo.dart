import 'package:healora/features/lab_results/data/data_sources/lab_results_firebase_data_source.dart';
import 'package:healora/features/lab_results/data/models/lab_results_card_model.dart';

class LabResultsRepo {
  final LabResultsFirebaseDataSource _dataSource;

  LabResultsRepo({required LabResultsFirebaseDataSource dataSource})
      : _dataSource = dataSource;

  Future<List<LabResultsModel>> getLabResultsList({
    required String uid,
  }) => _dataSource.getLabResultsList(uid: uid);

  Future<void> addLabResults({required LabResultsModel model}) =>
      _dataSource.addLabResults(model: model);

  Future<LabResultsModel> updateLabResults({
    required String docId,
    required LabResultsModel model,
  }) => _dataSource.updateLabResults(docId: docId, model: model);
}
