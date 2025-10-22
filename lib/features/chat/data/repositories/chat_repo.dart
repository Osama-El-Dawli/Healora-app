import 'package:healora/features/chat/data/data_sources/firestore_chat_remote_data_source.dart';
import 'package:healora/features/chat/data/models/message_model.dart';

class ChatRepo {
  final FirestoreChatRemoteDataSource _firestoreDataSource;

  ChatRepo({required FirestoreChatRemoteDataSource firestoreDataSource})
    : _firestoreDataSource = firestoreDataSource;

  Stream<List<MessageModel>> getMessages(String chatId) {
    try {
      return _firestoreDataSource.getMessage(chatId);
    } catch (e) {
      throw Exception('Failed to get messages: $e');
    }
  }

  Future<void> sendMessage(String chatId, MessageModel message) async {
    try {
      await _firestoreDataSource.sendMessage(chatId, message);
    } catch (e) {
      throw Exception('Failed to send message: $e');
    }
  }
}
