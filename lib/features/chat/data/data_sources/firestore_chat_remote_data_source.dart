import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:healora/features/chat/data/models/message_model.dart';

class FirestoreChatRemoteDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<MessageModel>> getMessages(String chatId) {
    return _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => MessageModel.fromJson(doc.data(), doc.id))
              .toList(),
        );
  }

  Future<void> sendMessage(String chatId, MessageModel message) async {
    await _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .add(message.toJson());
  }

  Future<String?> getFcmToken(String userId) async {
    final doc = await _firestore.collection('users').doc(userId).get();
    return doc.data()?['fcm_token'] as String?;
  }
}
