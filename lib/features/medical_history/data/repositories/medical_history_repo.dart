import 'package:healora/features/medical_history/data/data_sources/medical_history_firebase_data_source.dart';
import 'package:healora/features/medical_history/data/models/medical_history_card_model.dart';

class MedicalHistoryRepo {
  final MedicalHistoryFirebaseDataSource _dataSource;

  MedicalHistoryRepo({required MedicalHistoryFirebaseDataSource dataSource})
    : _dataSource = dataSource;

  Future<List<MedicalHistoryModel>> getMedicalHistoryList({
    required String uid,
  }) => _dataSource.getMedicalHistoryList(uid: uid);

  Future<void> addMedicalHistory({required MedicalHistoryModel model}) =>
      _dataSource.addMedicalHistory(model: model);
}
