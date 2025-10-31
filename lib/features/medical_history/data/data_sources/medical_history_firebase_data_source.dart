import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:healora/core/constants/app_constants.dart';
import 'package:healora/features/medical_history/data/models/medical_history_card_model.dart';

class MedicalHistoryFirebaseDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<MedicalHistoryModel>> getMedicalHistoryList({
    required String uid,
  }) async {
    final snapshot = await _firestore
        .collection(AppConstants.medicalHistoryCollection)
        .where('uid', isEqualTo: uid)
        .get();
    return snapshot.docs
        .map((doc) => MedicalHistoryModel.fromFirebase(doc.data()))
        .toList();
  }

  Future<void> addMedicalHistory({required MedicalHistoryModel model}) async {
    await _firestore
        .collection(AppConstants.medicalHistoryCollection)
        .add(model.toFirebase());
  }
}
