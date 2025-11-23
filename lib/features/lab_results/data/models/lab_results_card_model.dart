import 'package:json_annotation/json_annotation.dart';

part 'lab_results_card_model.g.dart';
@JsonSerializable()
class LabResultsModel {
  final String? id;
  final String uid;
  final String title;
  final String description;

  LabResultsModel({
    this.id,
    required this.uid,
    required this.title,
    required this.description,
  });

  factory LabResultsModel.fromFirebase(
      Map<String, dynamic> data,
      String docId,
      ) => _$LabResultsModelFromFirebase(data, docId);

  Map<String, dynamic> toFirebase() => _$LabResultsModelToFirebase(this);
}
