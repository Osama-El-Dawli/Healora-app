import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:healora/core/constants/app_constants.dart';
import 'package:healora/features/lab_results/data/models/lab_results_card_model.dart';

class LabResultsFirebaseDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<LabResultsModel>> getLabResultsList({
    required String uid,
  }) async {
    final snapshot = await _firestore
        .collection(AppConstants.labResultsCollection)
        .where('uid', isEqualTo: uid)
        .get();

    return snapshot.docs
        .map((doc) =>
        LabResultsModel.fromFirebase(doc.data(), doc.id))
        .toList();
  }

  Future<void> addLabResults({required LabResultsModel model}) async {
    await _firestore
        .collection(AppConstants.labResultsCollection)
        .add(model.toFirebase());
  }

  Future<LabResultsModel> updateLabResults({
    required String docId,
    required LabResultsModel model,
  }) async {
    await _firestore
        .collection(AppConstants.labResultsCollection)
        .doc(docId)
        .update(model.toFirebase());
    var snapshot = await _firestore
        .collection(AppConstants.labResultsCollection)
        .doc(docId).get();

    return LabResultsModel.fromFirebase(snapshot.data()!, snapshot.id);
  }
}
