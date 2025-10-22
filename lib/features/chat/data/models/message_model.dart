import 'package:json_annotation/json_annotation.dart';

part 'message_model.g.dart';

@JsonSerializable()
class MessageModel {
  @JsonKey(includeToJson: false)
  final String id;
  final String message;
  final String senderId;
  final DateTime timestamp;

  const MessageModel({
    required this.id,
    required this.message,
    required this.senderId,
    required this.timestamp,
  });

  Map<String, dynamic> toJson() => _$MessageModelToJson(this);

  factory MessageModel.fromJson(Map<String, dynamic> json, String docId) {
    return MessageModel(
      id: docId,
      message: json['message'] as String,
      senderId: json['senderId'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );
  }
}
