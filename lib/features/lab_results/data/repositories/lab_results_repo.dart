import 'dart:io';
import 'package:healora/features/lab_results/data/data_sources/lab_results_firebase_data_source.dart';
import 'package:healora/features/lab_results/data/data_sources/lab_results_supabase_storage_data_source.dart';
import 'package:healora/features/lab_results/data/models/lab_results_card_model.dart';

class LabResultsRepo {
  final LabResultsFirebaseDataSource _firestore;
  final LabResultsSupabaseStorageDataSource _storageService;

  LabResultsRepo({
    required LabResultsFirebaseDataSource firestore,
    required LabResultsSupabaseStorageDataSource storageService,
  }) : _firestore = firestore,
       _storageService = storageService;

  Future<List<LabResultsModel>> getLabResultsList({required String uid}) =>
      _firestore.getLabResultsList(uid: uid);

  Future<void> addLabResults({
    required LabResultsModel model,
    File? imageFile,
  }) async {
    String? imageUrl;
    if (imageFile != null) {
      imageUrl = await _storageService.uploadFile(
        imageFile,
        'lab_results/${model.uid}',
        'lab_results',
      );
    }

    final newModel = LabResultsModel(
      uid: model.uid,
      title: model.title,
      description: model.description,
      imageUrl: imageUrl,
    );

    await _firestore.addLabResults(model: newModel);
  }

  Future<LabResultsModel> updateLabResults({
    required String docId,
    required LabResultsModel model,
    File? imageFile,
  }) async {
    String? imageUrl = model.imageUrl;
    if (imageFile != null) {
      if (imageUrl != null) {
        try {
          final Uri uri = Uri.parse(imageUrl);
          final String path = uri.pathSegments.last;
          await _storageService.deleteFile(path, 'lab_results');
        } catch (e) {
          throw Exception('Error deleting old image: $e');
        }
      }

      imageUrl = await _storageService.uploadFile(
        imageFile,
        'lab_results/${model.uid}',
        'lab_results',
      );
    }

    final newModel = LabResultsModel(
      id: model.id,
      uid: model.uid,
      title: model.title,
      description: model.description,
      imageUrl: imageUrl,
    );

    return _firestore.updateLabResults(docId: docId, model: newModel);
  }
}
