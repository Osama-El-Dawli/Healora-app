/*import 'package:json_annotation/json_annotation.dart';

part 'medical_history_card_model.g.dart';

@JsonSerializable()
class MedicalHistoryModel {
  final String uid;
   String title;
   String description;

  MedicalHistoryModel({
    required this.uid,
    required this.title,
    required this.description,
  });

  factory MedicalHistoryModel.fromFirebase(Map<String, dynamic> data) =>
      _$MedicalHistoryModelFromFirebase(data);

  Map<String, dynamic> toFirebase() => _$MedicalHistoryModelToFirebase(this);
}*/
import 'package:json_annotation/json_annotation.dart';

part 'medical_history_card_model.g.dart';

@JsonSerializable()
class MedicalHistoryModel {
  final String? id; // <–– ضيفي ده
  final String uid;
  String title;
  String description;

  MedicalHistoryModel({
    this.id,               // <–– مهم
    required this.uid,
    required this.title,
    required this.description,
  });

  factory MedicalHistoryModel.fromFirebase(
      Map<String, dynamic> data,
      String documentId,             // <–– هنا ركزي
      ) =>
      MedicalHistoryModel(
        id: documentId,
        uid: data['uid'],
        title: data['title'],
        description: data['description'],
      );

  Map<String, dynamic> toFirebase() => {
    'uid': uid,
    'title': title,
    'description': description,
  };
}

