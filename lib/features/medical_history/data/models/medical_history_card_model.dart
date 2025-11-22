import 'package:json_annotation/json_annotation.dart';

part 'medical_history_card_model.g.dart';

@JsonSerializable()
class MedicalHistoryModel {
  final String? id;
  final String uid;
  final String title;
  final String description;

  MedicalHistoryModel({
    this.id,
    required this.uid,
    required this.title,
    required this.description,
  });

  factory MedicalHistoryModel.fromFirebase(
    Map<String, dynamic> data,
    String docId,
  ) => _$MedicalHistoryModelFromFirebase(data, docId);

  Map<String, dynamic> toFirebase() => _$MedicalHistoryModelToFirebase(this);
}
