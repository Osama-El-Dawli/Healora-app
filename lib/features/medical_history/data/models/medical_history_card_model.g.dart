// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_history_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalHistoryModel _$MedicalHistoryModelFromFirebase(
  Map<String, dynamic> data,
  String docId,
) => MedicalHistoryModel(
  id: docId,
  uid: data['uid'] as String,
  title: data['title'] as String,
  description: data['description'] as String,
);

Map<String, dynamic> _$MedicalHistoryModelToFirebase(
  MedicalHistoryModel instance,
) => <String, dynamic>{
  'uid': instance.uid,
  'title': instance.title,
  'description': instance.description,
};
