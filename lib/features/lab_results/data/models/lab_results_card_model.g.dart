// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lab_results_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************


LabResultsModel _$LabResultsModelFromFirebase(
    Map<String, dynamic> data,
    String docId,
    ) => LabResultsModel(
  id: docId,
  uid: data['uid'] as String,
  title: data['title'] as String,
  description: data['description'] as String,
);

Map<String, dynamic> _$LabResultsModelToFirebase(
    LabResultsModel instance,
    ) => <String, dynamic>{
  'uid': instance.uid,
  'title': instance.title,
  'description': instance.description,
};
